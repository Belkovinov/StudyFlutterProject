class AIModel {
  final String id;
  final String object;
  final String ownedBy;

  AIModel({required this.id, required this.object, required this.ownedBy});

  factory AIModel.fromJson(Map<String, dynamic> json) {
    return AIModel(
        id: json['id'] ?? 'unknown',
        object: json['object'] ?? 'unknown',
        ownedBy: json['owned_by'] ?? 'unknown',
    );
  }
}

class ModelListResponse {
  final List<AIModel> data;

  ModelListResponse({required this.data});

  factory ModelListResponse.fromJson(Map<String, dynamic> json) {
    final modelsData = (json['data'] as List<dynamic>?) ?? [];
    final models = modelsData.map((item) => AIModel.fromJson(item)).toList();

    return ModelListResponse(data: models);
  }
}