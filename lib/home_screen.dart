import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_application/Widget/note_card.dart';
import 'screens/note_editor.dart';
import 'screens/note_reader.dart';

// ignore: camel_case_types
class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        shadowColor: Colors.white,
        centerTitle: true,
        title: Text(
          'My Notes',
          style: GoogleFonts.poppins(fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      children: snapshot.data!.docs.map((note)=>notecard((){
                       Navigator.push(context, MaterialPageRoute(
                        builder:(context)=>NoteReader(note),
                         ));
                      }, note)).toList(), );
                  }
                  return (const Text('There is no notes',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                  fontWeight: FontWeight.bold),));
                  
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: ((context) =>NoteEditor() )));
        },
         label: Text('add note'),
         icon: Icon(Icons.add),
         backgroundColor: Colors.pink,
         ),   
    );
  }
}
