import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lastTimeNoteStory = prefs.containsKey('ff_lastTimeNoteStory')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastTimeNoteStory')!)
          : _lastTimeNoteStory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _currentPage = 1;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
  }

  int _rating = 0;
  int get rating => _rating;
  set rating(int value) {
    _rating = value;
  }

  DateTime? _lastTimeNoteStory;
  DateTime? get lastTimeNoteStory => _lastTimeNoteStory;
  set lastTimeNoteStory(DateTime? value) {
    _lastTimeNoteStory = value;
    value != null
        ? prefs.setInt('ff_lastTimeNoteStory', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastTimeNoteStory');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
