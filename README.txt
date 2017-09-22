#################################
### Kafka Workshop 22.09.2017 ###
###          Sipgate          ###
#################################

# Dateien und Verzeichnisse #
README.txt          Diese Datei
docker-compose.yml  Beschreibung und Konfiguration der in Containern zu startenden Services
config/             Konfigurationsdateien für Services
data/               Beispiel-Dateien und Tabellen
tools/confluent/    Confluent Kafka 0.11.0.1
tools/maven/        Apache Maven
pom.xml             Maven Projektdatei


Benötigte Software:
- Java 8 (OpenJDK oder Oracle)
  (https://java.com/en/download/)

- Aktuelles Docker CE (z.B. 17.06.1-ce)
  (https://www.docker.com/get-docker)

- docker-compose
  (https://docs.docker.com/compose/install/)

Schritte des Workshops:

0. Dauer: 10 Minuten
   Vorstellung "Big Picture"

1. Dauer: 25 Minuten
   Docker und docker-compose installieren
   - Siehe Links oben

2. Umgebung hochfahren, ausprobieren
   Dauer: 20 Minuten
   - $ docker-compose up
   - Topic UI zeigt Topic-Übersicht: http://localhost/
   - Schema Registry UI zeigt Topic-Übersicht: http://localhost/schema-registry-ui/
   - Adminer zeigt MySQL Datenbank: http://localhost:8080/
       - Login
         - Server: customer-db
         - Username / Password: root / sipgate
         - Datenbank und Tabelle: customers

3. Datenquellen anbinden mittels Kafka Connect
   Dauer: 30 Minuten
   - Events-Datei über FileSource anbinden -> Topic "raw-events"
   - MySQL über JDBC-Source anbinden -> Topic "customers"

4. Daten über Streams aufbereiten
   Dauer: 60 Minuten
   - Topic "raw-events" aufbereiten zu "events" mit Schema
     -> CustomerKeySelectStream.java

   - Topic "customers" zu "keyed-customers" wandeln (key = masterSipId)
     -> CustomerKeySelectStream.java

5. Join Stream entwickeln
   Dauer: 30 Minuten
   - Topics "events" und "keyed-customers" per masterSipId joinen
   - Schreiben in Topic "enriched-events"

6. Datensenke anbinden mittels Kafka Connect
   Dauer: 10 Minuten
   - Topic "enriched-events" mittels FileSink in Datei schreiben

7. Aggregate Stream entwickeln (falls Zeit übrig)
   - Mit Sliding Window (10 Minuten)
   - Falls 3 oder mehr Events von einem Nutzer in selbes Postleitzahlengebiet -> Nachricht in Topic "alert"
   - Topic "alert" in Datei schreiben mittels FileSink

#########################################################################
Befehle:

- JdbcSource für Customers starten
  tools/confluent/bin/connect-standalone config/connect-avro-standalone.properties config/customers-jdbc-source.properties

- FileSource für Events starten
  tools/confluent/bin/connect-standalone config/connect-standalone.properties config/events-file-source.properties

- Stream Code bauen
  tools/maven/bin/mvn clean compile

- EventMapperStream starten
  tools/maven/bin/mvn exec:java -Dexec.mainClass=de.sipgate.kafka.workshop.stream.EventMapperStream

- CustomerKeySelectStream starten
  tools/maven/bin/mvn exec:java -Dexec.mainClass=de.sipgate.kafka.workshop.stream.CustomerKeySelectStream

- CustomerEventJoinStream starten
  tools/maven/bin/mvn exec:java -Dexec.mainClass=de.sipgate.kafka.workshop.stream.CustomerEventJoinStream

- Event hinzufügen
  (Format: masterSipId;vorwahl;nummer)
  echo "1234501;0211;42471142" >> data/events.txt
