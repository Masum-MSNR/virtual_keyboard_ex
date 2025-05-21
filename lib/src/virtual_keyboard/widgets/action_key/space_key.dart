part of '../../../../virtual_keyboard_plus.dart';

class SpaceKey extends StatelessWidget {
  const SpaceKey({
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
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: verticalGap / 2,
                horizontal: horizontalGap / 2,
              ),
              height: height,
              width: width * 1.5,
              decoration: keyDecoration,
              clipBehavior: Clip.antiAlias,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    onKeyPress(keyboardKey);
                  },
                  child: SizedBox(
                    height: height,
                    child: Icon(
                      Icons.space_bar,
                      size: textSize,
                      color: textColor,
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
