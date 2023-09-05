import '../../app/exports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routeName = '/register';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: _buildAppBar('Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 25.h),
                    Center(
                      child:
                          _buildText('Enter your details below & free sign up'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 50.h,
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText('User name'),
                          CustomTextField(
                            hint: 'Enter your name',
                            iconName: 'user',
                            onChanged: (v) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpUserNameChanged(v));
                            },
                          ),
                          SizedBox(height: 20.h),
                          _buildText('Email'),
                          CustomTextField(
                            hint: 'Enter your email address',
                            type: 'email',
                            iconName: 'user',
                            onChanged: (v) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEmailChanged(v));
                            },
                          ),
                          SizedBox(height: 20.h),
                          _buildText('Password'),
                          CustomTextField(
                            hint: 'Enter your password',
                            type: 'password',
                            iconName: 'lock',
                            onChanged: (v) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpPasswordChanged(v));
                            },
                          ),
                          SizedBox(height: 20.h),
                          _buildText('Confirm Password'),
                          CustomTextField(
                            hint: 'Confirm your password',
                            type: 'password',
                            iconName: 'lock',
                            onChanged: (v) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpRePasswordChanged(v));
                            },
                          ),
                          SizedBox(height: 20.h),
                          _buildText(''),
                          SizedBox(height: 30.h),
                          CustomButton(
                            title: 'Sign Up',
                            onTap: () async {
                              SignUpC(context: context).handleSignUp();
                            },
                          ),
                          SizedBox(height: 20.h),
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
