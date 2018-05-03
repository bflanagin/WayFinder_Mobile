import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2

import "logic.js" as Logic

Item {
    id:thisWindow
    property int round: 0
    property int turn: 0

    width:parent.width * 0.95
    height:parent.height * 0.95

    property string theState: "Hide"

    onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage"} else {theState = "Hide"}

    WFBorder {
        id:gameCard
       // anchors.fill: parent
      //  maxWidth: parent.width * 0.95
      //  maxHeight: parent.height * 0.95
        anchors.centerIn: parent
        state:theState

        clip:true

        Column {
          // anchors.top:parent.top
          // anchors.topMargin: mainView.width * 0.02
          // anchors.horizontalCenter: parent.horizontalCenter

            anchors.centerIn: parent
            width: parent.width * 0.98
            height:parent.height * 0.92
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
            text: "<rank>'s Log"
            color: borderColor
            font.pixelSize: mainView.width * 0.08

        }

        Text {
            id: characterName
            text: "Character Name"
            color: borderColor
            font.pixelSize: mainView.width * 0.04

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
            text:"We've been traveling at maxium burn for more than a month. My crew has been preforming with distinction as I expected.
I know that it sounds melodramatic but I for one need this experiment to succeed, its been too long since I've felt the vibration of a real ship under my feet. Heh, I just never thought I would be on a ship that was practically all engine.
"

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
            text:"Something HAPPENED!!!"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id:command

            width: parent.width * 0.98
            padding: mainView.width * 0.01
            color:borderColor
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            text:Logic.rounds(0)

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

            MouseArea {
                anchors.fill: parent
                onClicked: {
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    action.state = "Engage"
                    action.type = "Attack"
                }
            }
        }

        Map {
            id:map
            width: mainView.width * 0.45
            height: mainView.width * 0.45
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.02
            anchors.top: parent.top
            anchors.topMargin: mainView.width * 0.04
        }

        WFBorder {
            anchors.top:map.bottom
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
                         color:borderColor
                         text:"Ability 1"

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
                    color:borderColor
                    text: "Ability 2"
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
                    color:borderColor
                    text: "Ability 3"
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
            }
        }
    }

}
