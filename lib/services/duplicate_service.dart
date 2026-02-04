import 'dart:math';

class DuplicateCandidate {
  const DuplicateCandidate({required this.groupId, required this.paths});

  final String groupId;
  final List<String> paths;
}

class DuplicateService {
  List<DuplicateCandidate> findExactDuplicates() {
    return const [
      DuplicateCandidate(groupId: 'g1', paths: ['photo_1.jpg', 'photo_1_copy.jpg']),
      DuplicateCandidate(groupId: 'g2', paths: ['screenshot.png', 'screenshot_copy.png']),
    ];
  }

  List<DuplicateCandidate> findSimilar({required double threshold}) {
    final random = Random(2);
    return List.generate(
      3,
      (index) => DuplicateCandidate(
        groupId: 'sim_$index',
        paths: ['image_${random.nextInt(100)}.jpg', 'image_${random.nextInt(100)}.jpg'],
      ),
    );
  }
}
