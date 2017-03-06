module RollingList exposing (..)

{-| Module description

## Definition
@docs MyType

## Functions
@docs myFunction
-}


{-| Type
-}
type alias RollingList a =
    { previous : List a
    , next : List a
    }


{-| Create a rolling list from a normal list

    >>> toList (fromList [1,2,3])
    [1,2,3]
-}
fromList : List a -> RollingList a
fromList l =
    { previous = [], next = l }


{-| Create a normal list from a rolling list

    >>> toList (fromList [1,2])
    [1,2]
-}
toList : RollingList a -> List a
toList { previous, next } =
    next ++ List.reverse previous


{-| Return a New RollingList, with the current element set to the next element

    >>> roll (fromList [1,2,3])
    fromList [2,3,1]

    >>> current (roll (fromList [1,2,3]))
    Just 2
-}
roll : RollingList a -> RollingList a
roll current =
    case ( List.head current.next, List.tail current.next ) of
        ( Nothing, _ ) ->
            { previous = [], next = List.reverse current.previous }

        ( Just element, Just tail ) ->
            { previous = element :: current.previous, next = tail }

        _ ->
            current


{-| Returns the currently selected element in the list

    >>> current (fromList [1,2,3])
    Just 1
-}
current : RollingList a -> Maybe a
current =
    List.head << .next
