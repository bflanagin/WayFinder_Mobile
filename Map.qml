import QtQuick 2.0

WFBorder {
    property string shipname: "Wheyl"
    clip:true


     Rectangle {
         anchors.fill: mapGrid
         color:Qt.rgba(0.1,0.1,0.1,0.1)
     }

    Flickable {
        id:mapGrid
        anchors.centerIn: parent
        width: parent.width * 0.99
        height: parent.height * 0.85

    }






    Text {
        id: title
        text: shipname
        anchors.top:parent.top
        anchors.left:parent.left
        color:borderColor
        anchors.topMargin: mainView.width * 0.05
        anchors.leftMargin: mainView.width * 0.02
        font.pixelSize: mainView.width * 0.03

    }





}
