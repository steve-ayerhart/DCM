DCM_VERSION = 0.1

EOL = $$escape_expand(\n\t)

isEmpty(PREFIX) {
  unix {
    PREFIX = /usr/local
  }
}

DCM_SOURCE_TREE = $$PWD

isEmpty(DCM_BUILD_TREE) {
  sub_dir == $$_PRO_FILE_PWD_
  sub_dir ~= s,^$$re_escape($$PWD),,
  DCM_BUILD_TREE = $$clean_path($$OUT_PWD)
  DCM_BUILD_TREE ~= s,$$re_escape($$sub_dir)$,,
}

DCM_APP_PATH = $$DCM_BUILD_TREE/bin
mac {
  DCM_LIB_PATH = $$DCM_APP_PATH/dcm.app/Contents/Frameworks
  DCM_QML_PATH = $$DCM_APP_PATH/dcm.app/Contents/Resources/qml
} else {
  DCM_LIB_PATH = $$DCM_APP_PATH
  DCM_QML_PATH = $$DCM_APP_PATH
}