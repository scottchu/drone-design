include <spec.scad>
use <../common/GPS/side_panel.scad>

panel_thickness = 2;
panel_length = 40;

arm_length = 15;
arm_height = 10;
arm_shift = -1.15;

fin_height = 2.5;
fin_length = 8;
fin_angle = 30;

bottom_height = 4;
bottom_angle = 30;
bottom_length = 35;

mount_screw_diameter = 1.6;
mount_screw_distance = 12;
mount_thickness = 2.5;
mount_base_multiplier = 3;
mount_base_scale = [1.2, 1.2];
mount_offset = [0, 0];
mount_adjustable_angle = 25;

distribute(
  (STANDOFF_DISTANCE + STANDOFF_DIAMETER)/2 + STANDOFF_WALL + 2
) {
  yrot(90)
  GPS_SidePanel_v1(
    thickness = panel_thickness,
    length = panel_length,

    arm_length = arm_length,
    arm_height = arm_height,
    arm_shift = arm_shift,

    fin_height = fin_height,
    fin_length = fin_length,
    fin_angle = fin_angle,

    bottom_height = bottom_height,
    bottom_angle = bottom_angle,
    bottom_length = bottom_length,

    standoff_diameter = STANDOFF_DIAMETER,
    standoff_wall = STANDOFF_WALL,
    standoff_height = STANDOFF_HEIGHT,
    standoff_ofn = STANDOFF_OUTER_SIDES,
    standoff_ifn = STANDOFF_INNER_SIDES,
    standoff_front_flat = false,

    mount_screw_diameter = mount_screw_diameter,
    mount_screw_distance = mount_screw_distance,
    mount_thickness = mount_thickness,
    mount_base_multiplier = mount_base_multiplier,
    mount_base_scale = mount_base_scale,
    mount_offset = mount_offset,
    mount_adjustable_angle = mount_adjustable_angle
  );


  translate([(STANDOFF_DISTANCE + STANDOFF_DIAMETER)/2 + STANDOFF_WALL, 0, 0])
  yrot(-90)
  mirror([1, 0, 0])
  GPS_SidePanel_v1(
    thickness = panel_thickness,
    length = panel_length,

    arm_length = arm_length,
    arm_height = arm_height,
    arm_shift = arm_shift,

    fin_height = fin_height,
    fin_length = fin_length,
    fin_angle = fin_angle,

    bottom_height = bottom_height,
    bottom_angle = bottom_angle,
    bottom_length = bottom_length,

    standoff_diameter = STANDOFF_DIAMETER,
    standoff_wall = STANDOFF_WALL,
    standoff_height = STANDOFF_HEIGHT,
    standoff_ofn = STANDOFF_OUTER_SIDES,
    standoff_ifn = STANDOFF_INNER_SIDES,
    standoff_front_flat = false,

    mount_screw_diameter = mount_screw_diameter,
    mount_screw_distance = mount_screw_distance,
    mount_thickness = mount_thickness,
    mount_base_multiplier = mount_base_multiplier,
    mount_base_scale = mount_base_scale,
    mount_offset = mount_offset,
    mount_adjustable_angle = mount_adjustable_angle
  );

}
