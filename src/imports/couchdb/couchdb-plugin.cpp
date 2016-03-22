#include "couchdb.h"
#include "couchdb-plugin.h"
#include <qqml.h>

void CouchDBPlugin::registerTypes(const char *uri)
{
  qmlRegisterType<CouchDBDocument>(uri, 1, 0, "CouchDBDocument");
  qmlRegisterType<CouchDB>(uri, 1, 0, "CouchDB");
}
