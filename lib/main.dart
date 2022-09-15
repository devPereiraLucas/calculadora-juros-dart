import 'dart:io';
import './modules/calculadoraJuros.dart';
import './modules/Exceptions.dart';

void main() {
  String? userAction;
  const int jurosSimples = 1;
  const int jurosComposto = 2;
  const int sair = 3;

  var convertUserAction;

  do {
    print('-' * 20);
    print('Calculadora de juros'.toUpperCase());
    print('O que você deseja fazer? ');
    print('1: Para juros simples, 2: Para juros composto 3: Para sair');
    userAction = stdin.readLineSync();
    convertUserAction = int.parse(userAction!);

    switch (convertUserAction) {
      case jurosSimples:
        print('Vamos calcular o juros simples: ');

        print('Informe o valor de capital: ');
        String? inputCapital = stdin.readLineSync();

        print('Informe quantos meses será o tempo corrente desta aplicação: ');
        String? inputTempoDaAplicacao = stdin.readLineSync();

        print('Informe a taxa de juros: ');
        String? inputTaxaJuros = stdin.readLineSync();

        if (inputCapital == null ||
            inputTempoDaAplicacao == null ||
            inputTaxaJuros == null ||
            inputCapital.isEmpty ||
            inputTempoDaAplicacao.isEmpty ||
            inputTaxaJuros.isEmpty) {
          throw ValueException();
        }

        double capitalConvertido = double.parse(inputCapital);
        double tempoAplicacao = double.parse(inputTempoDaAplicacao);
        double taxaJuros = double.parse(inputTaxaJuros);
        double jurosTotal = calculadoraJuros.jurosSimples(
          capitalConvertido, taxaJuros, tempoAplicacao);
        double montanteTotal = capitalConvertido + jurosTotal;

        String? jurosTotalReal = jurosTotal.toStringAsFixed(2);
        String? montanteTotalReal = montanteTotal.toStringAsFixed(2);

        print('Durante um periodo de $tempoAplicacao meses, você acumulou $jurosTotalReal reais de juros, somando um montade de $montanteTotalReal reais.');
        break;
      case jurosComposto:
        print('Vamos calcular o juros composto: ');

        print('Informe o valor de capital: ');
        String? inputCapital = stdin.readLineSync();

        print('Informe quantos meses será o tempo corrente desta aplicação: ');
        String? inputTempoDaAplicacao = stdin.readLineSync();

        print('Informe a taxa de juros: ');
        String? inputTaxaJuros = stdin.readLineSync();

        if (inputCapital == null ||
            inputTempoDaAplicacao == null ||
            inputTaxaJuros == null ||
            inputCapital.isEmpty ||
            inputTempoDaAplicacao.isEmpty ||
            inputTaxaJuros.isEmpty) {
          throw ValueException();
        }

        double capitalConvertido = double.parse(inputCapital);
        double tempoAplicacao = double.parse(inputTempoDaAplicacao);
        double taxaJuros = double.parse(inputTaxaJuros);
        double jurosTotal = calculadoraJuros.jurosComposto(
          capitalConvertido, taxaJuros, tempoAplicacao);
        double montanteTotal = capitalConvertido + jurosTotal;

        String? jurosTotalReal = jurosTotal.toStringAsFixed(2);
        String? montanteTotalReal = montanteTotal.toStringAsFixed(2);

        print('Durante um periodo de $tempoAplicacao meses, você acumulou $jurosTotalReal reais de Juros, somando um montade de $montanteTotalReal reais.');
        break;
      case sair:
        print('Obrigado por usar a calculadora!');
        print('-' * 20);
        break;
    }
  } while (convertUserAction != 3);
}