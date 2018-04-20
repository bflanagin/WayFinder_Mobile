import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.2
//import QtQuick.Controls.Styles 1.4
import "openseed.js" as OpenSeed

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
        id:gameBox
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
            text: qsTr("Modes")
            font.pointSize: if(parent.width > 0) {parent.width * 0.07} else {20}
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color:borderColor
            anchors.horizontalCenter: parent.horizontalCenter

        } */

        Rectangle {
            id:deviceShared
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
                   text:qsTr("Shared Device")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                  // height:parent.height
                   wrapMode: Text.WordWrap
                   width:deviceMulti.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }

            Flasher {
                id:gflash
            }

            MouseArea {
                anchors.fill: parent
                onClicked: deviceShared.color = borderColor,mainmenu.visible = false,gameselect.visible = false,gamestart.visible = true,gflash.start()
                onReleased: deviceShared.color = "black"
            }
        }

        Rectangle {
            id:deviceMulti
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.95
            height:parent.width * 0.2
            clip:true
            color:Qt.rgba(0.1,0.1,0.1,0.8)
             radius: 8
            border.color: borderColor
            border.width:1
            opacity: 0.2
            Image {
               source:"qrc:/graphics/img/logo1.png"
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.left
               anchors.leftMargin: parent.width * 0.01
               height:parent.height * 0.9
               width:parent.height * 0.9

               Text {
                   text:qsTr("Local Connect")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                   //height:parent.height
                   wrapMode: Text.WordWrap
                   width:deviceMulti.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }
        }

        Rectangle {
            id:deviceWeb
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.95
            height:parent.width * 0.2
            clip:true
            color:Qt.rgba(0.1,0.1,0.1,0.8)
             radius: 8
            border.color: borderColor
            border.width:1
            opacity: 0.2

            Image {
               source:"qrc:/graphics/img/logo2.png"
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.left
               anchors.leftMargin: parent.width * 0.01
               height:parent.height * 0.9
               width:parent.height * 0.9

               Text {
                   text:qsTr("Web Connect")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                   //height:parent.height
                   wrapMode: Text.WordWrap
                   width:deviceMulti.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }
        }


    }

    Rectangle {
        id:back
        anchors.bottom:parent.bottom
        anchors.left:parent.left
        anchors.bottomMargin: parent.width * 0.05
        width:parent.width * 0.50
        height:parent.width * 0.1
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
               text:qsTr("Main Menu")
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.right
               anchors.leftMargin: parent.width * 0.2
               //height:parent.height
               wrapMode: Text.WordWrap
               width:deviceMulti.width - parent.width
               font.pixelSize: parent.height * 0.5
               color:borderColor
           }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: gameselect.visible = false,mainmenu.visible = true
        }
    }

    }

}
