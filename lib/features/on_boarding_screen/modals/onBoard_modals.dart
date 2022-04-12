class OnBoardModals {
  String? image;
  String? title;
  String? description;

  // String? description1;
  // String? description2;
  // String? description3;

  OnBoardModals({
    this.image,
    this.title,
    this.description,
    // this.description1,
    // this.description2,
    // this.description3,
  });
}

List<OnBoardModals> onBoardingList = [
  OnBoardModals(
    image: "assets/onbording_1.png",
    title: "هذا النص هو مثال لنص يمكن أن يستبدل ",
    description:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضا",
  ),
  OnBoardModals(
    image: "assets/onbording_2.png",
    title: "هذا النص هو مثال لنص يمكن أن يستبدل ",
    description:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضا",
  ),
];
