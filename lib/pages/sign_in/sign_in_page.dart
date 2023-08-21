import '../../app/exports.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const String routeName = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildThirdPartyLogin(context),
                Center(child: _buildText('Or use your email account to login')),
                Container(
                  margin: EdgeInsets.only(
                    top: 66.h,
                    left: 25.w,
                    right: 25.w,
                  ),
                  child: Column(
                    children: [
                      _buildText('Email'),
                      const CustomTextField(
                        hint: 'Enter your email address',
                        type: 'email',
                        iconName: 'user',
                      ),
                      SizedBox(height: 25.h),
                      _buildText('Password'),
                      const CustomTextField(
                        hint: 'Enter your password',
                        type: 'password',
                        iconName: 'lock',
                      ),
                      SizedBox(height: 20.h),
                      _buildForgotPassword(),
                      SizedBox(height: 40.h),
                      const CustomButton(title: 'Log in'),
                      SizedBox(height: 20.h),
                      const CustomButton(title: 'Register'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey.withOpacity(0.5),
          height: 1.0, // line thickness
        ),
      ),
      title: Text(
        'Log In',
        style: TextStyle(
          color: Colors.black,
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

  Widget _buildForgotPassword() => SizedBox(
        width: 325.w,
        height: 44.h,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            'Forgot password?',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
}
