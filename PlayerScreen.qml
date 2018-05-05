import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4


import "logic.js" as Logic
import "main.js" as Scripts

Item {
    id:thisWindow
    property int round: 0
    property int turn: 0
    property bool enemies_sighted: false
    property int mcounter: 20

    width:parent.width * 0.95
    height:parent.height * 0.95

    property string theState: "Hide"

    onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage"} else {theState = "Hide"}
    onRoundChanged: mcounter = 20;
    onTurnChanged: mcounter = 20;

    WFBorder {
        id:gameCard
       // anchors.fill: parent
      //  maxWidth: parent.width * 0.95
      //  maxHeight: parent.height * 0.95
        anchors.centerIn: parent
        state:theState

        clip:true

        Flickable {
            width: parent.width * 0.98
            height:parent.height * 0.92
            anchors.centerIn: parent
            contentHeight: narraColumn.height * 1.2

        Column {
            id:narraColumn
          // anchors.top:parent.top
          // anchors.topMargin: mainView.width * 0.02
          anchors.horizontalCenter: parent.horizontalCenter

            //anchors.centerIn: parent
            width: parent.width * 0.99

            spacing: parent.width * 0.03

        Text {
            id: title
            text: "Player "+ (turn +1)
            color: borderColor
            font.pixelSize: mainView.width * 0.05
            anchors.right: parent.right
        }

        Text {
            id: characterRank
            text: Scripts.pc_select(thePlayers.split(",")[turn],"rank")+"'s Log"
            color: borderColor
            font.pixelSize: mainView.width * 0.07
            width: parent.width
            wrapMode: Text.WordWrap

        }

        Text {
            id: characterName
            text: Scripts.pc_select(thePlayers.split(",")[turn],"name")
            color: borderColor
            font.pixelSize: mainView.width * 0.04
            width: parent.width
            wrapMode: Text.WordWrap

        }

        Rectangle {
            width: parent.width
            height:thisWindow.height * 0.005
            color: borderColor
        }


        Text {
            width: parent.width
            padding: mainView.width * 0.01
            color:borderColor
            wrapMode: Text.WordWrap
            text:Logic.pull_log(0,turn,Scripts.pc_select(thePlayers.split(",")[turn],"type"),round)

        }

        Rectangle {
            width: parent.width
            height:thisWindow.height * 0.005
            color: borderColor
        }

        Text {
            id:event

            width: parent.width * 0.98
            padding: mainView.width * 0.01
            color:borderColor
            wrapMode: Text.WordWrap
            text:Logic.pull_event(0,turn,Scripts.pc_select(thePlayers.split(",")[turn],"type"))
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id:command

            width: parent.width * 0.98
            padding: mainView.width * 0.01
            color:borderColor
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            text:Logic.rounds(Scripts.pc_select(thePlayers.split(",")[turn],"type"))

        }

        }

        }


        WFButtonMenu {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: mainView.width * 0.03
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.65
            height: parent.width * 0.15
            buttontext: "CONFIRMED"

            MouseArea {
                anchors.fill: parent
                onClicked: {gameCard.state ="Hide";
                            actionCard.visible = "true";
                            actionCard.state = "Engage";
                        }

                }
            }

    }

    WFBorder {
        id:actionCard
       // anchors.fill: parent
      //  maxWidth: parent.width * 0.95
       // maxHeight: parent.height * 0.95
        anchors.centerIn: parent
        visible: false
        clip:true

        onVisibleChanged: if(visible == true) {ticker.start();} else {ticker.stop();}

        WFButtonAction {
            id:moveAction
           // anchors.horizontalCenter: parent.horizontalCenter
          //  anchors.horizontalCenterOffset: mainView.width * -0.1
            anchors.left: parent.left
            anchors.leftMargin: mainView.width * 0.02
            anchors.top:parent.top
            anchors.topMargin: mainView.width * 0.05
            width: mainView.width * 0.40
            height: mainView.width * 0.20
            buttontext: "Move"
            opacity: if(round > 0){1} else {0.3}
            MouseArea {
                anchors.fill: parent
                onClicked: if(round > 0){
                    action.state = "Engage"
                    action.type = "Move"
                }
            }
        }

        WFButtonAction {
            id:attackAction
          //  anchors.horizontalCenter: parent.horizontalCenter
         //   anchors.horizontalCenterOffset: mainView.width * 0.2
            anchors.top:moveAction.bottom
            anchors.topMargin: mainView.width * 0.03
            anchors.left: moveAction.left
            //anchors.leftMargin: mainView.width *0.03
            width: mainView.width * 0.40
            height: mainView.width * 0.20
            buttontext: "Attack"
            opacity: if(round > 0 && enemies_sighted == true) {1} else {0.3}

            MouseArea {
                anchors.fill: parent
                onClicked: if(round > 0 && enemies_sighted == true) {
                    action.state = "Engage"
                    action.type = "Attack"
                }
            }
        }

      WFBorder   {
            id:status
            width: mainView.width * 0.45
            height: mainView.width * 0.45
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.02
            anchors.top: parent.top
            anchors.topMargin: mainView.width * 0.04
        }

        Map {
            anchors.top:status.bottom
            anchors.topMargin: mainView.width * 0.02
            anchors.bottom: abilities.top
            anchors.bottomMargin: mainView.width * 0.02
            anchors.left: parent.left
            anchors.leftMargin: mainView.width * 0.02
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.02
            state: "Show"
        }

        WFBorder {
            id:abilities
            //width: mainView.width * 0.98
            height: mainView.height * 0.28

            anchors.left: parent.left
            anchors.leftMargin: mainView.width * 0.02
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.02
            anchors.bottom: parent.bottom
            anchors.bottomMargin: mainView.width * 0.2

            Column {
                anchors.centerIn: parent
                width: parent.width
                height: parent.height * 0.83
                spacing: mainView.width * 0.02

                Item {
                    id:ab1

                    Rectangle {
                        anchors.fill: parent
                        border.color: borderColor
                        border.width: mainView.width * 0.001
                        color:Qt.rgba(0,0,0,0)
                    }

                    height: parent.height / 3.2
                    width: parent.width
                    Text {
                         padding:mainView.width * 0.01
                         width: parent.width
                         wrapMode: Text.WordWrap
                         color:borderColor
                         text:Scripts.pc_select(thePlayers.split(",")[turn],"ab1")

                        }

                }

                Item {
                id:ab2
                height: parent.height / 3.2
                width: parent.width

                Rectangle {
                    anchors.fill: parent
                    border.color: borderColor
                    border.width: mainView.width * 0.001
                    color:Qt.rgba(0,0,0,0)
                }

                Text {
                    padding:mainView.width * 0.01
                    width: parent.width
                    wrapMode: Text.WordWrap
                    color:borderColor
                    text: Scripts.pc_select(thePlayers.split(",")[turn],"ab2")
                }
                }

                Item {
                    id:ab3
                height: parent.height / 3.2
                width: parent.width

                Rectangle {

                    anchors.fill: parent
                    border.color: borderColor
                    border.width: mainView.width * 0.001
                    color:Qt.rgba(0,0,0,0)
                }

                Text {
                    padding:mainView.width * 0.01
                    width: parent.width
                    wrapMode: Text.WordWrap
                    color:borderColor
                    text: Scripts.pc_select(thePlayers.split(",")[turn],"ab3")
                }
                }

            }
        }

        WFButtonMenu {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: mainView.width * 0.03
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.65
            height: parent.width * 0.15
            buttontext: "End Turn"


            MouseArea {
                anchors.fill: parent
                onClicked: {gameCard.state = "Engage";
                            actionCard.state = "Hide";
                            Logic.itterate();
                            action.counter = 20;
                        }

                }
            }

        Timer {
            id:ticker
            running: false
            repeat: true
            interval: 1000
            onTriggered: if(mcounter > 0) {
                          //   console.log(mcounter);
                             mcounter = mcounter -1;
                         } else {
                          //   action.type = "";
                           //  action.state = "Hide";
                             mcounter = 20;
                            // ticker.stop();

                         }
        }

        CircularGauge {
            id:countdown
           // anchors.fill: parent
            anchors.bottom:parent.bottom
            anchors.bottomMargin: mainView.width * 0.05
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.03
            height: mainView.width * 0.1
            width: mainView.width * 0.1
            value: mcounter
            maximumValue: 20
            minimumValue: 0
            stepSize:1
            style: CircularGaugeStyle {
                   needle:  Rectangle {
                       y: outerRadius * 0.15
                       implicitWidth: outerRadius * 0.03
                       implicitHeight: outerRadius * 0.9
                       antialiasing: true
                       color: borderColor
                   }
                   foreground: null
                    tickmarkLabel: null
                   minorTickmarkCount : 9

                   tickmark:
                           Rectangle {
                                width: 3
                                height: 3
                                border.color: borderColor
                                border.width: 2
                                color:Qt.rgba(0.0,0.0,0.0,0)
                                antialiasing: true
                                clip:true
                                radius: width /2

                            Rectangle {
                             color: borderColor
                             opacity: if(mcounter >= styleData.index*10) {1} else {0}
                             anchors.centerIn: parent
                             width: parent.width * 0.80
                             height: parent.height * 0.80
                            antialiasing: true
                            radius: width /2
                            }
                   }
                   minorTickmark:   Rectangle {
                       width: 3
                       height: 3
                       border.color: borderColor
                       border.width: 2
                       color:Qt.rgba(0.0,0.0,0.0,0)
                        antialiasing: true
                        clip:true
                        radius: width /2


                   Rectangle {
                    color: borderColor
                    opacity: if(mcounter >= styleData.index+1) {1} else {0}
                    anchors.centerIn: parent
                    width: parent.width * 0.80
                    height: parent.height * 0.80
                    antialiasing: true
                    radius: width /2

                   }
          }
            }

            Behavior on value {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }


    }

    PopUp {
        id:action
        anchors.centerIn: parent
        maxWidth: parent.width * 0.75
        maxHeight: parent.width * 0.75
        state: "Hide"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.state = "Hide";
                parent.counter = 20;

            }
        }
    }






}
