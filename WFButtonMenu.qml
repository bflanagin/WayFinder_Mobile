import QtQuick 2.0

Item {
      property string style: ""
      property string buttontext: ""
      property bool flashit: false


    Rectangle {
        anchors.fill: parent
        id:container
        color:Qt.rgba(0.1,0.1,0.1,0.8)
        border.width:1
        border.color: borderColor
        radius: 8

        Image {
           source:"qrc:/graphics/img/logo1.png"
           anchors.verticalCenter: parent.verticalCenter
           anchors.left:parent.left
           anchors.leftMargin: parent.width * 0.01
           height:parent.height * 0.9
           width:parent.height * 0.9

           Text {
               text:buttontext
               anchors.verticalCenter: parent.verticalCenter
               anchors.left:parent.right
               anchors.leftMargin: parent.width * 0.1
               //height:parent.height
               //horizontalAlignment: Text.AlignRight
               wrapMode: Text.WordWrap
               width:(container.width * 0.90) - parent.width
               font.pixelSize: parent.height * 0.5
               color:borderColor
           }
        }

        Timer {
            id:flashout
            running: false
            repeat: false
            interval: 40
            onTriggered: parent.color = Qt.rgba(0.1,0.1,0.1,0.8),flashit = false
        }

        Timer {
            id:flashin
            running: flashit
            repeat: false
            interval: 10
            onTriggered: parent.color = borderColor,flashout.start()
        }

    }

}
