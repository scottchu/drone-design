include <../common/GPS/BN220.scad>
use <../common/GPS/mount.scad>
use <../common/GPS/side_panel.scad>
use <../common/SMA/mount.scad>

STANDOFF_DIAMETER = 4.5;
STANDOFF_WALL = 2;
STANDOFF_HEIGHT = 10;
STANDOFF_DISTANCE = 16.5;

ANGLE = 30;

SMA_MOUNT_LENGTH = 15;

translate([0, 0, 10])
SMA_Mount_Dual(
  width = 31.5,
  length = SMA_MOUNT_LENGTH,
  height = 10,
  distance = 8,
  angle=ANGLE,
  thickness = 2,
  top_back_chamfer = 1,
  sma_fn = 50,
  show_sma_teeth_disk = false,
  sma_y_offset = -0.5,

  standoff_diameter = STANDOFF_DIAMETER,
  standoff_wall = STANDOFF_WALL,
  standoff_height = STANDOFF_HEIGHT,
  standoff_distance = STANDOFF_DISTANCE,
  standoff_ofn = 6,
  standoff_ifn = 30,
  standoff_front_flat = true
);

translate([0, -30, -5])
xrot(ANGLE - 15, cp=[0, -BN220_LENGTH/2, BN220_HEIGHT/2])
GSP_Mount(
  base_width = BN220_WIDTH,
  base_length = BN220_LENGTH,
  base_height = BN220_HEIGHT,
  screw_spec = "M1.6",
  screw_distance = 12,
  clip_width = 6,
  clip_arm_thickness = 2,
  clip_arm_height = 6,
  clip_thickness = 2,
  clip_length = 4,
  $fn = 50
);

translate([-(STANDOFF_DISTANCE + STANDOFF_DIAMETER)/2 - STANDOFF_WALL, 0, 0])
GPS_SidePanel_v1(
  thickness = 2,
  length = 40,

  arm_length = 15,
  arm_height = 10,

  fin_height = 2.5,
  fin_length = 8,
  fin_angle = 30,

  bottom_height = 4,
  bottom_angle = 30,
  bottom_length = 35,

  standoff_diameter = STANDOFF_DIAMETER,
  standoff_wall = STANDOFF_WALL,
  standoff_height = STANDOFF_HEIGHT,
  standoff_ofn=6,
  standoff_ifn=30,
  standoff_front_flat = false,

  mount_screw_diameter = 1.6,
  mount_screw_distance = 12,
  mount_thickness = 1.4,
  mount_adjustable_angle = 45,
  mount_adjustable = true,
  mount_scale = [1.2, 1.2],
  mount_offset = [2.1, -0.85],
  mount_multiplier = [6, 2]
);

translate([(STANDOFF_DISTANCE + STANDOFF_DIAMETER)/2 + STANDOFF_WALL, 0, 0])
mirror([1, 0, 0])
GPS_SidePanel_v1(
  thickness = 2,
  length = 40,

  arm_length = 15,
  arm_height = 10,

  fin_height = 2.5,
  fin_length = 8,
  fin_angle = 30,

  bottom_height = 4,
  bottom_angle = 30,
  bottom_length = 35,

  standoff_diameter = STANDOFF_DIAMETER,
  standoff_wall = STANDOFF_WALL,
  standoff_height = STANDOFF_HEIGHT,
  standoff_ofn=6,
  standoff_ifn=30,
  standoff_front_flat = false,

  mount_screw_diameter = 1.6,
  mount_screw_distance = 12,
  mount_thickness = 1.4,
  mount_adjustable_angle = 45,
  mount_adjustable = true,
  mount_scale = [1.2, 1.2],
  mount_offset = [2.1, -0.85],
  mount_multiplier = [6, 2]
);