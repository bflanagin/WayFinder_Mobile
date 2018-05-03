import QtCanvas3D 1.1

import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2

import "glcode.js" as GLCode

import "main.js" as Scripts

Item {

    id:thisWindow
    anchors.verticalCenter: parent.verticalCenter
   // anchors.centerIn: parent
    width:parent.width
    height:parent.height
    clip:true

    property int playerNum: 1

    property string theState: "Hide"

    onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage",Scripts.pc_load()} else {theState = "Hide"}

    WFBorder {
        state: theState
        //anchors.fill:parent
        anchors.centerIn: parent
        innerOpacity: 0.8

        ListView {

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: mainView.height * 0.08
            anchors.bottom: parent.bottom
            anchors.bottomMargin: mainView.height * 0.08
            width:parent.width * 0.98
            //height:parent.height * 0.85
            orientation:Qt.Horizontal
            snapMode: ListView.SnapOneItem
            spacing:mainView.height * 0.02

            model:clist

            clip:true

            delegate: Item {
              //  anchors.verticalCenter: parent.verticalCenter
                width:thisWindow.width * 0.98
                //height:thisWindow.height * 0.85
                anchors.bottom: parent.bottom
                anchors.top:parent.top

                   Canvas3D {
                        id: canvas3d
                        anchors.right: parent.right
                        width:parent.width * 0.90
                        height:parent.height
                        focus: false
                        visible: true

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

                   Item {
                       anchors.bottom:canvas3d.bottom
                       anchors.bottomMargin: mainView.width * 0.01
                       anchors.left:canvas3d.left
                       anchors.leftMargin: mainView.width * 0.01
                       width:canvas3d.width * 0.50
                       height:abilities.height

                       Rectangle {
                           anchors.centerIn: abilities
                           //border.width: [0,1,1,0]
                           //border.color: borderColor
                           width:parent.width
                           height:abilities.height
                           color:Qt.rgba(0.9,0.9,0.9,0.05)
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
                               text:a1
                               color:"white"
                               width:parent.width
                               horizontalAlignment: Text.AlignLeft
                               font.pointSize: parent.width * 0.05
                               wrapMode: Text.WordWrap
                           }
                           Text {
                               id:ab2
                               text:a2
                               color:"white"
                               horizontalAlignment: Text.AlignLeft
                               font.pointSize: parent.width * 0.05
                               wrapMode: Text.WordWrap
                           }
                           Text {
                               id:ab3
                               text:a3
                               color:"white"
                               horizontalAlignment: Text.AlignLeft
                               font.pointSize: parent.width * 0.05
                               wrapMode: Text.WordWrap
                           }
                       }

                   }


                   Item {
                       anchors.top:canvas3d.top
                       anchors.topMargin: mainView.width * 0.01
                       anchors.right:canvas3d.right
                       anchors.rightMargin: mainView.width * 0.01
                       width:canvas3d.width * 0.50
                       height:generalinfo.height

                       Rectangle {
                           anchors.centerIn: generalinfo
                           //border.width: [0,1,1,0]
                           //border.color: borderColor
                           width:parent.width
                           height:generalinfo.height * 1.1
                           color:Qt.rgba(0.9,0.9,0.9,0.05)
                       }

                       Column {
                           id:generalinfo
                           anchors.horizontalCenter: parent.horizontalCenter
                           width:parent.width * 0.98
                           spacing: parent.width * 0.05

                           Text {
                            //   id:statTitle
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
                            //   id:name
                               text:"Name:"+name
                               color:"white"
                               width:parent.width
                               horizontalAlignment: Text.AlignLeft
                               font.pointSize: parent.width * 0.05
                               wrapMode: Text.WordWrap
                           }
                           Text {
                          //     id:rank
                               text:"Rank:"+rank
                               color:"white"
                               horizontalAlignment: Text.AlignLeft
                               font.pointSize: parent.width * 0.05
                               wrapMode: Text.WordWrap
                           }
                           Text {
                           //    id:comm
                               text:"Commission:"+commission
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
                             //  id:status
                               text:"Status:"+status
                               color:"white"
                               width:parent.width
                               horizontalAlignment: Text.AlignLeft
                               font.pointSize: parent.width * 0.05
                               wrapMode: Text.WordWrap
                           }
                           Text {
                              // id:about
                               text:"About: "+about
                               color:"white"
                               horizontalAlignment: Text.AlignJustify
                               font.pointSize: parent.width * 0.05
                               wrapMode: Text.WordWrap
                               width: parent.width
                               maximumLineCount: 5
                               elide: Text.ElideRight
                           }

                       }

                   }




                Rectangle {
                    anchors.left:parent.left
                   anchors.right: canvas3d.left

                    height: canvas3d.height
                    radius: height / 1.2
                    color:borderColor
                    clip: true

                    Text {
                        anchors.centerIn: parent

                        text: type
                        rotation: 90
                       color:"white"
                       font.pixelSize: parent.width * 0.7
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                                if(thePlayers != "") {
                                thePlayers = thePlayers+","+characterNum;
                                    Scripts.pc_load();
                                } else {
                                    thePlayers = characterNum;
                                    Scripts.pc_load();
                                }

                                if(playerNum < maxplayers) {
                                playerNum++;

                                } else {
                                    thisWindow.state = "Hide";
                                    mainScreen.visible = false;
                                    gameOn.visible = true;

                                   }


                         }
                }

            }


        }

    Text {
        text: qsTr("Character Select ")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: mainView.width * 0.04
        font.pixelSize: mainView.width * 0.08
        color:borderColor
    }

    Text {
        text: qsTr("Player "+ playerNum)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin: mainView.width * 0.04
        font.pixelSize: mainView.width * 0.06
        color:borderColor
    }

    }


    ListModel {
                    id:clist

               /*     ListElement {
                        tname:"Commander"
                        characterNum: 5
                    }
                    ListElement {
                        tname:"Science Officer"
                        characterNum: 4
                    }
                    ListElement {
                        tname:"Engineer"
                        characterNum: 12
                    }
                    ListElement {
                        tname:"Medical Officer"
                        characterNum: 16
                    }
                    ListElement {
                        tname:"Security"
                        characterNum: 14
                    }  */

                }


}
