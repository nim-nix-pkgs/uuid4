{
  description = ''UUIDs in pure Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-uuid4-main.flake = false;
  inputs.src-uuid4-main.owner = "vtbassmatt";
  inputs.src-uuid4-main.ref   = "main";
  inputs.src-uuid4-main.repo  = "nim-uuid4";
  inputs.src-uuid4-main.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-uuid4-main"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-uuid4-main";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}