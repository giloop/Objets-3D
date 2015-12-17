lengthY = 100;
lengthX = 40;
woodX = 27;
wallThick = 4;
union() {
    translate([0,0,0.5*woodX+wallThick])
        rotate([90,0,0]) attache(woodX,woodX,lengthY,wallThick);
    translate([(lengthX/2+woodX)/2,0,0.5*woodX+wallThick])
        rotate([90,0,90]) attache(woodX,woodX,lengthX,wallThick);
}

module attache(sizeX,sizeY,sizeZ,thick)
difference() {
    roundedBox(sizeX+2*thick,sizeY+2*thick,sizeZ, thick);
    cube([sizeX,sizeY,sizeZ], true);
}

module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad);
   }
}