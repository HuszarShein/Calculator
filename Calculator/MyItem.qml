import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4


Item {
    function doSOmethingGrid(resWidth){
        rec0.width = resWidth
    }

    Rectangle{
        id: rect
        color: "white"
        border.color: Qt.darker(color)
        MouseArea {
            height: rec.height
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                rec.width = ((menu.width * 3) + (flow.spacing * 3))
                rec0.columnSpacing = 2
            }
            onExited:  {
                rec0.columnSpacing = 0
                rec.width = 0
            }
        }
        Behavior on width
        {
            NumberAnimation
            {
                easing.amplitude: 1
                easing.period: 1
                easing.type: Easing.OutCirc
                duration:500
            }
        }
        Grid {
            id: rec0
            visible: true
            anchors.verticalCenter: rec.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 4
            columns: 3
            columnSpacing: 2
            spacing: 2
            Behavior on columnSpacing
            {
                NumberAnimation
                {
                    easing.amplitude: 1
                    easing.period: 1
                    easing.type: Easing.OutCirc
                    duration:400
                }
            }
            Button {
                id: sinB
                height: (rec.height - rec0.spacing - 6) / 2
                width: (rec.width - (rec0.anchors.leftMargin * 2) - (rec0.columnSpacing * 2)) / 3//rec.width / 4
                text: "sin(x)"
                hoverEnabled: true
                background: Rectangle {
                    id: sinBstyle
                    color: sinB_ma.pressed ? "grey" : (sinB.hovered ? "darkgray" : "lightgrey")
                    border.width: 2
                    opacity: 1
                    border.color: Qt.darker(color)
                }
                MouseArea{
                    id:sinB_ma
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        rec0.columnSpacing = 2
                        rec.width = ((menu.width * 3) + (flow.spacing * 3))
                    }
                    onExited: {
                        rec0.columnSpacing = 0
                        rec.width = 0
                    }
                    onClicked: {
                        textInput2_1.text = newClass.foo(5)
                    }
                }
            }
            Button{
                id: cosB
                height: (rec.height - rec0.spacing - 6) / 2
                width: (rec.width - (rec0.anchors.leftMargin * 2) - (rec0.columnSpacing * 2)) / 3
                text: "cos(x)"
                hoverEnabled: true
                background: Rectangle {
                    id: cosBstyle
                    color: cosB_ma.pressed ? "grey" : (cosB.hovered ? "darkgray" : "lightgrey")
                    border.width: 2
                    border.color: Qt.darker(color)
                }
                MouseArea{
                    id:cosB_ma
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        rec0.columnSpacing = 2
                        rec.width = ((menu.width * 3) + (flow.spacing * 3))
                    }
                    onExited: {
                        rec0.columnSpacing = 0
                        rec.width = 0
                    }
                    onClicked: {
                        textInput2_1.text = newClass.foo(10)
                    }
                }
            }
            Button{
                id: tgB
                height: (rec.height - rec0.spacing - 6) / 2
                width: (rec.width - (rec0.anchors.leftMargin * 2) - (rec0.columnSpacing * 2)) / 3
                text: "tg(x)"
                hoverEnabled: true
                background: Rectangle {
                    id: tgBstyle
                    color: tgB_ma.pressed ? "grey" : (tgB.hovered ? "darkgray" : "lightgrey")
                    border.width: 2
                    border.color: Qt.darker(color)
                }
                MouseArea{
                    id:tgB_ma
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        rec0.columnSpacing = 2
                        rec.width = ((menu.width * 3) + (flow.spacing * 3))
                    }
                    onExited: {
                        rec0.columnSpacing = 0
                        rec.width = 0
                    }
                }
            }
            Button{
                id: ctgB
                height: (rec.height - rec0.spacing - 6) / 2
                width: (rec.width - (rec0.anchors.leftMargin * 2) - (rec0.columnSpacing * 2)) / 3
                text: "ctg(x)"
                hoverEnabled: true
                background: Rectangle {
                    id: ctgBstyle
                    color: ctgB_ma.pressed ? "grey" : (ctgB.hovered ? "darkgray" : "lightgrey")
                    border.width: 2
                    border.color: Qt.darker(color)
                }
                MouseArea{
                    id:ctgB_ma
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        rec.width = ((menu.width * 3) + (flow.spacing * 3))
                        rec0.columnSpacing = 2
                    }
                    onExited: {
                        rec.width = 0
                        rec0.columnSpacing = 0
                    }
                }
            }
            Button{
                id: logB
                height: (rec.height - rec0.spacing - 6) / 2
                width: (rec.width - (rec0.anchors.leftMargin * 2) - (rec0.columnSpacing * 2)) / 3
                text: "log"
                hoverEnabled: true
                background: Rectangle {
                    id: logBstyle
                    color: logB_ma.pressed ? "grey" : (logB.hovered ? "darkgray" : "lightgrey")
                    border.width: 2
                    border.color: Qt.darker(color)
                }
                MouseArea{
                    id:logB_ma
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        rec.width = ((menu.width * 3) + (flow.spacing * 3))
                        rec0.columnSpacing = 2
                    }
                    onExited: {
                        rec.width = 0
                        rec0.columnSpacing = 0
                    }
                }
            }
            Button{
                id: expB
                height: (rec.height - rec0.spacing - 6) / 2
                width: (rec.width - (rec0.anchors.leftMargin * 2) - (rec0.columnSpacing * 2)) / 3
                text: "exp"
                hoverEnabled: true
                background: Rectangle {
                    id: expBstyle
                    color: expB_ma.pressed ? "grey" : (expB.hovered ? "darkgray" : "lightgrey")
                    border.width: 2
                    border.color: Qt.darker(color)
                }
                MouseArea{
                    id:expB_ma
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        rec.width = ((menu.width * 3) + (flow.spacing * 3))
                        rec0.columnSpacing = 2
                    }
                    onExited: {
                        rec.width = 0
                        rec0.columnSpacing = 0
                    }
                }
            }
        }
    }
}
