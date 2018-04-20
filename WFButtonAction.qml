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
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top:parent.top
           anchors.topMargin: parent.width * 0.02
           height:parent.height * 0.7
           width:parent.height * 0.7

           Text {
               text:buttontext
               //anchors.verticalCenter: parent.verticalCenter
              // anchors.left:parent.right
               //anchors.leftMargin: parent.width * 0.1
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.top:parent.bottom
               //height:parent.height
               horizontalAlignment: Text.AlignHCenter
               wrapMode: Text.WordWrap
               width:(container.width * 0.90) - parent.width
               font.pixelSize: parent.height * 0.3
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
