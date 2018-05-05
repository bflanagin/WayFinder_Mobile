import QtQuick 2.8

Item {
    id:thisWindow

    property double maxWidth: parent.width
    property double maxHeight: parent.height
    property double innerOpacity: 0.8
    clip:true



    states: [

        State {
            name:"Engage"

            PropertyChanges {
                target:thisWindow
                width:maxWidth
                height:maxHeight * 0.02
              //  opacity: 1
            }

        },


        State {
          name: "Show"

          PropertyChanges {
              target:thisWindow
              width:maxWidth
              height:maxHeight
            //  opacity: 1
          }
        },

        State {
            name:"Hide"
            PropertyChanges {
                target: thisWindow
                width:0
                height:0
               // opacity: 0
            }
        }

    ]

    transitions: [
      /*  Transition {
            id:tran1
            from: "Hide"
            to: "Show"
            reversible: true

            NumberAnimation {
                target: thisWindow
                property: "opacity"
                duration: 200
                easing.type: Easing.InOutQuad
            }

        }, */

        Transition {
            from: "Hide"
            to: "Engage"
            reversible: true


            NumberAnimation {
                target: thisWindow
                property: "width"
                duration: 200
                easing.type: Easing.InOutQuad
            }

        },
        Transition {
            from: "Engage"
            to: "Show"
            reversible: true


            NumberAnimation {
                target: thisWindow
                property: "height"
                duration: 200
                easing.type: Easing.InOutQuad
            }

        }

    ]

    Timer {
        id:fullshow
        interval: 600
        running: false
        repeat: false
        onTriggered: thisWindow.state = "Show"
    }



    onStateChanged: if(thisWindow.state == "Engage") {fullshow.start()} else {fullshow.stop()}




    Rectangle {
        anchors.centerIn: parent
        width:parent.width
        height:parent.height

        color:Qt.rgba(0.1,0.1,0.1,innerOpacity)

    }

    Rectangle {
     width:parent.width
     height:mainView.height * 0.015
     anchors.top:parent.top
     color:borderColor
     radius:height /2
     z:2
    }




    Rectangle {
     width:parent.width
     height:mainView.height * 0.01
     anchors.bottom:parent.bottom
     color:borderColor
     radius:height /2
     z:2
    }

}
