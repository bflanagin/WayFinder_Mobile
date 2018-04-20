import QtQuick 2.8
import QtCanvas3D 1.1
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2

import QtQuick.LocalStorage 2.0 as Sql


import "glcode.js" as GLCode
import "main.js" as Scripts

Item {

    id:thisWindow
    anchors.centerIn: parent
    width:parent.width
    height:parent.height * 0.95
    clip:true


property var db: Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo", 1);

   /* states: [

        State {
          name: "Show"

          PropertyChanges {
              target:thisWindow
              width:parent.width
              height:parent.height * 0.90
              opacity: 1
          }
        },

        State {
            name:"Hide"
            PropertyChanges {
                target: thisWindow
                width:parent.width * 0.0
                height:parent.height * 0.0
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
                target: thisWindow
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
                target: thisWindow
                property: "height"
                duration: 1400
                easing.type: Easing.InOutQuad
            }

        }

    ] */

    property string theState: "Hide"

    onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage"} else {theState = "Hide"}

    WFBorder {
        state: theState
        //anchors.fill:parent
        anchors.centerIn: parent
        innerOpacity: 1
        id:crewview
      //  anchors.verticalCenter: parent.verticalCenter
     //   width:parent.width
     //   height:parent.height



    Canvas3D {
        id: canvas3d
        anchors.verticalCenter: parent.verticalCenter
       // anchors.right: parent.right
        //anchors.rightMargin: mainView.width * 0.02
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.98
        height:parent.height * 0.94
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

    Rectangle {
        anchors.top:parent.top
        anchors.left:canvas3d.left
        height:mainView.height * 0.01
        color:borderColor
        width:canvas3d.width
        radius: height / 2
    }

    Rectangle {
        anchors.bottom:parent.bottom
        anchors.left:canvas3d.left
        height:mainView.height * 0.01
        color:borderColor
        width:canvas3d.width
        radius: height / 2
    }


    Item {
        anchors.top:canvas3d.top
        anchors.topMargin: mainView.width * 0.01
        anchors.right:canvas3d.right
        anchors.rightMargin: mainView.width * 0.01
        width:canvas3d.width * 0.50
        height:generalinfo.height

        visible: if(crewview.state == "Show") {true} else {false}

        Rectangle {
            anchors.centerIn: generalinfo
            //border.width: [0,1,1,0]
            //border.color: borderColor
            width:parent.width
            height:generalinfo.height * 1.1
            color:Qt.rgba(0.9,0.9,0.9,0.1)
        }

        Column {
            id:generalinfo
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.98
            spacing: parent.width * 0.05

            Text {
                id:statTitle
                text:"General Info"
                color:"white"
                font.pointSize: parent.width * 0.1
                width:parent.width
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                width:parent.width
                height:mainView.width * 0.003
                color:borderColor
            }

            Text {
                id:name
                text:"Name:"
                color:"white"
                width:parent.width
                horizontalAlignment: Text.AlignLeft
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }
            Text {
                id:rank
                text:"Rank:"
                color:"white"
                horizontalAlignment: Text.AlignLeft
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }
            Text {
                id:commission
                text:"Commission:"
                color:"white"
                horizontalAlignment: Text.AlignLeft
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }

            Rectangle {
                width:parent.width
                height:mainView.width * 0.003
                color:borderColor
            }

            Text {
                id:status
                text:"Status:"
                color:"white"
                width:parent.width
                horizontalAlignment: Text.AlignLeft
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }
            Text {
                id:about
                text:"About:"
                color:"white"
                horizontalAlignment: Text.AlignJustify
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }

        }

    }

    Item {
        anchors.bottom:canvas3d.bottom
        anchors.bottomMargin: mainView.width * 0.01
        anchors.left:canvas3d.left
        anchors.leftMargin: mainView.width * 0.01
        width:canvas3d.width * 0.50
        height:abilities.height

        visible: if(crewview.state == "Show") {true} else {false}

        Rectangle {
            anchors.centerIn: abilities
            //border.width: [0,1,1,0]
            //border.color: borderColor
            width:parent.width
            height:abilities.height
            color:Qt.rgba(0.9,0.9,0.9,0.1)
        }

        Column {
            id:abilities
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width * 0.98
            spacing: parent.width * 0.05

            Text {
                id:atitle
                text:"Abilities"
                font.pointSize: parent.width * 0.1

                color:"white"
                width:parent.width
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                width:parent.width
                height:mainView.width * 0.003
                color:borderColor
            }

            Text {
                id:ab1
                text:"Name and discription"
                color:"white"
                width:parent.width
                horizontalAlignment: Text.AlignLeft
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }
            Text {
                id:ab2
                text:"Name and discription"
                color:"white"
                horizontalAlignment: Text.AlignLeft
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }
            Text {
                id:ab3
                text:"Name and discription"
                color:"white"
                horizontalAlignment: Text.AlignLeft
                font.pointSize: parent.width * 0.05
                wrapMode: Text.WordWrap
            }
        }

    }

    Item {
        anchors.top:canvas3d.bottom
        anchors.topMargin: mainView.width * 0.01
        anchors.left:canvas3d.left
        width:canvas3d.width
        height:canvas3d.width * 0.01

        Row {
            anchors.fill: parent
            spacing: mainView.width * 0.01
            Repeater {
                model:3

                    Rectangle {
                            height:parent.height
                            width:canvas3d.width  / 3
                            color: if(index == 1) {"white"} else {Qt.rgba(0.4,0.4,0.4,0.5)}
                         }

                    }

             }
        }

    }

    Rectangle {
        visible: if(crewview.state == "Show") {true} else {false}
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.margins: mainView.width * 0.04
        color:"black"
        border.width:1
        border.color: borderColor
        height:mainView.width * 0.07
        width:parent.width * 0.20
         radius: 8
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
               width: parent.width
               font.pixelSize: parent.height * 0.5
               color:borderColor
           }
        }

        MouseArea {
            anchors.fill:parent
            onClicked: theMenu.state = "Show"
        }
    }


    Item {
        id:theMenu
        width:parent.width * 0.40
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

        state:"Hide"

        onStateChanged: if(state =="Show") {focus = true} else {focus = false}
        onFocusChanged: if(focus == false) {state = "Hide"} else {state = "Show"}

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
                text:qsTr("Account:")
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
                buttontext:qsTr("On Crew")

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
                buttontext:qsTr("Available")

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
                text:qsTr("Type:")
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
                buttontext:qsTr("Command")

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
                buttontext:qsTr("Engineering")

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
                buttontext:qsTr("Science")

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
                buttontext:qsTr("Security")

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
                buttontext:qsTr("Medical")

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
                text:qsTr("Commission:")
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
                buttontext:qsTr("USC")

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.flashit = true
                   // onClicked: theMenu.state = "Hide",charactermanifest.state = "Hide",mainmenu.state = "Show"
                }


            }


        }

        Rectangle {
            anchors.bottom:parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: mainView.width * 0.02
            color:"black"
            border.width:1
            border.color: borderColor
            height:mainView.width * 0.06
            width:parent.width * 0.55
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
                   width:parent.width
                   font.pixelSize: parent.height * 0.5
                   color:borderColor
               }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: theMenu.state = "Hide",charactermanifest.visible = false,mainmenu.visible = true
            }


        }


    }

}
