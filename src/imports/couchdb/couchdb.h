#ifndef __COUCHDB_H__
#define __COUCHDB_H__

#include <QObject>
/*
#include <QNetworkRequest>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QAuthenticator>
*/

class CouchDBDocument : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ id WRITE setId NOTIFY idChanged)

 public:

    CouchDBDocument(QObject *parent = 0);
    ~CouchDBDocument();

    QString id() const;
    void setId(const QString &id);

 signals:

    void idChanged(QString id);

 private:

    QString m_id;
};

typedef QList<CouchDBDocument> CouchDBDocumentList;

class CouchDB : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int port READ port WRITE setPort NOTIFY portChanged)
    Q_PROPERTY(QString host READ host WRITE setHost NOTIFY hostChanged)

 public:
    CouchDB(QObject *parent = 0);
    ~CouchDB();

 public slots:
     /*
     void listDatabases();
     void createDatabase(const QString &name);
     void deleteDatabase(const QString &name);
     */

     int port() const;
     void setPort(int port);

     QString host() const;
     void setHost(const QString &name);

 signals:
     /*
     void databaseListReceived(const QStringList&);
     void databaseCreated(bool ok, const QString& error = QString());
     void databaseDeleted(bool ok, const QString& error = QString());
     */

     void portChanged(int port);
     void hostChanged(const QString &host);

 private slots:

     /*
     void _q_connectionErrorOccured(QNetworkReply::NetworkError);
     void _q_databaseListFinished();
     void _q_databaseCreateFinished();
     void _q_databaseDeleteFinished();
     */

 private:
    //     QNetworkAccessManager m_network_access_manager;
     int m_port;
     QString m_host;
};

#endif
