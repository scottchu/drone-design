include <BOSL2/std.scad>
use <../screws/hole.scad>

module GPS_BottomPlate(
  width,
  length,
  height,
  chamfer = 2,
  edges = [BOTTOM+FRONT, BOTTOM+BACK]
) {
  cuboid(
    size = [width, length, height],
    chamfer = chamfer,
    edges = edges,
    anchor=BOTTOM
  );
}

module GPS_Base(
  width,
  length,
  height,
  chamfer = 2,
  screw_spec = "M1.6",
  screw_distance = 4
) {
  difference() {
    GPS_BottomPlate(
      width = width,
      length = length,
      height = height,
      chamfer = chamfer
    );

    translate([0, screw_distance / 2, height / 2])
    Screw_Hole(
      spec = screw_spec,
      length = length,
      anchor = CENTER,
      thread = !$preview,
      orient = LEFT
    );

    translate([0, -screw_distance / 2, height / 2])
    Screw_Hole(
      spec = screw_spec,
      length = length,
      anchor = CENTER,
      thread = !$preview,
      orient = LEFT
    );
  };
}

GPS_Base(
    width = 20,
    length = 22,
    height = 5,
    screw_distance = 12,
    $fn=50
  );
