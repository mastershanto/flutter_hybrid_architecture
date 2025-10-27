/// API Configuration constants
class ApiConfig {
  ApiConfig._();

  /// Base URL for the API
  /// Change this to your actual API endpoint
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  /// API Endpoints
  static const String todos = '/todos';
  static String todoById(String id) => '/todos/$id';

  /// Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
