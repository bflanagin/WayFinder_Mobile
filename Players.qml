import QtQuick 2.0

Item {

    id:thisWindow
    anchors.centerIn: parent
    width:parent.width
    height:parent.height
   // clip:true

    property int numberNeeded: 4

    property string theState: "Hide"

    onVisibleChanged: if(thisWindow.visible == true) {theState = "Engage"} else {theState = "Hide"}

    WFBorder {
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
                text: "Players"
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

            Repeater {

                model:numberNeeded -1

                WFButtonMenu {
                    buttontext: (index+2)+ " Players"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height:parent.width * 0.2

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {parent.flashit = true;
                                    thisWindow.visible = false;
                                    maxplayers = index+2;
                                    charselect.visible = true;}
                    }
                }



            }


    }


 }
}
