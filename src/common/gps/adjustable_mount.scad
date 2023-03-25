include <BOSL2/std.scad>
use <../Screws/adjustable_screw.scad>
use <../Screws/hole.scad>

function adjustable_length(screw_diameter, screw_edge_distance, screw_distance) =
  (screw_diameter + screw_edge_distance * 2) + screw_distance;

module EggShape(
  length,
  thickness,
  scale = [1, 1],
  r1,
  r2,
  R = 180,
  inverse = false,
  display_info = false
) {
  m = inverse ? -1 : 1;

  translate([thickness / 2 * m, 0, 0])
  rot([90 * m, 0, -90])
  linear_extrude(
    height=thickness,
    scale = scale
  )
  egg(
    length = length,
    r1 = r1,
    r2 = r2,
    R = 180
  );

  if (display_info) {
    translate([0, length / 2 - r1, 0])
    rot([0, 90, 0])
    #cylinder(
      r=r1,
      h=thickness,
      anchor=CENTER
    );
    translate([0, -length / 2 + r2, 0])
    rot([0, 90, 0])
    #cylinder(
      r=r2,
      h=thickness,
      anchor=CENTER
    );

    d = length - r1 - r2;
    echo(str("Distance between c1 center to c2 center is ", d));
  }
}

module GPS_Adjustable_Mount(
  screw_diameter,
  screw_distance,
  screw_edge_distance = 2,
  thickness = 2,
  adjustable_angle = 30,
  mount_multiplier = [5, 2],
  mount_scale = [1, 1],
  adjustable = true,
  display_info = false,
  egg_fn = 50,
  screw_fn = 50
) {
  offset = 0.2;

  r1 = screw_diameter / 2 * mount_multiplier[0];
  r2 = screw_diameter / 2 * mount_multiplier[1];

  length = adjustable_length(screw_diameter, screw_edge_distance, screw_distance);
  static_screw_y = (length / 2 - r2);
  adjustable_screw_y = (length / 2 - r1 + (screw_diameter/2));
  adjustable_screw_thickness = thickness + offset;

  opp = r1 - r2;
  adj = static_screw_y + adjustable_screw_y;
  ang = adj_opp_to_ang(adj = adj, opp = opp);

  echo(str("The distance between screw holes is: ", static_screw_y + adjustable_screw_y));

  xrot(ang)
  difference() {
    EggShape(
      length = length,
      thickness = thickness,
      r1 = r1,
      r2 = r2,
      display_info = display_info,
      scale = mount_scale,
      $fn = egg_fn
    );

    // Static Screw Hole
    translate([0, -static_screw_y, 0])
    Screw_M_Hole(
      diameter = screw_diameter,
      length = thickness + 0.2,
      orient = LEFT,
      thread = false,
      $fn = screw_fn
    );

    // Adjustable Screw Hole
    translate([0, -adjustable_screw_y , 0])
    rotate([90, 0, 90])
    render()
    #AdjustableScrewHole(
      angle = adjustable_angle,
      distance = screw_distance,
      thickness = adjustable_screw_thickness,
      diameter = screw_diameter * 1.1,
      $fn = adjustable_angle * 3
    );
  }
}

module GPS_Adjustable_Mount_Outer(
  screw_diameter,
  screw_distance,
  screw_edge_distance = 2,
  thickness = 2,
  adjustable_angle = 30,
  mount_multiplier = [5, 2],
  mount_scale = [1, 1],
  adjustable = true,
  display_info = false,
  egg_fn = 50,
  screw_fn = 50,
) {
  offset = 0.2;

  r1 = screw_diameter / 2 * mount_multiplier[0];
  r2 = screw_diameter / 2 * mount_multiplier[1];

  length = adjustable_length(screw_diameter, screw_edge_distance, screw_distance);
  static_screw_y = (length / 2 - r2);
  adjustable_screw_y = (length / 2 - r1 + (screw_diameter/2));
  adjustable_screw_thickness = thickness + offset;

  opp = r1 - r2;
  adj = static_screw_y + adjustable_screw_y;
  ang = adj_opp_to_ang(adj = adj, opp = opp);

  echo(str("The distance between screw holes is: ", static_screw_y + adjustable_screw_y));

  xrot(ang) {
    EggShape(
      length = length,
      thickness = thickness,
      r1 = r1,
      r2 = r2,
      display_info = display_info,
      scale = mount_scale,
      $fn = egg_fn
    );

    // Static Screw Hole
    translate([thickness, -static_screw_y, 0])
    Screw_M_Hole(
      diameter = screw_diameter,
      length = thickness + 0.2,
      orient = LEFT,
      thread = false,
      $fn = screw_fn
    );

    // Adjustable Screw Hole
    translate([thickness, adjustable_screw_y, 0]) {
      if (adjustable) {
        translate([-adjustable_screw_thickness/2, -screw_distance/2, 0])
        rotate([90, 0, 90])
        #AdjustableScrewHole(
          angle = adjustable_angle,
          distance = screw_distance,
          thickness = adjustable_screw_thickness,
          diameter = screw_diameter * 1.1
        );
      } else {
        Screw_M_Hole(
          diameter = screw_diameter,
          length = thickness + 0.2,
          orient = LEFT,
          thread = false,
          $fn = screw_fn
        );
      }
    }
  }
}

GPS_Adjustable_Mount(
  screw_diameter = 1.6,
  screw_distance = 12,
  adjustable = true
);
