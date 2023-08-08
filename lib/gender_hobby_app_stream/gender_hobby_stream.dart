import 'dart:async';

import 'package:flutter/material.dart';

class StreamGenderHobbyBloc {
  static String gender = 'gender', male = 'male', feMale = 'feMale';
  static bool isCricket = false, isFootball = false, isSinging = false;
  static bool submited = false;
  static List<String> selectHobbyList = [];
  static List<Map<String, dynamic>> userData = [];
  static TextEditingController txtNameEditingController =
      TextEditingController();
  static TextEditingController txtLastNameEditingController =
      TextEditingController();

  static final StreamController<String> _streamController =
      StreamController<String>();
  static Stream<String> get genderStreamController => _streamController.stream;
  static Sink<String> get genderSinkController => _streamController.sink;
  static set genderControllerValue(String data) =>
      genderSinkController.add(data);

  static final StreamController<bool> _streamCricketController =
      StreamController<bool>();
  static Stream<bool> get hobbyCricketStreamController =>
      _streamCricketController.stream;
  static Sink<bool> get hobbyCricketSinkController =>
      _streamCricketController.sink;
  static set hobbyCricketControllerValue(bool data) =>
      hobbyCricketSinkController.add(data);

  static final StreamController<bool> _streamFootballController =
      StreamController<bool>();
  static Stream<bool> get hobbyFootballStreamController =>
      _streamFootballController.stream;
  static Sink<bool> get hobbyFootballSinkController =>
      _streamFootballController.sink;
  static set hobbyFootballControllerValue(bool data) =>
      hobbyFootballSinkController.add(data);

  static final StreamController<bool> _streamSingingController =
      StreamController<bool>();
  static Stream<bool> get hobbySingingStreamController =>
      _streamSingingController.stream;
  static Sink<bool> get hobbySingingSinkController =>
      _streamSingingController.sink;
  static set hobbySingingControllerValue(bool data) =>
      hobbySingingSinkController.add(data);

  static final StreamController<bool> _streamSubmitController =
      StreamController<bool>();
  static Stream<bool> get submitStreamController =>
      _streamSubmitController.stream;
  static Sink<bool> get submitSinkController => _streamSubmitController.sink;
  static set submitControllerValue(bool data) => submitSinkController.add(data);

  static final StreamController<List<String>> _streamSelectHobbyController =
      StreamController<List<String>>();
  static Stream<List<String>> get selectHobbyStreamController =>
      _streamSelectHobbyController.stream;
  static Sink<List<String>> get selectHobbySinkController =>
      _streamSelectHobbyController.sink;
  static set selectHobbyControllerValue(List<String> data) =>
      selectHobbySinkController.add(data);

  static final StreamController<String> _streamNameController =
      StreamController<String>();
  static Stream<String> get nameStreamController =>
      _streamNameController.stream;
  static Sink<String> get nameSinkController => _streamNameController.sink;
  static set nameControllerValue(String data) => nameSinkController.add(data);
  static Stream<String> get lastNameStreamController =>
      _streamNameController.stream;
  static Sink<String> get lastNameSinkController => _streamNameController.sink;
  static set lastNameControllerValue(String data) =>
      nameSinkController.add(data);

  static Stream<void> addUserData() async* {
    selectHobbyList.clear();
    if (isCricket == true) {
      selectHobbyList.add('Cricket');
    }
    if (isFootball == true) {
      selectHobbyList.add('Football');
    }
    if (isSinging == true) {
      selectHobbyList.add('Singing');
    }
    userData.add({
      'name': txtNameEditingController.text,
      'lastName': txtLastNameEditingController.text,
      'gender': gender,
      'hobby': List.from(selectHobbyList.map((e) => e)),
    });
  }
}
