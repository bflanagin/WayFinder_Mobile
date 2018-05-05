function player_movement(playerNum,modifier) {

   //random number for movement

    var mov = Math.floor(Math.random() * 6);
    var movReturn = 0;

    if(mov == 0 ) {mov = 1;}

        movReturn = mov;

return movReturn;
}

function player_attack(playerNum,modifier) {

    //random attack number

    var act = Math.floor(Math.random() * 6);
    var actReturn = 0;

    if(act == 0 ) {act = 1;}

        actReturn = act;

  return actReturn;

}

function player_defense(playerNum,modifier) {

    //random defense number
    var def = Math.floor(Math.random() * 6);
    var defReturn = 0;

    if(def == 0 ) {def = 1;}

        defReturn = def;

  return defReturn

}

function card_draw(playerNum,type) {
    var cardNum = 0;
    var card = "";
    cardNum = Math.floor(Math.random() * 20);

    switch(type) {
        case "Command": card =pulledCard(num,type);break;
        case "Engineer":card =pulledCard(num,type);break;
        case "Medic":card =pulledCard(num,type);break;
        case "Security":card =pulledCard(num,type);break;
        case "Science_Officer":card =pulledCard(num,type);break;
        default:break;
    }

    return card;

}


function pull_log(mission,playerNum,playertype) {

    //pulls log for player taking in the accounts of past rolls

    var log = ""
        switch(playertype) {
        case "Command": log ="We've been traveling at maxium burn for more than a month. My crew has been preforming with distinction as I expected.\
I know that it sounds melodramatic but I for one need this experiment to succeed, its been too long since I've felt the vibration of a real ship under my feet. Heh, I just never thought I would be on a ship that was practically all engine.
";break;
        default: log = "No log entry";break;
        }



   return log;

}

function pull_event(mission,playerNum,playertype,round) {
    var event = "Everything seems to be working as expected -"+playertype+"-";
    var ev = 0;
    //pull events generic or exacting for player taking in the accounts of past rolls


    return event;
}

function pull_tiles(mission,playerNum,playertype) {
    var tiles = 0;
    var tilesReturn;
    //pulls log for player taking in the accounts of past rolls

   tiles = Math.floor(Math.random() * 6);

    if(tiles == 0 ) {tiles = 1;}
    if(tiles == 1) {
        tilesReturn = tiles+" tile";
    } else {
        tilesReturn = tiles+" tiles";
    }

    if (round == 0) {

    }

    return tilesReturn;
}

function place_tiles(mission,playerNum,playertype) {

    //pulls log for player taking in the accounts of past rolls
    var direction = "continuing main path"
    var dir = 0
    dir = Math.floor(Math.random() * 3);

    switch (round) {
    case 1:switch(dir) {
        case 0: direction = "heading toward the Bridge";break;
        case 1: direction = "to the left of your station";break;
        case 2: direction = "to the right of your station";break;
        default:direction ="heading away from the Bridge";break;
        };break;
    case 0:switch(dir) {
        case 0: direction = "continuing in the same direction as the last tile";break;
        case 1: direction = "to the left of the last tile";break;
        case 2: direction = "to the right of the last tile";break;
        default:direction =" continuing in the same direction as the last tile";break;
        };break;
    default:switch(dir) {
        case 0: direction = "continuing path";break;
        case 1: direction = "to the left of the last tile";break;
        case 2: direction = "to the right of the last tile";break;
        default:direction ="continuing path";break;
        }break;

    }

    return direction;
}

function pulled_card(num,type) {
    var reads = "";


    return reads;
}

function itterate() {
    if (turn < maxplayers-1) {
        turn = turn + 1;
    } else {
        round = round + 1;
        turn = 0;
    }
}

function rounds(type) {
    var roundCommand = "";
    if(round == 0) {
            if(type == "Command") {
            roundCommand = "Start game: Place your piece on the Bridge."
             } else {
            roundCommand ="Start game: Place "+type+"'s station " + pull_tiles(0,turn,0)+" "+place_tiles(0,turn,0)+" and "+ pull_tiles(0,turn,0)+" "+place_tiles(0,turn,0)+" from the Bridge. \
Place your piece at your station.\n\nThen remove the tiles between.";
                }
    } else {
        roundCommand = "Place "+pull_tiles(0,turn,0)+" "+place_tiles(0,turn,0);
    }

    return roundCommand;
}

function enemy_movement(mission,enemyNum,enemytype) {

    Math.floor(Math.random() * 10);

    //after player round enemies get to move

}

function enemy_attack(mission,enemyNum,enemytype) {

    Math.floor(Math.random() * 10);

    //if player is in range

}

function enemy_defense(mission,enemyNum,enemytype) {

    Math.floor(Math.random() * 10);

    //if player is in range

}
