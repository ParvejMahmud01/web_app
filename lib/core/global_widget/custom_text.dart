import 'package:web_app/core/const/app_export.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final double? height;
  final TextDecoration? textDecoration;
  const CustomText({
    super.key,
    required this.text,
    this.maxLines,
    this.textOverflow,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.height,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        fontSize: fontSize ?? fontSize16(),
        height: height,
        color: color ?? AppColors.textBlack,
        fontWeight: fontWeight ?? fontWeight500(),
        decoration: textDecoration,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
