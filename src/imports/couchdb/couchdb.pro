include(../../../dcm.pri)

TEMPLATE = lib
  
CONFIG += qt plugin

QT += network qml quick

TARGET = $$qtLibraryTarget(couchdbplugin)

DESTDIR = $$DCM_QML_PATH/CouchDB

HEADERS += \
    couchdb.h \
    couchdb-plugin.h
    

SOURCES += \
    couchdb.cpp \
    couchdb-plugin.cpp


unix {
    target.path = $$DESTDIR
    qmldir.files = $$PWD/qmldir
    qmldir.path = $$DESTDIR

    INSTALLS += target qmldir
}

OTHER_FILES += qmldir

# Copy the qmldir file to the same folder as the plugin binary
QMAKE_POST_LINK += $$QMAKE_COPY $$replace($$list($$quote($$PWD/qmldir) $$DESTDIR), /, $$QMAKE_DIR_SEP)
