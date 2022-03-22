extension ListExtension on List {
  Iterable<RegExp> mapRegex() =>
      map((pattern) => '^${pattern.replaceAll('*', r'(.*)?')}\$')
          .map((pattern) => RegExp(pattern));
}
