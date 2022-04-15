$fn = 256;

module ring(r, R) {
    rotate_extrude()
        translate([R,0,0])
            circle(r);
}

module outer_shell() {
    union() {
        difference() {
            translate([25,0,0]) {
                sphere(d = 50, true);
            }
            cube(50, true);
        };
        translate([54 , 0, 0]) {
            cube([17,25,16.6], true);
        }
        translate([23, 0, 0])
        rotate([0,90,0])
            ring(2.5, 25);
    }
};

difference() {
    outer_shell();
    scale([1, 0.85, 0.85]) {
        outer_shell();
    };    
};





