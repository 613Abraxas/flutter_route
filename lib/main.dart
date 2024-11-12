import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'DetailPage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
  
}
// class MyApp extends StatelessWidget {
//   final _appRouter = AppRouter();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: _appRouter.delegate(),
//       routeInformationParser: _appRouter.defaultRouteParser(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int boxCount=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder:(context,constraints){
          const boxWidth=108;
          final boxesPerRow=(constraints.maxWidth/boxWidth).floor();
          return Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int row = 0; row < (boxCount / boxesPerRow).ceil(); row++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int col = 0; col < boxesPerRow; col++)
                      if (row * boxesPerRow + col < boxCount) ...[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  DetailPage(index: row * boxesPerRow + col),
                              ),
                            );
                          },
                        child: Container(
                          margin: const EdgeInsets.all(4), 
                          width: 100,
                          height: 100,
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              'Box ${row * boxesPerRow + col + 1}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]
                ],
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (boxCount > 0) boxCount--;
                      });
                    },
                    child: const Text('减号按钮'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        boxCount++;
                      });
                    },
                  child: const Text('加号按钮'),
                  ),
                ],
                ),
              ],
            ),
          );
        }
      )
      
    );
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //           // Wrap(
  //           //   spacing: 10, 
  //           //   runSpacing: 10, 
  //           //   children: List.generate(boxCount, (index) {
  //           //     return Container(
  //           //       width: 100,
  //           //       height: 100,
  //           //       color: Colors.green,
  //           //       child: Center(
  //           //         child: Text(
  //           //           'Box ${index + 1}',
  //           //           style: const TextStyle(fontSize: 16, color: Colors.white),
  //           //         ),
  //           //       ),
  //           //     );
  //           //   }),
  //           // ),
  //           // GestureDetector(
  //             // onTap:(){
  //             //   Navigator.push(
  //             //     context,
  //             //     MaterialPageRoute(
  //             //       builder:((context)=>const SecondPage()),
  //             //     ),
  //             //   );
  //             // },
  //         //     child:Container(
  //         //       width:200,
  //         //       height:200,
  //         //       color:Colors.green,
  //         //       child:Center(
  //         //         child:Text(
  //         //           '$boxCount boxes',
  //         //           style:const TextStyle(fontSize:20)
  //         //       ),
  //         //     ),
  //         //   ),
  //         // ),
  //           // 绿色方框
  //           // Controller(
  //           //   width:200,
  //           //   height:200.
  //           //   color:Colors.green,
  //           //   child:Center(
  //           //     child:Text(
  //           //       'boxCount boxes',
  //           //       style:const TextStyle(fontsize:20)
  //           //     ),
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
  }
}


