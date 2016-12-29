#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe
    ~opams:[Pkg.opam_file ~lint_deps_excluding:(Some ["findlib"]) "opam"]
    "nosetup" @@ fun c ->
  Ok [ Pkg.lib "src/nosetup.cma" ]
