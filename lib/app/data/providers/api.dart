import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:discover_decide/app/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const API_HOST = "api.openai.com";
const API_URL = "https://api.openai.com/v1/chat/completions";
const OPENAI_API_KEY = "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";

Map<String, String> baseHeaders = {
  'Content-type': 'application/json',
  'Authorization': 'Bearer $OPENAI_API_KEY',
};

Future<Map<String, dynamic>> call({required String body}) async {
  try {
    Uri uri = Uri.parse(API_URL);

    http.Response response = await http.post(uri,
        headers: baseHeaders,
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content":
                  "$body, sort it by rating and don't explain anything else"
            }
          ],
        }));
    print('response ${response.statusCode} ${response.body}');
    return _handleResponse(response);
  } on SocketException {
    showSnackBar('No internet', 'Check your internet connection and try again',
        icon: Icons.signal_wifi_connected_no_internet_4_rounded);
    return {'error': 'No internet connection'};
  } catch (e, stck) {
    log('ERROR IN API CALL  $e $stck');
    return {'error': 'API call failed'};
  }
}

_handleResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return {'success': jsonDecode(response.body)};
    case 429:
      showSnackBar('Too many requests',
          'You have reached the limit of requests. You need to update your plan.',
          icon: Icons.price_check_rounded);
      return {'error': 'Too many requests'};
    case 400:
      showSnackBar('Bad request', 'Please check your request and try again',
          icon: Icons.error_rounded);
      return {'error': 'Bad request'};
    case 401:
      showSnackBar('Unauthorized', 'Please check your API key and try again',
          icon: Icons.lock);
      return {'error': 'Unauthorized'};
    default:
      return {'error': 'Unknown error'};
  }
}
