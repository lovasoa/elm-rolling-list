# elm-base-repo

This repo contains an empty Elm module. It's ready to be forked.

## What does this include

 - Elm module directory structure
 - Adapted `.gitignore`
 - `elm-package.json`, and `package.json`, for automatic installation of all your dependencies.
 - [elm-doctest](https://www.npmjs.com/package/elm-doctest) for automatic testing of the code snippets you have in your documentation.

## What to do after forking

  0. Choose a name for your module.
      0. Rename `src/BaseRepo.elm`
      0. change the name in `elm-package.json`
      0. Change the name in `tests/elm-doc-test.json`.
  0. Write your code in `src/`. If you create new files, don't forget to add them to `tests/elm-doc-test.json`

## test

Just run `npm install && npm test`
