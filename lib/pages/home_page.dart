import 'dart:developer';

import 'package:chatgpt_project/contraints.dart';
import 'package:chatgpt_project/services/api_services.dart';
import 'package:chatgpt_project/services/assets_manager.dart';
import 'package:chatgpt_project/services/services.dart';
import 'package:chatgpt_project/widgets/chat_widgets.dart';
import 'package:chatgpt_project/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _istyping = true;

  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.logo,
          ),
        ),
        title: const Text("ChatGPT"),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModelSheet(context);
            },
            icon: const Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return ChatWidget(
                  chatIndex:
                      int.parse(chatMessages[index]["chatIndex"].toString()),
                  msg: chatMessages[index]["msg"].toString(),
                );
              },
            ),
          ),
          if (_istyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(
              height: 15,
            ),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          // sen message
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration.collapsed(
                            hintText: "How can I help you",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          try {
                            await ApiServices.getModels();
                          } catch (e) {
                            print("error $e");
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            )
          ]
        ],
      )),
    );
  }
}
