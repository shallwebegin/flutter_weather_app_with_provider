import 'package:flutter/material.dart';

class ChooseCity extends StatefulWidget {
  const ChooseCity({super.key});

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose City'),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _textController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context, _textController.text);
                  },
                  icon: const Icon(Icons.search)),
              hintText: 'City',
              labelText: 'Choose City',
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
