import QtQuick
import QtQuick.Controls

Slider {
    id: root

    property var tokens

    implicitWidth: 132
    implicitHeight: tokens ? tokens.controlHeight : 28
    padding: 0
    live: false
    stepSize: 1

    handle: Rectangle {
        objectName: root.objectName + "_handle"
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + (root.availableHeight - height) / 2
        width: 14
        height: 14
        radius: width / 2
        color: root.enabled ? root.tokens.accent : root.tokens.disabledText
        border.width: root.tokens.hairlineWidth
        border.color: root.activeFocus
            ? root.tokens.accentText : root.tokens.accent
    }

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + (root.availableHeight - height) / 2
        width: root.availableWidth
        height: 4
        radius: height / 2
        color: root.tokens.borderStrong

        Rectangle {
            objectName: root.objectName + "_fill"
            width: root.visualPosition * parent.width
            height: parent.height
            radius: height / 2
            color: root.enabled ? root.tokens.accent : root.tokens.disabledText
        }
    }
}
