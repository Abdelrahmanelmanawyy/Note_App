import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_application/color_style.dart';
Widget notecard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(

      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      
      
      decoration: BoxDecoration(
        color: AppColor.cardColor[doc['color_id']],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Text(
            doc["note_title"],
            style: AppColor.text,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5,),
          Text(
            doc["creation_data"],
            style: AppColor.text,
          ),
          SizedBox(height: 8,),
          Text(
            doc["note_content"],
            style: AppColor.text,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8,),
        
        ],
      ),
    ),
  );
}