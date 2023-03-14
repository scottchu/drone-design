include <BOSL2/std.scad>;


module Standoff(
  diameter,
  height,
  offset=0,
  anchor=BOTTOM,
  $fn=10
) {
  cylinder(
    h=height,
    d=diameter + offset,
    anchor=anchor,
    $fn=$fn
  );
}

Standoff(4, 20, 1, $fn=6);