import 'package:dio_example_n6/data/models/input_model/input_model.dart';
import 'package:dio_example_n6/ui/dynamic_view_screen/widgets/universal_input_view.dart';
import 'package:dio_example_n6/view_models/dynamic_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DynamicViewPage extends StatelessWidget {
  const DynamicViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Dynamic views"),
        ),
        body: Consumer<DynamicViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.dynamicFields.isNotEmpty) {
              List<InputModel> sendersContainer = viewModel.dynamicFields
                  .where((element) => element.group == "SENDER")
                  .toList();

              List<InputModel> receiversContainer = viewModel.dynamicFields
                  .where((element) => element.group == "RECEIVER")
                  .toList();

              List<InputModel> commonsContainer = viewModel.dynamicFields
                  .where((element) => element.group == "COMMON")
                  .toList();

              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  getMyCustomContainer(Column(
                    children: [
                      Text("Sender info"),
                      ...List.generate(
                        sendersContainer.length,
                        (index) => UniversalInputView(
                          inputModel: sendersContainer[index],
                        ),
                      )
                    ],
                  )),
                  getMyCustomContainer(Column(
                    children: [
                      Text("Receiver info"),
                      ...List.generate(
                        receiversContainer.length,
                        (index) => UniversalInputView(
                          inputModel: receiversContainer[index],
                        ),
                      )
                    ],
                  )),
                  getMyCustomContainer(Column(
                    children: [
                      Text("Common info"),
                      ...List.generate(
                        commonsContainer.length,
                        (index) => UniversalInputView(
                          inputModel: commonsContainer[index],
                        ),
                      )
                    ],
                  )),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

Widget getMyCustomContainer(Widget widget) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              spreadRadius: 6,
              offset: Offset(2, 4),
              color: Colors.grey.withOpacity(0.3))
        ]),
    child: widget,
  );
}
