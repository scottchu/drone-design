use <../common/SMA/mount.scad>
include <spec.scad>

SMA_Mount_Dual(
  width = 30,
  length = 15,
  height = 10,
  distance = 8,
  angle = 30,
  thickness = 1,
  top_back_chamfer = 0.5,
  sma_fn = 60,
  show_sma_teeth_disk = $preview ? true : false,
  sma_y_offset = -0.5,

  standoff_diameter = STANDOFF_DIAMETER,
  standoff_wall = STANDOFF_WALL,
  standoff_height = STANDOFF_HEIGHT,
  standoff_distance = STANDOFF_DISTANCE,
  standoff_ofn = STANDOFF_OUTER_SIDES,
  standoff_ifn = STANDOFF_INNER_SIDES,
  standoff_front_flat = false
);