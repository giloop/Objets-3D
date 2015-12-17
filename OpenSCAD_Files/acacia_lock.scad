
thick = 5; // size factor, mm

part1();
translate([0,5*thick,0]) part2();
translate([0,10*thick,0]) part3();
translate([7*thick,0, 0]) part4();
translate([7*thick,5*thick, 0]) part5();
translate([7*thick,10*thick,0]) part6();

module baseCube(b) { cube([6*b, 4*b, b]); }

// Part 1
module part1() {
    difference() {
        baseCube(thick);
        translate([thick, thick, 0]) cube([4*thick, 2*thick, thick]);
    }
}

// Part 2
module part2() {
    difference() {
        baseCube(thick);
        translate([thick, thick, 0]) cube([4*thick, 2*thick, thick]);
        translate([2*thick, 0, 0]) cube([2*thick, 2*thick, thick]);
    }
}

// Part 3
module part3() {
    union() {
        part2();
        translate([3*thick, 2*thick, 0]) cube(thick);
    }
}

// Part 4
module part4() {
    union() {
        part2();
        translate([2*thick, 0, 0]) cube(thick);
    }
}

// Part 5
module part5() {
    union() {
        part4();
        translate([4*thick, thick, 0]) cube(thick);
    }
}

// Part 6
module part6() {
    difference() {
        union() {part2(); translate([0, 2*thick, 0]) cube([4*thick, thick, thick]); }
        translate([2*thick, 3*thick, 0]) #cube(thick);
    }
}
