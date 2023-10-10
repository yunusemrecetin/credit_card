enum Flavor {
  dev,
  beta,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev So Like App';
      case Flavor.beta:
        return 'Beta So Like App';
      case Flavor.prod:
        return 'So Like App';
      default:
        return 'title';
    }
  }
}
