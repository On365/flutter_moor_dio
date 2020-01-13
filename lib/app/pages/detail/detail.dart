import "package:flutter/material.dart";
import 'package:using_moor/app/customwidgets/myappsilverbar.dart';
import 'package:using_moor/app/database/database.dart';

class DetailPage extends StatelessWidget {
  final User _user;

  DetailPage(this._user);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBar(
              expandedHeight: 200,
              minHeight: 80,
              silverText: _user.name,
              heroTag: 'avatar${_user.email}',
              heroImage: _user.detailPicture,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => ListTile(
                title: Text("Index: $index"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
