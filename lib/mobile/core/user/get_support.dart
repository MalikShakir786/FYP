import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/global_providers/feedback_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_textfield.dart';


class GetSupport extends StatefulWidget {
  const GetSupport({super.key});

  @override
  State<GetSupport> createState() => _GetSupportState();
}

class _GetSupportState extends State<GetSupport> {

  String? _errorEmail;
  String? _errorTitle;
  String? _errorDescription;

  bool _isButtonEnabled = false;

  void _validateAndSubmit() {
    final emailRegex = RegExp(r'^[^@]+@uog\.edu\.pk$');
    setState(() {
      _errorEmail = context.read<FeedBackProvider>().fEmailController.text.isEmpty
          ? 'Please enter email'
          : (!emailRegex.hasMatch(context.read<FeedBackProvider>().fEmailController.text)
          ? 'Invalid email format'
          : null);
      _errorTitle = context.read<FeedBackProvider>().fTitleController.text.isEmpty
          ? 'Please enter title'
          : null;
      _errorDescription = context.read<FeedBackProvider>().fDescriptionController.text.isEmpty
          ? 'Please enter description'
          : null;
    });

    if (_errorEmail == null && _errorTitle == null && _errorDescription == null) {
      context.read<FeedBackProvider>().insertFeedback(context);
      FocusScope.of(context).unfocus();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "Get Support"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          FypTextField(
                            isDisable: true,
                            controller: context.read<FeedBackProvider>().fEmailController,
                            labelText: "Email",
                            labelColor: Colors.black,
                            hintText: "Email",
                            errorText: _errorEmail,
                          ),
                          SizedBox(height: 30),
                          FypTextField(
                            controller: context.read<FeedBackProvider>().fTitleController,
                            labelText: "Title",
                            labelColor: Colors.black,
                            hintText: "Title",
                            errorText: _errorTitle,
                          ),
                          SizedBox(height: 10),
                          FypTextField(
                            controller: context.read<FeedBackProvider>().fDescriptionController,
                            labelText: "Description",
                            labelColor: Colors.black,
                            hintText: "Description",
                            maxLines: 5,
                            errorText: _errorDescription,
                          ),
                          SizedBox(height: 40),
                          FypButton(
                            isLoading: context.watch<FeedBackProvider>().isLoading,
                            text: "Submit",
                            onTap: _validateAndSubmit,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
