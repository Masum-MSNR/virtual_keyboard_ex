part of '../../../virtual_keyboard_plus.dart';

class CharKey extends StatelessWidget {
  const CharKey({
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalGap / 2,
        horizontal: horizontalGap / 2,
      ),
      height: height,
      width: width,
      decoration: keyDecoration,
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: VkpColors.defaultSplashColor,
          onTap: () {
            onKeyPress(keyboardKey);
          },
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: Text(
              capsLock
                  ? keyboardKey.capsText ?? ''
                  : (shift ? keyboardKey.capsText : keyboardKey.text) ?? '',
              style: TextStyle(fontSize: textSize, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
