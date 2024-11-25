class BaseLink {
  static String domain = 'https://clownfish-app-wvth5.ondigitalocean.app';
  static String register = '$domain/auth/register/resident';
  static String login = '$domain/auth/login';

  static String fetchListMaterial = '$domain/material/get-all-material';
  static String createSchedule = '$domain/schedule/create-collection-schedule';
  static String fetchListScheduleUserByStatus = '$domain/schedule/get-list-collection-schedule-by-user';
  static String confirmPayment = '$domain/collector/update-successful-collector-resident-payment';

  static String scheduleDetailById = '$domain/schedule/get-schedule-by-id';
  static String paymentDetailByScheduleId = '$domain/collector/get-payment-cr-by-schedule-id';


}