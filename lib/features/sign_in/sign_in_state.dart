abstract class SignInstate {}

class SignInInitialState extends SignInstate{}

class SignInLoadingState extends SignInstate{}

class SignInSuccessState extends SignInstate{}

class SignInErrorState extends SignInstate{
  final String message;

  SignInErrorState(this.message);
}