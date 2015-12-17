use <MCAD/triangles.scad>

lengthX = 45;
woodX = 27;
wallThick = 4;
screwHead = 8;
screwD = 4;

lengthY = lengthX+woodX;


difference() {
    union() {
        // attache() on Z axis    
        translate([0,0,0.5*(lengthX)])
            rotate([0,0,90]) attache(woodX,woodX,lengthX,wallThick);
        
        // T on X-Z direction
        translate([0.5*(woodX+lengthX),0,0.5*wallThick]) 
            roundedBox(lengthX,woodX+2*wallThick,wallThick,wallThick/2);
        //  triangle reinforcement X-Z plane
        translate([woodX/2,-wallThick/2,wallThick]) 
                rotate([0,-90,-90]) 
                triangle( 0.7*lengthX-wallThick*1.5, 0.7*lengthX, wallThick);
        
        // T on Y-Z direction
        translate([0,0.5*(woodX+lengthX),0.5*wallThick]) 
            roundedBox(woodX+2*wallThick,lengthX,wallThick,wallThick/2);
        //  triangle reinforcement X-Z plane
        translate([-wallThick/2,woodX/2,wallThick]) 
                rotate([90,0,90]) 
                triangle( 0.7*lengthX, 0.7*lengthX-wallThick*1.5, wallThick);
        
        
    }
    // Add holes for screws (1 hole per bar)
    /* X-Y plan below */
    translate([0.5*woodX+0.675*lengthX+wallThick, 0, -0.05]) {
        #cylinder(h=wallThick+0.1, d=screwD, $fn=50);
        translate([0, 0, wallThick-1.5])
        #cylinder(h=1.5+0.1, d1=screwD, d2=screwHead, $fn=50);
    }
    
    /* Z-X plane on the back  */  
    translate([0, -(0.5*woodX-0.05), 0.55*lengthX]) 
        rotate([90,0,0]) {
        #cylinder(h=wallThick+0.1, d=screwD, $fn=50);
        translate([0, 0, wallThick-1.5])
        #cylinder(h=1.5+0.1, d1=screwD, d2=screwHead, $fn=50);
    }
     
    /* Vertical Y-Z direction */
    translate([0, 0.5*woodX+0.675*lengthX+wallThick, -0.05]) {
        #cylinder(h=wallThick+0.1, d=screwD, $fn=50);
        translate([0, 0, wallThick-1.5])
        #cylinder(h=1.5+0.1, d1=screwD, d2=screwHead, $fn=50);
    }
}

module attache(sizeX,sizeY,sizeZ,thick)
difference() {
    roundedBox(sizeX+2*thick,sizeY+2*thick,sizeZ, thick/2);
    #translate([0,0,0]) cube([sizeX,sizeY,sizeZ+3*thick], true);
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
