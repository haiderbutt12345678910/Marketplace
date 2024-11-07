class AuthenticationStrings {
  static String btnlogInText = "LogIn";
  static String btnregisterText = "Register";
  static String btnResendOtp = "Resend";
  static String btnForgotPassword = 'Forgot password?';
  static String btnResetPassword = 'Reset';

//titles
  static String titleregisterText = "Create an accoount";
  static String titlelogInText = "Sign in to your account";
  static String titleOtpText = "Enter OTP";
  static String titleVerifyEmailText = "Verify your email to continue";
  static String titleResetPassowrdText = "Provide an email to get link";

//subtitles
  static String subTitleOtpText =
      "Please enter 6 digits pin sent to your phone number";
  static String subTitleOptionsText = "Or login with";
  static String subTitleAlreadyHaveAnAccountText = "Already have an account?";
  static String subTitleDontHaveAnAccountText = "Don't have an account?";
  static String subTitleVerfiyEmailText =
      "A verifaication link has been sent to your account, if you dont find it in your inbox check spams folder";
  static String subTitleResetPasswordText =
      "A Password Reset link has been sent to your account, if you dont find it in your inbox check spams folder";

//textformFeild
//hints
  static String hinttextFormFeildEmail = "Enter your email";
  static String hinttextFormFeildentpassword = "Enter your password";
  static String hinttextFormFeildPhone = "Enter Your phone number";
  static String hinttextFormFeildPasswordReset =
      "Provide an email to get reset link";

//labels
  static String labeltextFormFeildEnterEmail = "Email";
  static String labeltextFormFeildentEnterpassword = "Password";
  static String labeltextFormFeildEnterPhone = "Phone number";

//errors

  static String errorTextFormFeildIvalidFormatPhoneNumber =
      "Please provide a valid phone number";

  static String errorTextFormFeildInvalidFormatEmail =
      "Please provide a valid email format";
//[0 lenght error],[1 must contains letter and digits and specail chracters]
  static List<String> errorTextFormFeildFormatInvalidPassword = [
    "Password lenght must be greater than 6",
    "Password must contain at least one letter, one number, and one special character"
  ];
  static String apierrorTextFormFeildLogInEmail = "Email not found";
  static String apierrorTextFormFeildLogInPassword = "Incorrect password";
  static String apierrorTextFormFeildRegisterEmail =
      "Email already exists, provide another email address";

//snakbars
//titles

  static String snackBarTitleResetPassowrdText =
      "Reset password link has been sent to provided email";
  static String snackBarTitleLoginSucess = "Succesfully logged in";
  static String snackBarTitleRegisterSucess = "Account created succesfully";

//subtitles

  static String snackBarSubtitleResetPassowrdText =
      "If you dont find it in your inbox check spams folder";
}
