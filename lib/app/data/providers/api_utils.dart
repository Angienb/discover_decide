class StatusCode {
  /// # 200
  /// Success with body
  static const int OK = 200;

  /// ## 204
  /// Success without body
  static const int OK_NC = 204;

  /// ## 269
  /// Success with body and / or currencies to update
  static const int OK_CURRENCIES = 269;

  /// ## 400
  /// Bad request
  static const int BAD_REQUEST = 400;

  /// ## 401
  /// Unauthorized
  static const int UNAUTHORIZED = 401;

  /// ## 403
  /// Forbidden – Invalid token
  static const int FORBIDDEN = 403;

  /// ## 408
  /// Request timeout
  static const int REQUEST_TIMEOUT = 408;

  /// ## 409
  /// Conflict – Call already exists
  static const int CONFLICT = 409;

  /// ## 422
  /// Unprocessable Entity – Validation error
  static const int UNPROCESSABLE_ENTITY = 422;

  /// ## 429
  /// Too many requests
  static const int TOO_MANY_REQUESTS = 429;

  /// ## 451
  /// User has been banned -> Just one button to logout
  static const int BANNED = 451;

  /// ## 502
  /// Bad gateway (maintenance mode)
  static const int BAD_GATEWAY = 502;

  /// ## 503
  /// Service unavailable (maintenance mode)
  static const int SERVICE_UNAVAILABLE = 503;
}
