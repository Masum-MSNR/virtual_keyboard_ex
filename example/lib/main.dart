import 'package:flutter/material.dart';
import 'package:virtual_keyboard_ex/virtual_keyboard_ex.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Keyboard Plus Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var keyboardController = TextEditingController();
  var keyboardFocusNode = FocusNode();

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Virtual Keyboard Plus Demo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: textController1,
                  focusNode: focusNode1,
                  keyboardType: TextInputType.none,
                  maxLength: null,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter text',
                  ),
                  onTap: () {
                    setState(() {
                      keyboardController = textController1;
                      keyboardFocusNode = focusNode1;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextField(
                  controller: textController2,
                  focusNode: focusNode2,
                  keyboardType: TextInputType.none,
                  maxLength: null,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter text',
                  ),
                  onTap: () {
                    setState(() {
                      keyboardController = textController2;
                      keyboardFocusNode = focusNode2;
                    });
                  },
                ),
                SizedBox(height: 16),
                TextField(
                  controller: textController3,
                  focusNode: focusNode3,
                  keyboardType: TextInputType.none,
                  maxLength: null,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter text',
                  ),
                  onTap: () {
                    setState(() {
                      keyboardController = textController3;
                      keyboardFocusNode = focusNode3;
                    });
                  },
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: VirtualKeyboard(
              textController: keyboardController,
              keepFocusOn: keyboardFocusNode,
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width,
              keyboardType: VirtualKeyboardType.text,
              defaultLanguage: Language.english,
              textSize: 16,
              verticalGap: 5,
              horizontalGap: 5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }
}
