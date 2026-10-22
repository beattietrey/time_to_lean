import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Give Me a Task')),
        body: const TaskRecall(),
      ),
    );
  }
}

List taskTime = [];

class TaskRecall extends StatefulWidget {
  const TaskRecall({super.key});

  @override
  State<TaskRecall> createState() => _TaskRecallState();
}

class _TaskRecallState extends State<TaskRecall> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: .center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "How much time do you have?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // DropdownMenuFormField(dropdownMenuEntries: dropdownMenuEntries),
          // Fill This in
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Prioritize Task Type?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Add Radio Button for yes/no
          // Add Task Types as Dropdown if yes
          Padding(
            padding: const .symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
