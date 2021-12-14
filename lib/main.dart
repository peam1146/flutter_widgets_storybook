import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import './src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Buton',
            builder: (context, kb) => ElevatedButton(
              onPressed:
                  kb.boolean(label: 'Enabled', initial: true) ? () {} : null,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      kb.slider(label: 'Radius', min: 0, max: 20, initial: 5),
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  kb.options<Color>(
                      label: 'Color',
                      initial: Colors.blue,
                      options: const [
                        Option('Brown', Colors.brown),
                        Option('Red', Colors.red),
                        Option('Blue', Colors.blue),
                        Option('Green', Colors.green),
                        Option('Yellow', Colors.yellow),
                      ]),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  kb.slider(label: 'Padding', min: 0, max: 20, initial: 5),
                ),
                child: Text(
                  kb.text(label: 'Title', initial: 'Button'),
                  style: TextStyle(
                    fontSize: kb.slider(
                        label: 'Font Size', min: 0, max: 50, initial: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      );
}
