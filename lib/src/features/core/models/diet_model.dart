import "package:flutter/material.dart";

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool ViewIsSelected;

  DietModel({
   required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.ViewIsSelected
});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
          name: "Egg",
          iconPath: "assets/icons/egg-plate.svg",
          level: "Easy",
          duration: "30mins",
          calorie: "180kCal",
          boxColor: Color(0xff92a3fd),
          ViewIsSelected: true
      )
    );

    diets.add(
      DietModel(
          name: "Sushi",
          iconPath: "assets/icons/sushi-plate.svg",
          level: "Medium",
          duration: "1hr",
          calorie: "200kCal",
          boxColor: Color(0xffc58bf2),
          ViewIsSelected: false
      )
    );

    return diets;
  }
}