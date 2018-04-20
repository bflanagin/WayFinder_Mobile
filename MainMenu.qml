import QtQuick 2.8

import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2

Item {
    id:thisWindow
    anchors.centerIn: parent
    width:parent.width * 0.95
    height:parent.height * 0.95
    clip:true


    property string theState: "Hide"

   onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage"} else {theState = "Hide"}

    WFBorder {
        state: theState
        //anchors.fill:parent
        anchors.centerIn: parent
        innerOpacity: 0.8


    Column {
        id:mainBox
        width:parent.width * 0.99
        height:parent.height* 0.97
        anchors.centerIn: parent
        //visible:if(parent.height == mainView.height * 0.80) {true} else {false}
        spacing:mainView.width * 0.06

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source:"qrc:/graphics/img/logo2.png"
            width:parent.width * 0.45
            fillMode: Image.PreserveAspectFit
        }

        /* Text {
            id: title
            width:parent.width * 0.98
            text: qsTr("Main Menu")
            font.pointSize: if(parent.width > 0) {parent.width * 0.07} else {20}
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color:borderColor
            anchors.horizontalCenter: parent.horizontalCenter

        } */

        Rectangle {
            id:gameModes
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.95
            height:parent.width * 0.2
            clip:true
            color:Qt.rgba(0.1,0.1,0.1,0.8)
            radius: 8
            border.color: borderColor
            border.width:1

            Image {
               source:"qrc:/graphics/img/logo1.png"
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.left
               anchors.leftMargin: parent.width * 0.01
               height:parent.height * 0.9
               width:parent.height * 0.9

               Text {
                   text:qsTr("Play")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                  // height:parent.height
                   wrapMode: Text.WordWrap
                   width:missionLogs.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }

            Flasher {
                id:gflash
            }

            MouseArea {
                anchors.fill: parent
                onClicked: gameModes.color = borderColor,mainmenu.visible = false,gameselect.visible = true,gflash.start()
                onReleased: gameModes.color = "black"
            }
        }

        Item {
            width:parent.width * 0.95
            height:parent.width * 0.02
        }

        Rectangle {
            id:missionLogs
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.95
            height:parent.width * 0.15
            clip:true
            color:Qt.rgba(0.1,0.1,0.1,0.8)
             radius: 8
            border.color: borderColor
            border.width:1

            Image {
               source:"qrc:/graphics/img/logo1.png"
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.left
               anchors.leftMargin: parent.width * 0.01
               height:parent.height * 0.9
               width:parent.height * 0.9

               Text {
                   text:qsTr("Missions")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                   //height:parent.height
                   wrapMode: Text.WordWrap
                   width:missionLogs.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }

            Flasher {
                id:mflash
            }

            /*MouseArea {
                anchors.fill: parent
                onClicked: parent.color = borderColor,mainmenu.state = "Hide",gameselect.state = "Show",mflash.start()
                onReleased: parent.color = "black"
            } */
        }

        Rectangle {
            id:crewManifest
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.95
            height:parent.width * 0.15
            clip:true
            color:Qt.rgba(0.1,0.1,0.1,0.8)
             radius: 8
            border.color: borderColor
            border.width:1

            Image {
               source:"qrc:/graphics/img/logo2.png"
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.left
               anchors.leftMargin: parent.width * 0.01
               height:parent.height * 0.9
               width:parent.height * 0.9

               Text {
                   text:qsTr("Crew Manifest")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                   //height:parent.height
                   wrapMode: Text.WordWrap
                   width:missionLogs.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }
            Flasher {
                id:cflash
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.color = borderColor,mainmenu.visible = false,charactermanifest.visible = true,cflash.start()

            }
        }

        Rectangle {
            id:encyclopediaButton
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.95
            height:parent.width * 0.15
            clip:true
            color:Qt.rgba(0.1,0.1,0.1,0.8)
             radius: 8
            border.color: borderColor
            border.width:1

            Image {
               source:"qrc:/graphics/img/logo2.png"
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.left
               anchors.leftMargin: parent.width * 0.01
               height:parent.height * 0.9
               width:parent.height * 0.9

               Text {
                   text:qsTr("Encyclopedia")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                   //height:parent.height
                   wrapMode: Text.WordWrap
                   width:missionLogs.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }

            Flasher {
                id:eflash
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.color = borderColor,mainmenu.visible = false,encyclopedia.visible = true,eflash.start()

            }
        }
    }

    }

}
