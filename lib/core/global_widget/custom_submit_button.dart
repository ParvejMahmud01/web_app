import 'package:web_app/core/const/app_export.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? icon;
  final Color? bgColor;
  final Color? border;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final double? borderWidth;
  final BoxShape? boxShape;
  final bool useGradient;
  final BorderRadius? borderRadius;

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.bgColor,
    this.border,
    this.textColor,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.borderWidth,
    this.width,
    this.boxShape,
    this.useGradient = true,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? defaultRadius(),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius ?? defaultRadius(),
        child: Ink(
          decoration: BoxDecoration(
            color: (bgColor ?? AppColors.primaryColor),

            borderRadius: borderRadius ?? defaultRadius(),
            border: Border.all(color: border ?? AppColors.primaryColor),
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(0, 4),
            //     blurRadius: 12,
            //     spreadRadius: 0,
            //     color: Colors.black.withValues(alpha: 0.2),
            //   ),
            // ],
          ),
          child: InkWell(
            borderRadius: borderRadius ?? defaultRadius(),
            splashColor: Colors.white.withValues(alpha: .6),
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                shape: boxShape ?? BoxShape.rectangle,
                color: Colors.transparent,
              ),
              height: height ?? getHeight(48),
              width: width ?? double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    const SizedBox(width: 5),
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Center(child: icon),
                    ),
                  ],
                  CustomText(
                    text: text,
                    fontSize: fontSize ?? fontSize16(),
                    fontWeight: fontWeight ?? fontWeight400(),
                    color: textColor ?? AppColors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
