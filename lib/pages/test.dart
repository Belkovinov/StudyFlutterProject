import 'package:dio/dio.dart';

void main(){
  fetchModels();
  fetchResponse();
}

final dio = Dio();

Future<void> fetchModels() async {
  try {
    final response = await dio.get("https://gpt.yall.icu/v1/models");

    if (response.statusCode == 200) {
      final Map<String, dynamic> models = response.data;

      print(models["data"].length);
    } else {
      print(response.statusCode);
      print(response.data);
    }
  } catch (e) {
    print(e);
  }
}

Future<void> fetchResponse() async{
  try {
      final response = await dio.post(
        "https://gpt.yall.icu/v1/chat/completions",
        data: {
          "model": "default",
          "messages": [
            {"role": "user", "content": "2+2=?"},
          ],
        },
      );
    if (response.statusCode == 200) {
      final Map<String, dynamic> messages = response.data;

      print(messages["choices"][0]["message"]["content"]);
      //print(models['data'].length);
      //print(models['data']);
    } else {
      print(response.statusCode);
      print(response.data);
  }
  } catch (e) {
    print(e);
  }
  /*print({
    "messages": [
      {"role": "user", "content": "В чём смысл жизни"},
    ],
  });
  print(
    json.encode({
      "model": "default",
      "messages": [
        {"role": "user", "content": "В чём смысл жизни"},
      ],
    }),
  );*/
}
