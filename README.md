# lovasoa/elm-rolling-list

## Circular buffer

A *Rolling List* is a list with a finite number of elements that can be inifintely
iterated over.

```elm
import RollingList

let
    rl = RollingList.fromList [1,2]
in
    RollingList.current rl
--> Just 1
```

```elm
let
    rl = RollingList.fromList [1,2]
    rolled = RollingList.roll rl
in
    RollingList.current rolled
--> Just 2
```

```elm
let
    rl = RollingList.fromList [1,2]
    rolled = RollingList.roll rl
    rolledTwice = RollingList.roll rolled
in
    RollingList.current rolledTwice
--> Just 1
```

## test

Just run `npm install && npm test`
