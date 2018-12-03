bossW = 75;
bossH = 140;
bossD = 50;
space = 40;
slatH = 35;
hspace = 20;
wspace = 30;
wStep = bossW+space;
hStep = bossH + hspace;

module pedals(boardheight) {
    module bossSizePedal(bossW=75, bossH=140, bossD=50) {
        cube([bossW, bossH, bossD]);    
    }

    shiftV = boardheight - bossH - hspace;
    for(i = [0:1:4]){
        translate([i*wStep + wspace, hspace, 30])bossSizePedal();    
        translate([i*wStep + wspace, shiftV, 30])bossSizePedal();
    }
}

module pedalboard(boardwidth, boardheight, boarddepth, nHslats=8, nVslats=4) {
    // VERTICAL SLATS
    shiftH = (boardwidth - slatH) / 3;
    for(i = [0:1:nVslats-1]) {
        translate([i*shiftH, 0, 0])cube([slatH, boardheight, 15]);
    }
    // HORIZONTAL SLATS
    shiftV = (boardheight - slatH) / 7;
    for(i = [0:1:nHslats-1]){
        translate([0,i*shiftV, boarddepth/2])cube([boardwidth, slatH, 15]);
    }    
}

module handles(boardwidth, boardheight, boarddepth) {
    handlewidth=10;
    handledepth=20;
    handleheight=150;
    handleheight2=handleheight-50;
    
    module handle() {
        difference(){
            cube([handlewidth,handleheight,handledepth/2]);
            translate([-1,(handleheight2-30)/2,-1])cube([handlewidth+2,80,(handledepth/2)+1]);
        }
        translate([0,25,handledepth/2])cube([handlewidth,handleheight2,handledepth/2]);
    
    }
    
    translate([0,100,boarddepth])handle();
    translate([boardwidth-handlewidth,100,boarddepth])handle();
}

color([0.85,0.7,0.0])pedalboard(600, 350, 30);
color([0.2,0.2,0.2])handles(600, 350, 30);
color([0.9,0.9,0.9])pedals(350);