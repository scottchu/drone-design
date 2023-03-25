include <../common/GPS/BN220.scad>
use <../common/GPS/mount.scad>
include <spec.scad>

clip_width = 6;
clip_arm_thickness = 2;
clip_arm_height = 6;
clip_thickness = 2;
clip_length = 4;
$fn = 50;

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