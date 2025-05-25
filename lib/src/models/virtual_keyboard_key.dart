part of '../../virtual_keyboard_ex.dart';

class VirtualKeyboardKey {
  String? text;
  String? capsText;
  final KeyType keyType;
  final KeyAction? action;

  VirtualKeyboardKey({
    this.text,
    this.capsText,
    required this.keyType,
    this.action,
  }) {
    if (text == null && action != null) {
      text = action == KeyAction.space
          ? ' '
          : (action == KeyAction.myReturn ? '\n' : '');
    }
    if (capsText == null && action != null) {
      capsText = action == KeyAction.space
          ? ' '
          : (action == KeyAction.myReturn ? '\n' : '');
    }
  }

  @override
  String toString() {
    return 'VirtualKeyboardKey{text: $text, capsText: $capsText, keyType: $keyType, action: $action}';
  }
}
