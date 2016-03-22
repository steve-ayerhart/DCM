include(../../dcm.pri)

QT += multimedia network quick widgets xml
  
TARGET = dcm

DESTDIR = $$DCM_APP_PATH
VERSION = $$DCM_VERSION
DEFINES += DCM_VERSION=\\\"$${DCM_VERSION}\\\"

RESOURCES = ../resources/dcm.qrc
SOURCES += dcm.cpp

QMAKE_TARGET_COMPANY="DCM Group"
QMAKE_TARGET_COPYRIGHT="Copyright (c) 2016 DCM Group"

android {
} else:mac {
} else:unix {
  target.path =$$PREFIX/bin
  INSTALLS += target            
}
