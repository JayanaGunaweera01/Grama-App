import 'package:flutter/material.dart';
import 'package:nutriscan/services/colors.dart';

class ScanButtonWidget extends StatefulWidget {
  final String btnName;
  final Function() onPressed;
  final String logoImage;
  const ScanButtonWidget(
      {Key? key,
      required this.btnName,
      required this.onPressed,
      required this.logoImage})
      : super(key: key);

  @override
  State<ScanButtonWidget> createState() => _ScanButtonWidgetState();
}

class _ScanButtonWidgetState extends State<ScanButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: mainColor_3,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(widget.logoImage),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: TextButton(
              onPressed: widget.onPressed,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: const Size(200, 50),
                // primary: Color(0xffb74093),
                backgroundColor: mainColor_1.withOpacity(0.5),
              ),
              child: Text(
                widget.btnName,
                style: TextStyle(
                  fontSize: 17,
                  color: mainColor_3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
