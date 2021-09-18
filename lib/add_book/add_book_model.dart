import 'package:book_list_sample/domain/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;
  
  Future addBook() async {
    if(title == null || title!.isEmpty){
      throw '本のタイトルが入力されていません';
    }

    if(author == null || author!.isEmpty){
      throw '著者が入力されていません';
    }

    await FirebaseFirestore.instance.collection('books').add(
      {
        'title':title,
        'author':author
      }
    );
  }
}
