import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ProcessUtil {
  Future<String> startProcess(String executable, List<String> args) async {
    stderr.write('Running "$executable ${args.join(' ')}".\n');
    final List<int> output = <int>[];
    final Completer<int> completer = Completer<int>();
    final Process process =
        await Process.start(executable, args, runInShell: Platform.isWindows);

    process.stdout.listen((List<int> event) {
      output.addAll(event);
      stdout.add(event);
    }, onDone: () async => completer.complete(await process.exitCode));

    final int exitCode = await completer.future;
    if (exitCode != 0) {
      stderr.write(
          'Running "$executable ${args.join(' ')}" failed with $exitCode.\n');
      exit(exitCode);
    }
    return utf8.decoder.convert(output).trim();
  }
}
