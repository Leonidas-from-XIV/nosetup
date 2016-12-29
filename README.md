# nosetup

An `.ocamlinit` helper to `#require` packages in an OCaml toplevels (native or UTop).

## Naming

You can call it `no-setup` or `nose-tup`. In the latter case you can use
`(👃,👃)` as logo.

## Installation

Be sure to have installed:

  * `ocamlbuild` (for building)
  * `topkg` (also for building)
  * `findlib`
  * `angstrom`
  * `containers`

The package uses `topkg` to run the build infrastructure, therefore you can
build it with a short incantation:

```sh
ocaml pkg/pkg.ml -build
```

## Usage

You need to add a bit to your `.ocamlinit`:

```ocaml
#require "nosetup";;
```

Now every `utop` you'll start will have all the `findlib` packages from your
`.merlin` file preloaded. No need to do anything more.

## License

As you can see in the `LICENSE.md`, it is Apache 2.0 licensed.
