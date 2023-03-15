include <BOSL2/std.scad>;
use <./base.scad>;

module Standoff_Holder(
  diameter,
  height,
  wall=1,
  anchor=BOTTOM,
  offset=0,
  front_flat=false,
  front_chamfer=0,
  $ofn=10,
  $ifn=-1
) {
  $ifn = $ifn < 0 ? $ofn : $ifn;
  d = 0.02;

  difference() {

    union() {
      Standoff(
        diameter=diameter,
        height=height,
        offset=(wall*2)+offset,
        anchor=anchor,
        $fn=$ofn
      );

      if (front_flat == true) {
         cuboid(
          size=[
            diameter+(wall*2)+offset,
            diameter/2+wall+offset,
            height
          ],
          anchor=anchor+BACK,
          chamfer=front_chamfer,
          edges=[FRONT+LEFT, FRONT+RIGHT]
        );
      }
    }


    translate([0, 0, -d/2])
    Standoff(
      diameter=diameter+offset,
      height=height+d,
      anchor=anchor,
      $fn=$ifn
    );
  };
}

Standoff_Holder(
  diameter=4,
  height=20,
  wall=1,
  offset=0.2,
  front_flat=true,
  front_chamfer=0,
  $ofn=50,
  $ifn=6
);