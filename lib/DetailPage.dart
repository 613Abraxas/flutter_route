import 'package:flutter/material.dart';
// class SecondPage extends StatelessWidget{
//   const SecondPage({
//     super.key
//   });
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar:AppBar(
//         title:const Text('Sceond Page'),
//       ),
//       body:const Center (
//         child:Text('这是第二个页面'), 
//       ),
//     );
//   }
// }
class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page for Box ${index + 1}'),
      ),
      body: Center(
        child: Text(
          'detail page for Box ${index + 1}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}