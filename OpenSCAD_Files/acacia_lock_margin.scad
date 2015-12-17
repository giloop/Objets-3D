
thick = 5; // size factor, mm
margin = 0.1;
part1();
translate([0,5*thick,0]) part2();
translate([0,10*thick,0]) part3();
translate([7*thick,0, 0]) part4();
translate([7*thick,5*thick, 0]) part5();
translate([7*thick,10*thick,0]) part6();

module baseCube(b,m) { cube([6*b, 4*b, b-m]); }

// Part 1
module part1() {
    difference() {
        baseCube(thick, margin);
        translate([thick-margin, thick-margin, 0]) 
            cube([4*thick+2*margin, 2*thick+2*margin, thick-margin]);
    }
}

// Part 2
module part2() {
    difference() {
        part1();
        translate([2*thick-margin, 0, 0]) cube([2*thick+2*margin, thick+2*margin, thick]);
    }
}

// Part 3
module part3() {
    union() {
        part2();
        translate([3*thick, 2*thick+2*margin, 0]) cube(thick-margin);
    }
}

// Part 4
module part4() {
    union() {
        part2();
        translate([2*thick-2*margin, 0, 0]) cube(thick-margin);
    }
}

// Part 5
module part5() {
    union() {
        part4();
        translate([4*thick+margin, thick-margin, 0]) cube([thick, thick-margin, , thick-margin]);
    }
}

// Part 6
module part6() {
    difference() {
        union() {part2(); translate([0, 2*thick+2*margin, 0]) cube([4*thick-margin, thick-margin, thick-margin]); }
        translate([2*thick, 3*thick, 0]) #cube([thick+margin, thick+margin, , thick]);
    }
}
