import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidget {
  static Widget costum1({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    bool isDigitalNumber = false,
    bool isPassword = false,
    int? maxLength,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            maxLength: maxLength,
            keyboardType: isDigitalNumber == true ? TextInputType.number : null,
            inputFormatters: isDigitalNumber == true
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            decoration: InputDecoration(
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
}
