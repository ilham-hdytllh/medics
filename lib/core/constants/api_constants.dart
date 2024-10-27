class ContantAPI {
  static String baseUrlAPI = "https://tbr.ridinet.id";

  static String loginEmail = "https://tbr.ridinet.id/api/v1/login/email";
  static String loginGoogle = "https://tbr.ridinet.id/api/v1/login/google";
  static String signup = "https://tbr.ridinet.id/api/v1/register";
  static String forgotPassword =
      "https://tbr.ridinet.id/api/v1/forgot-password";
  static String logout = "https://tbr.ridinet.id/api/v1/logout";

  static String getProfile = "https://tbr.ridinet.id/api/v1/user/profile";
  static String updateProfile = "https://tbr.ridinet.id/api/v1/user/profile";
  static String updatePassword =
      "https://tbr.ridinet.id/api/v1/user/profile/edit-password";

  static String getFlyer = "https://tbr.ridinet.id/api/v1/content/flayers";
  static String getEvents = "https://tbr.ridinet.id/api/v1/content/events";
  static String getNews = "https://tbr.ridinet.id/api/v1/content/news";

  static String getOnboarding = "https://tbr.ridinet.id/api/v1/intros";

  static String biodata = "https://tbr.ridinet.id/api/v1/user/biodata";

  static String sendMedicine =
      "https://tbr.ridinet.id/api/v1/send-take-medicine";

  static String cekQuestionerStatus =
      "https://tbr.ridinet.id/api/v1/questionnaire/status";
  static String getQuestionerFirst =
      "https://tbr.ridinet.id/api/v1/questionnaire?category=1";
  static String getQuestioner30Day =
      "https://tbr.ridinet.id/api/v1/questionnaire?category=2";
  static String storeQuestioner = "https://tbr.ridinet.id/api/v1/questionnaire";
}
