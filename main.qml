import QtQuick 2.8
import QtCanvas3D 1.1
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2
//import QtQuick.Controls.Styles 1.4

import "glcode.js" as GLCode

Window {
    id:mainView
    title: qsTr("WayFinder_Mobile")
    width: 720
    height: 1280
    visible: true
    color:"black"
    property string borderColor: "#D2AF2B"

     Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source:"qrc:/graphics/img/space1-portrait.png"
    }

     Component.onCompleted: login.state = "Show"


    Canvas3D {
        id: canvas3d
        anchors.fill: parent
        focus: false
        visible: false

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
        id:mainScreen
        anchors.fill: parent
        clip:true

        Rectangle {
         width:parent.width
         height:parent.height * 0.04
         anchors.top:parent.top
         color:borderColor
         radius:height /2
        }

        Rectangle {
         width:parent.width
         height:parent.height * 0.03
         anchors.bottom:parent.bottom
         color:borderColor
         radius:height /2
        }

        Login {
            id:login
             state:"Hide"

        }

    }





}
