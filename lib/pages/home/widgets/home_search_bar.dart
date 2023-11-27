import '../../../app/exports.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width * 0.65).w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(15.w),
                border: Border.all(
                  color: AppColors.secondaryElementText,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16.w),
                    width: (MediaQuery.of(context).size.width * 0.05).w,
                    height: (MediaQuery.of(context).size.width * 0.05).w,
                    child: Image.asset('assets/icons/search.png'),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 16.w),
                    width: (MediaQuery.of(context).size.width * 0.5).w,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.fromLTRB(5.w, 5.h, 0.w, 5.h),
                        border: _transparentTextFieldBorder(),
                        enabledBorder: _transparentTextFieldBorder(),
                        disabledBorder: _transparentTextFieldBorder(),
                        focusedBorder: _transparentTextFieldBorder(),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.normal,
                      ),
                      autocorrect: false,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.1).w,
                height: (MediaQuery.of(context).size.width * 0.1).w,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.w),
                  ),
                  border: Border.all(
                    color: AppColors.primaryElement,
                  ),
                ),
                child: Image.asset('assets/icons/options.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _transparentTextFieldBorder() => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      );
}
