import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidget {
  static Widget costum1({
    required TextEditingController? controller,
    required String label,
    IconData? icon,
    bool isDigitalNumber = false,
    bool isPassword = false,
    int? maxLength,
    String? hinttext,
    int maxline = 1,
    int? minline,
  }) {
    if (minline != null) {
      if (maxline == 1) {
        maxline = minline + 1;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Sınırın rengi
              width: 0.5, // Sınırın kalınlığı
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            maxLength: maxLength,
            maxLines: maxline,
            minLines: minline,
            keyboardType: isDigitalNumber == true ? TextInputType.number : null,
            inputFormatters: isDigitalNumber == true
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: hinttext,
              contentPadding: const EdgeInsets.all(10.0),
              counterText: "", //Limiti gizler
              prefixIcon: icon == null ? null : Icon(icon),
              prefixIconColor: Colors.white,
              border: InputBorder.none,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static Widget costum2({
    required TextEditingController controller,
    String? label,
    IconData? icon,
    bool isDigitalNumber = false,
    bool isPassword = false,
    int? maxLength,
    String? hinttext,
    int maxline = 1,
    int? minline,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? Container()
            : Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Sınırın rengi
              width: 0.5, // Sınırın kalınlığı
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            maxLength: maxLength,
            maxLines: maxline,
            minLines: minline,
            keyboardType: isDigitalNumber == true ? TextInputType.number : null,
            inputFormatters: isDigitalNumber == true
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: hinttext,
              contentPadding: const EdgeInsets.all(10.0),
              counterText: "", //Limiti gizler
              prefixIcon: icon == null ? null : Icon(icon),
              prefixIconColor: Colors.black,
              border: InputBorder.none,
              fillColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
