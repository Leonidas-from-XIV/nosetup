open Containers
(* TODO: add support for _tags file as well *)

let rec locate_till_root path filename =
  let candidate = Filename.concat path filename in
  let open Unix in
  match access candidate [R_OK] with
  | _ -> Some candidate
  | exception Unix_error _ ->
    let parent = Filename.concat path Filename.parent_dir_name in
    match (stat path, stat parent) with
    | ({ st_ino = this_ino}, { st_ino = parent_ino }) when this_ino = parent_ino ->
        None
    | _ -> locate_till_root parent filename

let locate_merlin_file path =
  locate_till_root path ".merlin"

let parse_merlin_packages path =
  IO.with_in path IO.read_all
  |> Merlin_parser.parse

let main () =
  let open Option.Infix in
  locate_merlin_file Filename.current_dir_name
  >|= parse_merlin_packages
  |> Option.get_or ~default:[]
  |> Topfind.load_deeply

let () =
  main ()
