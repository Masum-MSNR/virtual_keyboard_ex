part of '../../../../virtual_keyboard_ex.dart';

class ActionKey extends StatelessWidget {
  const ActionKey({
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
  final LayoutStage? layoutStage;
  final Color splashColor;

  @override
  Widget build(BuildContext context) {
    switch (keyboardKey.action) {
      case KeyAction.space:
        return SpaceKey(
          height: height,
          width: width,
          keyboardKey: keyboardKey,
          onKeyPress: onKeyPress,
          capsLock: capsLock,
          shift: shift,
          verticalGap: verticalGap,
          horizontalGap: horizontalGap,
          keyDecoration: keyDecoration,
          textSize: textSize,
          textColor: textColor,
          splashColor: splashColor,
        );
      case KeyAction.backSpace:
        return BackSpaceKey(
          height: height,
          width: width,
          keyboardKey: keyboardKey,
          onKeyPress: onKeyPress,
          capsLock: capsLock,
          shift: shift,
          verticalGap: verticalGap,
          horizontalGap: horizontalGap,
          keyDecoration: keyDecoration,
          textSize: textSize,
          textColor: textColor,
          splashColor: splashColor,
        );
      case KeyAction.myReturn:
        return ReturnKey(
          height: height,
          width: width,
          keyboardKey: keyboardKey,
          onKeyPress: onKeyPress,
          capsLock: capsLock,
          shift: shift,
          verticalGap: verticalGap,
          horizontalGap: horizontalGap,
          keyDecoration: keyDecoration,
          textSize: textSize,
          textColor: textColor,
          splashColor: splashColor,
        );
      case KeyAction.shift:
        return ShiftKey(
          height: height,
          width: width,
          keyboardKey: keyboardKey,
          onKeyPress: onKeyPress,
          capsLock: capsLock,
          shift: shift,
          verticalGap: verticalGap,
          horizontalGap: horizontalGap,
          keyDecoration: keyDecoration,
          textSize: textSize,
          textColor: textColor,
          splashColor: splashColor,
        );
      case KeyAction.numbersAndSymbols:
        return NumbersAndSymbolsKey(
          height: height,
          width: width,
          keyboardKey: keyboardKey,
          onKeyPress: onKeyPress,
          capsLock: capsLock,
          shift: shift,
          verticalGap: verticalGap,
          horizontalGap: horizontalGap,
          keyDecoration: keyDecoration,
          textSize: textSize,
          textColor: textColor,
          layoutStage: layoutStage ?? LayoutStage.one,
          splashColor: splashColor,
        );
      case KeyAction.switchLanguage:
        return SwitchLanguageKey(
          height: height,
          width: width,
          keyboardKey: keyboardKey,
          onKeyPress: onKeyPress,
          capsLock: capsLock,
          shift: shift,
          verticalGap: verticalGap,
          horizontalGap: horizontalGap,
          keyDecoration: keyDecoration,
          textSize: textSize,
          textColor: textColor,
          splashColor: splashColor,
        );
      case KeyAction.symbolsSwitch:
        return SymbolsSwitchKey(
          height: height,
          width: width,
          keyboardKey: keyboardKey,
          onKeyPress: onKeyPress,
          capsLock: capsLock,
          shift: shift,
          verticalGap: verticalGap,
          horizontalGap: horizontalGap,
          keyDecoration: keyDecoration,
          textSize: textSize,
          textColor: textColor,
          layoutStage: layoutStage ?? LayoutStage.two,
          splashColor: splashColor,
        );
      default:
        return Container();
    }
  }
}
