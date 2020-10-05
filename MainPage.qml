import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page
{
    title: qsTr("Select Window")


    Component.onCompleted:
    {

    }

    ColumnLayout
    {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 12



            Label
            {
                id: labeldllfolder
                text: qsTr("Current folder for SeedKey DLL's:  ")
            }

            Rectangle
            {
                Layout.fillWidth: true
                Layout.preferredWidth: dllloadfoldertext.implicitWidth
                Layout.preferredHeight: 25
                Layout.minimumWidth: 25
                Layout.maximumWidth: dllloadfoldertext.implicitWidth

                Label
                {
                    id: dllloadfoldertext
                    anchors.fill: parent
                    font.weight: Font.DemiBold
                    elide: Text.ElideMiddle
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }


            Button
            {
                text: qsTr("Change DLL folder")
                onClicked:
                {
                    dllselect.open();
                }

                Connections
                {
                    target: dllselect
                    onAccepted:
                    {
                        var ordner = dllselect.folder.toString();
                        ordner = ordner.replace("file:///", "")
                        console.log("User has selected " + ordner);
                        dllloadfoldertext.text = ordner
                    }
                }
            }


        Rectangle
        {
            Layout.fillHeight: true
        }
    }

}