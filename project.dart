import 'dart:io';

import 'castVote.dart';

List globaldata = [];

void main() {
  greettheuser();
  bool isbool = false;
  while (!isbool) {
    greettheuser();
    int userInput = int.parse(stdin.readLineSync()!);
    switch (userInput) {
      case 1:
        castVote(maindata: globaldata);
        break;
      case 2:
        seeCandidates();
        break;
      case 3:
        exit();
        isbool = true;
        break;
      default:
        print('Invalid option. Please enter 1, 2, or 3.');
    }
  }
}

class Voter {
  int? cnicNumber;
  int? dateOfBirth;
}

greettheuser() {
  print('\n');
  print('-*-*-*-*-*-*-*-*-* Welcome To Our Voting System -*-*-*-*-*-*-*-*-*');
  print('\n');
  print('Enter (1) To Cast your Vote');
  print('Enter (2) To See the Candidates');
  print('Enter (3) Exit');
}

seeCandidates() {
  print('-----------------------------------------------------');
  print('-----------------See The Candidates:----------------');
  print('-----------------------------------------------------');

  if (globaldata.isNotEmpty) {
  for (var candidate in globaldata) {
    print(
        '${candidate['name']} (${candidate['Candidate Symbol']}) - Votes: ${candidate['Votes']}');
  }
  
}
else{
  print('--First Cast Your Votes To see the Candidates:--');
}
}

declareWinner() {
  print('-----------------------------------------------------');
  print('-----------------Result Of Voting-----------------');
  print('-----------------------------------------------------');

  for (var candidate in globaldata) {
    if (candidate['Votes'] >= 3) {
      print(
          'Winner: ${candidate['name']} Symbol: (${candidate['Candidate Symbol']})');
      return;
    }
  }
  print('No candidate received more than 3 votes. No clear winner.');
}

exit() {
  print('Exiting the voting system. Thank you!');
}
