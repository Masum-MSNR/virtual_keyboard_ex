part of '../../../../virtual_keyboard_plus.dart';

class NumbersAndSymbolsKey extends StatelessWidget {
  const NumbersAndSymbolsKey({
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
    required this.layoutStage,
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
  final LayoutStage layoutStage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalGap / 2,
        horizontal: horizontalGap / 2,
      ),
      height: height,
      width: width * 1.5,
      decoration: keyDecoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onKeyPress(keyboardKey);
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              layoutStage != LayoutStage.one ? 'ABC' : '!#1',
              style: TextStyle(fontSize: textSize, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
