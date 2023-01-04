import 'package:application_1/models/model.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String label1, selectedvalue = "";
  int len;

  bool greaterthan = false, lessthan = false, equals = false;
  CustomTextField({
    super.key,
    required this.label1,
    required this.len,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {
          setState(() {
            widget.selectedvalue = _controller.text;
          });
        },
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.label1,
            errorText: verify(_controller.text)),
      ),
    );
  }

  String? verify(String s) {
    if (widget.greaterthan == true) {
      if (s.length > widget.len) return null;
      return "The text must be greater than ${widget.len}";
    } else if (widget.lessthan == true) {
      if (s.length < widget.len) return null;
      return "The text must be less than ${widget.len}";
    } else if (widget.equals == true) {
      if (s.length == widget.len) return null;
      return "The text must be equal to ${widget.len}";
    } else {
      return null;
    }
  }
}

class CustomSlider extends StatefulWidget {
  double? min, max, selectedvalue;
  bool isReq = false;
  CustomSlider(
      {super.key,
      required this.min,
      required this.max,
      required this.selectedvalue});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Slider(
        label: widget.selectedvalue!.toString(),
        divisions: (widget.max!) ~/ (widget.min!),
        min: widget.min!,
        max: widget.max!,
        value: widget.selectedvalue!,
        onChanged: (value) {
          setState(() {
            widget.selectedvalue = value;
          });
        },
      ),
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  List<Model> items;
  String? selectedvalue = "-1";
  bool isReq = false;
  CustomDropDownButton({super.key, required this.items});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  //String? selectedvalue;

  @override
  void initState() {
    super.initState();
    widget.selectedvalue = widget.items[0].val;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButton(
        value: widget.selectedvalue,
        items: widget.items.map((Model item) {
          return DropdownMenuItem(value: item.val, child: Text(item.label));
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            widget.selectedvalue = value;
          });
        },
      ),
    );
  }
}
