function narrative_load() {

    //The narraTive daTabase has the main story arch as well as any sub arcs that are posible. When creating a story users should focus on the story from the eyes of the character

}

function events_load() {

    //The event database holds events that are standard to the plot of the mission. Location events can also be included which are system controlled and not considered by the story teller.

}

function canned_response() {

    //The canned responses database is a set of predefined "oh darn" type additions to the log to add flare to the story

}

function location_events() {

    //location events are tied to the missions location (Ship, planet, Asteroid, etc.) these randomly insert themselves much like the events

}

function character_load() {

    //add in default crew

    var userStr = "INSERT INTO PlayableCharacters VALUES(?,?,?,?,?,?,?,?,?,?)";

    var c1 = [ 0,
                "Command",
              "Captian",
              "Owen Pen-Wright",
              "U.S.C.",
              "Available",
              "After loosing his ship and most of the crew in the civil war that ravaged the Sol system Owen PenWright has spent years grounded on Earth undergoing theropy both mental and Physical.\
Shortly after being cleared for active duty Owen was given command of the Hermann-Wyell the first of its kind WayFinder class Vessel.",
              "AB1",
              "AB2",
              "AB3",
                ];
    var c2 = [ 1,
                "Engineer",
              "Experimental Engine Specialist",
              "Liam Slowburn",
              "U.S.C.",
              "Available",
              "Considered a genius by some and an oddball by others Liam Slowburn's greatest achievement is the very engine that the Hermann-Wyell is built around.\
Rather esentric Liam often finds that talking with machinery easier than talking with his fellow crew memebers, and is often taken by surprise when interupted by actual conversation.",
              "AB1",
              "AB2",
              "AB3",
                ];
    var c3 = [ 2,
                "Science Officer",
              "ExoBiologist",
              "Sera Laine",
              "U.S.C.",
              "Available",
              "Sera Laine is the top of everything; top of her class in the academy, top choice for the Hermann-Wyell's crew, and at the top of the list for 'most likely to start a war with the first alien spieces she meets'\
                her desire to know and understand any and everything has led her to make bad decissions both personal and professional.",
              "AB1",
              "AB2",
              "AB3",
                ];
    var c4 = [ 3,
                "tactical Officer",
              "Chief tactical Officer",
              "Seamus McNeal",
              "U.S.C.",
              "Available",
              "Fresh out of the academy with a desire to prove himself Seamus, is eyeing the captains chair and he plans to take every risk, within regulations, to get him there.",
              "AB1",
              "AB2",
              "AB3",
                ];

    var c5 = [ 4,
                "Medic",
              "Chief Medical Officer",
              "Jennifer Johanson",
              "U.S.C.",
              "Available",
              "Jennifer Johanson, or JJ if you want to end up in the med bay by her hand, isn't your typical medic. She is a no nonsense woman that has seen her share of death and quite unfortunatly\
those that should have died. She was a junior officer on the ship that Captain Pen-Wright lost so many years ago. It was her bravery that saved a great number of the crew on that ill-fated day, and it was the captain that forced her into the escape pod with him just before it was to late.",
              "AB1",
              "AB2",
              "AB3",
                ];

        db.transaction(function(tx) {

             tx.executeSql('CREATE TABLE IF NOT EXISTS PlayableCharacters (id INT, type TEXT,rank TEXT,name TEXT, commission TEXT,status TEXT,about TEXT,ability1 TEXT,ability2 TEXT,ability3 TEXT)');

            var testStr = "SELECT  * FROM PlayableCharacters WHERE id= 0";
            var testStr1 = "SELECT  * FROM PlayableCharacters WHERE id= 1";
            var testStr2 = "SELECT  * FROM PlayableCharacters WHERE id= 2";
            var testStr3 = "SELECT  * FROM PlayableCharacters WHERE id= 3";
            var testStr4 = "SELECT  * FROM PlayableCharacters WHERE id= 4";

            var c1t = tx.executeSql(testStr);
                if(c1t.rows.length == 0) {
                    tx.executeSql(userStr,c1);
                     }
            var c2t = tx.executeSql(testStr1);
                 if(c2t.rows.length == 0) {
                       tx.executeSql(userStr,c2);
                 }
                var c3t = tx.executeSql(testStr2);
                if(c3t.rows.length == 0) {
                        tx.executeSql(userStr,c3);
                }
                    var c4t = tx.executeSql(testStr3);
                    if(c4t.rows.length == 0) {
                         tx.executeSql(userStr,c4);
                     }
                        var c5t = tx.executeSql(testStr4);
                        if(c5t.rows.length == 0) {
                            tx.executeSql(userStr,c5);
                    }
        });

}




