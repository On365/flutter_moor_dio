// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String email;
  final String name;
  final String phone;
  final String profilePicture;
  final String detailPicture;
  User(
      {@required this.email,
      @required this.name,
      this.phone,
      @required this.profilePicture,
      @required this.detailPicture});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      profilePicture: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_picture']),
      detailPicture: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_picture']),
    );
  }
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return User(
      email: serializer.fromJson<String>(json['email']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      profilePicture: serializer.fromJson<String>(json['profilePicture']),
      detailPicture: serializer.fromJson<String>(json['detailPicture']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'profilePicture': serializer.toJson<String>(profilePicture),
      'detailPicture': serializer.toJson<String>(detailPicture),
    };
  }

  @override
  UsersCompanion createCompanion(bool nullToAbsent) {
    return UsersCompanion(
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      profilePicture: profilePicture == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePicture),
      detailPicture: detailPicture == null && nullToAbsent
          ? const Value.absent()
          : Value(detailPicture),
    );
  }

  User copyWith(
          {String email,
          String name,
          String phone,
          String profilePicture,
          String detailPicture}) =>
      User(
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        profilePicture: profilePicture ?? this.profilePicture,
        detailPicture: detailPicture ?? this.detailPicture,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('detailPicture: $detailPicture')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      email.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(phone.hashCode,
              $mrjc(profilePicture.hashCode, detailPicture.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.email == this.email &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.profilePicture == this.profilePicture &&
          other.detailPicture == this.detailPicture);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> email;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> profilePicture;
  final Value<String> detailPicture;
  const UsersCompanion({
    this.email = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.detailPicture = const Value.absent(),
  });
  UsersCompanion.insert({
    @required String email,
    @required String name,
    this.phone = const Value.absent(),
    @required String profilePicture,
    @required String detailPicture,
  })  : email = Value(email),
        name = Value(name),
        profilePicture = Value(profilePicture),
        detailPicture = Value(detailPicture);
  UsersCompanion copyWith(
      {Value<String> email,
      Value<String> name,
      Value<String> phone,
      Value<String> profilePicture,
      Value<String> detailPicture}) {
    return UsersCompanion(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      detailPicture: detailPicture ?? this.detailPicture,
    );
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn('email', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn('phone', $tableName, true,
        minTextLength: 1, maxTextLength: 15);
  }

  final VerificationMeta _profilePictureMeta =
      const VerificationMeta('profilePicture');
  GeneratedTextColumn _profilePicture;
  @override
  GeneratedTextColumn get profilePicture =>
      _profilePicture ??= _constructProfilePicture();
  GeneratedTextColumn _constructProfilePicture() {
    return GeneratedTextColumn('profile_picture', $tableName, false,
        minTextLength: 1, maxTextLength: 150);
  }

  final VerificationMeta _detailPictureMeta =
      const VerificationMeta('detailPicture');
  GeneratedTextColumn _detailPicture;
  @override
  GeneratedTextColumn get detailPicture =>
      _detailPicture ??= _constructDetailPicture();
  GeneratedTextColumn _constructDetailPicture() {
    return GeneratedTextColumn('detail_picture', $tableName, false,
        minTextLength: 1, maxTextLength: 150);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [email, name, phone, profilePicture, detailPicture];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.phone.present) {
      context.handle(
          _phoneMeta, phone.isAcceptableValue(d.phone.value, _phoneMeta));
    } else if (phone.isRequired && isInserting) {
      context.missing(_phoneMeta);
    }
    if (d.profilePicture.present) {
      context.handle(
          _profilePictureMeta,
          profilePicture.isAcceptableValue(
              d.profilePicture.value, _profilePictureMeta));
    } else if (profilePicture.isRequired && isInserting) {
      context.missing(_profilePictureMeta);
    }
    if (d.detailPicture.present) {
      context.handle(
          _detailPictureMeta,
          detailPicture.isAcceptableValue(
              d.detailPicture.value, _detailPictureMeta));
    } else if (detailPicture.isRequired && isInserting) {
      context.missing(_detailPictureMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.phone.present) {
      map['phone'] = Variable<String, StringType>(d.phone.value);
    }
    if (d.profilePicture.present) {
      map['profile_picture'] =
          Variable<String, StringType>(d.profilePicture.value);
    }
    if (d.detailPicture.present) {
      map['detail_picture'] =
          Variable<String, StringType>(d.detailPicture.value);
    }
    return map;
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [users];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UserDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => db.users;
}
