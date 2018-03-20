import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.2
//import QtQuick.Controls.Styles 1.4

Item {
    id:thisWindow
    anchors.centerIn: parent
   // width:parent.width * 0.80
   // height:parent.height * 0.80
    clip:true



    states: [

        State {
          name: "Show"

          PropertyChanges {
              target:thisWindow
              width:parent.width * 0.80
              height:parent.height * 0.80
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

    ]




    Rectangle {
        anchors.top:parent.top
        height:mainView.height * 0.01
        color:borderColor
        width:parent.width
        radius: height / 2
    }

    Rectangle {
        anchors.bottom:parent.bottom
        height:mainView.height * 0.01
        color:borderColor
        width:parent.width
        radius: height / 2
    }

    Rectangle {
        anchors.centerIn: loginBox
        width:loginBox.width
        height:loginBox.height

        color:Qt.rgba(0.1,0.1,0.1,0.8)

    }

    Column {
        id:loginBox
        width:parent.width * 0.99
        height:parent.height* 0.97
        anchors.centerIn: parent
        //visible:if(parent.height == mainView.height * 0.80) {true} else {false}
        spacing:mainView.width * 0.05

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source:"qrc:/graphics/img/logo2.png"
            width:parent.width * 0.5
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: title
            width:parent.width * 0.98
            text: qsTr("Welcome Commander")
            font.pointSize: if(parent.width > 0) {parent.width * 0.07} else {20}
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color:borderColor
            anchors.horizontalCenter: parent.horizontalCenter

        }

        Text {
            id: prompt
            text: qsTr("Use your OpenSeed account to log in")
            width:parent.width * 0.98
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: if(parent.width > 0) {parent.width * 0.03} else {8}
            wrapMode: Text.WordWrap
            color:borderColor
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id:name
            color:borderColor
            width:parent.width * 0.7
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "User Name"

        }

        TextField {
            id:email
            color:borderColor
            width:parent.width * 0.7
            anchors.horizontalCenter: parent.horizontalCenter
           placeholderText: "email@example.com"
        }

        TextField {
            id:password
            color:borderColor
            width:parent.width * 0.7
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "password"
            echoMode:TextInput.Password

        }





    }

    Image {
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        anchors.margins: parent.width * 0.03
        width:parent.height * 0.07
        height:parent.height * 0.07
        source:"qrc:/graphics/img/OpenSeed.png"
    }



}
