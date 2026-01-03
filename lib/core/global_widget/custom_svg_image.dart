import 'package:web_app/core/const/app_export.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage({
    super.key,
    required this.icon,
    this.color,
    this.height,
    this.width,
  });
  final String icon;
  final Color? color;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: height,
      width: width,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
