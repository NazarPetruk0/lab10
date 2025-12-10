import 'package:flutter/material.dart';
import 'preview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  double textSize = 20;

  void _showMessage(String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(msg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/robot.png", height: 150),

            const SizedBox(height: 20),

            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Enter text",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Text size: ${textSize.toInt()}",
              style: const TextStyle(fontSize: 16),
            ),

            Slider(
              value: textSize,
              min: 10,
              max: 60,
              onChanged: (value) {
                setState(() {
                  textSize = value;
                });
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: 160,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: () async {
                  final text = textController.text;

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PreviewScreen(
                        text: text,
                        size: textSize,
                      ),
                    ),
                  );

                  if (result == "ok") {
                    _showMessage("Cool!");
                  } else if (result == "cancel") {
                    _showMessage("Let’s try something else");
                  } else {
                    _showMessage("Don't know what to say");
                  }
                },
                child: const Text("Preview"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
