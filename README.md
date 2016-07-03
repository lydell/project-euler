# [Project Euler] solutions

The solutions are written in Haskell, with a a coding style inspired by the [Elm
language style guide][elm-style-guide].

This is how I run them (requires [stack]):

```sh
$ stack --verbosity warn runghc $PROBLEM_NUM.hs
```

Some solution requires the [primes] package. For now, I install it using
`stack install primes`.

## License

All files are in the public domain.

[Project Euler]: https://projecteuler.net/
[elm-style-guide]: http://elm-lang.org/docs/style-guide
[stack]: http://haskellstack.org/
[primes]: https://hackage.haskell.org/package/primes-0.2.1.0
