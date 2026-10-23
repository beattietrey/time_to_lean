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

  final _timeController = TextEditingController();
  final _timeValueController = TextEditingController();

  @override
  void dispose() {
    //clean up once submitted
    _timeController.dispose();
    _timeValueController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // validator
    if (_formKey.currentState!.validate()) {
      // set values to variables to be searched
      final timeDuration = _timeController.text;

      // etc
    }
  }

  int? _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: .center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'How much time do you have?',
                  hintText: 'Number of minutes',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a duration';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "Prioritize Task Type?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      RadioGroup<int>(
                        groupValue: _selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        child: Row(
                          children: [
                            const ListTile(
                              title: Text('Yes'),
                              leading: Radio(value: 2),
                            ),
                            const ListTile(
                              title: Text('No'),
                              leading: Radio(value: 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // if(_selectedValue == 2) [
                  //   //dropdown for task types
                  // ],
                ],
              ),
            ),

            // Add Radio Button for yes/no
            // Add Task Types as Dropdown, only show if yes
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
      ),
    );
  }
}
