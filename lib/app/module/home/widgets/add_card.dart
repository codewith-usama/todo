import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/utils/extension.dart';
import 'package:todo_app/app/module/home/home_controller.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: 'Task type',
              content: Form(
                key: homeCtrl.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 3.0.wp),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your task title';
                          }
                          return null;
                        },
                        controller: homeCtrl.editController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
        child: DottedBorder(
          color: Colors.grey.shade400,
          dashPattern: const [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
