import 'package:dio/dio.dart';
import 'package:flutter_project/models/ai_model.dart';
import 'package:flutter_project/models/chat_models.dart';

void main() async {
  final apiService = ApiService();

  final modelsResponse = await apiService.fetchModels();

  if (modelsResponse != null) {
    print (modelsResponse.data.length);

    if (modelsResponse.data.isNotEmpty) {
      print(modelsResponse.data[0].id);
    }
}
  final request = ChatCompletionRequest(
    model: "default",
    messages: [ChatMessage(role: "user", content: "Hello, how are you?")],
  );

  final chatResponse = await apiService.fetchResponse(request);

  if (chatResponse != null && chatResponse.choices.isNotEmpty) {
    final messageContent = chatResponse.choices.first.message.content;
    print(messageContent);
  }
}

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://gpt.yall.icu/v1"));

  Future<ModelListResponse?> fetchModels() async {
    try {
      final response = await dio.get("/models");

      if (response.statusCode == 200) {
        return ModelListResponse.fromJson(response.data);
      } else {
        print(response.statusCode);
        print(response.data);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
      }
    }

  Future<ChatCompletionResponse?> fetchResponse(
      ChatCompletionRequest request,
  ) async {
    try {
      final response = await dio.post(
      "/chat/completions",
      data: request.toJson(),
  );
      if(response.statusCode == 200) {
        return ChatCompletionResponse.fromJson(response.data);
      } else {
      print(response.statusCode);
      print(response.data);
      return null;
      }
  } catch (e) {
        print(e);
        return null;
    }
  }
}