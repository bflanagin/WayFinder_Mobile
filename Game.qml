import QtQuick 2.8

Item {

    id:thisWindow
    anchors.centerIn: parent
   width:parent.width * 0.95
   height:parent.height * 0.95
    clip:true



    property string theState: "Hide"

    onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage"} else {theState = "Hide"}

    WFBorder {
        id:storySelect
        state: theState
        //anchors.fill:parent
        anchors.centerIn: parent
        innerOpacity: 1
        Column {
            //anchors.centerIn: parent
            anchors.top:parent.top
            anchors.topMargin: parent.width * 0.1
            width:parent.width * 0.98
            height:parent.heigh * 0.90
            spacing: parent.width * 0.1

            Text {
                text: "Missions"
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                font.pixelSize: parent.width * 0.15
                color:borderColor
            }

            Rectangle {
                width: parent.width
                height: parent.width * 0.01
                color: borderColor
            }

            WFButtonMenu {
                width:parent.width * 0.98
                height: parent.width * 0.2
                buttontext: "Maiden Voyage"

                 Text {
                    anchors.right: playerRow.left
                    anchors.verticalCenter: playerRow.verticalCenter
                    text: "Players: "
                    color:borderColor
                    font.pixelSize: playerRow.height * 0.8
                 }

                Row {
                    id:playerRow
                    anchors.right:parent.right
                    anchors.bottom: parent.bottom
                    anchors.margins: mainView.width * 0.01

                    Repeater {
                        model:4

                        Image {
                            source:"./graphics/img/logo1.png"
                            height:mainView.width * 0.03
                            width: mainView.width * 0.03
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: players.visible = true,storySelect.state = "Hide" //charselect.state = "Show"
                }
            }

            WFButtonMenu {
                width:parent.width * 0.98
                height: parent.width * 0.2
                buttontext: "Download More"
                opacity: 0.4
            }



        }


        WFButtonMenu {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: parent.width * 0.03
            anchors.bottomMargin: parent.width * 0.06
            width:parent.width * 0.46
            height: parent.width * 0.1
            buttontext: "Game Modes"

            MouseArea {
                anchors.fill: parent
                onClicked: thisWindow.state = "Hide",gameselect.state = "Show"
            }
        }


}

   Players {
    id:players
    visible: false
    //anchors.fill: parent

   }

    CharacterSelect {
        id:charselect
        visible: false
      //  anchors.fill: parent


    }





}
