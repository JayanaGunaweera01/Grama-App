import 'package:flutter/material.dart';
import 'package:nutriscan/services/colors.dart';

class BodyWidget extends StatefulWidget {
  final Widget child;
  final dynamic childBottom;
  final String bacgroundImg;
  final bool backBtnRight;
  final bool isBackBtn;
  final bool isDrawerBtn;
  const BodyWidget({
    required this.child,
    Key? key,
    this.bacgroundImg = '',
    this.backBtnRight = false,
    this.isBackBtn = true,
    this.isDrawerBtn = false,
    this.childBottom,
  }) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: widget.bacgroundImg != ''
                  ? DecorationImage(
                      image: AssetImage(widget.bacgroundImg),
                      scale: 1,
                      fit: BoxFit.fill,
                    )
                  : null,
            ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: widget.child,
              ),
            ),
          ),
        ),
        widget.isBackBtn
            ? Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  alignment: widget.backBtnRight
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  // color: Colors.white,
                  height: 50,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18,
                        color: mainColor_4,
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: mainColor_4,
                    ),
                  ),
                ),
              )
            : Container(),
        //
        widget.isDrawerBtn
            ? Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: size.width,
                  alignment: Alignment.centerLeft,
                  // color: Colors.white,
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: mainColor_4,
                      size: 30,
                    ),
                  ),
                ),
              )
            : Container(),
        // bottom child
        widget.childBottom != null
            ? Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: widget.childBottom,
              )
            : Container()
      ],
    );
  }
}
