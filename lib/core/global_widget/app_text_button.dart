import 'package:web_app/core/const/app_export.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.textSize,
    this.fontWeight,
    this.textDecoration,
    this.isUnderline = true,
  });

  final String text;
  final Color? textColor;
  final double? textSize;
  final Function onTap;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final bool isUnderline;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  late Color color;
  late double size;

  @override
  void initState() {
    super.initState();
    color = widget.textColor ?? AppColors.textBlack;
    size = widget.textSize ?? 14.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: CustomText(
        text: widget.text,
        color: color,
        fontWeight: widget.fontWeight ?? FontWeight.w600,
        fontSize: size,
        textDecoration: widget.textDecoration ?? TextDecoration.none,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (mounted) {
      setState(() {
        color = color.withValues(
          alpha: .6,
        ); // Fixed the method withValues to withOpacity
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 150)).then((value) {
      if (mounted) {
        setState(() {
          color = widget.textColor ?? AppColors.textBlack;
          size = widget.textSize ?? 14.0;
        });
      }
    });
  }
}
