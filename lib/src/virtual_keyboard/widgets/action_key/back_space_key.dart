part of '../../../../virtual_keyboard_plus.dart';

class BackSpaceKey extends StatefulWidget {
  const BackSpaceKey({
    super.key,
    required this.height,
    required this.width,
    required this.keyboardKey,
    required this.onKeyPress,
    required this.capsLock,
    required this.shift,
    required this.verticalGap,
    required this.horizontalGap,
    required this.keyDecoration,
    required this.textSize,
    required this.textColor,
    required this.splashColor,
  });
  final double height;
  final double width;
  final VirtualKeyboardKey keyboardKey;
  final Function(VirtualKeyboardKey) onKeyPress;
  final bool capsLock;
  final bool shift;
  final double verticalGap;
  final double horizontalGap;
  final BoxDecoration keyDecoration;
  final double textSize;
  final Color textColor;
  final Color splashColor;

  @override
  State<BackSpaceKey> createState() => _BackSpaceKeyState();
}

class _BackSpaceKeyState extends State<BackSpaceKey> {
  bool longPress = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: widget.verticalGap / 2,
              horizontal: widget.horizontalGap / 2,
            ),
            height: widget.height,
            width: widget.width * 1.5,
            decoration: widget.keyDecoration,
            clipBehavior: Clip.antiAlias,
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onLongPressDown: (details) {
                  setState(() {
                    longPress = true;
                  });
                },
                onLongPressUp: () {
                  setState(() {
                    longPress = false;
                  });
                },
                onLongPress: () {
                  Timer.periodic(const Duration(milliseconds: 30), (timer) {
                    if (longPress) {
                      widget.onKeyPress(widget.keyboardKey);
                    } else {
                      // Cancel timer.
                      timer.cancel();
                    }
                  });
                },
                child: InkWell(
                  onTap: () {
                    widget.onKeyPress(widget.keyboardKey);
                  },
                  splashColor: widget.splashColor,
                  child: SizedBox(
                    height: widget.height,
                    width: widget.width * 1.5,
                    child: Icon(
                      Icons.backspace_outlined,
                      size: widget.textSize,
                      color: widget.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
