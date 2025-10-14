class ChatMessage {
  final String role;
  final String content;

  ChatMessage({required this.role, required this.content});

  Map<String, dynamic> toJson() {
    return {'role': role, 'content': content,};
  }
}

class ChatCompletionRequest {
  final String model;
  final List<ChatMessage> messages;

  ChatCompletionRequest({required this.model, required this.messages});

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }
}

class ResponseChatMessage {
  final String role;
  final String content;

  ResponseChatMessage({required this.role, required this.content});

  factory ResponseChatMessage.fromJson(Map<String, dynamic> json) {
    return ResponseChatMessage(role: json['role'] ?? 'unknown', content: json['content'] ?? 'unknown');
  }
}

class Choice {
  final int index;
  final ResponseChatMessage message;

  Choice({required this.index, required this.message});

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
        index: json['index'] ?? 0,
        message: ResponseChatMessage.fromJson(json['message']),
    );
  }
}

class ChatCompletionResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;

  ChatCompletionResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
  });

  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) {
    final choicesData = (json['choices'] as List<dynamic>?) ?? [];
    final choices = choicesData.map((item) => Choice.fromJson(item)).toList();

    return ChatCompletionResponse(
      id: json['id'] ?? 'unknown',
      object: json['object'] ?? '',
      created: json['created'] ?? 0,
      model: json['model'] ?? 'unknown',
      choices: choices,
    );
  }
}