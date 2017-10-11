open Angstrom

let is_not_end_line c = c <> '\n'
let pkg_name c = c <> ' ' && c <> '\n'

let pkg_line = string "PKG " *> sep_by (char ' ') (take_while1 pkg_name)
let skip_line = skip_while is_not_end_line *> return []

let any_line = pkg_line <|> skip_line

let parser = sep_by (char '\n') any_line

let parse content =
  print_endline "hallo";
  match parse_only parser (`String content) with
  | Result.Error msg ->
    []
  | Result.Ok lines ->
    List.flatten lines
