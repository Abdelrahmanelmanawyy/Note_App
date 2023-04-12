import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_application/color_style.dart';

class NoteReader extends StatefulWidget {
  NoteReader(this.doc, {Key? key}) : super(key:key);

  QueryDocumentSnapshot doc;
  @override
  State<NoteReader> createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReader> {
  
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppColor.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppColor.cardColor[color_id],
        elevation: 0.0,
      ) ,
      body: Container(
      
      decoration: BoxDecoration(
        color: AppColor.cardColor[widget.doc['color_id']],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Text(
              widget.doc["note_title"],
              style: AppColor.text,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2,),
            Text(
              widget.doc["creation_data"],
              style: AppColor.text,
            ),
            const SizedBox(height: 30,),
            Text(
              widget.doc["note_content"],
              style: AppColor.text,
            ),
           
          ],
        ),
      ),
    ));
  }
}
