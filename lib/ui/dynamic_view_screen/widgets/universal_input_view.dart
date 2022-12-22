import 'package:dio_example_n6/data/models/input_model/input_model.dart';
import 'package:dio_example_n6/view_models/dynamic_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UniversalInputView extends StatelessWidget {
  const UniversalInputView({Key? key, required this.inputModel})
      : super(key: key);

  final InputModel inputModel;

  @override
  Widget build(BuildContext context) {
    switch (inputModel.type) {
      case "select":
        {
          return Switch(value: true, onChanged: (value) {});
        }
      case "checkbox":
        {
          return Checkbox(
              value: true,
              onChanged: (v) {

              });
        }
      case "text":
        {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (val) {
                 Provider.of<DynamicViewModel>(context,listen: false).updateFields(inputModel.code, val);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(inputModel.caption),
              ),
            ),
          );
        }
      default:
        return const Text("No Input found");
    }
  }
}
