# recipes_mobile

Recipes, powered by AI.

## Features

Connects to backend server for operations:

- login/register
- save/fetch user data (recipes, prefs, etc)
- generate new recipes
- 

Consider the following formatting example, then make me a recipe for 

{
  "name": "Simple Cheesebugers",
  "cook-time": 20,
  "description": "Simple beef burgers topped with cheese.  Summer classic!",
  "prep-time": 20,
  "servings": 4,
  "ingredients": [
    {
      "name": "beef",
      "quantity": 1,
      "units": "pound",
      "preparation": "ground"
    },
    {
      "name": "salt",
      "quantity": 4,
      "units": "buns",
      "preparation": ""
    },
    {
      "name": "pepper",
      "quantity": 4,
      "units": "buns",
      "preparation": ""
    },
    {
      "name": "onion",
      "quantity": 0.25,
      "units": "cup",
      "preparation": "minced"
    },
    {
      "name": "cheese slices",
      "quantity": 4,
      "units": "slices",
      "preparation": ""
    },
    {
      "name": "hamburger buns",
      "quantity": 4,
      "units": "buns",
      "preparation": ""
    },
  ],
  "instructions": [
    "Thoroughly combine beef, spices, and minced onion.",
    "Divide the mixture into four equal portions and using rolling pin, form into thin round patties",
    "Fry on medium-high heat for 5-7 minutes, then flip and top with cheese slice.",
    "Cover and cook for another 5-7 minutes on the second side.",
    "Place platty onto bun topped favorite condiments.",
    "Serve with fries and sliced fresh vegetables or salad."  
  ]
}