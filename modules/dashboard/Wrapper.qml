import QtQuick
import Quickshell
import "root:/config"

Item {
    id: root

    required property PersistentProperties visibilities

    visible: height > 0
    implicitHeight: 0
    implicitWidth: content.implicitWidth + BorderConfig.rounding * 2

    states: State {
        name: "visible"
        when: root.visibilities.dashboard

        PropertyChanges {
            root.implicitHeight: content.implicitHeight
        }
    }

    transitions: [
        Transition {
            from: ""
            to: "visible"

            NumberAnimation {
                target: root
                property: "implicitHeight"
                duration: Appearance.anim.durations.large
                easing.type: Easing.BezierSpline
                easing.bezierCurve: Appearance.anim.curves.emphasizedDecel
            }
        },
        Transition {
            from: "visible"
            to: ""

            NumberAnimation {
                target: root
                property: "implicitHeight"
                duration: Appearance.anim.durations.normal
                easing.type: Easing.BezierSpline
                easing.bezierCurve: Appearance.anim.curves.emphasizedAccel
            }
        }
    ]

    Content {
        id: content

        visibilities: root.visibilities
    }
}
