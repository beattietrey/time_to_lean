import 'package:flutter/material.dart';
import 'package:time_to_lean/home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (pageIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = Placeholder(color: Colors.red);
        break;
      case 2:
        page = Placeholder(color: Colors.blue);
        break;
      default:
        throw UnimplementedError('No Widget for $pageIndex');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time To Lean",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: page,
      ),

      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.add_circle),
            label: 'New Task',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_rounded),
            label: 'Task List',
          ),
        ],
        selectedIndex: pageIndex,
        onDestinationSelected: (value) => setState(() {
          pageIndex = value;
        }),
      ),
    );
  }
}
