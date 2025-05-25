part of '../../../virtual_keyboard_ex.dart';

class EnglishLanguage extends BaseLanguage {
  EnglishLanguage({super.language = Language.english});

  List<List<String>> numberKeys = [];
  List<List<String>> phoneKeys = [];
  List<List<String>> textKeysLayoutOne = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
    [
      KeyAction.shift.name,
      'z',
      'x',
      'c',
      'v',
      'b',
      'n',
      'm',
      KeyAction.backSpace.name,
    ],
    [
      KeyAction.numbersAndSymbols.name,
      ',',
      KeyAction.space.name,
      '.',
      KeyAction.myReturn.name,
    ],
  ];
  List<List<String>> textKeysLayoutTwo = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    ['+', '×', '÷', '=', '/', '_', '<', '>', '[', ']'],
    ['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')'],
    [
      KeyAction.symbolsSwitch.name,
      '-',
      "'",
      '"',
      ':',
      ';',
      ',',
      '?',
      KeyAction.backSpace.name,
    ],
    [
      KeyAction.numbersAndSymbols.name,
      ',',
      KeyAction.space.name,
      '.',
      KeyAction.myReturn.name,
    ],
  ];

  List<List<String>> textKeysLayoutThree = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    ['`', '~', '\\', '|', '{', '}', '€', '£', '¥', '₩'],
    ['°', '•', '○', '●', '□', '■', '♤', '♡', '◇', '♧'],
    [
      KeyAction.symbolsSwitch.name,
      '☆',
      '▪️',
      '¤',
      '《',
      '》',
      '¡',
      '¿',
      KeyAction.backSpace.name,
    ],
    [
      KeyAction.numbersAndSymbols.name,
      ',',
      KeyAction.space.name,
      '.',
      KeyAction.myReturn.name,
    ],
  ];

  @override
  List<List<String>> _getNumberKeys() {
    return numberKeys;
  }

  @override
  List<List<String>> _getPhoneKeys() {
    return phoneKeys;
  }

  @override
  List<List<String>> _getTextKeys({required LayoutStage stage}) {
    switch (stage) {
      case LayoutStage.one:
        return textKeysLayoutOne;
      case LayoutStage.two:
        return textKeysLayoutTwo;
      case LayoutStage.three:
        return textKeysLayoutThree;
    }
  }

  @override
  List<List<VirtualKeyboardKey>> getKeys({
    required VirtualKeyboardType keyboardType,
    LayoutStage? stage,
  }) {
    var keys = <List<String>>[];
    if (keyboardType == VirtualKeyboardType.number) {
      keys = numberKeys;
    }
    if (keyboardType == VirtualKeyboardType.phone) {
      keys = phoneKeys;
    }
    keys = _getTextKeys(stage: stage ?? LayoutStage.one);
    return KeyProcessor.processKey(keys);
  }
}
