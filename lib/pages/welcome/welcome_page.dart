import 'package:learn_ai/app/values/constants.dart';

import '../../app/exports.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageC = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.w),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageC,
                    onPageChanged: (i) {
                      context.read<WelcomeBloc>().add(WelcomeEvent(i));
                    },
                    children: [
                      _buildWelcomePage(
                        index: 1,
                        context: context,
                        buttonName: 'Next',
                        title: 'First See Learnging',
                        subTitle:
                            'Forget about a for of paper all knowledge in one learning',
                        imagePath: 'assets/images/reading.png',
                      ),
                      _buildWelcomePage(
                        index: 2,
                        context: context,
                        buttonName: 'Next',
                        title: 'Connect With Everyone',
                        subTitle:
                            'Always keep in touch with your tutor & friends. Let\'s get connected!',
                        imagePath: 'assets/images/boy.png',
                      ),
                      _buildWelcomePage(
                        index: 3,
                        context: context,
                        buttonName: 'Get Started',
                        title: 'Always Fascinated Learning',
                        subTitle:
                            'Anywhere, anytime. The time is at your discretion so study whenever you want.',
                        imagePath: 'assets/images/man.png',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 70.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(16.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWelcomePage({
    required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 375.w,
          height: 375.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 100.h),
        CustomButton(
          title: buttonName,
          onTap: () {
            if (index < 3) {
              _pageC.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              Global.localStorage.setBoolData(
                  key: SharedPrefsKeys.hasSeenOnBoarding, value: true);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.application,
                (_) => false,
              );
            }
          },
        ),
      ],
    );
  }
}
