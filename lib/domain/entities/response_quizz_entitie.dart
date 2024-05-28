import 'package:equatable/equatable.dart';

class ResponseQuizzEntitie extends Equatable{
    final int? responseCode;
    final List<Result>? results;

    const ResponseQuizzEntitie({
        this.responseCode,
        this.results,
    });
    
      @override
      List<Object?> get props => [
        responseCode,
results,
      ];

}

class Result extends Equatable{
    final String? type;
    final String? difficulty;
    final String? category;
    final String? question;
    final String? correctAnswer;
    final List<String>? incorrectAnswers;

    const Result({
        this.type,
        this.difficulty,
        this.category,
        this.question,
        this.correctAnswer,
        this.incorrectAnswers,
    });
    
      @override
      List<Object?> get props => [
        type,
      difficulty,
      category,
      question,
      correctAnswer,
      incorrectAnswers,
      ];


}

