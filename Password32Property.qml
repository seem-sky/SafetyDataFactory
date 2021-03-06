import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2


Rectangle {
    id: rectangle1
    width: 550
    height: 400
    anchors.fill: parent


    RowLayout {
        id: rowLayout1
        y: 8
        height: 44
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        Label {
            id: label1
            text: qsTr("Password")
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        TextField {
            id: password
            text: actionData.password
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: label1.right
            anchors.leftMargin: 10
            placeholderText: qsTr("string password")

            onTextChanged: actionData.password=password.text
        }



    }

    RowLayout {
        id: rowLayout2
        x: 8
        y: 61
        height: 44
        anchors.right: parent.right
        Label {
            id: label2
            text: qsTr("File")
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        TextField {
            id: passwordFilePath
            text: actionData.file?actionData.file:""
            anchors.right: browse.left
            placeholderText: qsTr("Password file path")
            anchors.rightMargin: 10
            anchors.left: label2.right
            anchors.leftMargin: 10
            onTextChanged: actionData.file=passwordFilePath.text

        }

        Button {
            id: browse
            text: qsTr("Browse")
            anchors.right: parent.right
            anchors.rightMargin: 10
            onClicked: fileDialog.show("Please choose a Password file",function(path){

                actionData.file=path;

                passwordFilePath.text=path;

            });

        }
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    RowLayout {
        id: rowLayout3
        x: 8
        y: 111
        height: 44
        anchors.right: parent.right
        Label {
            id: label3
            text: qsTr("Start position")
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        SpinBox {
            id: startPos
            anchors.left: parent.left
            anchors.leftMargin: 100
            minimumValue: -9999999
            maximumValue: 9999999
            value:actionData.startPos==null?0:actionData.startPos
            onValueChanged: actionData.startPos=startPos.value
        }

        Label {
            id: label4
            text: qsTr("100,-100,default 0")
            anchors.top: parent.top
            anchors.topMargin: 14
            anchors.right: rectangle1.left
            anchors.rightMargin: -477
            anchors.left: startPos.right
            anchors.leftMargin: 10
        }


        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    RowLayout {
        id: rowLayout4
        x: 8
        y: 161
        height: 44
        anchors.right: parent.right
        Label {
            id: label5
            text: qsTr("Density")
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        SpinBox {
            id: densityValue
            anchors.left: parent.left
            anchors.leftMargin: 60
            minimumValue: 1
            maximumValue: 9999999
            value:actionData.density==null?1:actionData.density
            onValueChanged: actionData.density=densityValue.value
        }


        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
    RowLayout {
        y: 216
        height: 44
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        Label {
            text: qsTr("File type")
            anchors.left: parent.left
            anchors.leftMargin: 10
        }


        TextField {
            id: fileType
            anchors.right: parent.right
            anchors.left: parent.left
            placeholderText: qsTr("jpg,png,zip,csv,xml,plist")
            anchors.leftMargin: 70
            anchors.rightMargin: 10
            text:actionData.fileType?actionData.fileType:""
            onTextChanged: actionData.fileType=fileType.text
        }

    }




    FileDialog {
        id: fileDialog
        title: "Please choose a file"

        function show(caption,callback) {
            fileDialog.onAccepted.connect(function cb(){
                if(callback!=null)
                    callback(fileDialog.fileUrl);
                console.log("You chose: " + fileDialog.fileUrls)
                fileDialog.onAccepted.disconnect(cb);
            })
            fileDialog.open();
        }

    }


    property var actionData;
    //signal onActionDataChanged(var actionData);



}

