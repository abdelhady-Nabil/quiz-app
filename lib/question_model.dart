class QuestionModel{
  late final  String questionText ;
  late final List <Answer> answerList;
  
 QuestionModel(this.questionText,this.answerList);
}

class Answer{
  late final  String answerText ;
  late final  bool isCorrect ;
  
  Answer(this.answerText,this.isCorrect);
  
}

List<QuestionModel>getQuestion(){
  List<QuestionModel> list =[];
  list.add(
      QuestionModel(
          'how old are you ? ',
          [
            Answer('18', false),
            Answer('20', true),
            Answer('22', false),
            Answer('24', false),
          ]),
  );
  list.add(
    QuestionModel(
        'when you born ? ',
        [
          Answer('2003', true),
          Answer('2000', true),
          Answer('2005', false),
          Answer('2001', false),
        ]),
  );
  list.add(
    QuestionModel(
        'how are you ? ',
        [
          Answer('i fine', false),
          Answer('abdo', false),
          Answer('welcome', true),
          Answer('no', true),
        ]),
  );

  return list;
}