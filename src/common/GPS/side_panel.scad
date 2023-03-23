include <BOSL2/std.scad>
use <../../lib/polygon.scad>
use <../SMA/mount.scad>
use <../Standoff/holder.scad>
use <adjustable_mount.scad>
use <mount.scad>

module Panel_v1(
  // general
  thickness = 2,
  length,

  // arm
  arm_length,
  arm_height,

  // fin
  fin_length,
  fin_height,
  fin_angle,

  // bottom
  bottom_length = -1,
  bottom_height,
  bottom_angle
) {
  panel_height = fin_height + arm_height;

  fin_y = length - arm_length - fin_length;
  fin_z = adj_ang_to_opp(adj = fin_y, ang = fin_angle);
  fin_translate_y = length - arm_length;
  fin_translate_z = panel_height;

  bottom_length = bottom_length < 0 ? length : bottom_length;
  bottom_z = bottom_height;
  bottom_y = opp_ang_to_adj(opp = bottom_z, ang = bottom_angle);
  union() {

    difference() {
      union() {

        // Arm
        cuboid(
          size = [thickness, arm_length, arm_height],
          anchor = BOTTOM+FRONT
        );

        // Fin
        difference() {
          diff()
          cuboid(
            size = [thickness, length - arm_length, panel_height],
            anchor = BOTTOM+BACK
          ) {
            edge_mask([TOP+BACK])
            chamfer_edge_mask(l=thickness, chamfer=1, orient=DOWN);
          }

          translate([0, -fin_translate_y - 0.01, fin_translate_z + 0.01])
          wedge(
            size=[thickness + 0.01, fin_y + 0.01, fin_z + 0.01],
            anchor = BOTTOM+FRONT,
            orient=DOWN
          );
        }
      }
    }

    // Bottom
    difference() {
      translate([0, -fin_translate_y, 0])
      diff()
      cuboid(
        size = [thickness, bottom_length, bottom_height],
        anchor = TOP+FRONT
      ) {
        edge_mask([BOTTOM+FRONT])
        chamfer_edge_mask(l=thickness, chamfer=1, orient=DOWN);
      }

      translate([0, -fin_translate_y + bottom_length + 0.01, 0])
      rot([0, 180, 180])
      wedge(
        size=[thickness + 0.01, bottom_y + 0.01, bottom_z + 0.01],
        anchor = TOP+BACK,
        orient=DOWN
      );
    }
  }

}

module GPS_SidePanel_v1(
  // general
  thickness = 2,
  length,

  // Arm
  arm_length,
  arm_height,

  // Fin
  fin_length,
  fin_height,
  fin_angle,

  // Bottom
  bottom_length = -1,
  bottom_height,
  bottom_angle,

  // Standoff
  standoff_diameter,
  standoff_wall,
  standoff_height,
  standoff_offset = 0,
  standoff_front_flat = false,
  standoff_front_chamfer = 0,
  standoff_ofn = 10,
  standoff_ifn = -1,
  standoff_zrot = 0,

  // Mount
  mount_screw_diameter,
  mount_screw_distance,
  mount_screw_edge_distance = 2,
  mount_thickness = 2,
  mount_adjustable_angle = 30,
  mount_multiplier = [5, 2],
  mount_scale = [1, 1],
  mount_adjustable = true,
  mount_info = false,
  mount_fn = 50,
  mount_screw_fn = 50,
  mount_offset = [0, 0]
) {
  standoff_outer_radius = (standoff_diameter / 2) + standoff_wall;
  panel_dy = apothem(r = standoff_outer_radius, n = standoff_ofn) - (standoff_ofn/16);

  mount_length = adjustable_length(mount_screw_diameter, mount_screw_edge_distance, mount_screw_distance);
  mount_transition_y = mount_length / 2 + mount_offset[0];
  mount_transition_z = bottom_height / 2 + mount_offset[1];
  mount_x_rotation = mount_adjustable_angle / mount_multiplier[0] * mount_multiplier[1];

  zrot(standoff_zrot)
  Standoff_Holder(
    diameter = standoff_diameter,
    wall = standoff_wall,
    height = standoff_height,
    offset = standoff_offset,
    front_flat = standoff_front_flat,
    front_chamfer = standoff_front_chamfer,
    ofn = standoff_ofn,
    ifn = standoff_ifn
  );

  translate([0, -arm_length - panel_dy, 0])
  union() {
    difference() {
      Panel_v1(
        thickness = 2,
        length = 40,

        arm_length = 15,
        arm_height = 10,

        fin_height = 2.5,
        fin_length = 8,
        fin_angle = 30,

        bottom_height = 4,
        bottom_angle = 30,
        bottom_length = 35
      );

      translate([-thickness/2 + mount_thickness/2 - 0.1, -mount_transition_y, mount_transition_z])
      GPS_Adjustable_Mount_Outer(
        screw_diameter = mount_screw_diameter,
        screw_distance = mount_screw_distance,
        screw_edge_distance = mount_screw_edge_distance,
        thickness = mount_thickness,
        adjustable_angle = mount_adjustable_angle,
        mount_multiplier = mount_multiplier,
        mount_scale = mount_scale,
        adjustable = mount_adjustable,
        display_info = mount_info,
        egg_fn = mount_fn,
        screw_fn = mount_screw_fn
      );
    }

    translate([thickness - (thickness - mount_thickness) / 2, -mount_transition_y, mount_transition_z])
    GPS_Adjustable_Mount(
      screw_diameter = mount_screw_diameter,
      screw_distance = mount_screw_distance,
      screw_edge_distance = mount_screw_edge_distance,
      thickness = mount_thickness,
      adjustable_angle = mount_adjustable_angle,
      mount_multiplier = mount_multiplier,
      mount_scale = mount_scale,
      adjustable = mount_adjustable,
      display_info = mount_info,
      egg_fn = mount_fn,
      screw_fn = mount_screw_fn
    );
  }
}

STANDOFF_DIAMETER = 4.5;
STANDOFF_WALL = 2;
STANDOFF_HEIGHT = 10;
STANDOFF_DISTANCE = 16.5;

ANGLE = 30;

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
  mount_adjustable = false,
  mount_scale = [1.2, 1.2],
  mount_offset = [-10, 0]
);