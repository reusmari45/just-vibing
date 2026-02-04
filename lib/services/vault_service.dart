class VaultEntry {
  const VaultEntry({required this.path, required this.encryptedPath});

  final String path;
  final String encryptedPath;
}

class VaultService {
  Future<VaultEntry> encryptFile(String path) async {
    return VaultEntry(path: path, encryptedPath: '$path.aes');
  }

  Future<void> decryptFile(VaultEntry entry) async {}
}
