// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppPuzzles {
  static const _prefix = "assets/images/puzzle/";
  static final puzzle1 = PuzzleData(
    image: "${_prefix}image_1/image_1.png",
    name: "Ball",
    parts: List.generate(
      9,
      (index) => "${_prefix}image_1/image_1_${index + 1}.png",
    ),
  );

  static final puzzle2 = PuzzleData(
    image: "${_prefix}image_2/image_2.png",
    name: "Player",
    parts: List.generate(
      9,
      (index) => "${_prefix}image_2/image_2_${index + 1}.png",
    ),
  );

  static final puzzle3 = PuzzleData(
    image: "${_prefix}image_3/image_3.png",
    name: "Stadium",
    parts: List.generate(
      9,
      (index) => "${_prefix}image_3/image_3_${index + 1}.png",
    ),
  );

  static final puzzle4 = PuzzleData(
    image: "${_prefix}image_4/image_4.png",
    name: "Football uniform",
    parts: List.generate(
      9,
      (index) => "${_prefix}image_4/image_4_${index + 1}.png",
    ),
  );

  static final List<PuzzleData> puzzles = [
    puzzle1,
    puzzle2,
    puzzle3,
    puzzle4,
  ];
}

class PuzzleData {
  final String name;
  final String image;
  final List<String> parts;
  const PuzzleData({
    required this.name,
    required this.image,
    required this.parts,
  });
}
