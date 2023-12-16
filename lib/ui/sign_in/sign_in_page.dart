import '../../app/exports.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: _buildAppBar('Log In'),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildThirdPartyLogin(context),
                    Center(
                        child:
                            _buildText('Or use your email account to login')),
                    Container(
                      margin: EdgeInsets.only(
                        top: 66.h,
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText('Email'),
                          CustomTextField(
                            hint: 'Enter your email address',
                            type: 'email',
                            iconName: 'user',
                            onChanged: (v) {
                              context
                                  .read<SignInBloc>()
                                  .add(SignInEmailChanged(v));
                            },
                          ),
                          SizedBox(height: 25.h),
                          _buildText('Password'),
                          CustomTextField(
                            hint: 'Enter your password',
                            type: 'password',
                            iconName: 'lock',
                            onChanged: (v) {
                              context
                                  .read<SignInBloc>()
                                  .add(SignInPasswordChanged(v));
                            },
                          ),
                          SizedBox(height: 20.h),
                          _buildForgotPassword(),
                          SizedBox(height: 40.h),
                          CustomButton(
                            title: 'Log in',
                            onTap: () async {
                              SignInC(context: context).handleSignIn('email');
                            },
                          ),
                          SizedBox(height: 20.h),
                          CustomButton(
                            title: 'Sign Up',
                            bgColor: AppColors.primaryBackground,
                            titleColor: AppColors.primaryElement,
                            onTap: () async {
                              Navigator.of(context).pushNamed(AppRoutes.signUp);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(String title) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0, // line thickness
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildThirdPartyLogin(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PngIconButton(
            iconName: 'google',
          ),
          PngIconButton(
            iconName: 'apple',
          ),
          PngIconButton(
            iconName: 'facebook',
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return SizedBox(
      width: 325.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot password?',
          style: TextStyle(
            color: AppColors.link,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
