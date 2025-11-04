/// API Configuration constants for Dailhouc Car Marketplace
class ApiConfig {
  ApiConfig._();

  /// Base URL for the API
  static const String baseUrl = 'http://dailhouc.dashboard.softvencefsd.xyz/api';

  /// Auth Endpoints
  static const String register = '/users/register';
  static const String verifyRegistrationOtp = '/users/register/otp-verify';
  static const String resendRegistrationOtp = '/users/register/otp-resend';
  static const String login = '/users/login';
  static const String verifyLoginEmail = '/users/login/email-verify';
  static const String verifyLoginOtp = '/users/login/otp-verify';
  static const String resendLoginOtp = '/users/login/otp-resend';
  static const String resetPassword = '/users/login/reset-password';
  static const String logout = '/user/logout';

  /// User Endpoints
  static const String userDetails = '/user';
  static const String updateUser = '/user/update';
  static const String updatePassword = '/user/update-password';
  static const String deleteAccount = '/user/delete-account';

  /// Device Token Endpoints
  static const String updateDeviceToken = '/firebase/update-token';
  static const String deleteDeviceToken = '/firebase/delete-token';
  static const String testNotification = '/firebase/test-notification';

  /// Location Endpoints
  static const String countries = '/location/countries';
  static const String cities = '/location/cities';

  /// Vehicle Endpoints
  static const String vehicleCategories = '/vehicle/categories';
  static const String vehicleBrands = '/vehicle/brands';
  static const String vehicleModels = '/vehicle/models';
  static const String vehicleSubModels = '/vehicle/submodels';
  static const String vehicleConditions = '/vehicle/vehicle-conditions';
  static const String vehicleBodyColor = '/vehicle/vehicle-body-color';
  static const String vehicleUpholstery = '/vehicle/vehicle-upholstery';
  static const String vehicleInteriorColors =
      '/vehicle/vehicle-interior-colors';
  static const String previousOwner = '/vehicle/previour-owner';
  static const String numberOfDoors = '/vehicle/number-of-doors';
  static const String numberOfSeats = '/vehicle/number-of-seats';

  /// System Settings Endpoints
  static const String siteSettings = '/site-settings';
  static const String socialLinks = '/social-links';

  /// Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const String products = '/products';
  static const String vendors = '/vendors';
  static const String cart = '/cart';
  static const String orders = '/orders';

  /// Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
