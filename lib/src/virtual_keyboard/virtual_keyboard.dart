part of '../../virtual_keyboard_plus.dart';

class VirtualKeyboard extends StatefulWidget {
  const VirtualKeyboard({
    super.key,
    this.height = 400,
    this.width,
    required this.textController,
    required this.defaultLanguage,
    this.keyboardType,
    this.onKeyPress,
    this.spaceLongPressCallback,
    required this.verticalGap,
    required this.horizontalGap,
    this.backgroundColor,
    this.keyDecoration,
    this.textSize = 24,
    this.textColor = VkpColors.defaultKeyForegroundColor,
    this.keepFocusOn,
    this.actionKeyDecoration,
    this.splashColor,
  });

  final Language defaultLanguage;
  final TextEditingController textController;
  final FocusNode? keepFocusOn;
  final double height;
  final double? width;
  final VirtualKeyboardType? keyboardType;
  final Function? onKeyPress;
  final VoidCallback? spaceLongPressCallback;
  final double verticalGap;
  final double horizontalGap;
  final Color? backgroundColor;
  final BoxDecoration? keyDecoration;
  final double textSize;
  final Color textColor;
  final BoxDecoration? actionKeyDecoration;
  final Color? splashColor;

  @override
  State<VirtualKeyboard> createState() => _VirtualKeyboardState();
}

class _VirtualKeyboardState extends State<VirtualKeyboard> {
  late BaseLanguage baseLanguage;
  LayoutStage? layoutStage;
  late TextEditingController textController;
  late bool capsLock;
  late bool shift;
  late double height;
  double? width;
  late VirtualKeyboardType keyboardType;
  Function? onKeyPress;
  VoidCallback? spaceLongPressCallback;
  late Color backgroundColor;
  late BoxDecoration keyDecoration;
  late BoxDecoration actionKeyDecoration;

  @override
  void didUpdateWidget(covariant VirtualKeyboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    textController = widget.textController;
    if (oldWidget.textController != widget.textController) {
      capsLock = false;
      shift = false;
      height = widget.height;
      keyboardType = widget.keyboardType ?? VirtualKeyboardType.text;
      if (widget.keyboardType == VirtualKeyboardType.text) {
        layoutStage = LayoutStage.one;
      }
      onKeyPress = widget.onKeyPress;
      spaceLongPressCallback = widget.spaceLongPressCallback;
      backgroundColor =
          widget.backgroundColor ?? VkpColors.defaultBackgroundColor;
      keyDecoration =
          widget.keyDecoration ??
          BoxDecoration(
            color: VkpColors.defaultKeyBackgroundColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: VkpColors.defaultActionKeyColor.withValues(alpha: .25),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          );
      actionKeyDecoration =
          widget.actionKeyDecoration ??
          BoxDecoration(
            color: VkpColors.defaultActionKeyColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: VkpColors.defaultActionKeyColor.withValues(alpha: .25),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          );
    }
  }

