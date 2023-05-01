import 'package:flutter/material.dart';
import 'package:untitled1/question_model.dart';
import 'package:untitled1/score_screen.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List <QuestionModel> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,


           children:  [
             const Text('Simple quiz app',style: TextStyle(
               fontSize: 20,
               color: Colors.white
             ),),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:  [
                  Text('Question ${currentQuestionIndex+1} / ${questionList.length.toString()}',style: const TextStyle(
                     fontSize: 18,
                     color: Colors.white
                 ),),
                 const SizedBox(
                   height: 15,
                 ),
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height*0.15,

                   decoration: BoxDecoration(
                     color:Colors.orangeAccent,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child:  Center(child: Text(questionList[currentQuestionIndex].questionText,style: const TextStyle(
                     color: Colors.white,
                     fontSize: 25
                   ),)),

                 ),

               ],
             ),
             Column(
               children:  [
                 _answerList(),
                 _nextButton(),



                 /*Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height*0.07,

                   decoration: BoxDecoration(
                     color:Colors.white,
                     borderRadius: BorderRadius.circular(30),
                   ),
                   child:   Center(child: Text(questionList[currentQuestionIndex].answerList[1].toString(),style:const  TextStyle(
                       color: Colors.black,
                       fontSize: 25
                   ),)),


                 ),
                 const SizedBox(
                   height: 15,
                 ),
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height*0.07,

                   decoration: BoxDecoration(
                     color:Colors.white,
                     borderRadius: BorderRadius.circular(30),
                   ),
                   child:  const Center(child: Text('مصر',style: TextStyle(
                       color: Colors.black,
                       fontSize: 25
                   ),)),


                 ),
                 const SizedBox(
                   height: 15,
                 ),
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height*0.07,

                   decoration: BoxDecoration(
                     color:Colors.white,
                     borderRadius: BorderRadius.circular(30),
                   ),
                   child:  const Center(child: Text('مصر',style: TextStyle(
                       color: Colors.black,
                       fontSize: 25
                   ),)),


                 ),
                 const SizedBox(
                   height: 15,
                 ),
                 Container(
                   width: double.infinity,
                   height: MediaQuery.of(context).size.height*0.07,

                   decoration: BoxDecoration(
                     color:Colors.white,
                     borderRadius: BorderRadius.circular(30),
                   ),
                   child:  const Center(child: Text('مصر',style: TextStyle(
                       color: Colors.black,
                       fontSize: 25
                   ),)),


                 ),*/

               ],
             ),


           ],
          ),
        ),
      ),
    );
  }
  _answerList(){
   return Column(
     children: questionList[currentQuestionIndex].answerList.map((e) => _answerButton(e)).toList(),
   );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.orangeAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }
  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: (){
          if(isLastQuestion){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ScoreScreen(score)));
          }else{
          setState(() {
          selectedAnswer = null;
          currentQuestionIndex++;
          });
          }
        },
      ),
    );
  }
}
