import 'dart:async';

import 'package:flutter/material.dart';

class StreamGenderHobbyBloc {
  static String gender = 'gender', male = 'male', feMale = 'feMale';
  static bool isCricket = false, isFootball = false, isSinging = false;
  static double selectedAge = 0;
  static bool submited = false;
  static List<String> selectHobbyList = [];
  static List<Map<String, dynamic>> userData = [];
  static TextEditingController txtNameEditingController =
      TextEditingController();
  static TextEditingController txtMiddleNameEditingController =
      TextEditingController();
  static TextEditingController txtLastNameEditingController =
      TextEditingController();

  static final StreamController<String> _streamController =
      StreamController<String>.broadcast();
  static Stream<String> get genderStreamController => _streamController.stream;
  static Sink<String> get genderSinkController => _streamController.sink;
  static set genderControllerValue(String data) =>
      genderSinkController.add(data);

  static final StreamController<bool> _streamCricketController =
      StreamController<bool>.broadcast();
  static Stream<bool> get hobbyCricketStreamController =>
      _streamCricketController.stream;
  static Sink<bool> get hobbyCricketSinkController =>
      _streamCricketController.sink;
  static set hobbyCricketControllerValue(bool data) =>
      hobbyCricketSinkController.add(data);

  static final StreamController<bool> _streamFootballController =
      StreamController<bool>.broadcast();
  static Stream<bool> get hobbyFootballStreamController =>
      _streamFootballController.stream;
  static Sink<bool> get hobbyFootballSinkController =>
      _streamFootballController.sink;
  static set hobbyFootballControllerValue(bool data) =>
      hobbyFootballSinkController.add(data);

  static final StreamController<bool> _streamSingingController =
      StreamController<bool>.broadcast();
  static Stream<bool> get hobbySingingStreamController =>
      _streamSingingController.stream;
  static Sink<bool> get hobbySingingSinkController =>
      _streamSingingController.sink;
  static set hobbySingingControllerValue(bool data) =>
      hobbySingingSinkController.add(data);

  static final StreamController<double> _streamSelectAgeController =
      StreamController<double>.broadcast();
  static Stream<double> get ageStreamController =>
      _streamSelectAgeController.stream;
  static Sink<double> get ageSinkController => _streamSelectAgeController.sink;
  static set ageControllerValue(double data) => ageSinkController.add(data);

  static final StreamController<List<String>> _streamSelectHobbyController =
      StreamController<List<String>>();
  static Stream<List<String>> get selectHobbyStreamController =>
      _streamSelectHobbyController.stream;
  static Sink<List<String>> get selectHobbySinkController =>
      _streamSelectHobbyController.sink;
  static set selectHobbyControllerValue(List<String> data) =>
      selectHobbySinkController.add(data);

  static final StreamController<String> _streamNameController =
      StreamController<String>.broadcast();
  static Stream<String> get nameStreamController =>
      _streamNameController.stream;
  static Sink<String> get nameSinkController => _streamNameController.sink;
  static set nameControllerValue(String data) => nameSinkController.add(data);

  static final StreamController<String> _streamMiddleNameController =
      StreamController<String>.broadcast();
  static Stream<String> get middleNameStreamController =>
      _streamMiddleNameController.stream;
  static Sink<String> get middleNameSinkController =>
      _streamMiddleNameController.sink;
  static set middleNameControllerValue(String data) =>
      middleNameSinkController.add(data);

  static final StreamController<String> _streamLastNameController =
      StreamController<String>.broadcast();
  static Stream<String> get lastNameStreamController =>
      _streamLastNameController.stream;
  static Sink<String> get lastNameSinkController =>
      _streamLastNameController.sink;
  static set lastNameControllerValue(String data) =>
      lastNameSinkController.add(data);

  static final StreamController<bool> _streamSubmitController =
      StreamController<bool>.broadcast();
  static Stream<bool> get submitStreamController =>
      _streamSubmitController.stream;
  static Sink<bool> get submitSinkController => _streamSubmitController.sink;
  static set submitControllerValue(bool data) => submitSinkController.add(data);

  static final StreamController<List<Map<String, dynamic>>>
      _streamUseDataController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  static Stream<List<Map<String, dynamic>>> get userDataStreamController =>
      _streamUseDataController.stream;
  static Sink<List<Map<String, dynamic>>> get userDataSinkController =>
      _streamUseDataController.sink;
  static set userDataControllerValue(List<Map<String, dynamic>> data) =>
      userDataSinkController.add(data);

  static addUserData() {
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
      'middleName': txtMiddleNameEditingController.text,
      'lastName': txtLastNameEditingController.text,
      'gender': gender,
      'hobby': List.from(selectHobbyList.map((e) => e)),
    });
  }

  static void clearData() {
    txtNameEditingController.clear();
    txtLastNameEditingController.clear();
    gender = 'gender';
    selectHobbyList.clear();
    isCricket = false;
    isFootball = false;
    isSinging = false;
  }
}
