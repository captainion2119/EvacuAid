import "package:flutter/material.dart";

class CategoryModel{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
          name: 'Egg',
          iconPath: 'assets/icons/egg-plate.svg',
          boxColor: Color(0xff92a3fd)
      )
    );

    categories.add(
        CategoryModel(
            name: 'Fish',
            iconPath: 'assets/icons/fish-plate.svg',
            boxColor: Color(0xffc58bf2)
        )
    );

    categories.add(
        CategoryModel(
            name: 'Sushi',
            iconPath: 'assets/icons/sushi-plate.svg',
            boxColor: Color(0xff92a3fd)
        )
    );

    categories.add(
        CategoryModel(
            name: 'Lobster',
            iconPath: 'assets/icons/lobster-plate.svg',
            boxColor: Color(0xffc58bf2)
        )
    );

    categories.add(
        CategoryModel(
            name: 'Pie',
            iconPath: 'assets/icons/pie-plate.svg',
            boxColor: Color(0xff92a3fd)
        )
    );

    return categories;
  }
}