open Angstrom

let is_not_end_line c = c <> '\n'
let pkg_name c = c <> ' ' && c <> '\n'

let pkg_line = string "PKG " *> sep_by (char ' ') (take_while1 pkg_name)
let skip_line = skip_while is_not_end_line *> return []

let any_line = pkg_line <|> skip_line

let parser = sep_by (char '\n') any_line

let parse content =
  match parse_string parser content with
  | Error _ ->
    []
  | Ok lines ->
    List.flatten lines
