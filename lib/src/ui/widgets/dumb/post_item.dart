import 'package:compound/src/app/models/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final Function onDeleteItem;

  PostItem({
    this.post,
    this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(post.title),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: onDeleteItem ?? () {},
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.grey[200],
            spreadRadius: 3,
          )
        ],
      ),
    );
  }
}
