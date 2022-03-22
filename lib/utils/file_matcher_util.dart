class FileMatcherUtil {
  /// Check if has suffix
  bool hasSuffix(
      {required String file, required List<String> excludeSuffixes}) {
    final hasSufix = excludeSuffixes.any((sufix) => file.endsWith(sufix));
    return hasSufix;
  }

  /// Check if has patterns
  bool hasPatterns(
      {required List<String> values, required List<RegExp> patterns}) {
    final matchList =
        values.where((path) => hasPattern(value: path, patterns: patterns));
    final hasPatterns = matchList.isNotEmpty;
    return hasPatterns;
  }

  /// Check if has pattern
  bool hasPattern({required String value, required List<RegExp> patterns}) {
    final hasPattern = patterns.any((RegExp r) => r.hasMatch(value));
    return hasPattern;
  }
}
