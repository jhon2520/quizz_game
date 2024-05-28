import 'dart:convert';

class ResponseQuizzModelDomain {
    final int? responseCode;
    final List<Result>? results;

    ResponseQuizzModelDomain({
        this.responseCode,
        this.results,
    });

    ResponseQuizzModelDomain copyWith({
        int? responseCode,
        List<Result>? results,
    }) => 
        ResponseQuizzModelDomain(
            responseCode: responseCode ?? this.responseCode,
            results: results ?? this.results,
        );

    factory ResponseQuizzModelDomain.fromRawJson(String str) => ResponseQuizzModelDomain.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponseQuizzModelDomain.fromJson(Map<String, dynamic> json) => ResponseQuizzModelDomain(
        responseCode: json["response_code"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    final String? type;
    final String? difficulty;
    final String? category;
    final String? question;
    final String? correctAnswer;
    final List<String>? incorrectAnswers;

    Result({
        this.type,
        this.difficulty,
        this.category,
        this.question,
        this.correctAnswer,
        this.incorrectAnswers,
    });

    Result copyWith({
        String? type,
        String? difficulty,
        String? category,
        String? question,
        String? correctAnswer,
        List<String>? incorrectAnswers,
    }) => 
        Result(
            type: type ?? this.type,
            difficulty: difficulty ?? this.difficulty,
            category: category ?? this.category,
            question: question ?? this.question,
            correctAnswer: correctAnswer ?? this.correctAnswer,
            incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        type:json["type"],
        difficulty: json["difficulty"],
        category: json["category"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: json["incorrect_answers"] == null ? [] : List<String>.from(json["incorrect_answers"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "difficulty": difficulty,
        "category": category,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": incorrectAnswers == null ? [] : List<dynamic>.from(incorrectAnswers!.map((x) => x)),
    };
}

