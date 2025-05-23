import 'dart:async'; // Import for Timer

import 'package:driving_license_exam/component/PreviousButton.dart';
import 'package:driving_license_exam/component/custompageroute.dart';
import 'package:driving_license_exam/component/nextbutton.dart';
import 'package:driving_license_exam/mock_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';

class MockExamDo extends StatefulWidget {
  final String source;
  final String selectedLanguage;
  const MockExamDo({
    super.key,
    required this.selectedLanguage,
    required this.source,
  });

  @override
  State<MockExamDo> createState() => _MockExamDoState();
}

class _MockExamDoState extends State<MockExamDo> {
  int selectedAnswer = -1;
  int currentQuestionIndex = 0;
  List<int> userAnswers = [];
  late List<Map<String, dynamic>> questions;
  bool showAnswer = false;
  bool _triggerAnimation = false;

  // Timer-related variables
  late Timer _timer;
  int _remainingSeconds = 60 * 60; // 49 minutes and 25 seconds in seconds
  bool _isTimeUp = false;

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initializeQuestions();
    userAnswers = List.filled(questions.length, -1);
    _startTimer();
    _initializeAudioPlayer();
  }

  void _initializeQuestions() {
    questions = [
      if (widget.selectedLanguage == 'English') ...[
        {
          'question': 'What does this traffic sign indicate?',
          'image': 'assets/images/exam.png',
          'audio': 'assets/audio/e1.mp3',
          'answers': [
            'Curve to right',
            'Joining a side road at right angles to the right',
            'Stop sign ahead',
            'Slippery road',
          ],
          'correctAnswer': 1,
        },
        {
          'question':
              'What should you do when approaching a red traffic light?',
          'image': 'assets/images/redligt.jpg',
          'audio': 'assets/audio/e2.mp3',
          'answers': [
            'Speed up to cross quickly',
            'Come to a complete stop',
            'Slow down but continue moving',
            'Ignore if no vehicles are coming',
          ],
          'correctAnswer': 1,
        },
        {
          'question':
              'What is the speed limit in urban areas unless otherwise posted?',
          'image': 'assets/images/exam.png',
          'audio': 'assets/audio/e3.mp3',
          'answers': [
            '40 km/h',
            '50 km/h',
            '60 km/h',
            '70 km/h',
          ],
          'correctAnswer': 1,
        },
      ],
      if (widget.selectedLanguage == 'Sinhala') ...[
        {
          'question': 'මෙම ගමනාගමන සංඥාවෙන් දැක්වෙන්නේ කුමක්ද?',
          'image': 'assets/images/exam.png',
          'audio': 'assets/audio/s1.mp3',
          'answers': [
            'දකුණට වක්‍රය',
            'දකුණට සෘජු කෝණවලින් පැත්තක මාර්ගයට එකතු වීම',
            'ඉදිරියේ නවත්වන සංඥාව',
            'ස්ලිප්පි මාර්ගය',
          ],
          'correctAnswer': 1,
        },
        {
          'question': 'රතු ගමනාගමන ආලෝකයකට ආසන්න වූ විට ඔබ කළ යුත්තේ කුමක්ද?',
          'image': 'assets/images/redligt.jpg',
          'audio': 'assets/audio/s2.mp3',
          'answers': [
            'වේගයෙන් ඉක්මවා යාමට වේගය ඉහළ නංවන්න',
            'සම්පූර්ණයෙන් නවතින්න',
            'මන්දගාමී වන නමුත් ගමන් කරන්න',
            'වාහන එනවා නොමැති නම් නොසලකා හරින්න',
          ],
          'correctAnswer': 1,
        },
        {
          'question':
              'වෙනත් ලෙස නියම කර නොමැති නම් නාගරික ප්‍රදේශවල වේග සීමාව කොපමණද?',
          'image': 'assets/images/exam.png',
          'audio': 'assets/audio/s3.mp3',
          'answers': [
            'පැයට කි.මී. 40',
            'පැයට කි.මී. 50',
            'පැයට කි.මී. 60',
            'පැයට කි.මී. 70',
          ],
          'correctAnswer': 1,
        },
      ],
      if (widget.selectedLanguage == 'Tamil') ...[
        {
          'question': 'இந்த போக்குவரத்து அடையாளம் எதைக் குறிக்கிறது?',
          'image': 'assets/images/exam.png',
          'audio': 'assets/audio/t1.mp3',
          'answers': [
            'வலதுபுறம் வளைவு',
            'வலதுபுறம் செங்கோணங்களில் ஒரு பக்க சாலையில் சேர்தல்',
            'முன்னே நிறுத்தும் அடையாளம்',
            'வழுக்கல் சாலை',
          ],
          'correctAnswer': 1,
        },
        {
          'question':
              'சிவப்பு போக்குவரத்து விளக்கை நெருங்கும்போது நீங்கள் என்ன செய்ய வேண்டும்?',
          'image': 'assets/images/redligt.jpg',
          'audio': 'assets/audio/t2.mp3',
          'answers': [
            'விரைவாக கடக்க வேகத்தை அதிகரிக்கவும்',
            'முழுமையாக நிறுத்தவும்',
            'மெதுவாக ஆனால் தொடர்ந்து நகரவும்',
            'வாகனங்கள் வரவில்லை என்றால் புறக்கணிக்கவும்',
          ],
          'correctAnswer': 1,
        },
        {
          'question':
              'வேறுவிதமாக குறிப்பிடப்படாவிட்டால் நகர்ப்புற பகுதிகளில் வேக வரம்பு என்ன?',
          'image': 'assets/images/exam.png',
          'audio': 'assets/audio/t3.mp3',
          'answers': [
            'மணிக்கு 40 கி.மீ',
            'மணிக்கு 50 கி.மீ',
            'மணிக்கு 60 கி.மீ',
            'மணிக்கு 70 கி.மீ',
          ],
          'correctAnswer': 1,
        },
      ],
    ];
  }

  void _initializeAudioPlayer() {
    _audioPlayer = AudioPlayer();
    _loadCurrentQuestionAudio();
  }

  Future<void> _loadCurrentQuestionAudio() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.setAsset(questions[currentQuestionIndex]['audio']);
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  void _toggleAudio() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      if (_audioPlayer.duration == null) {
        await _loadCurrentQuestionAudio();
      }
      await _audioPlayer.play();
    }
    setState(() {}); // Refresh UI to update icon
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        setState(() {
          _isTimeUp = true;
        });
        _navigateToResultScreen();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _navigateToResultScreen() {
    // Save the current answer before navigating
    if (selectedAnswer != -1) {
      userAnswers[currentQuestionIndex] = selectedAnswer;
    }

    Navigator.pushReplacement(
      context,
      createFadeRoute(MockResultScreen(
        totalQuestions: questions.length,
        correctAnswers: userAnswers
            .asMap()
            .entries
            .where(
                (entry) => entry.value == questions[entry.key]['correctAnswer'])
            .length,
        source: widget.source,
        userAnswers: userAnswers,
        questions: questions,
      )),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  void _goToNextQuestion() {
    setState(() {
      //  _triggerAnimation = !_triggerAnimation;
      if (_audioPlayer.playing) {
        _audioPlayer.pause();
      }
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (widget.source == 'StudyMaterials') {
        setState(() {
          if (!showAnswer) {
            showAnswer = true;
          } else {
            userAnswers[currentQuestionIndex] = selectedAnswer;
            if (currentQuestionIndex < questions.length - 1) {
              currentQuestionIndex++;
              selectedAnswer = userAnswers[currentQuestionIndex];
              showAnswer = false;
              _loadCurrentQuestionAudio();
            } else {
              showAnswer = false;
              _navigateToResultScreen();
            }
          }
        });
      } else {
        if (currentQuestionIndex < questions.length - 1) {
          setState(() {
            userAnswers[currentQuestionIndex] = selectedAnswer;
            currentQuestionIndex++;
            selectedAnswer = userAnswers[currentQuestionIndex];
            _loadCurrentQuestionAudio();
          });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/alert_exam.png'),
                      height: 100,
                    ),
                    SizedBox(height: 26),
                    Text("Attempt all answer"),
                  ],
                ),
                content:
                    const Text("Are you sure you want to submit your answers?"),
                actions: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF4378DB),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextButton(
                            child: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _navigateToResultScreen();
                            },
                          ),
                        ),
                        TextButton(
                          child: const Text("Cancel",
                              style: TextStyle(
                                  color: Color(0xFF4378DB),
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }
      }
    });
  }

  void _goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      if (_audioPlayer.playing) {
        _audioPlayer.pause();
      }
      setState(() {
        userAnswers[currentQuestionIndex] = selectedAnswer;
        currentQuestionIndex--;
        selectedAnswer = userAnswers[currentQuestionIndex];
        _loadCurrentQuestionAudio();
        _triggerAnimation = !_triggerAnimation;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final currentQuestion = questions[currentQuestionIndex];
    final isLastQuestion = currentQuestionIndex == questions.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF0C1A64),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            color: Color.fromARGB(179, 8, 0, 0), size: 18),
                        const SizedBox(width: 6),
                        const Text("Time Remaining :",
                            style:
                                TextStyle(color: Color.fromARGB(179, 0, 0, 0))),
                        const Spacer(),
                        Text(
                          _formatTime(_remainingSeconds),
                          style: const TextStyle(
                              color: Color(0xFF219EBC),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                            "Question ${currentQuestionIndex + 1}/${questions.length}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (currentQuestionIndex + 1) / questions.length,
                      minHeight: 8,
                      backgroundColor: const Color.fromARGB(60, 1, 1, 1),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                key: ValueKey(
                    'question-$currentQuestionIndex-$_triggerAnimation'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: _toggleAudio,
                                icon: Icon(
                                  _audioPlayer.playing
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                )),
                          ),
                          Text(currentQuestion['question'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (currentQuestion['image'] != null)
                      Center(
                        child: Image.asset(
                          currentQuestion['image'],
                          height: 100,
                        ),
                      ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Select the correct answer below:",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14)),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ).animate(
                key: ValueKey(
                    'question-$currentQuestionIndex-$_triggerAnimation'),
                effects: [
                  FadeEffect(
                    duration: 300.ms,
                    begin: 0.0,
                    end: 1.0,
                    curve: Curves.easeInOut,
                  ),
                  SlideEffect(
                    duration: 300.ms,
                    begin: const Offset(0, -0.1),
                    end: const Offset(0, 0),
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  key: ValueKey(
                      'answers-$currentQuestionIndex-$_triggerAnimation'),
                  itemCount: currentQuestion['answers'].length,
                  itemBuilder: (context, index) {
                    bool isCorrect = index == currentQuestion['correctAnswer'];
                    bool showIndicator =
                        showAnswer && widget.source == 'StudyMaterials';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedAnswer == index
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                        color: showIndicator && isCorrect
                            ? Colors.green.shade50
                            : showIndicator &&
                                    selectedAnswer == index &&
                                    !isCorrect
                                ? Colors.red.shade50
                                : selectedAnswer == index
                                    ? Colors.blue.shade50
                                    : Colors.white,
                      ),
                      child: RadioListTile<int>(
                        value: index,
                        groupValue: selectedAnswer,
                        onChanged: (value) {
                          if (!showAnswer ||
                              widget.source != 'StudyMaterials') {
                            setState(() {
                              selectedAnswer = value!;
                            });
                          }
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(currentQuestion['answers'][index]),
                            ),
                            if (showIndicator)
                              Icon(
                                isCorrect ? Icons.check : Icons.close,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                          ],
                        ),
                        activeColor: Colors.blue,
                      ),
                    );
                  },
                ).animate(
                  key: ValueKey(
                      'answers-$currentQuestionIndex-$_triggerAnimation'),
                  effects: [
                    FadeEffect(
                      duration: 300.ms,
                      begin: 0.0,
                      end: 1.0,
                      curve: Curves.easeInOut,
                    ),
                    SlideEffect(
                      duration: 300.ms,
                      begin: const Offset(0, -0.1),
                      end: const Offset(0, 0),
                      curve: Curves.easeInOut,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(
                    onPressed:
                        currentQuestionIndex > 0 ? _goToPreviousQuestion : null,
                  ),
                  NextButton(
                    onPressed: selectedAnswer != -1 ? _goToNextQuestion : null,
                    isLastQuestion: isLastQuestion,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
