import QtQuick 2.0

Timer {
    id:flash
    running: false
    repeat: false
    interval: 200
    onTriggered: parent.color = Qt.rgba(0.1,0.1,0.1,0.8)
}
