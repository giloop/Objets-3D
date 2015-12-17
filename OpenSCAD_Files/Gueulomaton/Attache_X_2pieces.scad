lengthY = 80;
lengthX = 40;
woodX = 27;
wallThick = 4;
screwD = 4;


difference() {
    translate([0,0,0.5*woodX+wallThick])
        rotate([90,0,0]) attache(woodX,woodX,lengthY,wallThick);

    // Add holes for screws (1 hole per bar)
    /* X-Y plan below */
    translate([0,0.275*lengthY,-0.05]) 
        #cylinder(h=wallThick*2+woodX+0.1, d=screwD, $fn=50);
    translate([0,-(0.275*lengthY),-0.05]) 
        #cylinder(h=wallThick*2+woodX+0.1, d=screwD, $fn=50);
    
}

module attache(sizeX,sizeY,sizeZ,thick) {
difference() {
    roundedBox(sizeX+2*thick,sizeY+2*thick,sizeZ, thick/2);
    translate([0,0,-0.5*thick]) cube([sizeX,sizeY,sizeZ+3*thick], true);
}
}

module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
   }
}
