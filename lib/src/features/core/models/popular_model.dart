class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected
});

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(
      PopularDietsModel(
          name: "Lobster",
          iconPath: "assets/icons/lobster-plate.svg",
          level: "Medium",
          duration: "30mins",
          calorie: "80kCal",
          boxIsSelected: true,
      )
    );

    popularDiets.add(
      PopularDietsModel(
          name: "Pie",
          iconPath: "assets/icons/pie-plate.svg",
          level: "Easy",
          duration: "30mins",
          calorie: "200kCal",
          boxIsSelected: false
      )
    );

    return popularDiets;
  }
}