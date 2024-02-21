import 'dart:io';

import 'project.dart';

castVote({maindata}) {
  print('Enter Your CNIC (13 digits)');
  String userCnic = stdin.readLineSync()!;
  int? parse = int.tryParse(userCnic);
  if (userCnic.toString().length == 13) {
    print('Enter the number for Candidate from (2-5)');
    int candidateNumber = int.parse(stdin.readLineSync()!);
    if (candidateNumber >= 2) {
      for (var i = 1; i <= candidateNumber; i++) {
        print('Enter the name for Candidate $i');
        String candidateName = stdin.readLineSync()!;
        List<String> candidateSymbol = ['!', '@', '#', '%', '&'];

        if (candidateName.isNotEmpty) {
          maindata.add({
            'name': candidateName,
            'Candidate Symbol': candidateSymbol[i - 1],
            'Votes': 0,
          });
        } else {
          print('Assign a Name to the Candidate');
        }
      }

      print('*-*-*-*-*-*-*----Candidates:*-*-*-*-*-*-*----');
      for (var candidate in maindata) {
        print(
            'Candidate Name: ${candidate['name']} : Symbol: (${candidate['Candidate Symbol']})');
      }

      for (var round = 1; round <= 3; round++) {
        print('Round $round: Enter the symbol of your chosen candidate:');
        String chosenSymbol = stdin.readLineSync()!;
        for (var candidate in maindata) {
          if (candidate['Candidate Symbol'] == chosenSymbol) {
            candidate['Votes']++;
            print('Your vote has been recorded for ${candidate['name']}');
            break;
          }
        }
      }
  } else if (parse == null) {
    print('Error: Enter Only an Integer Value');
  } else {
    print('Error: Enter a 13-digit CNIC number');
  }
    } else {
      print('Error: Enter a Value Greater Than or Equal to 2');
    }
  declareWinner();
}
