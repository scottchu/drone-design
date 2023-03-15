include <BOSL2/std.scad>;
include <./constants.scad>;
include <./functions.scad>;

module SMA_MountModel(
  width,
  length,
  height,
  flat_top,
  angle,
  chamfer = 0,
  top_back_chamfer = 0,
  top_back_chamfer_length = 0
) {
  pl = length - flat_top;
  ph = wedge_height(pl, angle);
  dz = height - ph;
  max_angle = wedge_max_height(pl, height);

  assert(angle <= max_angle, str("Angle is too large, max angle is ", max_angle));

  top_back_chamfer = top_back_chamfer > 0 ? top_back_chamfer : chamfer;

  difference() {
    diff()
    cuboid(
      size=[width, length, height],
      anchor=BOTTOM
    ) {
      if (top_back_chamfer_length > 0 && top_back_chamfer > 0) {
        edge_mask(TOP+BACK)
        chamfer_edge_mask(l=top_back_chamfer_length, chamfer=top_back_chamfer);
      }

      if (chamfer > 0) {
        edge_mask([BOTTOM+FRONT, BOTTOM+LEFT, BOTTOM+RIGHT])
        chamfer_edge_mask(l=width, chamfer=0.5);
      }
    };

    translate([0, -length/2 - 0.01, dz + 0.01])
    wedge(
      size=[width+0.01, pl+0.01, ph+0.02],
      anchor=TOP+FRONT,
      orient=DOWN
    );
  };
}

module SMA_Mount(
  width,
  length,
  height,
  flat_top = 2,
  angle = 30,
  thickness = 1.5,
  wall = 1.5,
  chamfer = 0,
  top_back_chamfer = 0,
  top_back_chamfer_length = 0,
  show_side = false
) {

  top_back_chamfer = top_back_chamfer > 0 ? top_back_chamfer : chamfer;
  top_back_chamfer_length = top_back_chamfer_length > 0 ? top_back_chamfer_length : width;


  difference() {
    SMA_MountModel(
      width = width,
      length = length,
      height = height,
      flat_top = flat_top,
      angle = angle,
      chamfer = chamfer,
      top_back_chamfer = top_back_chamfer,
      top_back_chamfer_length = top_back_chamfer_length
    );

    a = thickness;
    b = triangle_b(a, angle);
    c = triangle_c(a, b);

    iw = width - wall * 2;
    il = length - c;
    ih = height - c;

    translate([0, c/2 + 0.01, -0.01])
    SMA_MountModel(
      width = iw,
      length = il,
      height = ih,
      flat_top = flat_top,
      angle = angle
    );

    if (show_side == true) {
      translate([-(width-wall)/2, 0, -0.01])
      cube([wall+0.02, length+0.02, height+0.02], anchor=BOTTOM);
    }
  }
}

SMA_Mount(
  width=40,
  length=30,
  height=20,
  flat_top=6,
  angle=38,
  chamfer=1,
  top_back_chamfer = 1,
  show_side=false
);