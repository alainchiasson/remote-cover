// Build the bottom of the box

// Sizes
height = 5;
thickness = 1;
span = 60;
inside_width = 24;
outside_width = inside_width + 2* thickness;
total_height = height + thickness;
clip_width = 4;
release_width = 8;

module release() {
  cube([6, release_width, 2 * thickness]);
  translate([6, 0, thickness]) cube([2, release_width, thickness ]);
  rotate([90,0,0]) {
    translate([8,2,-release_width])
    linear_extrude(release_width) polygon(points=[[0,-2], [0,0], [5,0] ]);
  }
}

module clip() {
  cube([6, clip_width ,thickness]);
}

module bottom() {
  cube([span,outside_width,thickness]);
  translate([span-6,(outside_width-release_width)/2,0]) release();
}

module side() {
  cube([span,thickness,height]);
}

module end() {
  cube([1,outside_width,height]);
  a = clip_width*2 + 6;
  b = (outside_width - a)/2;
  c = b + clip_width + 6;
  translate([0, b ,height -1]) clip();
  translate([0, c ,height -1]) clip();
  /* translate([0, (outside_width-clip_width)/2 ,height -1]) color("red") clip(); */
}

/* release(); */
/* bottom (); */
/* end(); */
union() {
  translate([-span/2,-outside_width/2,0]) bottom();
  translate([-span/2,-outside_width/2,0]) side();
  translate([-span/2,+outside_width/2,0]) side();
  translate([-span/2,-outside_width/2,0]) end();
}
