import 'dart:math';

import 'package:flutter/material.dart';

class TransitionPage extends StatefulWidget {
  final Widget child;

  TransitionPage({Key key, this.child}) : super(key: key);

  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(overflow: Overflow.visible, children: [
      Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("back.jpg"), fit: BoxFit.cover))),
      Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 450,
              width: 300,
              child: TransitionWidget(
                backGroundColor: Colors.white,
                child: Container(
                    height: 400,
                    width: 300,
                    child: Stack(//this the main map just a picture
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.asset("maph.png"),
                        Container(
                            width: 65,
                            height: 70,
                            child: Image.asset("flag.png"))
                      ],
                    )),
                height: 400,
                width: 300,
              ),
            ),
          ]),
        ),
      ),
    ]));
  }
}

class TransitionWidget extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final Color backGroundColor;

  TransitionWidget(
      {Key key, this.child, this.width, this.height, this.backGroundColor})
      : super(key: key);

  _TransitionWidgetState createState() => _TransitionWidgetState();
}

class _TransitionWidgetState extends State<TransitionWidget>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  AnimationController Step1Controller;
  AnimationController Step2Controller;
  AnimationController Step3Controller;
  AnimationController Step4Controller;
  Animation animation;
  Animation animation2;
  Animation animation3;
  Animation animation4;
  Animation animation5;
  Animation animation6;
  Animation animation7;
  Animation animation8;
  Widget mystack;
  @override
  void initState() {
    super.initState();
    Step4Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() => setState(() {}))
          ..addStatusListener((listener) {
            if (listener == AnimationStatus.completed) {
              
            }
            if (listener == AnimationStatus.dismissed) {
              Step3Controller.reverse();
            }
          });
    Step3Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() => setState(() {}))
          ..addStatusListener((listener) {
            if (listener == AnimationStatus.completed) {
              Step4Controller.forward();
            }
            if (listener == AnimationStatus.dismissed) {
              Step2Controller.reverse();
            }
          });
    Step2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() => setState(() {}))
          ..addStatusListener((listener) {
            if (listener == AnimationStatus.completed) {
              Step3Controller.forward();
            }
            if (listener == AnimationStatus.dismissed) {
              Step1Controller.reverse();
            }
          });
    Step1Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() => setState(() {}))
          ..addStatusListener((listener) {
            if (listener == AnimationStatus.completed) {
              Step2Controller.forward();
            }
            if (listener == AnimationStatus.dismissed) {
              controller2.reverse();
            }
          });
    controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() => setState(() {}))
          ..addStatusListener((listener) {
            if (listener == AnimationStatus.completed) {
              Step1Controller.forward();
            }
            if (listener == AnimationStatus.dismissed) {
              controller.reverse();
            }
          });
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() => setState(() {}))
          ..addStatusListener((a) {
            if (a == AnimationStatus.completed) {
              controller2.forward();
            }
          });
    animation = Tween(begin: 0.0, end: pi / 2).animate(controller);
    animation2 = Tween(begin: pi / 2, end: 0.0).animate(controller2);
    animation3 = Tween(begin: pi / 2, end: pi).animate(controller2);
    animation4 = Tween(begin: 0.0, end: pi / 2).animate(controller);
    animation5 = Tween(begin: 0.0, end: pi / 2).animate(Step1Controller);
    animation6 = Tween(begin: pi / 2, end: 0.0).animate(Step2Controller);
    animation7 = Tween(begin: 0.0, end: pi / 2).animate(Step3Controller);
    animation8 = Tween(begin: pi / 2, end: 0.0).animate(Step4Controller);
   
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    Step1Controller.dispose();
    Step2Controller.dispose();
    Step3Controller.dispose();
    Step4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mystack = myStack(widget.backGroundColor);
    return GestureDetector(
      onTap: () {
        if (controller.status == AnimationStatus.dismissed) {
          controller.forward();
        } else {
          Step4Controller.reverse();
        }
      },
      child: Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateY(-animation.value),
                  alignment: FractionalOffset.centerRight,
                  child: ClipRect(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.2,
                    child: widget.child,
                  ))),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(overflow: Overflow.visible, children: [
                    ClipRect(
                        child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: 0.333,
                            child: mystack)),
                    Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.002)
                          ..rotateX(animation8.value),
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          width: widget.width * 0.6,
                          height: widget.height * 0.333,
                          child: Container(
                              child: Stack(//this is the map widget whish is just a two photo in stack
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Image.asset("map2.gif", fit: BoxFit.scaleDown),
                              Text("my Location",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "f",
                                      color: Colors.lightBlue))
                            ],
                          )),
                        ))
                  ]),
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(-animation7.value),
                    alignment: FractionalOffset.topCenter,
                    child: Stack(children: [
                      ClipRect(
                          child: Align(
                              alignment: Alignment.center,
                              heightFactor: 0.333,
                              child: mystack)),
                      Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.002)
                          ..rotateX(animation6.value),
                        alignment: FractionalOffset.bottomCenter,
                        child: ClipRect(
                            child: Container(
                          width: widget.width * 0.6,
                          height: widget.height * 0.333,
                          color: widget.backGroundColor,
                        )),
                      )
                    ]),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(-animation5.value),
                    alignment: FractionalOffset.topCenter,
                    child: ClipRect(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            heightFactor: 0.333,
                            child: mystack)),
                  ),
                ],
              ),
              Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateY(animation4.value),
                  alignment: FractionalOffset.centerLeft,
                  child: ClipRect(
                      child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 0.2,
                    child: widget.child,
                  )))
            ],
          ),
        ),
      ),
    );
  }

  Widget myStack(Color backColor) {
    return Stack(
      overflow: Overflow.visible,
      fit: StackFit.loose,
      children: <Widget>[
        ClipRect(
            child: Align(
          widthFactor: 0.6,
          alignment: Alignment.center,
          child: widget.child,
        )),
        Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(animation2.value ?? pi / 2),
            alignment: FractionalOffset.centerLeft,
            child: ClipRect(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: widget.width * 0.2,
                      height: widget.height,
                      color: backColor,
                    )))),
        Positioned(
          left: widget.width * 0.6,
          child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateY(animation3.value),
              alignment: FractionalOffset.centerLeft,
              child: ClipRect(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: widget.width * 0.2,
                        height: widget.height,
                        color: backColor,
                      )))),
        ),
      ],
    );
  }
}
