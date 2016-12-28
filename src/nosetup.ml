open Containers
(* TODO: add support for _tags file as well *)

let locate_merlin_file path =
  ".merlin"

let parse_merlin_packages path =
  let content = IO.with_in path IO.read_all in
  Merlin_parser.parse content

let main () =
  locate_merlin_file "."
  |> parse_merlin_packages
  |> Topfind.load_deeply

let () =
  main ()
