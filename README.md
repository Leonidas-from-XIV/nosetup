# nosetup

An `.ocamlinit` helper to `#require` packages in an OCaml toplevels (native or UTop).

## Naming

You can call it `no-setup` or `nose-tup`. In the latter case you can use
`(👃,👃)` as logo.

## Installation

Be sure to have installed:

  * `findlib`
  * `angstrom`
  * `ocamlbuild` (for duh, building)

## Usage

You need to add a bit to your `.ocamlinit`:

```ocaml
#require "nosetup";;
```

## License

As you can see in the `LICENSE.md`, it is Apache 2.0 licensed.
