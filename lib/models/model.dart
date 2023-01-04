class Model {
  String val;
  String label;

  Model({required this.label, required this.val});
  Model.fromJson(Map<String, dynamic> json)
      : val = json['value'] as String,
        label = json['label'] as String;

  @override
  bool operator(Model other) {
    return val == other.val;
  }
}
