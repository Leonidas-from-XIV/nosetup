# nosetup - An `.ocamlinit` helper to `#require` packages in an OCaml toplevels

`nosetup` helps you to load the dependencies of your project into your toplevel
of choice (OCaml Toplevel as well as UTOP) so you don't have to `#require` your
dependencies yourself. It does so by finding your project metadata (even if you
are in a subdirectory, similar to `git`), parsing it and then using `findlib`
to load it into your toplevel session.

Currently it supports Merlin's `.merlin` files, though there is no limitation
of which files *could* be supported as long as the `findlib` package names can
be parsed.

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
ocaml pkg/pkg.ml build
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
