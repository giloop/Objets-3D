/* Simple human silhouette for OpenScad */

humanShape(height_m=1.8);

module humanShape(height_m) {
    height_mm = height_m*1000;
    headDiam = 250;
    shoulder = 500;
    shoulderH = height_mm - headDiam;
    hips = 400;
    hipsH = 0.4*height_mm;
    feet = 400;
    union() {
    // head 
    translate([0,0,height_mm-0.5*headDiam]) scale([0.7,0.7,1]) sphere(d=headDiam);
    // Shoulder -> hips
    translate([0,0,hipsH])  scale([0.5,1,1]) cylinder(d1=hips,d2=shoulder,h=shoulderH-hipsH);
    // Hips -> feet
    scale([0.4,1,1]) cylinder(d1=feet,d2=hips,h=shoulderH-hipsH);    /*translate([0,0,chest_height+17]) cylinder(chest_height,chest/2-3,        waist/2);
    translate([0,0,chest_height*2+17]) cylinder(chest_height, waist/2, hips/2);
    translate([0,0,chest_height*3+17]) cylinder(torso_height*1.4, hips/2, 8);
    translate([0,0,torso_height*2.4+17]) cylinder(2,10,10);*/
    };
}