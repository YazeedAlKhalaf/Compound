import 'package:compound/src/ui/global/app_colors.dart';
import 'package:compound/src/ui/global/ui_helpers.dart';
import 'package:compound/src/ui/widgets/dumb/creation_aware_list_item.dart';
import 'package:compound/src/ui/widgets/dumb/post_item.dart';
import 'package:flutter/material.dart';
import 'package:compound/src/ui/views/home/home_viewmodel.dart';
import 'package:compound/src/ui/widgets/dumb/busy_overlay.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async => await model.initialize(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return BusyOverlay(
          show: model.isBusy,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(
                blockSizeHorizontal(context) * 5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpaceMedium(context),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: blockSizeHorizontal(context) * 8,
                        child: Image.asset(
                          'assets/images/title.png',
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: model.posts != null
                        ? ListView.builder(
                            itemCount: model.posts.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return CreationAwareListItem(
                                itemCreated: () {
                                  if (index % 5 == 0) {
                                    model.requestMoreData();
                                  }
                                },
                                child: GestureDetector(
                                  onTap: () async {
                                    await model.editPost(index);
                                  },
                                  child: PostItem(
                                    post: model.posts[index],
                                    onDeleteItem: () async {
                                      await model.deletePost(index);
                                    },
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                primaryColor,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            // body: Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Text(
            //         'Home View',
            //       ),
            //       RoundedButton(
            //         isBusy: model.isBusy,
            //         text: 'Sign Out',
            //         fontSize: blockSizeHorizontal(context) * 4,
            //         onPressed: () async {
            //           await model.signOut();
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryColor,
              child: Icon(
                Icons.add,
                size: blockSizeHorizontal(context) * 10,
              ),
              onPressed: () async {
                await model.navigateToCreatePostView();
              },
            ),
          ),
        );
      },
    );
  }
}
