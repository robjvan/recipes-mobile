import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:recipes_mobile/controllers/app_state.controller.dart';
import 'package:recipes_mobile/models/recipe.model.dart';
import 'package:recipes_mobile/services/api.service.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static dynamic db;

  /// Opens a connection to the local DB
  static Future<void> openDB() async {
    db = await openDatabase(
      /// Set the path to the DB
      join(await getDatabasesPath(), 'recipes.db'),

      /// When the DB is first created, create a table to store our printers
      onCreate: (final Database db, final int version) {
        /// Run script to create DB
        db.execute(
          'CREATE TABLE recipes(id INTEGER PRIMARY KEY, name TEXT, description TEXT, servings INTEGER, prepTime INTEGER, cookTime INTEGER)',
        );
      },
      version: 1,
    );
  }

  /// Creates a new record in the recipes table
  static FutureOr<void> insertOne(final Map<String, dynamic> recipeJson) async {
    await db.insert(
      'recipes',
      recipeJson,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Syncs the local recipes table with server recipes table
  static refreshDB() async {
    final List<Recipe> recipes = <Recipe>[];

    final http.Response response = await APIService.fetchRecipes();

    if (response.statusCode == 200) {
      /// Convert list of recipes to recipe objects
      final List<dynamic> jsonResult = jsonDecode(response.body);
      for (final Map<String, dynamic> element in jsonResult) {
        recipes.add(Recipe.fromMap(element));
      }
    }

    AppStateController.recipes.value = recipes;
  }
}
