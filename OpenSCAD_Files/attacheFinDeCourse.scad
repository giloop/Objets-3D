x = 15;
y = 15;
h = 3;
dTrou = 1.9;
dxTrou = 8.6;

//attacheHoriz(15,15,3,1.9);

//translate([0,2*y,0]) 
attacheVert(25,16,3,1.9);

module attacheVert(x,y,z,dTrou) {
union() {
    difference() {
        cube([x,y,h], true);
        #translate([-0.5*x+8,0,0]) cylinder(h=h*2,d=3.1, $fn=50, center=true);
        
    }
    translate([x*0.5-4,0.5*(dxTrou-dTrou),h/2])
    cylinder(h=5,d=dTrou, $fn=50);
    translate([x*0.5-4,-0.5*(dxTrou-dTrou),h/2]) 
    cylinder(h=5, d=dTrou, $fn=50);
}
}

module attacheHoriz(x,y,z,dTrou) {
union() {
    difference() {
        cube([x,y,h], true);
        #cylinder(h=h*2,d=3.1, $fn=50, center=true);
        
    }
    translate([x*0.5,0.5*(dxTrou-dTrou),(dTrou-h)/2]) rotate([0,90,0])
    cylinder(h=5,d=dTrou, $fn=50);
    translate([x*0.5,-0.5*(dxTrou-dTrou),(dTrou-h)/2]) rotate([0,90,0])
    cylinder(h=5, d=dTrou, $fn=50);
}
}