import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loading extends StatelessWidget {
  final bool? showtext;

  const Loading({Key? key, this.showtext = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: const CircularProgressIndicator(
                strokeWidth: 10,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(79, 22, 153, 1)),
              ),
            ),
          ),
          showtext!
              ? const SizedBox(
                  height: 20,
                )
              : Container(),
          showtext!
              ? Center(
                  child: Text(
                    'Please wait...',
                    style: GoogleFonts.lato(
                        color: const Color.fromRGBO(79, 22, 153, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
