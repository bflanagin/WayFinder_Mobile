import QtQuick 2.8

import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2
//import QtQuick.Controls.Styles 1.4

import QtQuick.LocalStorage 2.0 as Sql

import "qrc:/sToryTemplaTe.js" as Template



Window {
    id:mainView
    title: qsTr("WayFinder_Mobile")
    //width: 720
      width: 580
  //  height: 1280
    height: 1080
    visible: true

    //Theme //
    color:"black"
    property string borderColor: "#D2AF2B"


    //Openseed Stuff //

    property int uniqueemail: 0
    property int uniquename: 0
    property int uniqueaccount: 0
    property string uniqueid: '0'
    property bool newaccount: false
    property string userid:""
    property string message:""

    property string appId: "WF-03062018"
    property string devId: "Vag-01001011"


    property string gameselected: "none"

    property string thePlayers: ""
    property int maxplayers: 2


     property var db: Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo", 1);



     Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source:"qrc:/graphics/img/space1-portrait.png"
    }

    // Component.onCompleted: login.state = "Show"

        Component.onCompleted: {mainmenu.visible = true
                                Template.character_load()}



    Item {
        id:mainScreen
        anchors.fill: parent
        clip:true

        WFBorder {
            anchors.fill: parent
            visible: true
            //anchors.centerIn: parent
   }

        Login {
            id:login
             state:"Hide"
        }

        MainMenu {
            id:mainmenu
            //state:"Hide"
            visible: false
        }

        GameMode {
            id:gameselect
             visible: false
        }

        CharacterSelect {
            id:characterselect
             visible: false
        }

        CharacterManifest {
            id:charactermanifest
             visible: false
        }

        Encyclopedia {
            id:encyclopedia
             //state:"Hide"
            visible: false
        }

        Game {
            id:gamestart
            visible: false
        }



    }

    PlayerScreen {
        id:gameOn
        anchors.fill: parent
        visible: false
        clip:true
    }





}
