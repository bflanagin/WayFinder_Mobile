import QtQuick 2.8
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

import "logic.js" as Logic
WFBorder {

    property string type: ""
    property int modifier: 0
    property int player: 0
    property int value1: 0
    property int value2: 0
     property int counter: 20
    innerOpacity: 0.9

   // onCounterChanged: if(counter == 20) {ticker.stop();}
   // onTypeChanged: if(type == "Move") {counter = 20;ticker.start()} else {counter = 20;ticker.stop()}

    onStateChanged: if(state == "Show") {switch(type) {
                                            case "Move": value1 = Logic.player_movement(player,modifier); break;
                                            case "Attack":value1 = Logic.player_attack(player,modifier);
                                                value2 = Logic.player_defense(player,modifier); break;
                        } } else {counter = 20;}

    Item {
        id:moveInfo
        visible: if(type == "Move") {true} else {false}
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.82





       /* Timer {
            id:ticker
            running: false
            repeat: true
            interval: 1000
            onTriggered: if(counter > 0) {
                             counter = counter -1;
                         } else {
                             action.type = "";
                             action.state = "Hide";
                             counter = 20;
                             ticker.stop();

                         }
        } */


        CircularGauge {
            id:countdown
            anchors.fill: parent
            value: mcounter
            maximumValue: 20
            minimumValue: 0
            stepSize:1
            style: CircularGaugeStyle {
                   needle: null /* Rectangle {
                       y: outerRadius * 0.15
                       implicitWidth: outerRadius * 0.03
                       implicitHeight: outerRadius * 0.9
                       antialiasing: true
                       color: borderColor
                   } */
                   foreground: null
                    tickmarkLabel: null
                   minorTickmarkCount : 9

                   tickmark:
                           Rectangle {
                                width: 15
                                height: 15
                                border.color: borderColor
                                border.width: 2
                                color:Qt.rgba(0.0,0.0,0.0,0)
                                antialiasing: true
                                clip:true
                                radius: width /2

                            Rectangle {
                             color: borderColor
                             opacity: if(mcounter > styleData.index*10) {1} else {0}
                             anchors.centerIn: parent
                             width: parent.width * 0.80
                             height: parent.height * 0.80
                            antialiasing: true
                            radius: width /2
                            }
                   }
                   minorTickmark:   Rectangle {
                       width: 15
                       height: 15
                       border.color: borderColor
                       border.width: 2
                       color:Qt.rgba(0.0,0.0,0.0,0)
                        antialiasing: true
                        clip:true
                        radius: width /2


                   Rectangle {
                    color: borderColor
                    opacity: if(mcounter > styleData.index+1) {1} else {0}
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



        Text {
            anchors.bottom:parent.bottom
            anchors.bottomMargin: parent.width * 0.02
            anchors.horizontalCenter: parent.horizontalCenter
            color:borderColor
            text: qsTr("Move")
            font.pixelSize: parent.width * 0.13
        }

        Text {
          //  anchors.top:parent.top
           // anchors.topMargin: parent.width * 0.4
           // anchors.horizontalCenter: parent.horizontalCenter
            anchors.centerIn: parent
            color:borderColor
            text: value1
            font.pixelSize: parent.width * 0.4
        }

    }

    Item {
            id:attackInfo
        visible: if(type == "Attack") {true} else {false}
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.82


        Text {
            anchors.top:parent.top
            anchors.topMargin: parent.width * 0.01
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


