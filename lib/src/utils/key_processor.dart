part of '../../virtual_keyboard_ex.dart';

class KeyProcessor {
  static List<List<VirtualKeyboardKey>> processKey(List<List<String>> keys) {
    List<List<VirtualKeyboardKey>> processedKeys = [];
    for (var i = 0; i < keys.length; i++) {
      List<VirtualKeyboardKey> processedRow = [];
      for (var j = 0; j < keys[i].length; j++) {
        if (keys[i][j] == KeyAction.backSpace.name) {
          processedRow.add(
            VirtualKeyboardKey(
              keyType: KeyType.action,
              action: KeyAction.backSpace,
            ),
          );
        } else if (keys[i][j] == KeyAction.myReturn.name) {
          processedRow.add(
            VirtualKeyboardKey(
              keyType: KeyType.action,
              action: KeyAction.myReturn,
            ),
          );
        } else if (keys[i][j] == KeyAction.shift.name) {
          processedRow.add(
            VirtualKeyboardKey(
              keyType: KeyType.action,
              action: KeyAction.shift,
            ),
          );
        } else if (keys[i][j] == KeyAction.space.name) {
          processedRow.add(
            VirtualKeyboardKey(
              keyType: KeyType.action,
              action: KeyAction.space,
            ),
          );
        } else if (keys[i][j] == KeyAction.switchLanguage.name) {
          processedRow.add(
            VirtualKeyboardKey(
              keyType: KeyType.action,
              action: KeyAction.switchLanguage,
            ),
          );
        } else if (keys[i][j] == KeyAction.numbersAndSymbols.name) {
          processedRow.add(
            VirtualKeyboardKey(
              keyType: KeyType.action,
              action: KeyAction.numbersAndSymbols,
            ),
          );
        } else if (keys[i][j] == KeyAction.symbolsSwitch.name) {
          processedRow.add(
            VirtualKeyboardKey(
              keyType: KeyType.action,
              action: KeyAction.symbolsSwitch,
            ),
          );
        } else {
          processedRow.add(
            VirtualKeyboardKey(
              text: keys[i][j],
              capsText: keys[i][j].toUpperCase(),
              keyType: KeyType.char,
            ),
          );
        }
      }
      processedKeys.add(processedRow);
    }
    return processedKeys;
  }
}
