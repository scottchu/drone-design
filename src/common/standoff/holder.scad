include <BOSL2/std.scad>;
use <./base.scad>;

module Standoff_Holder(
  diameter,
  height,
  wall=1,
  anchor=BOTTOM,
  offset=0,
  $ofn=10,
  $ifn=-1
) {
  $ifn = $ifn < 0 ? $ofn : $ifn;
  d = 0.02;

  difference() {
    Standoff(
      diameter=diameter,
      height=height,
      offset=wall+offset,
      anchor=anchor,
      $fn=$ofn
    );

    translate([0, 0, -d/2])
    Standoff(
      diameter=diameter+offset,
      height=height + d,
      anchor=anchor,
      $fn=$ifn
    );
  };
}

Standoff_Holder(4, 20, 2, offset=0.2, $ofn=6, $ifn=6);