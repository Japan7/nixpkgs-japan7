{ syncplay
, syncplay-src
}:
syncplay.overrideAttrs (oldAttrs: rec {
  name = "${pname}-${version}";

  pname = "syncplay";
  version = builtins.substring 0 7 syncplay-src.rev;

  src = syncplay-src;

  patches = builtins.tail oldAttrs.patches;
})
