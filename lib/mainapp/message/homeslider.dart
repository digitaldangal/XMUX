import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  })
      : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.5;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selected;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class HomeSlider extends StatefulWidget {
  final BuildContext context;
  HomeSlider(this.context);
  @override
  State createState() => new _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  List<Widget> _pages = <Widget>[
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new CachedNetworkImage(
        imageUrl:
            "http://i0.hdslb.com/bfs/archive/ba95094389efd8a3444dca765403dfe9a9befd9c.jpg",
        fit: BoxFit.fitWidth,
      ),
    ),
  ];

  @override
  void initState() {
    BackendApiHandler
        .get(
      context: widget.context,
      api: "/v2/homepage/homepage.json",
    )
        .then((r) {
      List resList = JSON.decode(r.body)["news"];
      setState(() {
        _pages = resList.map((n) {
          if (n["isWebPage"])
            return new Builder(
                builder: (BuildContext context) => new DecoratedBox(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new CachedNetworkImageProvider(n["imageURL"]),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: new FlatButton(
                          onPressed: () =>
                              launch(n["uri"], forceWebView: false),
                          child: null),
                    ));
          else
            return new Builder(
                builder: (BuildContext context) => new DecoratedBox(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new CachedNetworkImageProvider(n["imageURL"]),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: new FlatButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed(n["uri"]),
                          child: null),
                    ));
        }).toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) =>
                  _pages[index % _pages.length],
              itemCount: _pages.length,
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
