class GlobalVar {
  static String userPhone = "";
  static String productName = "";
  static String userEmail = "";
  static String userName = "";
  static String partnerUserName = "";
  static String partnerId = "";
  // Username and Password
  static String adminUsername = "AllboutiqueNbeautique";
  static String adminPassword = "9IOLDM5S7A8QSQW0E1R2T6Y4U8I3O";
//  checking for the location permissison
  static String tpAdminUsername = 'admin';
  static String tpAdminPassword = '5A4U8S3Y9I0E1W2R6T4O9P8G2F4D3';

  static String ticketApiUsername = "c4esathyaraj_raj";
  static String ticketApiPassword = "Welcome";
  
  static String festivalApiUsername = "c4esathyaraj_raj";
  static String festivalApiPassword = "Welcome";
  
  static String partnerUsername = 'c4epartnerapp';
  static String partnerPassword = 'Partner@c4e';

  static String mode = "false";
  static String selectedStore = "";
  static String selectedStorePhone = "";
  static String isLoggedIn = "";

  static double userLatitude = 0.0;
  static double userLongitude = 0.0;
  static String  postalCode = "" ;

  static String deviceToken = "" ;

  static bool isFestiveDiologShown = false;
  static String festivalUrl = "";

  static int selectedProductId = 0;

  static int selectedRange = 5; // range of stores to be displayed

  static bool mordernClassic = true;

  static bool isUnverifiedShown = false;

  // the below value is for navigation drawer
  double value = 0;
  double getValue() {
    return value;
  }

  void setValue(double value) {
    this.value = value;
  }
}
