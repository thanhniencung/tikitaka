import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required Function onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, 'Server quá tải vui lòng thử lại sau ít phút nữa');
  }
}

void showSnackBar(BuildContext context, String text) {
  try {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  } catch (_) {}
}
