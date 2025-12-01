class ApiPaths {
  /// Url path
  //static String baseURL = 'https://m9.sjiinvestment.la/api/v1';  
  static String baseURL = 'https://m9api.hongfah.la/api/v1';

  static String baseURLWebView = 'https://m9.skvgroup.online/';
  //static String baseURLSocket = 'wss://m9.sjiinvestment.la';
  static String baseURLSocket = 'wss://m9api.hongfah.la';
  static String registerOnline = 'https://m9-fe.netlify.app?sessionID=';
  static String mqtt = 'https://h41770c0.ala.dedicated.aws.emqxcloud.com';
  static String mqttURL = 'ke307aaa.ala.us-east-1.emqxsl.com';
  static String mqttURL2 = 'https://mqtt.lxserve.xyz:1883';
  static String sessionID = '&path=register-driver';

  /// Http request methods
  static const String getRequest = 'get';
  static const String postRequest = 'post';
  static const String putRequest = 'put';
  static const String patchRequest = 'patch';
  static const String deleteRequest = 'delete';
  //---------------------- auth ---------------------
  static String loginPath = '${baseURL}/user/login';
  static String logoutPath = '${baseURL}/user/logout';
  static String refreshTokenPath = '${baseURL}/user/refresh-token';
  static String registerPath = '${baseURL}/user/register';
  static String forgotPasswordPath = '${baseURL}/user/forget-password';
  static String resetPasswordPath = '${baseURL}/user/reset-password';
  static String google = '${baseURL}/user/register/google';
  static String changePasswordPath = '${baseURL}/user/change-password';
  static String getProfilePath = '${baseURL}/user/me';
  static String updateProfile = '${baseURL}/user/update';

  static String editPassword = '${baseURL}/user/updatePassword';
  static String editBank = '${baseURL}/user/updatePassword';
  //---------------------- bank account ---------------------
  static String getBankAccountsPath = '${baseURL}/user/bank-account';
  static String addBankAccountPath = '${baseURL}/user/add-bank-account';
  static String editBankAccountPath = '${baseURL}/user/edit-bank-account';
  //---------------------- phone number ---------------------
  static String checkPhoneAvailablePath = '${baseURL}/user/available-phone';
  static String changePhoneNumberPath = '${baseURL}/user/change-phone-number';
  static String availablePhoneNumber = '${baseURL}/user/available-phone';
  //---------------------- home ---------------------
  static String getservicePath = '${baseURL}/user/service/getall';
  static String getbannerPath = '${baseURL}/user/banner/getall';
  static String getCarTypePath = '${baseURL}/user/car-type/getall'; 
  static String getConversationPath = '${baseURL}/user/conversation/customer/getall?page=1&limit=10';
  static String getConversationDriverPath = '${baseURL}/user/conversation/driver/getall?page=1&limit=10';
  //---------------------- order ---------------------
  static String createOrderCustomer =
      '${baseURL}/user/customer/order/create'; // ການສ້າງ

  static String createOrderDriver = '${baseURL}/user/driver/order/create';
  static String getUserSurveyDriver = '${baseURL}/user/customer/order/drivers?';
  //---------------------- driver ---------------------
  static String chooseOrder =
      '${baseURL}/user/driver/order/choose/'; // ແມ່ນdriver ກົດຍອມຮັບ ຕ້ອງ login ເຂົ້າ driver ແລະ customer ແຍກກັນ
  static String chooseDriver =
      '${baseURL}/user/customer/order/choose-driver'; // ລູກຄ້າກົດຍອດຮັບ mqtt
  static String driverUpdateInProgress =
      '${baseURL}/user/driver/order/progress/'; // ເຈົ້າຂອງລົດກົດຮັບຄົນຂື້ນລົດ
  static String driverUpdateComplete=
      '${baseURL}/user/driver/order/complete'; // ເຈົ້າຂອງລົດກົດຮັບຄົນຂື້ນລົດ
  static String reviewDriver =
      "${baseURL}/user/customer/order/review"; // review driver
  static String getDriverMe = "${baseURL}/user/driver/me";
  static String updateDriverMe = "${baseURL}/user/driver/active?active=";
  static String getDriverBalancePath = '${baseURL}/user/withdrawal/balance';
  static String getDriverProfilePath = '${baseURL}/user/driver/me';
  static String updateDriverProfilePath = '${baseURL}/user/driver/me';
  static String updateDriverVehiclePath = '${baseURL}/user/driver/update/vehicle';
  static String updateDriverLicensePath = '${baseURL}/user/driver/update/license';
  static String updateDriverPersonalPath =  '${baseURL}/user/driver/update/personal';
  static String addDriverLicensePath = '${baseURL}/user/driver/license';
  static String addDriverVehiclePath = '${baseURL}/user/driver/vehicle';
  static String driverActiveOrder = '${baseURL}/user/driver/order/active';
  static String getDriverPendingOrders = '${baseURL}/user/driver/order/order-pending';
  static String updateDriverActiveStatus = '${baseURL}/user/driver/active';
  static String getDriverDeliveryPendingOrders = '${baseURL}/user/driver/order/delivery-pending';

  static String createOrderDelivery = '${baseURL}/user/customer/order/delivery';
  static String startDelivery = '${baseURL}/user/driver/order/choose-delivery/';
  // ສ້າງອໍເດີ
  static String getOrderDelivery = '${baseURL}/user/customer/order/getall';
  // ສ້າງອໍເດີ
  static String getUserMe = '${baseURL}/user/me';
  static String changeMode = '${baseURL}/user/change-mode';

  static String checkPhoneNumber = '${baseURL}/user/check-phone-number';

  static String getQRCode = '${baseURL}/user/setting/qr-code-bank-account';

  static String userActiveOrder = '${baseURL}/user/customer/order/active';
}
