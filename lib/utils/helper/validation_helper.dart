import 'package:email_validator/email_validator.dart';

import '../../core/constant/app_strings.dart';

class ValidationHelper{

  static String? validateMail(String? email){
    if(email !=null){
      if(EmailValidator.validate(email)){
        return null;
      }else{
        return AppStrings.invalidMail;
      }
    }else{
      return AppStrings.canNotBeEmpty;
    }
  }

  static String? validatePassword(String? password){
    if(password !=null){
      if(password.length>=6){
        return null;
      }else{
        return AppStrings.invalidPassword;
      }
    }else{
      return AppStrings.canNotBeEmpty;
    }
  }
}