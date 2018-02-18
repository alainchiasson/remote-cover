// Build the bottom of the box

// Sizes

span = 60;
inside_width = 24;
height = 4;

module release() {
  cube([6,4,1]);
}

module clip() {
  cube([6,4,1]);
}

module bottom() {
  cube([60,24,1]);
  translate([60,10,0]) release();
}

module side() {
  cube([60,1,4]);
}

module end() {
  cube([1,24,4]);
  translate([0,3,3]) clip();
  translate([0,17,3]) clip();
}

union() {
  translate([-30,-12,0]) bottom();
  translate([-30,-12,0]) side();
  translate([-30,+12,0]) side();
  translate([-30,-12,0]) end();
}
