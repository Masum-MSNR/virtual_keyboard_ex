part of '../../../virtual_keyboard_ex.dart';

abstract class BaseLanguage {
  Language language;
  BaseLanguage({required this.language});

  List<List<VirtualKeyboardKey>> getKeys({
    required VirtualKeyboardType keyboardType,
    LayoutStage? stage,
  });
}
