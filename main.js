function pc_load() {
        clist.clear();

        db.transaction(function(tx) {

             tx.executeSql('CREATE TABLE IF NOT EXISTS PlayableCharacters (id INT, type TEXT,rank TEXT,name TEXT, commission TEXT,status TEXT,about TEXT,ability1 TEXT,ability2 TEXT,ability3 TEXT)');
               var dataStr = "SELECT * FROM `PlayableCharacters` WHERE 1";
              var pull = tx.executeSql(dataStr);

            var record = 0;
             while (pull.rows.length > record) {

                    console.log(thePlayers);

                    if(thePlayers.search(pull.rows.item(record).id) == -1) {

                 clist.append({
                                  characterNum: pull.rows.item(record).id,
                                  rank:pull.rows.item(record).rank,
                                  type: pull.rows.item(record).type,
                                  name:pull.rows.item(record).name,
                                  commission: pull.rows.item(record).commission,
                                  status:pull.rows.item(record).status,
                                  about: pull.rows.item(record).about,
                                  a1:pull.rows.item(record).ability1,
                                  a2:pull.rows.item(record).ability2,
                                  a3:pull.rows.item(record).ability3,

                             });

                          }

                 record = record + 1;
             }
        });


}


function pc_select(pcNum,field) {
     //   clist.clear();

       var  valueReturn = "";
        db.transaction(function(tx) {

             tx.executeSql('CREATE TABLE IF NOT EXISTS PlayableCharacters (id INT, type TEXT,rank TEXT,name TEXT, commission TEXT,status TEXT,about TEXT,ability1 TEXT,ability2 TEXT,ability3 TEXT)');
               var dataStr = "SELECT * FROM `PlayableCharacters` WHERE id="+pcNum;
              var pull = tx.executeSql(dataStr);


                            switch(field) {
                                 case "id": valueReturn = pull.rows.item(0).id;break;
                                 case "rank": valueReturn = pull.rows.item(0).rank;break;
                                 case "type": valueReturn = pull.rows.item(0).type;break;
                                 case "name": valueReturn = pull.rows.item(0).name;break;
                                 case "commission": valueReturn = pull.rows.item(0).commission;break;
                                 case "status": valueReturn = pull.rows.item(0).status;break;
                                 case "about": valueReturn = pull.rows.item(0).about;break;
                                 case "ab1": valueReturn = pull.rows.item(0).ability1;break;
                                 case "ab2": valueReturn = pull.rows.item(0).ability2;break;
                                 case "ab3": valueReturn = pull.rows.item(0).ability3;break;
                                }

        });

return valueReturn;
}
