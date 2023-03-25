include <../common/GPS/BN220.scad>
use <../common/GPS/mount.scad>
include <spec.scad>

clip_width = 6;
clip_arm_thickness = 2;
clip_arm_height = 6;
clip_thickness = 2;
clip_length = 4;
$fn = 50;

color([0.75, 0.25, 0.25, 0.75])
GSP_Mount(
  base_width = BN220_WIDTH,
  base_length = BN220_LENGTH,
  base_height = BN220_HEIGHT,
  screw_diameter = GPS_SCREW_DIAMETER,
  screw_distance = GPS_SCREW_DISTANCE,
  clip_width = clip_width,
  clip_arm_thickness = clip_arm_thickness,
  clip_arm_height = clip_arm_height,
  clip_thickness = clip_thickness,
  clip_length = clip_length
);

color([0, 0.75, 0.5, 0.75])
translate([0, 4.65, 5])
xrot(-30)
zrot(180)
translate([0, -70, 0])
import("stl/BN220_Mount.stl");