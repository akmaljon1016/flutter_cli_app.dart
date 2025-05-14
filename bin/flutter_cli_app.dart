import 'package:args/args.dart';

void main(List<String> arguments) {
  // Create a parser for command-line arguments
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage information')
    ..addFlag('version', abbr: 'v', negatable: false, help: 'Show version information')
    ..addCommand('greet')
    ..addCommand('calculate');

  try {
    // Parse the arguments
    final results = parser.parse(arguments);

    // Handle help flag
    if (results['help']) {
      printUsage(parser);
      return;
    }

    // Handle version flag
    if (results['version']) {
      print('Flutter CLI App v1.0.0');
      return;
    }

    // Handle commands
    final command = results.command;
    if (command == null) {
      print('No command specified.');
      printUsage(parser);
      return;
    }

    switch (command.name) {
      case 'greet':
        greetCommand(command.rest);
        break;
      case 'calculate':
        calculateCommand(command.rest);
        break;
      default:
        print('Unknown command: ${command.name}');
        printUsage(parser);
    }
  } catch (e) {
    print('Error: $e');
    printUsage(parser);
  }
}

void printUsage(ArgParser parser) {
  print('Usage: flutter_cli_app [options] <command> [arguments]');
  print('Options:');
  print(parser.usage);
  print('Commands:');
  print('  greet     - Greet a person');
  print('  calculate - Perform a simple calculation');
  print('Examples:');
  print('  flutter_cli_app greet John');
  print('  flutter_cli_app calculate 5 + 3');
}

void greetCommand(List<String> args) {
  if (args.isEmpty) {
    print('Hello, World!');
  } else {
    print('Hello, ${args.join(' ')}!');
  }
}

void calculateCommand(List<String> args) {
  if (args.length != 3) {
    print('Usage: calculate <number> <operator> <number>');
    print('Supported operators: +, -, *, /');
    return;
  }

  final num1 = double.tryParse(args[0]);
  final operator = args[1];
  final num2 = double.tryParse(args[2]);

  if (num1 == null || num2 == null) {
    print('Invalid numbers provided');
    return;
  }

  double result;
  switch (operator) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 == 0) {
        print('Cannot divide by zero');
        return;
      }
      result = num1 / num2;
      break;
    default:
      print('Unsupported operator: $operator');
      return;
  }

  print('Result: $result');
}