import 'package:application_1/models/model.dart';

class Form1 {
  final String? title;
  final String? desc;
  final List<Fields> fields;
  final String? submitButtonText;
  final String? cancelButtonText;
  final String? submitButtonAPI;

  Form1({
    this.title,
    this.desc,
    required this.fields,
    this.submitButtonText,
    this.cancelButtonText,
    this.submitButtonAPI,
  });

  Form1.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        desc = json['desc'] as String?,
        fields = (json['fields'] as List)
            .map((dynamic e) => Fields.fromJson(e as Map<String, dynamic>))
            .toList(),
        submitButtonText = json['submitButtonText'] as String?,
        cancelButtonText = json['cancelButtonText'] as String?,
        submitButtonAPI = json['submitButtonAPI'] as String?;

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'fields': fields.map((e) => e.toJson()).toList(),
        'submitButtonText': submitButtonText,
        'cancelButtonText': cancelButtonText,
        'submitButtonAPI': submitButtonAPI
      };
}

class Fields {
  final String? label;
  final String? type;
  final Range? range;
  final List<Model>? values;
  final List<Validations>? validations;

  Fields({this.label, this.type, this.validations, this.values, this.range});

  Fields.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?,
        type = json['type'] as String?,
        validations = (json['validations'] as List?)
            ?.map(
                (dynamic e) => Validations.fromJson(e as Map<String, dynamic>))
            .toList(),
        range = (json['range'] as Map<String, dynamic>?) != null
            ? Range.fromJson(json['range'] as Map<String, dynamic>)
            : null,
        values = (json['values'] as List?)
            ?.map((dynamic e) => Model.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'label': label,
        'type': type,
        'validations': validations?.map((e) => e.toJson()).toList()
      };
}

class Validations {
  final Length? length;
  final double? min;
  final double? max;
  bool isReq = false;

  Validations({this.length, this.min, this.max});

  Validations.fromJson(Map<String, dynamic> json)
      : length = (json['length'] as Map<String, dynamic>?) != null
            ? Length.fromJson(json['length'] as Map<String, dynamic>)
            : null,
        min = json['min'] as double?,
        max = json['max'] as double?;

  Map<String, dynamic> toJson() => {'length': length?.toJson()};
}

class Length {
  final int? greaterThan;

  Length({
    this.greaterThan,
  });

  Length.fromJson(Map<String, dynamic> json)
      : greaterThan = json['greaterThan'] as int?;

  Map<String, dynamic> toJson() => {'greaterThan': greaterThan};
}

class Range {
  int min, max;
  Range({required this.min, required this.max});

  Range.fromJson(Map<String, dynamic> json)
      : min = json['min'] as int,
        max = json['max'] as int;
}
