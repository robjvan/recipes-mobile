class Recipe {
  int id;
  int userId;
  String name;
  int cookTime;
  int prepTime;
  String description;
  int servings;
  // List<Ingredient> ingredients;
  // List<Instruction> instructions;

  Recipe({
    required this.id,
    required this.userId,
    required this.name,
    required this.cookTime,
    required this.prepTime,
    required this.description,
    required this.servings,
  });

  factory Recipe.fromMap(final Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      description: json['description'],
      cookTime: json['cookTime'],
      prepTime: json['prepTime'],
      servings: json['servings'],
    );
  }
}
