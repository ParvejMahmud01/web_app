import 'package:web_app/core/const/app_export.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? radius;
  final Color? borderColor;
  final bool? readOnly;
  final String? title;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final bool obsecureText;
  final TextInputType? textInputType;
  final int? maxLength;
  final bool? isTitle;
  final Color? bgColor;
  final bool? isPrefix;
  final bool? autofocus;
  final String? Function(String?)? validator;
  final double? obscureTextSize;
  final bool isPassword;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintext,
    this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.obsecureText = false,
    this.textInputType,
    this.height,
    this.radius,
    this.borderColor,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.isTitle,
    this.bgColor,
    this.isPrefix,
    this.autofocus,
    this.validator,
    this.obscureTextSize,
    this.isPassword = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  String? errorText;
  bool _shouldValidate = true;
  late FocusNode _focusNode;

  final String _tag = UniqueKey().toString();

  late final PasswordVisibilityController _visibilityController = Get.put(
    PasswordVisibilityController(),
    tag: _tag,
  );

  bool get isValid =>
      _shouldValidate && errorText == null && widget.controller.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        if (!_focusNode.hasFocus) {
          _shouldValidate = false;
          errorText = null;
        } else {
          _shouldValidate = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    Get.delete<PasswordVisibilityController>(tag: _tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasError = errorText != null;
    final bool isReadOnly = widget.readOnly ?? false;
    final bool showGreen = !isReadOnly && _shouldValidate && isValid;

    final Color activeBorderColor = showGreen
        ? Colors.green
        : AppColors.textfieldBorder;

    if (widget.isPassword) {
      return Obx(
        () => _buildTextField(
          hasError,
          isReadOnly,
          activeBorderColor,
          obscureText: !_visibilityController.isVisible.value,
        ),
      );
    }

    return _buildTextField(
      hasError,
      isReadOnly,
      activeBorderColor,
      obscureText: false,
    );
  }

  SizedBox _buildTextField(
    bool hasError,
    bool isReadOnly,
    Color activeBorderColor, {
    required bool obscureText,
  }) {
    return SizedBox(
      height: hasError
          ? getHeight(75, maxHeight: 85)
          : getHeight(56, maxHeight: 75),
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        onTap: widget.onTap,
        autofocus: widget.autofocus ?? false,
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines,
        obscureText: obscureText,
        keyboardType: widget.textInputType,
        obscuringCharacter: "•",
        readOnly: isReadOnly,
        maxLength: widget.maxLength,
        cursorColor: AppColors.textBlack,

        onChanged: (value) {
          widget.onChanged?.call(value);
          if (errorText != null || isValid) setState(() {});
        },

        validator: (value) {
          final error = widget.validator?.call(value);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (error != errorText) {
              setState(() => errorText = error);
            }
          });
          return error;
        },

        autovalidateMode: AutovalidateMode.onUserInteraction,

        style: GoogleFonts.roboto(
          fontSize: getWidth(15),
          fontWeight: FontWeight.w600,
          color: AppColors.textBlack,
        ),

        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintext,
          floatingLabelBehavior: hasError
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,

          hintStyle: GoogleFonts.roboto(
            fontSize: getWidth(15),
            fontWeight: FontWeight.w400,
            color: AppColors.hintText.withValues(alpha: 0.3),
          ),

          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: _visibilityController.toggleVisibility,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CustomSvgImage(
                      icon: _visibilityController.isVisible.value
                          ? IconsPath.eye
                          : IconsPath.eyeOff,
                      color: AppColors.textGrey,
                    ),
                  ),
                )
              : widget.suffixIcon,

          prefixIcon: (widget.isPrefix ?? true) && widget.prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    left: getWidth(10),
                    right: AppSizes.isTablet ? getWidth(5) : 0,
                    top: AppSizes.isTablet ? getHeight(3) : getHeight(8),
                    bottom: AppSizes.isTablet ? getHeight(3) : getHeight(8),
                  ),
                  child: SizedBox(
                    height: getHeight(20, maxHeight: 30),
                    width: getWidth(20, maxWidth: 30),
                    child: Center(child: widget.prefixIcon),
                  ),
                )
              : null,

          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),

          errorText: errorText,
          errorStyle: GoogleFonts.roboto(
            fontSize: getWidth(13),
            fontWeight: FontWeight.w400,
            color: AppColors.red,
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: activeBorderColor),
            borderRadius: BorderRadius.circular(widget.radius ?? getWidth(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: activeBorderColor),
            borderRadius: BorderRadius.circular(widget.radius ?? getWidth(10)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(widget.radius ?? getWidth(10)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(widget.radius ?? getWidth(10)),
          ),
        ),
      ),
    );
  }
}

class PasswordVisibilityController extends GetxController {
  final isVisible = false.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
