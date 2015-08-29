# Ditto

Ditto is a dependently typed functional programming language.

![Ditto](http://cdn.bulbagarden.net/upload/7/72/Ditty.png)

## Development

* Make sure you have [Stack](https://github.com/commercialhaskell/stack#how-to-install) installed.
* Build the project with `stack build`.
* Run the tests with `stack runghc src/Ditto/Test.hs`.
* Work interactively with `stack ghci`.
* Run the current version of the binary with `stack exec -- ditto -c PATH/TO/Foo.ditto`.

## Installation

* Make sure you have [Stack](https://github.com/commercialhaskell/stack#how-to-install) installed.
* Make sure `$HOME/.local/bin` is in your `$PATH`.
* Run `stack install` in this directory.
* Run `ditto -c PATH/TO/Foo.ditto` to type check a file.
