#include <cstdlib>
#include <csignal>

#include <QGuiApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>

static int aborted = 0;
static void signal_handler(int sig)
{
  Q_UNUSED(sig);

  if (aborted)
    exit(1);

  qApp->quit();
  aborted = 1;
}

int main(int argc, char *argv[])
{
  QGuiApplication dcmApp(argc, argv);
  QQmlApplicationEngine *appEngine;

  dcmApp.setOrganizationName("dcm-group");
  dcmApp.setOrganizationDomain("dcm.org");
  dcmApp.setApplicationName("Digital Collection Management");

  signal(SIGINT, signal_handler);
  signal(SIGTERM, signal_handler);

  appEngine = new QQmlApplicationEngine();
  appEngine->load(QUrl("qrc:/qml/Application.qml"));

  return dcmApp.exec();
}
