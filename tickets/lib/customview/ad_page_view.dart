import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _dotRadius = 7.0;
const _horizontalPadding = 5.0;

final _dotWidget = Padding(
  padding: const EdgeInsets.only(
      left: _horizontalPadding, right: _horizontalPadding),
  child: CircleAvatar(
    backgroundColor: Colors.grey,
    radius: _dotRadius,
  ),
);

final _unDotWidget = Padding(
  padding: const EdgeInsets.only(
      left: _horizontalPadding, right: _horizontalPadding),
  child: CircleAvatar(
    backgroundColor: Colors.white60,
    radius: _dotRadius,
  ),
);

List<Widget> _createDotted(int num, int highlight) {
  return List.generate(num, (index) {
    if (highlight == index)
      return _dotWidget;
    else
      return _unDotWidget;
  });
}

class AdPageView extends StatefulWidget {
  final List<Image> children;

  AdPageView(this.children, {double autoTranslate = 1.0});

  @override
  State createState() => _AdPageViewState(children);
}

class _AdPageViewState extends State<AdPageView> {
  final List<Image> images;
  var currentIndex = 0;
  PageController _controller = PageController();

  _AdPageViewState(this.images) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      currentIndex = (currentIndex + 1) % images.length;
      if (_controller.hasClients) {
        _controller.animateToPage(currentIndex,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView.builder(
            itemCount: images.length,
            controller: _controller,
            itemBuilder: (context, idx) => images[idx],
            onPageChanged: (idx) {
              print('hh $idx');
              setState(() {});
            },
            physics: const NeverScrollableScrollPhysics(),
          ),
          Positioned(
            bottom: 30.0,
            child: Row(children: _createDotted(images.length, currentIndex)),
          ),
        ],
      ),
    );
  }
}
