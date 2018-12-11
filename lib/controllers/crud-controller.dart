import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stopwatch/models/contact.dart';

class ContactModel {
  static final ContactModel _instance = ContactModel.internal();

  factory ContactModel() => _instance;

  ContactModel.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable($idCollumn INTEGER PRIMARY KEY, $nameCollumn TEXT, $emailCollumn TEXT,"
          "$phoneCollumn TEXT, $adressCollumn TEXT, $imgCollumn TEXT, $dataCreationCollumn DATETIME, $activeCollumn BOOL)");
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

  //trazendo todos apenas
  Future<List> getAllContactsA() async {
    Database dbContact = await db;
    var result = await dbContact.rawQuery('SELECT * FROM $contactTable');

    return result.toList();
  }

  // adicionando os contatos
  Future<List> getAllContacts() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery('SELECT * FROM $contactTable');
    List<Contact> listContact = List();
    for (Map m in listMap) {
      listContact.add(Contact.fromMap(m));
    }
    return listContact;
  }

  Future<Contact> getContact(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(contactTable,
        columns: [
          idCollumn,
          nameCollumn,
          emailCollumn,
          emailCollumn,
          adressCollumn,
          dataCreationCollumn,
          activeCollumn
        ],
        where: "$idCollumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }
  // Future<int> deleteContact(Contact contact) async{
  //   Database dbContact = await db;
  //   return await dbContact.update(contactTable,  , where: "$idCollumn = ?", whereArgs: [contact.id]);
  // } Delete Permanente

  Future<int> deleteContact(Contact contact) async {
    Database dbContact = await db;
    return await dbContact.rawUpdate(
        'UPDATE $contactTable SET $activeCollumn = false WHERE $idCollumn = ${contact.id}');
  }

  Future<int> updateContact(Contact contact) async {
    Database dbContact = await db;
    return await dbContact.update(contactTable, contact.toMap(),
        where: "$idCollumn = ?", whereArgs: [contact.id]);
  }

  Future<int> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT (*) FROM {$contactTable}"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}
