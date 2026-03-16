class Validators {
  Validators._(); // prevent instantiation

  static String? mandatoryFieldValidation(String? value, [String? errorMsg]) {
    if (value != null && value.trim().isNotEmpty) {
      return null;
    }
    return errorMsg ?? 'This field is mandatory';
  }

  static String? emailValidation(String? value, [String? errorMsg]) {
    // ✅ Fixed: safe null check before force-unwrap
    if (value == null || value.trim().isEmpty) {
      return errorMsg ?? 'Please provide a valid email';
    }
    final RegExp emailRegex = RegExp(
      r'^[\w.-]+@[a-zA-Z_-]+?(?:\.[a-zA-Z]{2,})+$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return errorMsg ?? 'Please provide a valid email';
    }
    return null;
  }

  static String? pinValidationCheck(
    String? value, [
    String? errorRequired,
    String? errorDigits,
  ]) {
    // ✅ Fixed: safe null check before force-unwrap
    if (value == null || value.trim().isEmpty) {
      return errorRequired ?? '* Please enter pin code';
    }
    if (value.trim().length < 4) {
      return errorDigits ?? '* Please enter 4 digits pin';
    }
    return null;
  }

  static String? passwordValidation(
    String? value, {
    String? value2,
    String? errorRequired,
    String? errorShort,
    String? errorMismatch,
  }) {
    // ✅ Fixed: safe null check before force-unwrap
    if (value == null || value.trim().isEmpty) {
      return errorRequired ?? '* Please enter password';
    }
    final trimText = value.trim();
    if (trimText.length < 6) {
      return errorShort ?? '* Password should be at least 6 characters';
    }
    if (value2 != null && value2 != trimText) {
      return errorMismatch ?? '* Passwords do not match';
    }
    return null;
  }

  /// Validates a 17-character Vehicle Identification Number (VIN).
  static String? vinValidator(
    String? value, [
    String? errorLength,
    String? errorInvalid,
  ]) {
    final trimText = value?.trim();

    if (trimText == null || trimText.isEmpty) return null;

    if (trimText.length != 17) {
      return errorLength ??
          'VIN must be exactly 17 characters (got ${trimText.length}).';
    }

    final vinRegExp = RegExp(r'^[A-HJ-NPR-Z0-9]{17}$');
    if (!vinRegExp.hasMatch(trimText)) {
      return errorInvalid ?? 'Only A–Z (except I, O, Q) and 0–9 are allowed.';
    }

    return null;
  }
}