  @override
  void initState() {
    super.initState();
    switch (widget.defaultLanguage) {
      case Language.english:
        baseLanguage = EnglishLanguage();
        break;
    }
    textController = widget.textController;
    capsLock = false;
    shift = false;
    height = widget.height;
    keyboardType = widget.keyboardType ?? VirtualKeyboardType.text;
    if (widget.keyboardType == VirtualKeyboardType.text) {
      layoutStage = LayoutStage.one;
    }
    onKeyPress = widget.onKeyPress;
    spaceLongPressCallback = widget.spaceLongPressCallback;
    backgroundColor =
        widget.backgroundColor ?? VkpColors.defaultBackgroundColor;
    keyDecoration =
        widget.keyDecoration ??
        BoxDecoration(
          color: VkpColors.defaultKeyBackgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: VkpColors.defaultActionKeyColor.withValues(alpha: .25),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(1, 2),
            ),
          ],
        );
    actionKeyDecoration =
        widget.actionKeyDecoration ??
        BoxDecoration(
          color: VkpColors.defaultActionKeyColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: VkpColors.defaultActionKeyColor.withValues(alpha: .25),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(1, 2),
            ),
          ],
        );
  }

  List<List<VirtualKeyboardKey>> _getKeys() {
    switch (widget.defaultLanguage) {
      case Language.english:
        return baseLanguage.getKeys(
          keyboardType: keyboardType,
          stage: layoutStage,
        );
    }
  }

  double _calculateHeight(int rows) {
    var usedHeight = (rows + 1) * widget.verticalGap;

    return (height - usedHeight) / rows;
  }

  double _calculateWidth(int maxLength) {
    var usedWidth = (maxLength + 1) * widget.horizontalGap;

    return ((width ?? 0) - usedWidth) / maxLength;
  }

  List<Widget> _keyboard({
    required List<List<VirtualKeyboardKey>> keys,
    required double keyHeight,
    required double baseKeyWidth,
  }) {
    return List.generate(keys.length, (int rowNum) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(keys[rowNum].length, (int colNum) {
          if (keys[rowNum][colNum].keyType == KeyType.action) {
            return ActionKey(
              height: keyHeight,
              width: baseKeyWidth,
              keyboardKey: keys[rowNum][colNum],
              onKeyPress: _onKeyPress,
              capsLock: capsLock,
              shift: shift,
              verticalGap: widget.verticalGap,
              horizontalGap: widget.horizontalGap,
              keyDecoration: actionKeyDecoration,
              textSize: widget.textSize,
              textColor: widget.textColor,
              layoutStage: layoutStage,
              splashColor: widget.splashColor ?? VkpColors.defaultSplashColor,
            );
          } else {
            return CharKey(
              height: keyHeight,
              width: baseKeyWidth,
              keyboardKey: keys[rowNum][colNum],
              onKeyPress: _onKeyPress,
              capsLock: capsLock,
              shift: shift,
              verticalGap: widget.verticalGap,
              horizontalGap: widget.horizontalGap,
              keyDecoration: keyDecoration,
              textSize: widget.textSize,
              textColor: widget.textColor,
              splashColor: widget.splashColor ?? VkpColors.defaultSplashColor,
            );
          }
        }),
      );
    });
  }

  void _onKeyPress(VirtualKeyboardKey key) {
    FocusScope.of(context).requestFocus(widget.keepFocusOn);

    final currentOffset =
        textController.selection.baseOffset == -1
            ? textController.text.length
            : textController.selection.baseOffset;
    String newText = "";
    final TextSelection newSelection;
    if (key.keyType == KeyType.char) {
      final String newCharacters;
      if (capsLock) {
        newCharacters = key.capsText ?? "";
      } else if (shift) {
        newCharacters = key.capsText ?? '';
        setState(() {
          if (shift && !capsLock) {
            shift = false;
          }
        });
      } else {
        newCharacters = key.text ?? '';
      }

      newText = textController.text.substring(0, currentOffset);
      newText += newCharacters;
      newText += textController.text.substring(currentOffset);

      newSelection = TextSelection.collapsed(
        offset: currentOffset + newCharacters.length,
      );

      textController.value = TextEditingValue(
        text: newText,
        selection: newSelection,
      );
    } else if (key.keyType == KeyType.action) {
      switch (key.action) {
        case KeyAction.backSpace:
          if (textController.selection
              .textInside(textController.text)
              .isNotEmpty) {
            int startIndex = textController.selection.start;
            int lastIndex = textController.selection.end;
            newText = textController.text.replaceRange(
              startIndex,
              lastIndex,
              "",
            );

            newSelection = TextSelection.collapsed(offset: currentOffset);
            textController.value = TextEditingValue(
              text: newText,
              selection: newSelection,
            );
          } else {
            if (textController.text.isEmpty || currentOffset < 1) {
              return;
            }
            newText = textController.text.substring(0, currentOffset - 1);
            newText += textController.text.substring(currentOffset);
            newSelection = TextSelection.collapsed(offset: currentOffset - 1);
            textController.value = TextEditingValue(
              text: newText,
              selection: newSelection,
            );
          }
          break;
        case KeyAction.myReturn:
          newText = newText += textController.text.substring(0, currentOffset);
          newText += (key.text ?? '\n');
          newText += textController.text.substring(currentOffset);
          newSelection = TextSelection.collapsed(
            offset: currentOffset + (key.text?.length ?? 1),
          );
          textController.value = TextEditingValue(
            text: newText,
            selection: newSelection,
          );
          break;
        case KeyAction.space:
          newText = textController.text.substring(0, currentOffset);
          newText += (key.text ?? '');
          newText += textController.text.substring(currentOffset);
          newSelection = TextSelection.collapsed(
            offset: currentOffset + (key.text?.length ?? 1),
          );
          textController.value = TextEditingValue(
            text: newText,
            selection: newSelection,
          );
          if (newText.substring(newText.length - 2, newText.length) == ". ") {
            if (!shift) {
              setState(() {
                shift = true;
              });
            }
          }
          break;
        case KeyAction.shift:
          setState(() {
            if (!shift) {
              shift = true;
            } else if (shift && !capsLock) {
              capsLock = true;
            } else if (shift && capsLock) {
              shift = false;
              capsLock = false;
            } else {
              shift = false;
            }
          });
          break;
        case KeyAction.numbersAndSymbols:
          setState(() {
            if (layoutStage == LayoutStage.one) {
              layoutStage = LayoutStage.two;
            } else {
              layoutStage = LayoutStage.one;
            }
          });
          break;
        case KeyAction.symbolsSwitch:
          setState(() {
            if (layoutStage == LayoutStage.two) {
              layoutStage = LayoutStage.three;
            } else {
              layoutStage = LayoutStage.two;
            }
          });
        default:
      }
    }
    onKeyPress?.call(key);
  }

  @override
  Widget build(BuildContext context) {
    width = widget.width ?? MediaQuery.of(context).size.width;
    List<List<VirtualKeyboardKey>> keys = _getKeys();
    var rows = keys.length;
    var maxColumns = keys.map((e) => e.length).reduce(max);
    var keyHeight = _calculateHeight(rows);
    var baseKeyWidth = _calculateWidth(maxColumns);
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(widget.keepFocusOn);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: widget.verticalGap / 2,
          horizontal: widget.horizontalGap / 2,
        ),
        color: backgroundColor,
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _keyboard(
            keys: keys,
            keyHeight: keyHeight,
            baseKeyWidth: baseKeyWidth,
          ),
        ),
      ),
    );
  }
}
