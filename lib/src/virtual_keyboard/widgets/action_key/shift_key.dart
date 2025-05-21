part of '../../../../virtual_keyboard_plus.dart';

class ShiftKey extends StatelessWidget {
  const ShiftKey({
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
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
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
                splashColor: splashColor,
                child: SizedBox(
                  height: height,
                  width: width * 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        capsLock
                            ? Assets.keyboardShiftSolid
                            : Assets.keyboardShift,
                        height: textSize,
                        width: textSize,
                        colorFilter: ColorFilter.mode(
                          shift ? Colors.blue : textColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
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
