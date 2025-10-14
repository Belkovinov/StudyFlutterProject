import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'models/chat_models.dart';

void main() {
  runApp(const MyApp());
}

class ApiService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://gpt.yall.icu/v1",
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
  ));

  Future<ChatCompletionResponse?> sendRequest(String userInput) async {
    final request = ChatCompletionRequest(
      model: "default",
      messages: [ChatMessage(role: "user", content: userInput)],
    );

    try {
      final response = await dio.post(
        "/chat/completions",
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ChatCompletionResponse.fromJson(response.data);
      } else {
        debugPrint('Ошибка ответа сервера: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      debugPrint('Исключение при запросе чата: $e');
      if (e.response != null) {
        debugPrint('Данные ошибки: ${e.response?.data}');
      }
      return null;
    } catch (e) {
      debugPrint('Произошла непредвиденная ошибка: $e');
      return null;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AI Чат',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ApiService _apiService = ApiService();
  final TextEditingController _textController = TextEditingController();

  String _responseText = "Здесь появится ответ от нейросети...";
  bool _isLoading = false;

  Future<void> _sendMessage() async {
    final userInput = _textController.text;
    if (userInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, введите ваш запрос.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _responseText = "Отправка запроса...";
    });

    final response = await _apiService.sendRequest(userInput);

    setState(() {
      if (response != null && response.choices.isNotEmpty) {
        _responseText = response.choices.first.message.content.trim();
      } else {
        _responseText = "Не удалось получить ответ. Попробуйте еще раз.";
      }
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат с AI'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Text(
                      _responseText,
                      style: const TextStyle(fontSize: 16.0, height: 1.5),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Введите ваш вопрос...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _isLoading ? null : _sendMessage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  tooltip: 'Отправить',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
