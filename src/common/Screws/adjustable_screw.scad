include <BOSL2/std.scad>;

module AdjustableScrewHole(
  angle = 45,
  distance = 16,
  thickness = 2,
  diameter = 1.6,
  caps = true,
) {
  quality = $preview ? 30 : 60;
  cap_angle = 2.92 * diameter;
  angle = angle - cap_angle * 2;

  zrot(cap_angle)
  path_extrude2d(
    arc(
      r = distance,
      angle = [0, angle],
      n = quality
    ),
    caps = caps,
    $fn = quality
  )
  trapezoid(
    w1 = diameter,
    w2 = diameter,
    h = thickness,
    anchor = BOTTOM
  );
}

AdjustableScrewHole(
  diameter = 1.6,
  angle = 30,
  distance = 10,
  caps = true
);