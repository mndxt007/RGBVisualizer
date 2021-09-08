import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15



ApplicationWindow {
    id: applicationWindow
    width: 640
    height: 480
    visible: true
    color: "#2a2626"
    title: qsTr("RGB Visualizer")
    Material.theme: Material.Dark //run pyside6 to see effects
    minimumWidth: 640
    minimumHeight: 480
    onHeightChanged: console.log(applicationWindow.height)
    onWidthChanged: console.log(applicationWindow.width)

    Dial {
        id: dialR
        y: 284
        width: 108
        height: 122
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/6
        anchors.leftMargin: parent.width/8.5
        stepSize: 1
        to: 255
        palette.dark:"Red"
        Material.accent: Material.Red
        onMoved:
        {
            backend.setR(dialR.value)
        }

        Label {
            id: rlabel
            x: 1
            y: 134
            color: "#e6e8e9"
            text: qsTr("R Value - ###")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            styleColor: "#f7f6f6"
        }
    }

    Dial {
        id: dialG
        x: 266
        y: 284
        width: 108
        height: 122
        anchors.bottom: dialR.bottom
        anchors.bottomMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        stepSize: 1
        to: 255
        palette.dark: "Green"
        Material.accent: Material.Green
        onMoved:
        {
            backend.setG(dialG.value)
        }

        Label {
            id: glabel
            x: 18
            y: 134
            color: "#e6e8e9"
            text: qsTr("G Value - ###")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            anchors.horizontalCenter: dialG.horizontalCenter
            styleColor: "#f7f6f6"
        }
    }

    Dial {
        id: dialB
        x: 455
        y: 284
        width: 108
        height: 122
        anchors.right: parent.right
        anchors.bottom: dialR.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: parent.width/8.5
        stepSize: 1
        to: 255
        palette.dark: "Blue"
        Material.accent: Material.Blue
        onMoved:
        {
            backend.setB(dialB.value)
        }

        Label {
            id: blabel
            x: 18
            y: 134
            color: "#e6e8e9"
            text: qsTr("B Value - ###")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            anchors.horizontalCenter: dialB.horizontalCenter
            styleColor: "#f7f6f6"
        }
    }

    Rectangle {
        id: led1
        x: 256
        y: 57
        width: 129
        height: 129
        color: "#150000"
        radius: led1.x/2
        border.color: "#fbfbfb"
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: rgblabel
            x: 7
            y: 146
            color: "#e6e8e9"
            text: qsTr("RGB Value - ######")
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Courier"
            styleColor: "#f7f6f6"
        }
    }

    Connections
    {
        target: backend

        function onSetRGB(colorRGB,rval,gval,bval)
        {
            led1.color = colorRGB
            rlabel.text = qsTr("R Value - "+rval)
            glabel.text = qsTr("G Value - "+gval)
            blabel.text = qsTr("B Value - "+bval)
            rgblabel.text = qsTr("RGB Value - "+colorRGB)

        }

    }


}
