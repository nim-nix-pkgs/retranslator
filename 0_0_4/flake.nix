{
  description = ''Transformer'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-retranslator-0_0_4.flake = false;
  inputs.src-retranslator-0_0_4.owner = "linksplatform";
  inputs.src-retranslator-0_0_4.ref   = "refs/tags/0.0.4";
  inputs.src-retranslator-0_0_4.repo  = "RegularExpressions.Transformer";
  inputs.src-retranslator-0_0_4.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-retranslator-0_0_4"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-retranslator-0_0_4";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}