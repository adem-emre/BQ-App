import 'package:email_validator/email_validator.dart';

import '../../core/constant/app_strings.dart';

class ValidationHelper{

  static String? validateMail(String? email){
    if(email !=null && email.isNotEmpty){
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


  static String? isNotNullOrEmpty(String? name){
    if(name !=null){
      if(name.trim().isNotEmpty){
        return null;
      }else{
        return AppStrings.canNotBeEmpty;
      }
    }else{
      return AppStrings.canNotBeEmpty;
    }
  }
}