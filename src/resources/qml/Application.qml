import QtQuick 2.5

import Material 0.2

import CouchDB 1.0

ApplicationWindow {
    id: dcmWindow

    visible: true

    width: 640
    height: 480

    property Component collectionPageComponent: Qt.createComponent(Qt.resolvedUrl('CollectionPage.qml'))

    theme {
        primaryColor: '#7bafd4'
        accentColor: 'red'
        tabHighlightColor: '#2376a1'
    }

    initialPage: Page {
        id: homePage

        title: 'Digitcal Collection Management'

        ActionButton {
            anchors {
                right: parent.right
                bottom: parent.bottom
                margins: Units.dp(8)
            }

            action: Action {
                id: newCollection
                text: '&New'

                onTriggered: newCollectionDialog.open()
            }

            iconName: 'content/add'
        }
    }

    Dialog {
        id: newCollectionDialog

        title: 'Create New Collection'
        hasActions: true

        TextField {
            id: collectionNameInput
            width: parent.width
            placeholderText: 'Collection ID'
        }

        onAccepted: {
            if (collectionPageComponent.status != Component.Ready) {
                if (collectionPageComponent.status == Component.Error) {
                    console.debug("Error: " + collectionPageComponent.errorString());
                }
                return;
            }

            var collectionPage = collectionPageComponent.createObject(dcmWindow, {title: collectionNameInput.text});

            pageStack.push(collectionPage);
        }
    }
}
