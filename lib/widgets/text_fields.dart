import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';

class TextFields {
  buildTextInfo(text, value, context) => Padding(
        padding: PublicVariables().all10,
        child: Row(children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.55,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: PublicVariables().mainColor.withOpacity(0.25),
              borderRadius: PublicVariables().borderCircular10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.5),
                  child: Text(
                    text,
                    style: PublicVariables().normalItalizedText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.5),
                  child: Text(
                    value,
                    style: PublicVariables().normalText
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
}
