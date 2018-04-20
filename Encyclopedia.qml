import QtQuick 2.8
import QtCanvas3D 1.1
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2

import "glcode.js" as GLCode

Item {

    id:thisWindow
    anchors.centerIn: parent
    width:parent.width
    height:parent.height * 0.95
    clip:true

   property string theState: "Hide"

   onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage"} else {theState = "Hide"}

    Item {
        id:crewview
        anchors.verticalCenter: parent.verticalCenter
        width:parent.width
        height:parent.height
        visible: parent.visible

        WFBorder {
            id:viewport
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.02
            maxWidth:parent.width * 0.63
            maxHeight:parent.width * 0.60

            clip:true
            state: theState


    Canvas3D {
        id: canvas3d
        //anchors.top: parent.top
      //  anchors.right: parent.right
          anchors.centerIn: parent
      //  anchors.rightMargin: mainView.width * 0.02
        width:parent.width * 0.98
        height:parent.width * 0.85
        focus: false
        visible: true
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }

        onInitializeGL: {
            GLCode.initializeGL(canvas3d);
        }

        onPaintGL: {
            GLCode.paintGL(canvas3d);
        }

        onResizeGL: {
            GLCode.resizeGL(canvas3d);
        }
    }

        }

        Item {
            anchors.top:viewport.bottom
            anchors.topMargin: mainView.width * -0.03
            anchors.horizontalCenter: viewport.horizontalCenter
            width:viewport.width
            height:viewport.width * 0.01
            clip:true
            Row {
                anchors.fill: parent
                spacing: mainView.width * 0.01
                Repeater {
                    model:3

                        Rectangle {
                                height:parent.height
                                width:viewport.width  / 3
                                color: if(index == 1) {"white"} else {Qt.rgba(0.4,0.4,0.4,0.5)}
                             }

                        }

                 }
            }

    Item {
        visible: if(viewport.state == "Show") {true} else {false}
        anchors.top:viewport.bottom
        anchors.topMargin: mainView.width * 0.02
        anchors.right:viewport.right
        width:viewport.width
        anchors.bottom:parent.bottom
        anchors.bottomMargin: mainView.width * 0.01
        //height:generalinfo.height

        Rectangle {
            anchors.centerIn: generalinfo
            //border.width: [0,1,1,0]
            //border.color: borderColor
           // width:parent.width
           // height:generalinfo.height * 1.1
            anchors.fill:parent
            color:Qt.rgba(0.9,0.9,0.9,0.1)
        }

        Column {
            id:generalinfo
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.98
            spacing: parent.width * 0.05

            Text {
                id:statTitle
                text:"Thing"
                color:"white"
                font.pointSize: parent.width * 0.06
                width:parent.width
                horizontalAlignment: Text.AlignLeft
            }

            Rectangle {
                width:parent.width
                height:mainView.width * 0.003
                color:borderColor
            }

            Text {
                id:name
                text:"Planet:"
                color:"white"
                width:parent.width
                font.pointSize: parent.width * 0.05
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                id:rank
                text:"Race:"
                color:"white"
                font.pointSize: parent.width * 0.05
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                id:commission
                text:"avg Height: avg Weight:"
                color:"white"
                font.pointSize: parent.width * 0.05
                horizontalAlignment: Text.AlignLeft
            }

            Text {
                id:status
                text:"Status:"
                color:"white"
                font.pointSize: parent.width * 0.05
                width:parent.width
                horizontalAlignment: Text.AlignLeft
            }

            Rectangle {
                width:parent.width
                height:mainView.width * 0.003
                color:borderColor
            }


            Text {
                id:about
                text:"About:"
                color:"white"
                font.pointSize: parent.width * 0.05
                horizontalAlignment: Text.AlignJustify
            }

        }

    }





    }

    /*Rectangle {
        id:menubutton
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.leftMargin: mainView.width * 0.02
        color:"black"
        border.width:1
        border.color: borderColor
        height:mainView.width * 0.05
        width:parent.width * 0.15
        radius: height / 2

        Image {
           source:"qrc:/graphics/img/logo1.png"
           anchors.verticalCenter: parent.verticalCenter
           anchors.left:parent.left
           anchors.leftMargin: parent.width * 0.01
           height:parent.height * 0.9
           width:parent.height * 0.9

           Text {
               text:qsTr("Menu")
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.right
               anchors.leftMargin: parent.width * 0.1
               //height:parent.height
               wrapMode: Text.WordWrap
               width:menubutton.width - parent.width
               font.pixelSize: parent.height * 0.5
               color:borderColor
           }
        }

        MouseArea {
            anchors.fill:parent
            onClicked: theMenu.state = "Show"
        }
    } */


    Item {
        id:theMenu
        width:parent.width * 0.35
        height:parent.height

        states: [

            State {
              name: "Show"

              PropertyChanges {
                  target:theMenu
                  x:0
                  opacity: 1
              }
            },

            State {
                name:"Hide"
                PropertyChanges {
                    target: theMenu
                    x: -1* width
                    opacity: 0
                }
            }

        ]

        transitions: [
            Transition {
                from: "Hide"
                to: "Show"
                reversible: true

                NumberAnimation {
                    target: theMenu
                    property: "opacity"
                    duration: 200
                    easing.type: Easing.InOutQuad
                }

            },

            Transition {
                from: "Hide"
                to: "Show"
                reversible: true


                NumberAnimation {
                    target: theMenu
                    property: "x"
                    duration: 1400
                    easing.type: Easing.InOutQuad
                }

            }

        ]

        state:"Show"

       // onStateChanged: if(state =="Show") {focus = true} else {focus = false}
       // onFocusChanged: if(focus == false) {state = "Hide"} else {state = "Show"}

        MouseArea {
            anchors.fill: parent
            onClicked: console.log("")
        }

        Rectangle {
            height:parent.height
            width:mainView.width * 0.01
            color:borderColor
            anchors.right:parent.right
        }

        Rectangle {
            anchors.fill: parent
            color:Qt.rgba(0,0,0,0.9)

            }
        Column {
            anchors.verticalCenter: parent.verticalCenter
            width:parent.width
            height:parent.height * 0.98
            spacing: mainView.width * 0.02
            //clip:true


           /* Rectangle {
                width:parent.width
                height:mainView.width * 0.01
                color:borderColor
            } */

            Text {
                text:qsTr("Technology:")
                color:"white"
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                font.pointSize: mainView.width * 0.03
            }

            WFButtonMenu {
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                height:mainView.width * 0.07
                width:parent.width * 0.9
                buttontext:qsTr("Vehicles")

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.flashit = true
                   // onClicked: theMenu.state = "Hide",charactermanifest.state = "Hide",mainmenu.state = "Show"
                }


            }

            WFButtonMenu {
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                height:mainView.width * 0.07
                width:parent.width * 0.9
                buttontext:qsTr("Weapons")

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.flashit = true
                   // onClicked: theMenu.state = "Hide",charactermanifest.state = "Hide",mainmenu.state = "Show"
                }


            }

            WFButtonMenu {
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                height:mainView.width * 0.07
                width:parent.width * 0.9
                buttontext:qsTr("Equipment")

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.flashit = true
                   // onClicked: theMenu.state = "Hide",charactermanifest.state = "Hide",mainmenu.state = "Show"
                }

            }

            Rectangle {
                width:parent.width
                height:mainView.width * 0.01
                color:borderColor
            }

            Text {
                text:qsTr("Biology")
                color:"white"
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                font.pointSize: mainView.width * 0.03
            }

            WFButtonMenu {
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                height:mainView.width * 0.07
                width:parent.width * 0.9
                buttontext:qsTr("Flora")

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.flashit = true
                   // onClicked: theMenu.state = "Hide",charactermanifest.state = "Hide",mainmenu.state = "Show"
                }


            }

            WFButtonMenu {
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                height:mainView.width * 0.07
                width:parent.width * 0.9
                buttontext:qsTr("Fauna")

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.flashit = true
                   // onClicked: theMenu.state = "Hide",charactermanifest.state = "Hide",mainmenu.state = "Show"
                }


            }

            Rectangle {
                width:parent.width
                height:mainView.width * 0.01
                color:borderColor
            }

            Text {
                text:qsTr("System:")
                color:"white"
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                font.pointSize: mainView.width * 0.03
            }


            WFButtonMenu {
                anchors.left: parent.left
                anchors.leftMargin: mainView.width * 0.02
                height:mainView.width * 0.07
                width:parent.width * 0.9
                buttontext:qsTr("Sol")

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.flashit = true
                   // onClicked: theMenu.state = "Hide",charactermanifest.state = "Hide",mainmenu.state = "Show"
                }


            }


        }

        Rectangle {
            id:bbutton
            anchors.bottom:parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.03
            color:"black"
            border.width:1
            border.color: borderColor
            height:mainView.width * 0.06
            width:parent.width * 0.65
             radius: 8

            Image {
               source:"qrc:/graphics/img/logo1.png"
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.left
               anchors.leftMargin: parent.width * 0.01
               height:parent.height * 0.9
               width:parent.height * 0.9

               Text {
                   text:qsTr("Main Menu")
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:parent.right
                   anchors.leftMargin: parent.width * 0.1
                   //height:parent.height
                   wrapMode: Text.WordWrap
                   width:bbutton.width - parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: encyclopedia.visible = false,mainmenu.visible = true
            }


        }


    }

}
