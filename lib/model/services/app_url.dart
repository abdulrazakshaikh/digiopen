class AppUrl {
  static String baseUrl = "https://admin.xceednet.com/";
  static String login = "api/v2/sessions/user_login";
  static String listOfLocation = "location_subdomain_and_domains";
  static String dashboard = "location_dashboard";
  static String subscriber_list = "subscribers/search";
  static String subscriber_details = "subscribers";
  static String invoice_list = "subscriber_invoices/search";
  static String invoice_details = "subscriber_invoices";
  static String payment_list = "subscriber_payments/search";
  static String payment_details = "subscriber_payments";
  static String package_list = "location_packages";
  static String package_details = "location_packages";

  static debugPrint(dynamic data) {
    print(data);
  }
}
