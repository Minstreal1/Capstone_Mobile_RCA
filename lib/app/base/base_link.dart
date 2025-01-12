class BaseLink {
  static String domain = 'https://clownfish-app-wvth5.ondigitalocean.app';
  static String register = '$domain/auth/register-resident';
  static String login = '$domain/auth/login';

  static String fetchListMaterial = '$domain/material/get-all-material';
  static String createSchedule = '$domain/schedule/create-collection-schedule';
  static String fetchListScheduleUserByStatus = '$domain/schedule/get-list-collection-schedule-by-user-by-status';
  static String confirmPayment = '$domain/collector/update-successful-collector-resident-payment';

  static String scheduleDetailById = '$domain/schedule/get-schedule-by-id';
  static String paymentDetailByScheduleId = '$domain/collector/get-payment-cr-by-schedule-id';
  static String fetchApparmentData = '$domain/apartments/get-list-apartment';
  static String getPoints = '$domain/user/get-point-by-user';
  static String drawMoney = '$domain/draw-money/create-draw-money-form';

  static String listDrawMoney = '$domain/draw-money/get-draw-money-by-user';
  static String getBuilding = '$domain/building/get-all-building';
  static String getAppartmentByIdBuilding = '$domain/apartments/get-list-apartment-by-building-id';

  static String getUserInfo ='$domain/user/get-info-user';

  static String updateInformation = '$domain/update-info-user';
  static String getDashBoard = '$domain/residents/analyze-material';
  static String sendPoint = '$domain/payment/change-point-to-user';
  static String getPosts = '$domain/post/get-all-post';
  static String getVouchers = '$domain/voucher/get-all-voucher';


  static String cancelSchedule = '$domain/schedule/cancel-collection-schedule';

  static String voucherByUser = '$domain/user/get-list-voucher-by-user';

  static String takeVoucher = '$domain/user/change-point-to-voucher';


}