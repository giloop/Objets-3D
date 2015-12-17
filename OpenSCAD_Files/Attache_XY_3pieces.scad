use <MCAD/triangles.scad>

lengthY = 100;
lengthX = 40;
woodX = 27;
wallThick = 4;
screwHead = 10;
screwD = 5;
translate([0,0,0.5*woodX+wallThick]) rotate([0,-90,0])
difference() {
    union() {
        // attache() on Y axis
        translate([0,0,0.5*woodX+wallThick])
            rotate([90,0,0]) attache(woodX,woodX,lengthY,wallThick);
            translate([(lengthX+woodX)/2,0,0.5*woodX+wallThick])
                rotate([90,0,90]) attache(woodX,woodX,lengthX,wallThick);
        // attache() on X axis    
        translate([0.5*woodX,0.5*woodX,(woodX+wallThick)/2]) 
            triangle((lengthY-woodX)/2, lengthX, wallThick);
        // triangle reinforcement
        mirror([0,1,0]) translate([0.5*woodX,0.5*woodX,(woodX+wallThick)/2]) 
            triangle((lengthY-woodX)/2, lengthX, wallThick);
        //triangle(40, 20, wallThick);
    }
    // Cut interior of XY intersection
    translate([+0.5*woodX+wallThick,0,0.5*woodX+wallThick]) 
        #cube([lengthX+2*wallThick,woodX,woodX], true);
    // Add holes for screws
    /* X */
    translate([0.5*woodX+0.35*lengthX+wallThick,0,0]) 
        #cylinder(h=wallThick, d1=screwHead, d2=screwD, $fn=50);
    /*translate([0.5*woodX+0.35*lengthX+wallThick,0,woodX+wallThick-0.05]) 
        #cylinder(h=wallThick+0.1, d1=screwD, d2=screwHead, $fn=50);*/
    /* Y>0 */    
    translate([0,0.5*woodX+0.35*lengthX+wallThick,0])
        #cylinder(h=wallThick, d1=screwHead, d2=screwD, $fn=50);
    /*translate([0,0.5*woodX+0.35*lengthX+wallThick,woodX+wallThick-0.05]) #cylinder(h=wallThick+0.1, d1=screwD, d2=screwHead, $fn=50);*/
    /* Y<0 */    
    translate([0,-0.5*woodX-0.35*lengthX-wallThick,0]) 
        #cylinder(h=wallThick+0.05, d1=screwHead, d2=screwD, $fn=50);
    /*translate([0,-0.5*woodX-0.35*lengthX-wallThick,woodX+wallThick-0.05]) #cylinder(h=wallThick+0.1, d1=screwD, d2=screwHead, $fn=50);*/
    
}


module attache(sizeX,sizeY,sizeZ,thick)
difference() {
    roundedBox(sizeX+2*thick,sizeY+2*thick,sizeZ, thick);
    translate([0,0,-thick]) cube([sizeX,sizeY,sizeZ+2*thick], true);
}

module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
   }
}