import 'dart:io';
import 'push_subscription.dart';

class WebPushException implements Exception {
  final String message;
  HttpStatus statusCode;
  HttpResponse response;
  PushSubscription pushSubscription;

  WebPushException(
      this.message, this.statusCode, this.response, this.pushSubscription);
}
