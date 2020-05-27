import 'package:cached_network_image/cached_network_image.dart';
import 'package:compound/src/app/models/post.dart';
import 'package:compound/src/ui/global/ui_helpers.dart';
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
      height: post.imageUrl != null ? null : blockSizeHorizontal(context) * 10,
      margin: EdgeInsets.only(top: blockSizeHorizontal(context) * 5),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: blockSizeHorizontal(context) * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  post.imageUrl != null
                      ? SizedBox(
                          height: blockSizeHorizontal(context) * 60,
                          child: CachedNetworkImage(
                            imageUrl: post.imageUrl,
                            placeholder: (BuildContext context, String url) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (
                              BuildContext context,
                              String url,
                              dynamic error,
                            ) {
                              return Icon(
                                Icons.error,
                              );
                            },
                          ),
                        )
                      : Container(),
                  Text(post.title),
                ],
              ),
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
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.grey[200],
            spreadRadius: 5,
          )
        ],
      ),
    );
  }
}
