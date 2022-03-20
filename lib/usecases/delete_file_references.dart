import '../core/app_constants.dart';
import '../utils/file_system/file_system_util.dart';

class DeleteFileReferences {
  final FileSystemUtil fileSystemUtil;

  DeleteFileReferences(this.fileSystemUtil);

  Future<void> call() async =>
      fileSystemUtil.delete(AppConstants.dlcovFileReferences);
}
