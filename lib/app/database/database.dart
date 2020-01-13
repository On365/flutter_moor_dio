import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Users extends Table {
  TextColumn get email => text().withLength(min: 1, max: 50)();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get phone => text().nullable().withLength(min: 1, max: 15)();
  TextColumn get profilePicture => text().withLength(min: 1, max: 150)();
  TextColumn get detailPicture => text().withLength(min: 1, max: 150)();
  @override
  Set<Column> get primaryKey => {email};
}

@UseMoor(tables: [Users], daos: [UserDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));
  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(
  //       onCreate: (Migrator m) {
  //         return m.createAllTables();
  //       },
  //       onUpgrade: (Migrator m, int from, int to) async {
  //         if (from == 1) {
  //           // we added the dueDate property in the change from version 1
  //           await m.addColumn(todos, todos.dueDate);
  //         }
  //       },
  //     );
}

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Stream<List<User>> watchAllTasks() {
    return (select(users)..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  Future insertUser(User user) =>
      into(users).insert(user, mode: InsertMode.insertOrReplace);
  Future updateUser(User user) => update(users).replace(user);
  Future deleteUSer(User user) => delete(users).delete(user);
  Future clearUser() => delete(users).go();
}
