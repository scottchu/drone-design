include <BOSL2/std.scad>

module EggShape(
  length,
  thickness,
  r1,
  r2,
  R = 180,
  $fn = 50,
  show_cirlce = false
) {
  translate([thickness/2, 0, 0])
  rot([90, 0, -90])
  linear_extrude(height=thickness)
  egg(
    length = length,
    r1 = r1,
    r2 = r2,
    R = 180,
    $fn = $fn
  );

  if (show_cirlce) {
    translate([0, length / 2 - r1, 0])
    rot([0, 90, 0])
    #cylinder(
      r=r1,
      h=thickness,
      anchor=CENTER
    );
    translate([0, -length / 2 + r2, 0])
    rot([0, 90, 0])
    #cylinder(
      r=r2,
      h=thickness,
      anchor=CENTER
    );

    d = length - r1 - r2;
    echo(str("Distance between c1 center to c2 center is ", d));
  }
}

EggShape(
  length = 26,
  thickness = 2,
  r1 = 6,
  r2 = 3
);