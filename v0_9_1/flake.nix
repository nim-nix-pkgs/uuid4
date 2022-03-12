{
  description = ''UUIDs in pure Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-uuid4-v0_9_1.flake = false;
  inputs.src-uuid4-v0_9_1.owner = "vtbassmatt";
  inputs.src-uuid4-v0_9_1.ref   = "refs/tags/v0.9.1";
  inputs.src-uuid4-v0_9_1.repo  = "nim-uuid4";
  inputs.src-uuid4-v0_9_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-uuid4-v0_9_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-uuid4-v0_9_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}