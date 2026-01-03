import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:web_app/core/const/app_export.dart';

void handleAllExceptions(dynamic e) {
  if (e is SocketException) {
    log("SocketException: No Internet connection");
    EasyLoading.showError("No Internet connection. Please check your network.");
  } else if (e is TimeoutException) {
    log("TimeoutException: Request timed out");
    EasyLoading.showError(
      "Server is taking too long to respond. Please try again later.",
    );
  } else if (e is FormatException) {
    log("FormatException: ${e.message}");
    EasyLoading.showError("Server response format is invalid.");
  } else if (e is OSError) {
    log("OSError: ${e.message}");
    EasyLoading.showError("Operating system error occurred.");
  } else if (e is Exception) {
    log("Generic Exception: ${e.toString()}");
    EasyLoading.showError("An error occurred. Please try again.");
  } else {
    log("Unknown Error: $e");
    EasyLoading.showError("An unexpected error occurred.");
  }
}
