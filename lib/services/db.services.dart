import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DBService {
  static dynamic db;

  static FutureOr<void> Function(Database, int)? onCreate(
    final dynamic db,
    final int version,
  ) {
    return db
        .execute('CREATE TABLE recipes(id INTEGER PRIMARY KEY, name TEXT);');
  }

  static FutureOr<void> insertOne(final Map<String, dynamic> recipeJson) async {
    await db.insert(
      'recipes',
      recipeJson,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static fetchRecipes() async {
    final List<Map<String, dynamic>> maps = await db.query('recipes');

    return List.generate(maps.length, (final int i) {
      // return Recipe();
    });
  }
}
