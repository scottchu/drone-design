include <BOSL2/std.scad>
include <BOSL2/screws.scad>

module Screw_Hole(
  spec = "M1.6",
  length,
  anchor = CENTER,
  thread = true,
  orient = UP,
) {
  screw_hole(
    spec = spec,
    length = length,
    anchor = anchor,
    thread = thread,
    orient = orient
  );
}