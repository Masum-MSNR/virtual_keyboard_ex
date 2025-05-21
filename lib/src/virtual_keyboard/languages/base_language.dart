part of '../../../virtual_keyboard_plus.dart';

abstract class BaseLanguage {
  Language language;
  BaseLanguage({required this.language});

  List<List> _getNumberKeys();
  List<List> _getPhoneKeys();
  List<List> _getTextKeys({required LayoutStage stage});

  List<List<VirtualKeyboardKey>> getKeys({
    required VirtualKeyboardType keyboardType,
    LayoutStage? stage,
  });
}
