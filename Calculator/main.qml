import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Window {
    id: okno
    property int mar: 5
    visible: true
    width: 350
    height: 650
    color: "lightgrey"
    Column {
        id: column
        spacing: okno.height / 25
        padding: 3
        Rectangle {
            id: recTextInput
            visible: true
            width: okno.width - (column.padding * 2)
            height: ((menu.height * 3) / 2)
            Column {
                id: textInput
                Rectangle{
                    id: textInput1
                    height: recTextInput.height / 3
                    width: recTextInput.width
                    color: "yellow"
                    TextInput {
                        id: textInput1_1
                        text: ""
                        color: "black"
                        anchors.fill: parent
                        anchors.margins: 12
                    }
                }
                Rectangle {
                    id: textInput2
                    height: (recTextInput.height / 3) * 2
                    width: recTextInput.width
                    color: "blue"
                    TextInput {
                        id: textInput2_1
                        text: calc.textInput2_1_number(0)
                        color: "white"
                        anchors.fill: parent
                        anchors.margins: 12
                    }
                }
            }
        }
        Rectangle {
            id: buttons
            visible: true
            color: okno.color
            width: ((menu.width * 4) + (flow.spacing * 4))
            height: ((menu.height * 6) + (flow.spacing * 5))
            Flow{
                visible: true
                id: flow
                anchors.fill: parent
                spacing: 2
                Button {
                    id: menu
                    height: ((okno.height - (column.padding * 2) - column.spacing - (flow.spacing * 4)) / 6.5)
                    width: ((recTextInput.width - (flow.spacing * 3)) / 4)
                    text: ">"
                    hoverEnabled: true
                    background: Rectangle {
                          id: menuStyle
                          color: (menu.hovered)||(rec.width > 50) ? "lightgrey" : "white"
                          opacity: 1
                    }
                    MouseArea {
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
                Button {
                    id: swapSign
                    height: menu.height
                    width: menu.width
                    text: "±"
                    hoverEnabled: true
                    background: Rectangle {
                          id: ce2Style
                          color: swapSign.pressed ? "grey" : (swapSign.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        console.log(calc.show_real_with_symbol())
                        console.log(calc.show_real())
                        calc.swapSign()
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
                        console.log(calc.show_real())
                        console.log(calc.show_res())
                        console.log(calc.show_sym())
                    }
                }
                Button {
                    id: ce
                    height: menu.height
                    width: menu.width
                    text: "CE"
                    hoverEnabled: true
                    background: Rectangle {
                          id: ceStyle
                          color: ce.pressed ? "grey" : (ce.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {

                    }
                }
                Button {
                    id: c
                    height: menu.height
                    width: menu.width
                    text: "C"
                    hoverEnabled: true
                    background: Rectangle {
                          id: cStyle
                          color: c.pressed ? "grey" : (c.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        console.log( (okno.height - 6) / recTextInput.height)
                    }
                }
                Button {
                    id: b7
                    height: menu.height
                    width: menu.width
                    text: "7"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b7Style
                          color: b7.pressed ? "grey" : (b7.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(7);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
//                        newClass.is_toched(true)
                    }
                }
                Button {
                    id: b8
                    height: menu.height
                    width: menu.width
                    text: "8"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b8Style
                          color: b8.pressed ? "grey" : (b8.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(8);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: b9
                    height: menu.height
                    width: menu.width
                    text: "9"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b9Style
                          color: b9.pressed ? "grey" : (b9.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(9);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: division
                    height: menu.height
                    width: menu.width
                    text: "÷"
                    hoverEnabled: true
                    background: Rectangle {
                          id: divisionStyle
                          color: division.pressed ? "grey" : (division.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_symbol(4)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: b4
                    height: menu.height
                    width: menu.width
                    text: "4"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b4Style
                          color: b4.pressed ? "grey" : (b4.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(4);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: b5
                    height: menu.height
                    width: menu.width
                    text: "5"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b5Style
                          color: b5.pressed ? "grey" : (b5.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(5);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: b6
                    height: menu.height
                    width: menu.width
                    text: "6"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b6Style
                          color: b6.pressed ? "grey" : (b6.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(6);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: multiplication
                    height: menu.height
                    width: menu.width
                    text: "×"
                    hoverEnabled: true
                    background: Rectangle {
                          id: multiplicationStyle
                          color: multiplication.pressed ? "grey" : (multiplication.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_symbol(3)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: b1
                    height: menu.height
                    width: menu.width
                    text: "1"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b1Style
                          color: b1.pressed ? "grey" : (b1.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(1);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: b2
                    height: menu.height
                    width: menu.width
                    text: "2"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b2Style
                          color: b2.pressed ? "grey" : (b2.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(2);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: b3
                    height: menu.height
                    width: menu.width
                    text: "3"
                    hoverEnabled: true
                    background: Rectangle {
                          id: b3Style
                          color: b3.pressed ? "grey" : (b3.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(3);
//                        newClass.add(7)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                    }
                }
                Button {
                    id: subtraction
                    height: menu.height
                    width: menu.width
                    text: "-"
                    hoverEnabled: true
                    background: Rectangle {
                          id: subtractionStyle
                          color: subtraction.pressed ? "grey" : (subtraction.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_symbol(2)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                        console.log(calc.show_res())
                        console.log(calc.show_sym())
                    }
                }
                Button {
                    id: b0
                    height: menu.height
                    width: menu.width
                    text: "0"
                    background: Rectangle {
                          id: b0Style
                          color: b0.pressed ? "grey" : (b0.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        calc.add_number(0);
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number();
                        console.log(calc.show_sym())
                        console.log(calc.show_real_with_symbol())
//                        newClass.add(7)


//                        newClass.add(0)
//                        textInput2_1.text = newClass.showReal_TextInput2()
//                        newClass.is_toched(true)
                    }
                }
                Button {
                    id: dot
                    height: menu.height
                    width: menu.width
                    text: ","
                    background: Rectangle {
                              id: dotStyle
                              color: dot.pressed ? "grey" : (dot.hovered ? "darkgray" : "lightgrey")
                              border.width: 2
                              opacity: 1
                              border.color: Qt.darker(color)
                        }
                    onClicked: {
                        calc.dot()
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
                    }
                }
                Button {
                    id: equally
                    height: menu.height
                    width: menu.width
                    text: "="
                    background: Rectangle {
                          id: equallyStyle
                          color: equally.pressed ? "grey" : (equally.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        console.log("sym ",calc.show_real())
                        console.log("res ",calc.show_res())
                        console.log("num ",calc.show_sym())
                        calc.equally()
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
                        console.log("sym ",calc.show_real())
                        console.log("res ",calc.show_res())
                        console.log("num ",calc.show_sym())
                    }
                }
                Button {
                    id: plus
                    height: menu.height
                    width: menu.width
                    text: "+"
                    background: Rectangle {
                          id: plusStyle
                          color: plus.pressed ? "grey" : (plus.hovered ? "darkgray" : "lightgrey")
                          border.width: 2
                          opacity: 1
                          border.color: Qt.darker(color)
                    }
                    onClicked: {
                        console.log(calc.show_real_with_symbol())
                        console.log(calc.show_real())
                        calc.add_symbol(1)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
                        console.log(calc.show_real_with_symbol())
                        console.log(calc.show_real())
                    }
                }
            }
        }
    }
    Rectangle{
        color: "white"
        x: menu.width + column.padding; y: column.spacing + column.padding + recTextInput.height//menu.y + okno.mar
        id: rec
        visible: true
        width: 0
        height: (rec.width === 0) ? 0 : ((menu.height * 2) + (flow.spacing))
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
            Button{
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
                        calc.tri(1)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
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
                        calc.tri(2)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
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
                    onClicked: {
                        calc.tri(3)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
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
                    onClicked: {
                        calc.tri(4)
                        textInput1_1.text = calc.textInput1_1_real()
                        textInput2_1.text = calc.textInput2_1_number()
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
