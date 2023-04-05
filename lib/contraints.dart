import 'package:chatgpt_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color scaffoldBackdroundColor = const Color(0xFF343541);

Color cardColor = const Color(0xFF444654);

List<String> models = [
  "Model1",
  "Model2",
  "Model3",
  "Model4",
  "Model5",
  "Model6",
];

List<DropdownMenuItem<String>>? get getModelItem {
  List<DropdownMenuItem<String>>? modelItems =
      List<DropdownMenuItem<String>>.generate(
          models.length,
          (index) => DropdownMenuItem(
              value: models[index],
              child: TextWidget(
                label: models[index],
                fonsize: 15,
              )));
  return modelItems;
}

final chatMessages = [
  {"msg": "Hello who are you", "chatIndex": "0"},
  {
    "msg":
        "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you ",
    "chatIndex": "1"
  },
  {"msg": "What is flutter", "chatIndex": "0"},
  {
    "msg":
        "Flutter is an open source application development framework created by Google",
    "chatIndex": "1"
  },
  {"msg": "Hello who are you", "chatIndex": "0"},
  {"msg": "Hello who are you", "chatIndex": "1"},
];
