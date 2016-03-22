include(dcm.pri)

TEMPLATE = subdirs

SUBDIRS = src

mac {
    package.depends = first
    package.output = dcm-$$DCM_VERSION-mac.dmg
    package.tmp = dcm.tmp
    package.commands = \
                     rm -rf $$package.tmp $$package.output;\
                     $(MKDIR) $$package.tmp; \
                     ln -s /Applications $$package.tmp/Applications; \
                     cp -a $$DCM_APP_PATH/dcm.app $$package.tmp; \
                     hdiutil create $$package.output -srcdir $$package.tmp -format UDBZ -volname \"dcm $$DCM_VERSION\"; \
                     rm -rf $package.tmp
    QMAKE_EXTRA_TARGTES = package
} else:win32 {

}
