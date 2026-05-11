import 'package:master_utility/master_utility.dart';

class MixPanelEventModel {
  String? eventName;
  Map<String, dynamic>? successData;
  Map<String, dynamic>? errorData;

  Map<String, dynamic>? Function([Response<dynamic>? response, Exception? exception, StackTrace? stackTrace])?
      errorDataBuilder;
  Map<String, dynamic>? Function(Response<dynamic>? response)? successDataBuilder;

  MixPanelEventModel({
    this.eventName,
    this.successData,
    this.errorData,
    this.errorDataBuilder,
    this.successDataBuilder,
  });

  MixPanelEventModel.fromJson(Map<String, dynamic> json) {
    eventName = json['eventName'];
    successData = json['successData'] != null ? Map<String, dynamic>.from(json['successData']) : null;
    errorData = json['errorData'] != null ? Map<String, dynamic>.from(json['errorData']) : null;

    errorDataBuilder = json['errorDataBuilder'] != null
        ? ([Response<dynamic>? response, Exception? exception, StackTrace? stackTrace]) =>
            Map<String, dynamic>.from(json['errorDataBuilder'])
        : null;
    successDataBuilder =
        json['successDataBuilder'] != null ? (response) => Map<String, dynamic>.from(json['successDataBuilder']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventName'] = eventName;
    if (successData != null) {
      data['successData'] = successData;
    }
    if (errorData != null) {
      data['errorData'] = errorData;
    }

    if (errorDataBuilder != null) {
      data['errorDataBuilder'] = errorDataBuilder;
    }
    if (successDataBuilder != null) {
      data['successDataBuilder'] = successDataBuilder;
    }
    return data;
  }
}
