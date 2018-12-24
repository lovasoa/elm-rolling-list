module RollingList exposing (RollingList, fromList, roll, rollBack ,current, toList)

{-| Module description


## Functions

@docs fromList, roll, rollBack, current, toList


## Definition

@docs RollingList

-}


{-| The rolling list type.
-}
type alias RollingList a =
    { previous : List a
    , next : List a
    }


{-| Create a rolling list from a normal list

    toList (fromList [1,2,3])
    --> [1,2,3]

-}
fromList : List a -> RollingList a
fromList l =
    { previous = [], next = l }


{-| Create a normal list from a rolling list

    toList (fromList [1,2])
    --> [1,2]

-}
toList : RollingList a -> List a
toList { previous, next } =
    next ++ List.reverse previous


{-| Return a New RollingList, with the current element set to the next element

    toList (roll (fromList [1,2,3]))
    --> [2,3,1]

    current (roll (fromList [1,2,3]))
    --> Just 2

-}
roll : RollingList a -> RollingList a
roll rollingList =
    case rollingList.next of
        [] ->
            { previous = [], next = List.reverse rollingList.previous }

        element :: tail ->
            { previous = element :: rollingList.previous, next = tail }


{-| Return a New RollingList, with the current element set to the previous element

    toList (rollBack (fromList [1,2,3]))
    --> [3,1,2]

    current (rollBack (fromList [1,2,3]))
    --> Just 3

-}
rollBack : RollingList a -> RollingList a
rollBack rollingList =
    case rollingList.previous of
        [] ->
            case List.reverse rollingList.next of
                elem :: list ->
                    { previous = list, next = [ elem ] }

                [] ->
                    { previous = [], next = [] }

        element :: tail ->
            { previous = tail, next = element :: rollingList.next }


{-| Returns the currently selected element in the list

    current (fromList [1,2,3])
    --> Just 1

-}
current : RollingList a -> Maybe a
current rollingList = 
    case rollingList.next of 
        [] -> List.head <| List.reverse rollingList.previous
        
        element :: _ ->
          Just element
