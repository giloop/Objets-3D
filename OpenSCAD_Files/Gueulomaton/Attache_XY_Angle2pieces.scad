use <MCAD/triangles.scad>

lengthX = 40;
woodX = 27;
wallThick = 4;
screwHead = 10;
screwD = 4;

lengthY = lengthX+woodX;


difference() {
    union() {
        // attache() on Y axis
        translate([0,(lengthY-woodX)/2,0.5*woodX+wallThick])
            rotate([90,0,0]) attache(woodX,woodX,lengthY,wallThick);
        // attache() on X axis    
        translate([(lengthX+woodX)/2,0,0.5*woodX+wallThick])
                rotate([90,0,90]) attache(woodX,woodX,lengthX,wallThick);
        
        /* Back Y panel */
        translate([0,-woodX/2,woodX/2+wallThick])
            rotate([90,0,0]) backFace(woodX+2*wallThick,woodX+2*wallThick,wallThick,wallThick/2);
        
        // triangle reinforcement
        // X-Y Plane
        translate([0.5*woodX,0.5*woodX,(woodX+wallThick)/2]) 
            triangle(lengthX-wallThick*1.5, lengthX, wallThick);
    }
    
    // Cut interior of XY intersection
    translate([+0.5*woodX+wallThick,0,0.5*woodX+wallThick]) 
        #cube([lengthX+2*wallThick,woodX,woodX], true);
    
    // Add holes for screws (1 hole per bar)
    /* X-Y plan below */
    translate([0.55*woodX+0.35*lengthX+wallThick,0,-0.05]) 
        #cylinder(h=wallThick*2+woodX+0.1, d=screwD, $fn=50);
    translate([0,0.55*woodX+0.35*lengthX+wallThick,-0.05]) 
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

module backFace(x,y,z,rad){
    difference() {
        union() {
            translate([0,0,z/4]) roundedBox(x,y,z/2,rad);
            hull() {
                translate([-x/2+rad, y/2-rad,z/2]) sphere(r=rad, $fn=100);
                translate([ x/2-rad, y/2-rad,z/2]) sphere(r=rad, $fn=100);
                translate([-x/2+rad,-y/2+rad,z/2]) sphere(r=rad, $fn=100);
                translate([ x/2-rad,-y/2+rad,z/2]) sphere(r=rad, $fn=100);
           }
        }
        translate([0,0,-z/2]) cube([x,y,z], true);
    }
}
