include <BOSL2/std.scad>;

module AdjustableScrewHole(
  angle = 45,
  distance = 16,
  thickness = 2,
  diameter = 1.6,
  caps = true,
  $fn = 50
) {
  zrot(20)
  path_extrude2d(
    arc(
      d = distance,
      angle = [0, angle]
    ),
    caps = caps,
    $fn = $fn
  )
  trapezoid(
    w1 = diameter,
    w2 = diameter,
    h = thickness,
    anchor = BOTTOM
  );
}

AdjustableScrewHole(
  angle = 90,
  distance = 5,
  caps = true,
  $fn=20
);