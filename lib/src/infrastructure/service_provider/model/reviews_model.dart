import 'dart:convert';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    this.reviews,
  });

  List<Review> reviews;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    this.id,
    this.workTitle,
    this.description,
    this.comments,
    this.workTodoImages,
    this.workDoneImages,
    this.rating,
  });

  int id;
  String workTitle;
  dynamic description;
  dynamic comments;
  dynamic workTodoImages;
  dynamic workDoneImages;
  dynamic rating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        workTitle: json["work_title"],
        description: json["description"],
        comments: json["comments"],
        workTodoImages: json["work_todo_images"],
        workDoneImages: json["work_done_images"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "work_title": workTitle,
        "description": description,
        "comments": comments,
        "work_todo_images": workTodoImages,
        "work_done_images": workDoneImages,
        "rating": rating,
      };
}
