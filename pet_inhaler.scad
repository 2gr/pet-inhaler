$fn = 256;

cat_nozzle_diameter = 50;
inhaler_nozzle_dimensions = [17,25,16.6];

module ring(r, R) {
    rotate([0,90,0])
        rotate_extrude()
            translate([R,0,0])
                circle(r);
}

module outer_shell() {
    difference() {
        sphere(d = cat_nozzle_diameter, true);
        translate([cat_nozzle_diameter / 2, 0, 0]) {
            cube(cat_nozzle_diameter, true);
        };
    };
    translate([-cat_nozzle_diameter / 2 , 0, 0]) {
        cube(inhaler_nozzle_dimensions, true);
    };
};

difference() {
    outer_shell();
    scale([1, 0.85, 0.85]) {
        outer_shell();
    };
};
ring(2.5, cat_nozzle_diameter / 2);
