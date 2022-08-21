String getFileSize(int file) {
  final kb = file / 1024;
  final mb = kb / 1024;
  final fileSize =
      mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  return fileSize;
}
