include <BOSL2/std.scad>;
include <./constants.scad>;

module SMA_Hole(
  height = 2,
  $fn = 25
) {
  echo($fn)
  cylinder(
    d = SMA_DIAMETER,
    h = height,
    anchor = CENTER+BOTTOM,
    $fn = $fn
  );
}
