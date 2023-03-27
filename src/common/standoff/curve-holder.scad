include <BOSL2/std.scad>
include <BOSL2/rounding.scad>

use <base.scad>

$fn = 60;

module Standoff_CurvedHolder(
  diameter,
  wall,
  height,
  offset = 0.02,
  ofn = 6,
  ifn = 50,

  // Curve
  curve_x,
  curve_y,

  // Connecting Point
  connect_width,
  connect_length
) {
  od = diameter + wall * 2 + offset;
  or = od / 2;

  connect_point_x = -connect_width / 2 + or + curve_x;
  connect_point_y = -or - connect_length / 2;

  diff()
  conv_hull("remove") {
    cyl(
      d = od,
      h = height,
      $fn = ofn);

    translate([curve_x, curve_y, 0])
    cyl(
      d = od,
      h = height);

    tag("remove")
    cyl(
      d = diameter,
      h = height + offset,
      $fn = ifn);

    translate([connect_point_x, connect_point_y, 0])
    cuboid(
      size = [
        connect_width,
        connect_length,
        height
      ],
      anchor = FRONT
    );
  };
}

Standoff_CurvedHolder(
  // Standoff
  diameter = 5,
  wall = 1,
  height = 10,
  offset = 0.2,
  ofn = 6,
  ifn = 50,

  // Curve
  curve_x = 2,
  curve_y = -1,

  // Connecting Point
  connect_width = 2,
  connect_length = 4
);
