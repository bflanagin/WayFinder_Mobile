import QtQuick 2.8
import "logic.js" as Logic
WFBorder {

    property string type: ""
    property int modifier: 0
    property int player: 0
    property int value1: 0
    property int value2: 0
    innerOpacity: 0.9

    onStateChanged: if(state == "Show") {switch(type) {
                                            case "Move": value1 = Logic.player_movement(player,modifier); break;
                                            case "Attack":value1 = Logic.player_attack(player,modifier);
                                                value2 = Logic.player_defense(player,modifier); break;
                        } }

    Item {
        visible: if(type == "Move") {true} else {false}
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.9
        height: parent.height * 0.82

        Text {
            anchors.top:parent.top
            anchors.topMargin: parent.width * 0.02
            anchors.horizontalCenter: parent.horizontalCenter
            color:borderColor
            text: qsTr("Move")
            font.pixelSize: parent.width * 0.13
        }

        Text {
            anchors.top:parent.top
            anchors.topMargin: parent.width * 0.4
            anchors.horizontalCenter: parent.horizontalCenter
            color:borderColor
            text: value1
            font.pixelSize: parent.width * 0.4
        }

    }

    Item {
        visible: if(type == "Attack") {true} else {false}
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.9
        height: parent.height * 0.82

        Text {
            anchors.top:parent.top
            anchors.topMargin: parent.width * 0.02
            anchors.horizontalCenter: parent.horizontalCenter
            color:borderColor
            text: qsTr("Attack")
            font.pixelSize: parent.width * 0.13
        }

        Text {
            anchors.top:parent.top
            anchors.topMargin: parent.width * 0.4
            anchors.horizontalCenter: parent.horizontalCenter
            color:borderColor
            text: value1
            font.pixelSize: parent.width * 0.4
        }
    }

}


