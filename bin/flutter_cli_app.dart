// import 'package:args/args.dart';
//
// void main(List<String> arguments) {
//   // Create a parser for command-line arguments
//   final parser = ArgParser()
//     ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage information')
//     ..addFlag('version', abbr: 'v', negatable: false, help: 'Show version information')
//     ..addCommand('greet')
//     ..addCommand('calculate');
//
//   try {
//     // Parse the arguments
//     final results = parser.parse(arguments);
//
//     // Handle help flag
//     if (results['help']) {
//       printUsage(parser);
//       return;
//     }
//
//     // Handle version flag
//     if (results['version']) {
//       print('Flutter CLI App v1.0.0');
//       return;
//     }
//
//     // Handle commands
//     final command = results.command;
//     if (command == null) {
//       print('No command specified.');
//       printUsage(parser);
//       return;
//     }
//
//     switch (command.name) {
//       case 'greet':
//         greetCommand(command.rest);
//         break;
//       case 'calculate':
//         calculateCommand(command.rest);
//         break;
//       default:
//         print('Unknown command: ${command.name}');
//         printUsage(parser);
//     }
//   } catch (e) {
//     print('Error: $e');
//     printUsage(parser);
//   }
// }
//
// void printUsage(ArgParser parser) {
//   print('Usage: flutter_cli_app [options] <command> [arguments]');
//   print('Options:');
//   print(parser.usage);
//   print('Commands:');
//   print('  greet     - Greet a person');
//   print('  calculate - Perform a simple calculation');
//   print('Examples:');
//   print('  flutter_cli_app greet John');
//   print('  flutter_cli_app calculate 5 + 3');
// }
//
// void greetCommand(List<String> args) {
//   if (args.isEmpty) {
//     print('Hello, World!');
//   } else {
//     print('Hello, ${args.join(' ')}!');
//   }
// }
//
// void calculateCommand(List<String> args) {
//   if (args.length != 3) {
//     print('Usage: calculate <number> <operator> <number>');
//     print('Supported operators: +, -, *, /');
//     return;
//   }
//
//   final num1 = double.tryParse(args[0]);
//   final operator = args[1];
//   final num2 = double.tryParse(args[2]);
//
//   if (num1 == null || num2 == null) {
//     print('Invalid numbers provided');
//     return;
//   }
//
//   double result;
//   switch (operator) {
//     case '+':
//       result = num1 + num2;
//       break;
//     case '-':
//       result = num1 - num2;
//       break;
//     case '*':
//       result = num1 * num2;
//       break;
//     case '/':
//       if (num2 == 0) {
//         print('Cannot divide by zero');
//           return;
//       }
//       result = num1 / num2;
//       break;
//     default:
//       print('Unsupported operator: $operator');
//       return;
//   }
//   print('Result: $result');
// }

//-------------------------------------------------------

/*import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '71cebbb6a951490da9008193bdac6928'; // Replace with your OpenWeatherMap API key

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Usage: weather_cli <city>');
    exit(1);
  }

  final city = arguments.join(' ');
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q= $city&appid=$apiKey&units=metric');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final temperature = data['main']['temp'];
      final description = data['weather'][0]['description'];

      print('\n🌤️ Weather in $city:');
      print('🌡️ Temperature: $temperature°C');
      print('📝 Description: $description\n');
    } else {
      print('❌ Failed to get weather data. Check city name or API key.');
      print('Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  } catch (e) {
    print('⚠️ An error occurred: $e');
  }
}
*/
import 'dart:io';

void main() {
  final dir = Directory('lib');
  final files = dir.listSync(recursive: true, followLinks: false);

  for (final entity in files) {
    if (entity is File && entity.path.endsWith('.dart')) {
      processFile(entity);
    }
  }
}

void processFile(File file) {
  final content = file.readAsStringSync();
  final updatedContent = content.replaceAll("Text('Refresh')", "Text('Yangilash')");

  if (content != updatedContent) {
    print('✅ Updated: ${file.path}');
    file.writeAsStringSync(updatedContent);
  }
}