open Angstrom

let is_not_end_line c = c <> '\n'

let pkg_line = string "PKG " *> take_while1 is_not_end_line >>= fun pkg -> return @@ Some pkg
let skip_line = skip_while is_not_end_line >>= fun () -> return None

let linebreak = char '\n'

let any_line = pkg_line <|> skip_line

let parser = sep_by linebreak any_line

let parse content =
  match parse_only parser (`String content) with
  | Result.Error msg ->
    []
  | Result.Ok lines ->
    lines
    |> List.filter CCOpt.is_some
    |> List.map CCOpt.get_exn
