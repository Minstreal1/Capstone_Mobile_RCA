import 'package:get/get.dart';

import '../modules/change-password/bindings/change_password_binding.dart';
import '../modules/change-password/views/change_password_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/check-point/bindings/check_point_binding.dart';
import '../modules/check-point/views/check_point_view.dart';
import '../modules/create_schedule/bindings/create_schedule_binding.dart';
import '../modules/create_schedule/views/create_schedule_view.dart';
import '../modules/history-checkpoint/bindings/history_checkpoint_binding.dart';
import '../modules/history-checkpoint/views/history_checkpoint_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my-voucher/bindings/my_voucher_binding.dart';
import '../modules/my-voucher/views/my_voucher_view.dart';
import '../modules/nav-history/bindings/nav_history_binding.dart';
import '../modules/nav-history/views/nav_history_view.dart';
import '../modules/new_schedule/bindings/new_schedule_binding.dart';
import '../modules/new_schedule/views/new_schedule_view.dart';
import '../modules/news-detail/bindings/news_detail_binding.dart';
import '../modules/news-detail/views/news_detail_view.dart';
import '../modules/personal_info/bindings/personal_info_binding.dart';
import '../modules/personal_info/views/personal_info_view.dart';
import '../modules/schedule-confirm/bindings/schedule_confirm_binding.dart';
import '../modules/schedule-confirm/views/schedule_confirm_view.dart';
import '../modules/schedule-detail/bindings/schedule_detail_binding.dart';
import '../modules/schedule-detail/views/schedule_detail_view.dart';
import '../modules/send-point/bindings/send_point_binding.dart';
import '../modules/send-point/views/send_point_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/summary-garbage/bindings/summary_garbage_binding.dart';
import '../modules/summary-garbage/views/summary_garbage_view.dart';
import '../modules/tab-calendar/bindings/tab_calendar_binding.dart';
import '../modules/tab-calendar/views/tab_calendar_view.dart';
import '../modules/tab_account/bindings/tab_account_binding.dart';
import '../modules/tab_account/views/tab_account_view.dart';
import '../modules/tab_home/bindings/tab_home_binding.dart';
import '../modules/tab_home/views/tab_home_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.TAB_ACCOUNT,
      page: () => const TabAccountView(),
      binding: TabAccountBinding(),
    ),
    GetPage(
      name: _Paths.TAB_HOME,
      page: () => const TabHomeView(),
      binding: TabHomeBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFO,
      page: () => const PersonalInfoView(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: _Paths.SUMMARY_GARBAGE,
      page: () => const SummaryGarbageView(),
      binding: SummaryGarbageBinding(),
    ),
    GetPage(
      name: _Paths.NEW_SCHEDULE,
      page: () => const NewScheduleView(),
      binding: NewScheduleBinding(),
    ),
    GetPage(
      name: _Paths.NAV_HISTORY,
      page: () => const NavHistoryView(),
      binding: NavHistoryBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_DETAIL,
      page: () => const ScheduleDetailView(),
      binding: ScheduleDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_POINT,
      page: () => const CheckPointView(),
      binding: CheckPointBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_CHECKPOINT,
      page: () => const HistoryCheckpointView(),
      binding: HistoryCheckpointBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.TAB_CALENDAR,
      page: () => const TabCalendarView(),
      binding: TabCalendarBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_CONFIRM,
      page: () => const ScheduleConfirmView(),
      binding: ScheduleConfirmBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SCHEDULE,
      page: () => const CreateScheduleView(),
      binding: CreateScheduleBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.SENT_POINT,
      page: () => const SendPointView(),
      binding: SendPointBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => const NewsDetailView(),
      binding: NewsDetailBinding(),
    ),
    GetPage(
      name: _Paths.MY_VOUCHER,
      page: () => const MyVoucherView(),
      binding: MyVoucherBinding(),
    ),
  ];
}
