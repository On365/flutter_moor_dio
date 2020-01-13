import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final String heroTag;
  final String heroImage;
  final String silverText;

  MySliverAppBar(
      {@required this.expandedHeight,
      @required this.minHeight,
      this.silverText,
      this.heroTag,
      this.heroImage});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          "https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          fit: BoxFit.cover,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              silverText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
          Container(
            height: 12,
          )
        ]),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Hero(
              tag: heroTag,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(heroImage),
              ),
            ),
          ),
        ),
        Positioned(left: 10, top : 30,
                  child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
