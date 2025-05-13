import "root:/services"
import "root:/config"
import "root:/modules/osd" as Osd
import "root:/modules/notifications" as Notifications
import "root:/modules/session" as Session
import "root:/modules/launcher" as Launcher
import QtQuick.Shapes

Shape {
    id: root

    required property Panels panels

    anchors.fill: parent
    anchors.margins: BorderConfig.thickness
    preferredRendererType: Shape.CurveRenderer
    opacity: Colours.transparency.enabled ? Colours.transparency.base : 1

    Osd.Background {
        wrapper: panels.osd

        startX: root.width - panels.session.width
        startY: (root.height - wrapper.height) / 2
    }

    Notifications.Background {
        wrapper: panels.notifications

        startX: root.width
        startY: 0
    }

    Session.Background {
        wrapper: panels.session

        startX: root.width
        startY: (root.height - wrapper.height) / 2
    }

    Launcher.Background {
        wrapper: panels.launcher

        startX: (root.width - wrapper.width) / 2
        startY: root.height
    }
}
