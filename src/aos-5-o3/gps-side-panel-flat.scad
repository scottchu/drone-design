include <BOSL2/std.scad>
include <spec.scad>
use <gps-side-panel.scad>

distance = (STANDOFF_DISTANCE + STANDOFF_DIAMETER) + STANDOFF_WALL * 2;

distribute(distance) {
  yrot(90)
  GPS_SidePanel();

  yrot(-90)
  mirror([1, 0, 0])
  GPS_SidePanel();
}
