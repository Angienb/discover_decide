import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:discover_decide/app/data/providers/api_utils.dart';
import 'package:discover_decide/app/widgets/alerts.dart';
import 'package:http/http.dart' as http;

const API_HOST = "api.openai.com";
const API_URL = "https://api.openai.com/v1/chat/completions";
const OPENAI_API_KEY = "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";

Map<String, String> baseHeaders = {
  'Content-type': 'application/json',
  'Authorization': 'Bearer $OPENAI_API_KEY',
};

Future<Map<String, dynamic>> call({String? body}) async {
  try {
    Uri uri = Uri.parse(API_URL);

    http.Response response = await http.post(uri,
        headers: baseHeaders,
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": "Say this is a test!"}
          ],
        }));

    print('response ${response.statusCode} ${response.body}');
    return _handleResponse(response);
  } on SocketException {
    showSnackBar('No internet', 'Check your internet connection and try again');
    return {'error': 'No internet connection'};
  } catch (e, stck) {
    log('ERROR IN API CALL  $e $stck');
    // Return standardized error code so that no internal API parser breaks
    // under strange error/exception conditions
    return {'error': 'API call failed'};
  }
}

_handleResponse(http.Response response) {
  switch (response.statusCode) {
    case StatusCode.OK:
      return jsonDecode(response.body);
    case StatusCode.TOO_MANY_REQUESTS:
      showSnackBar('Too many requests',
          'You have reached the limit of requests. You need to update your plan.');
      return {'error': 'Too many requests'};
    default:
      return {'error': 'Unknown error'};
  }
}
