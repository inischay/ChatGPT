import 'dart:convert';

class ModelsModel {
  final String id;
  final int created;
  final String root;

  ModelsModel(this.id, this.created, this.root);

  factory ModelsModel.fromJson(Map<String, dynamic> json) =>
      ModelsModel(json["id"], json["created"], json["root"]);
  static List<ModelsModel> modelsModelSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}
