import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late PdfControllerPinch pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
            document: PdfDocument.openAsset(
                'assets/images/content/jevelmebeautyloung....pdf'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: TColors.primary),
        centerTitle: true,
        title: Text('Privacy Policy',
            style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.primary)),
      ),
      body: _buildUI(),
      backgroundColor: TColors.secondary,
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _pdfView(),
      ],
    );
  }

  Widget _pdfView() {
    return Expanded(
      child: PdfViewPinch(controller: pdfControllerPinch),
    );
  }
}
