import 'dart:math';

class calculadoraJuros {
  static late double _juros;

  static double jurosSimples(double capital, double taxa, double tempo) {
    var taxaConvetida = taxa / 100;
    _juros = capital * taxaConvetida * tempo;
    return _juros;
  }

  static double jurosComposto(double capital, double taxa, double tempo) {
    var taxaConvetida = taxa / 100;
    double? taxaMaisUm = taxaConvetida + 1;
    double? montanteCalculado = capital * pow(taxaMaisUm, tempo);
    double? jurosCalculado = montanteCalculado - capital;
    _juros = jurosCalculado;
    return _juros;
  }
} 