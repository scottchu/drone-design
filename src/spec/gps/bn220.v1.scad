include <BOSL2/std.scad>

BN220_width = 20;
BN220_length = 22;
BN220_height = 5.8;

// Top Layer
BN220_top_width = 18;
BN220_top_length = 18;
BN220_top_height = 2;

// Middle Layer
BN220_middle_width = BN220_width;
BN220_middle_length = BN220_length;
BN220_middle_height = 0.7;

// Bottom Layer
BN220_bottom_width = 18;
BN220_bottom_length = 14.8;
BN220_bottom_height = 2.8;

// Battery
BN220_battery_diameter = 4.6;
BN220_battery_height = 1.7;
BN220_battery_distance_from_edge = 0.7;

// Plug
BN220_plug_width = 6;
BN220_plug_length = 4.3;
BN220_plug_height = 3.1;

module BN220() {
  // MIDDLE
  cuboid(
    size = [
      BN220_middle_width,
      BN220_middle_length,
      BN220_middle_height
    ],
    anchor = CENTER
  );

  // Top
  translate([0, 0, (BN220_top_height - BN220_middle_height / 2)])
  diff()
  cuboid(
    size = [
      BN220_top_width,
      BN220_top_length,
      BN220_top_height
    ],
    anchor = CENTER
  ) {
    edge_mask(FRONT+RIGHT)
    chamfer_edge_mask(l=4, chamfer=2);

    edge_mask(edges=[BACK+RIGHT, FRONT+LEFT, BACK+LEFT])
    rounding_edge_mask(l=4, r=1, $fn = 50);

  };


  // Bottom
  translate([0, 0, -(BN220_bottom_height - BN220_middle_height)]) {
    translate([0, -(BN220_middle_length - BN220_bottom_length) / 2 + 1, 0])
    cuboid(
      size = [
        BN220_bottom_width,
        BN220_bottom_length,
        BN220_bottom_height
      ],
      anchor = CENTER
    );

    // Battery
    translate([
      (BN220_middle_width - BN220_battery_diameter) / 2 - BN220_battery_distance_from_edge,
      (BN220_middle_length - BN220_battery_diameter) / 2 - BN220_battery_distance_from_edge,
      0
    ])
    cylinder(
      r = BN220_battery_diameter / 2,
      h = BN220_bottom_height,
      anchor = CENTER,
      $fn = 50
    );

    // Plug
    // Battery
    translate([
      0,
      (BN220_middle_length - BN220_plug_length) / 2,
      0
    ])
    cuboid(
      size = [
        BN220_plug_width,
        BN220_plug_length,
        BN220_plug_height
      ],
      anchor = CENTER
    );
  }

}

BN220();