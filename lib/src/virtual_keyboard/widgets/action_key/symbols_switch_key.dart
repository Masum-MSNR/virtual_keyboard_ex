part of '../../../../virtual_keyboard_ex.dart';

class SymbolsSwitchKey extends StatelessWidget {
  const SymbolsSwitchKey({
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
  final LayoutStage layoutStage;
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
                      Text(
                        layoutStage == LayoutStage.three ? '2/2' : '1/2',
                        style: TextStyle(fontSize: textSize, color: textColor),
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
