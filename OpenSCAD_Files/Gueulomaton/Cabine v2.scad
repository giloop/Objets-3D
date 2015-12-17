/* Modélisation Cabine gueulomaton 
Les dimensions sont en mm */ 

/* Dimension des éléments de bois */
epaisTasseau1 = 47;
epaisTasseau2 = 30;
longCabine = 1600;
longPanneauEntree = 700;
largCabine = 900;
hautCabine = 2000;
epaisBois1 = 15; /* OSB */
epaisBois2 = 5;  /* CP */
largEcran = 340;
hautEcran = 270;
lExplose = 250;

/* Paramètres calculés */
epaisPanneau = epaisTasseau1 + epaisBois1 + epaisBois2; // épaisseur totale des panneaux
longPanneauxFond = longCabine - epaisPanneau; // longueur du fond de cabine

echo("Taille des tasseaux :", epaisTasseau1, epaisTasseau2);
echo("Epaisseur bois extérieur (OSB):", epaisBois1);
echo("Epaisseur bois intérieur (CP):", epaisBois2);
echo("Epaisseur d'un panneaux :", epaisPanneau, "mm");
echo("Epaisseur des 6 panneaux posés à plat (rangement):", 6*epaisPanneau, "mm");

/* Création de la cabine */
translate([epaisPanneau,0,0]) GueulomatonMonte();

/* Cabine explosée */
//translate([epaisPanneau,0,0]) GueulomatonExplose();

/* Cabine explosée avec repli du fond */
//translate([-3000,0,0]) GueulomatonExplose(-45);

/* Cabine à plat */
//translate([0,-3000,0]) rotate([90,0,90]) GueulomatonAPlat();

module GueulomatonMonte(bToit=true) {
    // Panneaux
    echo("Panneaux du fond pliables : longueur ", longPanneauxFond*0.5, "mm");
    cadrePanneau(longPanneauxFond*0.5, hautCabine);
    translate([longPanneauxFond*0.5, 0,0]) cadrePanneau(longPanneauxFond*0.5, hautCabine);
    rotate([0,0,90]) {
        echo("Panneau derrière écran :");
        rotate([0,0,180]) translate([-largCabine,-epaisPanneau,0]) cadrePanneau(largCabine, hautCabine);
        
        echo("Panneau intérieur:");
        translate([epaisPanneau,-200,0]) panneauInterieur(largCabine-epaisPanneau, hautCabine);
        
        echo("Panneau Arrière plan photo :");
        translate([0,-longCabine,0]) cadrePanneau(largCabine+epaisPanneau, hautCabine);
    }
    echo("Panneau devant entrée :");
    translate([longPanneauEntree,largCabine+epaisPanneau,0]) 
        rotate([0,0,180]) cadrePanneau(longPanneauEntree+epaisPanneau, hautCabine);
    
    // Toit
    if (bToit) {
        echo("Panneau du toit:");
        translate([-epaisPanneau,0,hautCabine]) rotate([90,0,90]) 
            cadrePanneau(largCabine+epaisPanneau, longCabine+epaisPanneau);
    }
}


module GueulomatonExplose(angPli=0) {
    // Panneaux du fond pliables
    translate([0,longPanneauxFond*0.5*sin(angPli)-lExplose,0]) {
    translate([longPanneauxFond*0.5*(1-cos(angPli))+epaisPanneau*sin(angPli), 
        -longPanneauxFond*0.5*sin(angPli),0]) 
        rotate([0,0,angPli]) cadrePanneau(longPanneauxFond*0.5, hautCabine);
    translate([longPanneauxFond*0.5-epaisPanneau*sin(angPli), 0,0]) 
        rotate([0,0,-angPli]) cadrePanneau(longPanneauxFond*0.5, hautCabine);
    };
    rotate([0,0,90]) {
        //Panneau derrière écran
        translate([epaisPanneau,lExplose,0]) cadrePanneau(largCabine, hautCabine);
        
        //Panneau intérieur
        translate([epaisPanneau,-200,0]) panneauInterieur(largCabine-epaisPanneau, hautCabine);
        
        //Panneau Arrière plan photo
        translate([0,-longCabine,0]) cadrePanneau(largCabine+epaisPanneau, hautCabine);
    }
    //Panneau devant entrée
    translate([longPanneauEntree,largCabine+epaisPanneau+lExplose,0]) 
        rotate([0,0,180]) 
        cadrePanneau(longPanneauEntree+epaisPanneau, hautCabine);
    
    //Panneau du toit
    translate([-epaisPanneau,0,hautCabine+lExplose]) rotate([90,0,90]) 
        cadrePanneau(largCabine+epaisPanneau, longCabine+epaisPanneau);
}

module GueulomatonAPlat() {
    esp = 5;
    // Panneaux du fond pliables
    cadrePanneau(longPanneauxFond*0.5, hautCabine);
    translate([0,epaisPanneau+1,0]) cadrePanneau(longPanneauxFond*0.5, hautCabine);
    
    // Panneau devant entrée 
    translate([0,4*(epaisPanneau+esp)+(epaisBois2+esp),0]) cadrePanneau(longPanneauEntree+epaisPanneau, hautCabine);
    
    // Panneau intérieur
    translate([0,2*(epaisPanneau+esp),0]) panneauInterieur(largCabine-epaisPanneau, hautCabine);
    // Panneau derrière écran 
    translate([0,2*(epaisPanneau+esp)+(epaisBois2+esp),0]) cadrePanneau(largCabine, hautCabine);
        
        
    // Panneau Arrière plan photo
    translate([0,3*(epaisPanneau+esp)+(epaisBois2+esp),0]) cadrePanneau(largCabine+epaisPanneau, hautCabine);
        
    // Toit
    translate([0,5*(epaisPanneau+esp)+(epaisBois2+esp),0]) cadrePanneau(largCabine+epaisPanneau, longCabine+epaisPanneau);

}


/** Modules */
module panneauInterieur(larg, haut) {
    difference() {
        echo("Taille du panneau :", larg, haut); 
        color("orange") cube([larg,epaisBois2,haut]);
        translate([0.5*(larg-largEcran),-1,1100]) cube([largEcran,epaisBois1+2,hautEcran]);
    }
}

/* Cadre d'un panneau : 4 tasseaux */
module cadrePanneau(larg, haut,bEcho=true) {
    if (bEcho==true) { echo("Taille du panneau :", larg, haut); }
    translate([0,epaisBois1,0]) union() {
        // Tasseaux verticaux
        tasseau(haut);
        translate([larg-epaisTasseau2,0,0]) tasseau(haut);
        // Tasseaux horizontaux
        lT = larg-2*epaisTasseau2;
        if (bEcho==true) { echo("2 tasseaux coupés à ",lT); }
        color("gold") translate([epaisTasseau2,0,epaisTasseau2]) rotate([0,90,0]) {
             tasseau(lT);
             translate([-haut+epaisTasseau2,0,0]) tasseau(lT);
        }
        
        // Panneaux de bois 
        #color("white") translate([0,-epaisBois1,0])
            cube([larg,epaisBois1,haut]);
        #color("yellow") translate([0,epaisTasseau1,0])
            cube([larg,epaisBois2,haut]);
    }
}

/* Un tasseau hauteur paramétrable */
module tasseau(haut=2000)
{
    cube([epaisTasseau2, epaisTasseau1, haut]);
}