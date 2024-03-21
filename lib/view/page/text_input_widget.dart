import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController _controller = TextEditingController();
  String _enteredText = '';

  void _submitText() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _enteredText = _controller.text;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('Please enter text in the field!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _clearField() {
    if (_controller.text.isNotEmpty) {
      _controller.clear();
      setState(() {
        _enteredText = '';
      });
    } else {
      _controller.clear();
      setState(() {
        _enteredText = '';
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('The field is already empty!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text Input Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onEditingComplete: () => _submitText(),
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter Text',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitText();
                    },
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _clearField();
                    },
                    child: const Text('Clear field'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Entered Text: $_enteredText',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
