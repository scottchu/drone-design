include <BOSL2/std.scad>


union() {
  cuboid(
    size = [
      2,
      10,
      10
    ]
  );

  translate([-3.225, 7.8, 0])
  zrot(45)
  cuboid(
    size = [
      2,
      10,
      10
    ]
  );
}
