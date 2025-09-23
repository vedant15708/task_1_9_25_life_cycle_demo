import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LifecyleDemo(),
  );
  }
  }


  
  class LifecyleDemo extends StatefulWidget {
    const LifecyleDemo({super.key});
  
    @override
    State<LifecyleDemo> createState() => _LifecycleDemoState();
  }
  
  class _LifecycleDemoState extends State<LifecyleDemo> {
    int counter = 0;

    void showSnackBar(String message) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              duration: const Duration(seconds: 4),
            ),
          );
        }
      });
    }


    @override
    void initState() {
      super.initState();
      print("initstate() called");
      showSnackBar("initstate() called");
    }

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      print("didChangeDependencies() called");
      showSnackBar("didChangeDependencies() called");
    }

    @override
    void didUpdateWidget(covariant LifecyleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget() called");
    showSnackBar("didUpdateWidget() called");
  }

    @override
    Widget build(BuildContext context) {
      print("build() called");
      showSnackBar("build() called");
      return Scaffold(
        appBar: AppBar(
          title: const Text("Lifecyle Demo",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal,
          centerTitle: true,

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("counter: $counter",
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20),
              FloatingActionButton.extended(onPressed: () {
                setState(() {
                  counter++;
                  print("setState() called  build() will run again");
                  showSnackBar("setState() called  build() will run again");
                });
              },
                label: const Text("Increment Counter"),
                )
            ],
          ),
        ),
      );
    }

    @override
    void dispose() {
      super.dispose();
      print("dispose() called");
      showSnackBar("dispose() called");
    }
  }

