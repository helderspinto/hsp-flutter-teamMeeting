import 'package:flutter/material.dart';

void main() {
  runApp(const Pl02Ex01App());
}

class Pl02Ex01App extends StatelessWidget {
  const Pl02Ex01App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void join() {
    setState(() {
      count++;
    });
    //print("Join, $count");
  }

  void leave() {
    setState(() {
      count--;
    });
    //print("Leave, $count");
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Team Meeting App",
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              count.toString(), //'$count',
              style: const TextStyle(
                fontSize: 100,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isFull ? null : join,
                style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.grey[50] : Colors.blue[50],
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Text(
                  "JOIN",
                  style: TextStyle(
                    fontSize: 14,
                    color: isFull ? Colors.grey[400] : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: isEmpty ? null : leave,
                style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.grey[50] : Colors.blue[50],
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Text(
                  "LEAVE",
                  style: TextStyle(
                    fontSize: 14,
                    color: isEmpty ? Colors.grey[400] : Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
