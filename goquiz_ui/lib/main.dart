import 'package:flutter/material.dart';
import 'package:goquiz_ui/constants/app_routes.dart';
import 'package:goquiz_ui/views/auth/login_screen.dart';
import 'package:goquiz_ui/views/auth/register_screen.dart';
import 'package:goquiz_ui/views/question/question_detail_screen.dart';
import 'package:goquiz_ui/views/question/question_form_screen.dart';
import 'package:goquiz_ui/views/quiz/quiz_detail_screen.dart';
import 'package:goquiz_ui/views/quiz/quiz_list_screen.dart';
import 'package:goquiz_ui/views/quiz/quiz_play_screen.dart';
import 'package:goquiz_ui/views/quiz/quiz_result_screen.dart';

import 'models/question.dart';
import 'models/quiz.dart';
import 'models/quiz_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.login:
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case AppRoutes.register:
            return MaterialPageRoute(builder: (context) => RegisterScreen());
          case AppRoutes.quizList:
            return MaterialPageRoute(
                builder: (context) => const QuizListScreen());
          case AppRoutes.quizDetail:
            return MaterialPageRoute(
                builder: (context) =>
                    QuizDetailScreen(quiz: settings.arguments as Quiz));
          case AppRoutes.questionForm:
            return MaterialPageRoute(builder: (context) {
              final args = settings.arguments as QuestionFormScreenArgs;
              return QuestionFormScreen(
                  quizID: args.quizID, question: args.question);
            });
          case AppRoutes.questionDetail:
            return MaterialPageRoute(
                builder: (context) => QuestionDetailScreen(
                    question: settings.arguments as Question));
          case AppRoutes.quizPlay:
            return MaterialPageRoute(
                builder: (context) =>
                    QuizPlayScreen(quiz: settings.arguments as Quiz));
          case AppRoutes.quizResult:
            return MaterialPageRoute(
                builder: (context) => QuizResultScreen(
                    quizResult: settings.arguments as QuizResult));
          default:
            return MaterialPageRoute(builder: (context) => LoginScreen());
        }
      },
    );
  }
}
