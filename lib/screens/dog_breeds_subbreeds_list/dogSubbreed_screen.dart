
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DogsubbreedScreen extends StatefulWidget {
  final String title;


   const DogsubbreedScreen({super.key, required this.title});

   @override
   State<DogsubbreedScreen> createState() => _DogsubbreedScreenState();
 }

 class _DogsubbreedScreenState extends State<DogsubbreedScreen> {

   @override
   Widget build(BuildContext context) {

     List receivedList =  GoRouterState.of(context).extra as List<dynamic>;


     return Scaffold(
       appBar: AppBar(
         title: Text(widget.title,
           style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
         centerTitle: true,
         backgroundColor: Colors.blue,
       ),

       body:  receivedList.isEmpty?
         Center(child: Text("No Subbreed for ${widget.title}"))
       :ListView.builder(
     itemCount: receivedList.length,
         itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Card(child: Center(child: Text(receivedList[index]))),
           );
         }),
     );
   }
 }
