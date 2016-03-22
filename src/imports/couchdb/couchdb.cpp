#include "couchdb.h"

CouchDBDocument::CouchDBDocument(QObject *parent)
  : QObject(parent)
{

}

CouchDBDocument::~CouchDBDocument()
{

}

QString
CouchDBDocument::id() const
{
  return m_id;
}

void
CouchDBDocument::setId(const QString &id)
{
  if (id != m_id) {
    m_id = id;
    emit idChanged(id);
  }
}

CouchDB::CouchDB(QObject *parent)
  : QObject(parent)
{
}

CouchDB::~CouchDB()
{
}


QString
CouchDB::host() const
{
  return m_host;
}

void
CouchDB::setHost(const QString &name)
{
  if (name != m_host) {
    m_host = name;
    emit hostChanged(name);
  }
}

int
CouchDB::port() const
{
  return m_port;
}

void
CouchDB::setPort(int port)
{
  if (port != m_port) {
    m_port = port;
    emit portChanged(port);
  }
}
