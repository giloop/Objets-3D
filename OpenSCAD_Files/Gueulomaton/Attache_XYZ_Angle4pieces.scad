use <MCAD/triangles.scad>

lengthX = 40;
woodX = 27;
wallThick = 4;
screwHead = 10;
screwD = 4;

lengthY = 2*lengthX+woodX;


difference() {
    union() {
        // attache() on Y axis
        translate([0,0,0.5*woodX+wallThick])
            rotate([90,0,0]) attache(woodX,woodX,lengthY,wallThick);
        // attache() on X axis    
        translate([(lengthX+woodX)/2,0,0.5*woodX+wallThick])
                rotate([90,0,90]) attache(woodX,woodX,lengthX,wallThick);
        // attache() on Z axis    
        translate([0,0,0.5*(lengthX)+woodX+wallThick])
                rotate([0,0,90]) attache(woodX,woodX,lengthX,wallThick);
        
        // triangle reinforcement
        // X-Y Plane
        translate([0.5*woodX,0.5*woodX,(woodX+wallThick)/2]) 
            triangle((lengthY-woodX)/2, lengthX, wallThick);
        
        mirror([0,1,0]) translate([0.5*woodX,0.5*woodX,(woodX+wallThick)/2]) 
            triangle((lengthY-woodX)/2, lengthX, wallThick);
        
        // Y-Z plane
        translate([wallThick/2,woodX/2,woodX+wallThick]) 
                rotate([0,-90,0]) 
                triangle(0.75*lengthX-wallThick*1.5, lengthX, wallThick);
            
        mirror([0,1,0]) translate([wallThick/2,woodX/2,woodX+wallThick]) 
            rotate([0,-90,0]) 
            triangle(0.75*lengthX-wallThick*1.5, lengthX, wallThick);
            
        // X-Z plane
        translate([woodX/2,-wallThick/2,woodX+wallThick]) 
                rotate([0,-90,-90]) 
                triangle(0.75*lengthX-wallThick*1.5, 0.75*lengthX, wallThick);
        
    }
    // Cut interior of XY intersection
    translate([+0.5*woodX+wallThick,0,0.5*woodX+wallThick]) 
        #cube([lengthX+2*wallThick,woodX,woodX], true);
    // Cut interior of Z intersection
    translate([0,0,lengthX+0.5*woodX-wallThick]) 
        #cube([woodX,woodX,lengthX+4*wallThick], true);
    
    // Add holes for screws (1 hole per bar)
    /* X-Y plan below */
    translate([0.9*woodX+0.35*lengthX+wallThick,0,-0.05]) 
        #cylinder(h=wallThick*2+woodX+0.1, d=screwD, $fn=50);
    translate([0,0.9*woodX+0.35*lengthX+wallThick,-0.05]) 
        #cylinder(h=wallThick*2+woodX+0.1, d=screwD, $fn=50);
    translate([0,-(0.9*woodX+0.35*lengthX+wallThick),-0.05]) 
        #cylinder(h=wallThick*2+woodX+0.1, d=screwD, $fn=50);
    
    /* Y>0 
    translate([0,0.5*woodX+0.35*lengthX+wallThick,-0.05]) 
        #cylinder(h=wallThick+0.1, d1=screwHead, d2=screwD, $fn=50); */   
    /* Y<0   
    translate([0,-0.5*woodX-0.35*lengthX-wallThick,-0.05]) 
        #cylinder(h=wallThick++0.1, d1=screwHead, d2=screwD, $fn=50); */ 
    
    /* Y-Z plane on the back */
   translate([0.5*woodX+2*wallThick,0,0.5*woodX+1.125*lengthX+wallThick]) 
        rotate([0,-90,0]) 
        #cylinder(h=wallThick*4+woodX+0.1, d=screwD, $fn=50);
    /* translate([-0.5*woodX,0.5*woodX+0.35*lengthX+wallThick,0.5*woodX+wallThick]) 
        rotate([0,-90,0]) 
        #cylinder(h=wallThick+0.1, d1=screwD, d2=screwHead, $fn=50);
    translate([-0.5*woodX,-0.5*woodX-0.35*lengthX-wallThick,0.5*woodX+wallThick]) 
        rotate([0,-90,0]) 
        #cylinder(h=wallThick+0.1, d1=screwD, d2=screwHead, $fn=50);
    translate([-0.5*woodX,0,woodX+2*wallThick+0.35*lengthX]) 
        rotate([0,-90,0]) 
        #cylinder(h=wallThick+0.1, d1=screwD, d2=screwHead, $fn=50);
     */
}


module attache(sizeX,sizeY,sizeZ,thick)
difference() {
    roundedBox(sizeX+2*thick,sizeY+2*thick,sizeZ, thick/2);
    translate([0,0,-thick]) cube([sizeX,sizeY,sizeZ+2*thick], true);
}

module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
   }
}