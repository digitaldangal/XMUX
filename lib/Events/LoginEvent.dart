import 'package:flutter/foundation.dart';

class LoginEvent {
  String id;
  String campusIdPassword;
  String ePaymentPassword;
  Map classes;
  Map exams;
  Map payment;
  List assignment;

  LoginEvent({
    @required this.id,
    @required this.campusIdPassword,
    @required this.ePaymentPassword,
    this.classes,
    this.exams,
    this.payment,
    this.assignment,
  });
}
