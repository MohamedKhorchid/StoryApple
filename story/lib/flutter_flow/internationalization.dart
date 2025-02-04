import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
    String? esText = '',
  }) =>
      [frText, enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // homePage
  {
    'yo7r0zr6': {
      'fr': 'Story+',
      'en': 'Story+',
      'es': 'Historia+',
    },
    'tkkcjgay': {
      'fr': 'Découvrez des dizaines d\'histoires',
      'en': 'Discover dozens of stories',
      'es': 'Descubre decenas de historias',
    },
    'fvm56uwa': {
      'fr': 'Et de nouvelles histoires chaque semaine',
      'en': 'And new stories every week',
      'es': 'Y nuevas historias cada semana',
    },
    's6po6b47': {
      'fr': 'Catégories',
      'en': 'Categories',
      'es': 'Categorías',
    },
    'hhdkq33g': {
      'fr': 'Fantasy',
      'en': 'Fantasy',
      'es': 'Fantasía',
    },
    '1lw0eeth': {
      'fr': 'Mystère',
      'en': 'Mystery',
      'es': 'Misterio',
    },
    '122k8a38': {
      'fr': 'Enfant',
      'en': 'Child',
      'es': 'Niño',
    },
    'e9wiqjv1': {
      'fr': 'Aventure',
      'en': 'Adventure',
      'es': 'Aventura',
    },
    'gmhm7kdv': {
      'fr': 'Comédie',
      'en': 'Comedy',
      'es': 'Comedia',
    },
    '4rx91px1': {
      'fr': 'Horreur',
      'en': 'Horror',
      'es': 'Horror',
    },
    'rxofpbup': {
      'fr': 'Toutes les histoires',
      'en': 'All stories',
      'es': 'Todas las historias',
    },
    'mbty5woi': {
      'fr': 'Durée de lecture : ',
      'en': 'Reading time:',
      'es': 'Tiempo de lectura:',
    },
    'lhf9s8ei': {
      'fr': ' heures',
      'en': 'hours',
      'es': 'horas',
    },
  },
  // loginPage
  {
    'fib2wt5l': {
      'fr':
          'Pour les grands, pour les petits, dans le train ou chez vous : nous avons forcément l\'histoire que vous recherchez',
      'en':
          'For adults, for children, on the train or at home: we have the story you are looking for.',
      'es':
          'Para adultos, para niños, en el tren o en casa: tenemos la historia que estás buscando.',
    },
    'xw5i30vh': {
      'fr': 'Commencer à lire',
      'en': 'Start reading',
      'es': 'Empezar a leer',
    },
  },
  // fantasyPage
  {
    'p0dfmlbs': {
      'fr': 'Fantasy',
      'en': 'Fantasy',
      'es': 'Fantasía',
    },
    'l28pzi8b': {
      'fr':
          'Plongez dans des mondes magiques peuplés de créatures extraordinaires, de royaumes enchantés et de quêtes épiques. Découvrez des héros légendaires et des aventures captivantes.',
      'en':
          'Dive into magical worlds filled with extraordinary creatures, enchanted kingdoms, and epic quests. Discover legendary heroes and captivating adventures.',
      'es':
          'Sumérgete en mundos mágicos llenos de criaturas extraordinarias, reinos encantados y misiones épicas. Descubre héroes legendarios y aventuras cautivadoras.',
    },
    '89lslk1f': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    'o0xxbn9w': {
      'fr': ' heures de lecture',
      'en': 'hours of reading',
      'es': 'Horas de lectura',
    },
    'v3i72011': {
      'fr': 'Les Portes du Temps',
      'en': 'The Doors of Time',
      'es': 'Las puertas del tiempo',
    },
    'seds9e5q': {
      'fr': 'Fantasy • 30 min de lecture',
      'en': 'Fantasy • 30 min read',
      'es': 'Fantasía • 30 min de lectura',
    },
    '8ibrs3a7': {
      'fr':
          'Un ancien grimoire révèle l\'existence de passages secrets permettant de voyager entre les époques...',
      'en':
          'An ancient grimoire reveals the existence of secret passages allowing travel between eras...',
      'es':
          'Un antiguo grimorio revela la existencia de pasadizos secretos que permiten viajar entre eras...',
    },
    'paqegv20': {
      'fr': 'La Forêt des Murmures',
      'en': 'The Whispering Forest',
      'es': 'El bosque susurrante',
    },
    'rb4gr4nl': {
      'fr': 'Fantasy • 20 min de lecture',
      'en': 'Fantasy • 20 min read',
      'es': 'Fantasía • 20 min de lectura',
    },
    '8m6bf3ut': {
      'fr':
          'Au cœur d\'une forêt enchantée, les arbres parlent une langue oubliée que seule une jeune elfe peut comprendre...',
      'en':
          'In the heart of an enchanted forest, the trees speak a forgotten language that only a young elf can understand...',
      'es':
          'En el corazón de un bosque encantado, los árboles hablan un idioma olvidado que sólo un joven elfo puede entender...',
    },
    'tntyzvix': {
      'fr': 'L\'Épée des Anciens',
      'en': 'The Sword of the Ancients',
      'es': 'La espada de los antiguos',
    },
    'yhkukoxs': {
      'fr': 'Fantasy • 35 min de lecture',
      'en': 'Fantasy • 35 min read',
      'es': 'Fantasía • 35 min de lectura',
    },
    'a58jwhic': {
      'fr':
          'Une prophétie millénaire annonce le retour d\'un héros capable de manier l\'épée légendaire des premiers rois...',
      'en':
          'A thousand-year-old prophecy announces the return of a hero capable of wielding the legendary sword of the first kings...',
      'es':
          'Una profecía milenaria anuncia el regreso de un héroe capaz de empuñar la legendaria espada de los primeros reyes...',
    },
  },
  // storyPage
  {
    'h80wvk2m': {
      'fr': 'heures de lecture',
      'en': 'hours of reading',
      'es': 'Horas de lectura',
    },
    'mq10lfd6': {
      'fr': 'Chapitres',
      'en': 'Chapters',
      'es': 'Capítulos',
    },
    'e1xsj3in': {
      'fr': 'Durée : ',
      'en': 'Duration :',
      'es': 'Duración :',
    },
    '0qriscz7': {
      'fr': ' minutes',
      'en': 'minutes',
      'es': 'minutos',
    },
    '858jb68f': {
      'fr': 'Chapitre 2: Le Message Céleste',
      'en': 'Chapter 2: The Heavenly Message',
      'es': 'Capítulo 2: El mensaje celestial',
    },
    'afmrgxn9': {
      'fr': 'Durée: 10 minutes',
      'en': 'Duration: 10 minutes',
      'es': 'Duración: 10 minutos',
    },
    '6gsjlxir': {
      'fr': 'Chapitre 3: La Constellation Cachée',
      'en': 'Chapter 3: The Hidden Constellation',
      'es': 'Capítulo 3: La constelación oculta',
    },
    'fso2w3rr': {
      'fr': 'Durée: 7 minutes',
      'en': 'Duration: 7 minutes',
      'es': 'Duración: 7 minutos',
    },
    '00kua23o': {
      'fr': 'Chapitre 4: Les Gardiens du Ciel',
      'en': 'Chapter 4: The Guardians of Heaven',
      'es': 'Capítulo 4: Los guardianes del cielo',
    },
    '27lsizsx': {
      'fr': 'Durée: 12 minutes',
      'en': 'Duration: 12 minutes',
      'es': 'Duración: 12 minutos',
    },
  },
  // readingPage
  {
    'sm1wty9z': {
      'fr': 'Page Précédente',
      'en': 'Previous Page',
      'es': 'Página anterior',
    },
    'hxtl7nj7': {
      'fr': 'Page Suivante',
      'en': 'Next Page',
      'es': 'Página siguiente',
    },
  },
  // mysteryPage
  {
    '7wtd242j': {
      'fr': 'Mystère',
      'en': 'Mystery',
      'es': 'Misterio',
    },
    '6h9d82dn': {
      'fr':
          'Explorez des énigmes captivantes et des secrets bien gardés. Suivez des détectives astucieux et résolvez des affaires intrigantes qui défient l\'imagination.',
      'en':
          'Explore captivating puzzles and well-kept secrets. Follow clever detectives and solve intriguing cases that defy imagination.',
      'es':
          'Explora rompecabezas cautivadores y secretos bien guardados. Sigue a detectives inteligentes y resuelve casos intrigantes que desafían la imaginación.',
    },
    'xloochw8': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    '9t57hnao': {
      'fr': ' heures de lecture',
      'en': 'hours of reading',
      'es': 'Horas de lectura',
    },
    '6pt39j47': {
      'fr': 'Les Portes du Temps',
      'en': 'The Doors of Time',
      'es': 'Las puertas del tiempo',
    },
    'csi6ap8h': {
      'fr': 'Fantasy • 30 min de lecture',
      'en': 'Fantasy • 30 min read',
      'es': 'Fantasía • 30 min de lectura',
    },
    'ilye3x10': {
      'fr':
          'Un ancien grimoire révèle l\'existence de passages secrets permettant de voyager entre les époques...',
      'en':
          'An ancient grimoire reveals the existence of secret passages allowing travel between eras...',
      'es':
          'Un antiguo grimorio revela la existencia de pasadizos secretos que permiten viajar entre eras...',
    },
    'uyusfyf8': {
      'fr': 'La Forêt des Murmures',
      'en': 'The Whispering Forest',
      'es': 'El bosque susurrante',
    },
    'xwnqopgk': {
      'fr': 'Fantasy • 20 min de lecture',
      'en': 'Fantasy • 20 min read',
      'es': 'Fantasía • 20 min de lectura',
    },
    'khnq59wt': {
      'fr':
          'Au cœur d\'une forêt enchantée, les arbres parlent une langue oubliée que seule une jeune elfe peut comprendre...',
      'en':
          'In the heart of an enchanted forest, the trees speak a forgotten language that only a young elf can understand...',
      'es':
          'En el corazón de un bosque encantado, los árboles hablan un idioma olvidado que sólo un joven elfo puede entender...',
    },
    'fh3pznww': {
      'fr': 'L\'Épée des Anciens',
      'en': 'The Sword of the Ancients',
      'es': 'La espada de los antiguos',
    },
    'gcbgctuf': {
      'fr': 'Fantasy • 35 min de lecture',
      'en': 'Fantasy • 35 min read',
      'es': 'Fantasía • 35 min de lectura',
    },
    'xb2r0509': {
      'fr':
          'Une prophétie millénaire annonce le retour d\'un héros capable de manier l\'épée légendaire des premiers rois...',
      'en':
          'A thousand-year-old prophecy announces the return of a hero capable of wielding the legendary sword of the first kings...',
      'es':
          'Una profecía milenaria anuncia el regreso de un héroe capaz de empuñar la legendaria espada de los primeros reyes...',
    },
  },
  // childPage
  {
    'cutu2pl6': {
      'fr': 'Enfant',
      'en': 'Child',
      'es': 'Niño',
    },
    'n6i0nau6': {
      'fr':
          'Des histoires pleines de magie, de valeurs et d’amusement pour les jeunes lecteurs. Idéal pour rêver avant de dormir ou pour apprendre tout en s’amusant.',
      'en':
          'Stories full of magic, values and fun for young readers. Ideal for dreaming before going to sleep or for learning while having fun.',
      'es':
          'Historias llenas de magia, valores y diversión para los pequeños lectores. Ideal para soñar antes de dormir o para aprender mientras se divierte.',
    },
    'vra15br1': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    'pf0ed09o': {
      'fr': ' heures de lectures',
      'en': 'hours of reading',
      'es': 'Horas de lectura',
    },
    '8lqlp94u': {
      'fr': 'Les Portes du Temps',
      'en': 'The Doors of Time',
      'es': 'Las puertas del tiempo',
    },
    'd796s89g': {
      'fr': 'Fantasy • 30 min de lecture',
      'en': 'Fantasy • 30 min read',
      'es': 'Fantasía • 30 min de lectura',
    },
    '7valibi2': {
      'fr':
          'Un ancien grimoire révèle l\'existence de passages secrets permettant de voyager entre les époques...',
      'en':
          'An ancient grimoire reveals the existence of secret passages allowing travel between eras...',
      'es':
          'Un antiguo grimorio revela la existencia de pasadizos secretos que permiten viajar entre eras...',
    },
    '7itipqhe': {
      'fr': 'La Forêt des Murmures',
      'en': 'The Whispering Forest',
      'es': 'El bosque susurrante',
    },
    'ja5xebkn': {
      'fr': 'Fantasy • 20 min de lecture',
      'en': 'Fantasy • 20 min read',
      'es': 'Fantasía • 20 min de lectura',
    },
    '6mnjdf37': {
      'fr':
          'Au cœur d\'une forêt enchantée, les arbres parlent une langue oubliée que seule une jeune elfe peut comprendre...',
      'en':
          'In the heart of an enchanted forest, the trees speak a forgotten language that only a young elf can understand...',
      'es':
          'En el corazón de un bosque encantado, los árboles hablan un idioma olvidado que sólo un joven elfo puede entender...',
    },
    'm36i0xlj': {
      'fr': 'L\'Épée des Anciens',
      'en': 'The Sword of the Ancients',
      'es': 'La espada de los antiguos',
    },
    'uslqgi9i': {
      'fr': 'Fantasy • 35 min de lecture',
      'en': 'Fantasy • 35 min read',
      'es': 'Fantasía • 35 min de lectura',
    },
    'xmepjcaa': {
      'fr':
          'Une prophétie millénaire annonce le retour d\'un héros capable de manier l\'épée légendaire des premiers rois...',
      'en':
          'A thousand-year-old prophecy announces the return of a hero capable of wielding the legendary sword of the first kings...',
      'es':
          'Una profecía milenaria anuncia el regreso de un héroe capaz de empuñar la legendaria espada de los primeros reyes...',
    },
  },
  // adventurePage
  {
    'pf2w01dh': {
      'fr': 'Aventure',
      'en': 'Adventure',
      'es': 'Aventura',
    },
    'yrx1skc1': {
      'fr':
          'Embarquez pour des périples palpitants remplis de défis, de découvertes et de héros courageux. Idéal pour les amateurs d’action et de sensations fortes.',
      'en':
          'Embark on thrilling journeys filled with challenges, discoveries and courageous heroes. Ideal for lovers of action and thrills.',
      'es':
          'Embárcate en emocionantes viajes llenos de desafíos, descubrimientos y héroes valientes. Ideal para los amantes de la acción y la emoción.',
    },
    'w6hkug1v': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    '6a79c12j': {
      'fr': ' heures de lecture',
      'en': 'hours of reading',
      'es': 'Horas de lectura',
    },
    'wgxslacm': {
      'fr': 'Les Portes du Temps',
      'en': 'The Doors of Time',
      'es': 'Las puertas del tiempo',
    },
    'agrtht8o': {
      'fr': 'Fantasy • 30 min de lecture',
      'en': 'Fantasy • 30 min read',
      'es': 'Fantasía • 30 min de lectura',
    },
    'pucklk2o': {
      'fr':
          'Un ancien grimoire révèle l\'existence de passages secrets permettant de voyager entre les époques...',
      'en':
          'An ancient grimoire reveals the existence of secret passages allowing travel between eras...',
      'es':
          'Un antiguo grimorio revela la existencia de pasadizos secretos que permiten viajar entre eras...',
    },
    'f95s27zy': {
      'fr': 'La Forêt des Murmures',
      'en': 'The Whispering Forest',
      'es': 'El bosque susurrante',
    },
    '3jmo4obo': {
      'fr': 'Fantasy • 20 min de lecture',
      'en': 'Fantasy • 20 min read',
      'es': 'Fantasía • 20 min de lectura',
    },
    'vcnihlx0': {
      'fr':
          'Au cœur d\'une forêt enchantée, les arbres parlent une langue oubliée que seule une jeune elfe peut comprendre...',
      'en':
          'In the heart of an enchanted forest, the trees speak a forgotten language that only a young elf can understand...',
      'es':
          'En el corazón de un bosque encantado, los árboles hablan un idioma olvidado que sólo un joven elfo puede entender...',
    },
    'fb90epyo': {
      'fr': 'L\'Épée des Anciens',
      'en': 'The Sword of the Ancients',
      'es': 'La espada de los antiguos',
    },
    '5xr9qh3z': {
      'fr': 'Fantasy • 35 min de lecture',
      'en': 'Fantasy • 35 min read',
      'es': 'Fantasía • 35 min de lectura',
    },
    '7kt98fow': {
      'fr':
          'Une prophétie millénaire annonce le retour d\'un héros capable de manier l\'épée légendaire des premiers rois...',
      'en':
          'A thousand-year-old prophecy announces the return of a hero capable of wielding the legendary sword of the first kings...',
      'es':
          'Una profecía milenaria anuncia el regreso de un héroe capaz de empuñar la legendaria espada de los primeros reyes...',
    },
  },
  // comedyPage
  {
    'bkybgvpc': {
      'fr': 'Comédie',
      'en': 'Comedy',
      'es': 'Comedia',
    },
    'iv322dok': {
      'fr':
          'Des histoires légères et amusantes pour vous faire sourire et rire. Découvrez des situations cocasses et des personnages hilarants.',
      'en':
          'Light and funny stories to make you smile and laugh. Discover funny situations and hilarious characters.',
      'es':
          'Historias ligeras y divertidas que te harán sonreír y reír. Descubre situaciones divertidas y personajes divertidísimos.',
    },
    '6tpux0tn': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    'ppe139z1': {
      'fr': ' heures de lecture',
      'en': 'hours of reading',
      'es': 'Horas de lectura',
    },
    's8dz3quv': {
      'fr': 'Les Portes du Temps',
      'en': 'The Doors of Time',
      'es': 'Las puertas del tiempo',
    },
    'anvwe779': {
      'fr': 'Fantasy • 30 min de lecture',
      'en': 'Fantasy • 30 min read',
      'es': 'Fantasía • 30 min de lectura',
    },
    'm4aankkp': {
      'fr':
          'Un ancien grimoire révèle l\'existence de passages secrets permettant de voyager entre les époques...',
      'en':
          'An ancient grimoire reveals the existence of secret passages allowing travel between eras...',
      'es':
          'Un antiguo grimorio revela la existencia de pasadizos secretos que permiten viajar entre eras...',
    },
    '6ru6ngzh': {
      'fr': 'La Forêt des Murmures',
      'en': 'The Whispering Forest',
      'es': 'El bosque susurrante',
    },
    '5qbc88lq': {
      'fr': 'Fantasy • 20 min de lecture',
      'en': 'Fantasy • 20 min read',
      'es': 'Fantasía • 20 min de lectura',
    },
    '3u0pa5gk': {
      'fr':
          'Au cœur d\'une forêt enchantée, les arbres parlent une langue oubliée que seule une jeune elfe peut comprendre...',
      'en':
          'In the heart of an enchanted forest, the trees speak a forgotten language that only a young elf can understand...',
      'es':
          'En el corazón de un bosque encantado, los árboles hablan un idioma olvidado que sólo un joven elfo puede entender...',
    },
    '8aywbren': {
      'fr': 'L\'Épée des Anciens',
      'en': 'The Sword of the Ancients',
      'es': 'La espada de los antiguos',
    },
    'a95vp61j': {
      'fr': 'Fantasy • 35 min de lecture',
      'en': 'Fantasy • 35 min read',
      'es': 'Fantasía • 35 min de lectura',
    },
    'skfokgx5': {
      'fr':
          'Une prophétie millénaire annonce le retour d\'un héros capable de manier l\'épée légendaire des premiers rois...',
      'en':
          'A thousand-year-old prophecy announces the return of a hero capable of wielding the legendary sword of the first kings...',
      'es':
          'Una profecía milenaria anuncia el regreso de un héroe capaz de empuñar la legendaria espada de los primeros reyes...',
    },
  },
  // horrorPage
  {
    'dqr06dfe': {
      'fr': 'Horreur',
      'en': 'Horror',
      'es': 'Horror',
    },
    'y34i44g5': {
      'fr':
          'Préparez-vous à frissonner avec des récits effrayants et sombres. Plongez dans des histoires où monstres, fantômes et phénomènes inexplicables vous tiendront en haleine.',
      'en':
          'Get ready to shiver with scary and dark tales. Dive into stories where monsters, ghosts and inexplicable phenomena will keep you on the edge of your seat.',
      'es':
          'Prepárate para emocionarte con historias oscuras y aterradoras. Sumérgete en historias donde monstruos, fantasmas y fenómenos inexplicables te mantendrán al borde del asiento.',
    },
    '84wb6per': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    'c44cx6qd': {
      'fr': ' heures de lecture',
      'en': 'hours of reading',
      'es': 'Horas de lectura',
    },
    'oiyl2a4o': {
      'fr': 'Les Portes du Temps',
      'en': 'The Doors of Time',
      'es': 'Las puertas del tiempo',
    },
    'jm8clsbe': {
      'fr': 'Fantasy • 30 min de lecture',
      'en': 'Fantasy • 30 min read',
      'es': 'Fantasía • 30 min de lectura',
    },
    '93dabg43': {
      'fr':
          'Un ancien grimoire révèle l\'existence de passages secrets permettant de voyager entre les époques...',
      'en':
          'An ancient grimoire reveals the existence of secret passages allowing travel between eras...',
      'es':
          'Un antiguo grimorio revela la existencia de pasadizos secretos que permiten viajar entre eras...',
    },
    'xyr7cd7l': {
      'fr': 'La Forêt des Murmures',
      'en': 'The Whispering Forest',
      'es': 'El bosque susurrante',
    },
    'sdufnr76': {
      'fr': 'Fantasy • 20 min de lecture',
      'en': 'Fantasy • 20 min read',
      'es': 'Fantasía • 20 min de lectura',
    },
    'yg07f7qg': {
      'fr':
          'Au cœur d\'une forêt enchantée, les arbres parlent une langue oubliée que seule une jeune elfe peut comprendre...',
      'en':
          'In the heart of an enchanted forest, the trees speak a forgotten language that only a young elf can understand...',
      'es':
          'En el corazón de un bosque encantado, los árboles hablan un idioma olvidado que sólo un joven elfo puede entender...',
    },
    'kf414962': {
      'fr': 'L\'Épée des Anciens',
      'en': 'The Sword of the Ancients',
      'es': 'La espada de los antiguos',
    },
    'b3kkubd1': {
      'fr': 'Fantasy • 35 min de lecture',
      'en': 'Fantasy • 35 min read',
      'es': 'Fantasía • 35 min de lectura',
    },
    'lgdmb55u': {
      'fr':
          'Une prophétie millénaire annonce le retour d\'un héros capable de manier l\'épée légendaire des premiers rois...',
      'en':
          'A thousand-year-old prophecy announces the return of a hero capable of wielding the legendary sword of the first kings...',
      'es':
          'Una profecía milenaria anuncia el regreso de un héroe capaz de empuñar la legendaria espada de los primeros reyes...',
    },
  },
  // favoritePage
  {
    'swfwt538': {
      'fr': 'Favoris',
      'en': 'Favorites',
      'es': 'Favoritos',
    },
    'wohlbp11': {
      'fr':
          'Retrouvez ici toutes vos histoires préférées, sauvegardées pour une lecture facile et rapide.',
      'en':
          'Find all your favorite stories here, saved for quick and easy reading.',
      'es':
          'Encuentra aquí todas tus historias favoritas, guardadas para una lectura rápida y sencilla.',
    },
    'zgar1pc0': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    '0gqkb5e5': {
      'fr': ' minutes de lecture',
      'en': 'minutes of reading',
      'es': 'minutos de lectura',
    },
    'ixyfcgba': {
      'fr': 'Les Aventures de Luna',
      'en': 'The Adventures of Luna',
      'es': 'Las aventuras de Luna',
    },
    '2dig9n97': {
      'fr': 'Aventure',
      'en': 'Adventure',
      'es': 'Aventura',
    },
    'igs89c4r': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    'xq95iasl': {
      'fr': '40',
      'en': '40',
      'es': '40',
    },
    'hdr5u7d3': {
      'fr': ' minutes de lecture',
      'en': 'minutes of reading',
      'es': 'minutos de lectura',
    },
    'qp3aja4i': {
      'fr':
          'Luna, une petite chatte curieuse, part à la découverte du monde avec son ami Robot-Z. Ensemble, ils vivent des aventures extraordinaires et apprennent l\'importance de l\'amitié...',
      'en':
          'Luna, a curious little cat, sets off to discover the world with her friend Robot-Z. Together, they live extraordinary adventures and learn the importance of friendship...',
      'es':
          'Luna, una gatita curiosa, se lanza a descubrir el mundo junto a su amigo Robot-Z. Juntos, viven aventuras extraordinarias y aprenden la importancia de la amistad...',
    },
    'dvmjmh6x': {
      'fr': 'Le Trésor des Étoiles',
      'en': 'The Treasure of the Stars',
      'es': 'El tesoro de las estrellas',
    },
    'skhrr9v4': {
      'fr': 'Science-Fiction',
      'en': 'Science Fiction',
      'es': 'Ciencia ficción',
    },
    'j0wrl30s': {
      'fr': ' • ',
      'en': '•',
      'es': '•',
    },
    'cvt0gbia': {
      'fr': '35',
      'en': '35',
      'es': '35',
    },
    '74p1b769': {
      'fr': ' minutes de lecture',
      'en': 'minutes of reading',
      'es': 'minutos de lectura',
    },
    'io1v0lz5': {
      'fr':
          'À bord de son vaisseau spatial en forme d\'étoile filante, Tom part à la recherche d\'un trésor légendaire caché quelque part dans la galaxie...',
      'en':
          'Aboard his shooting star-shaped spaceship, Tom sets off in search of a legendary treasure hidden somewhere in the galaxy...',
      'es':
          'A bordo de su nave espacial con forma de estrella fugaz, Tom parte en busca de un tesoro legendario escondido en algún lugar de la galaxia...',
    },
  },
  // notationPage
  {
    'i3yhozu9': {
      'fr': 'Vous aimez notre app ?',
      'en': 'Do you like our app?',
      'es': '¿Te gusta nuestra aplicación?',
    },
    'qoo1m0wz': {
      'fr':
          'Votre avis compte. Prenez un instant pour noter l\'application et nous aider à nous améliorer.',
      'en':
          'Your opinion matters. Take a moment to rate the app and help us improve.',
      'es':
          'Tu opinión importa. Tómese un momento para calificar la aplicación y ayúdenos a mejorar.',
    },
    '872pp0of': {
      'fr': 'Noter sur l\'App Store',
      'en': 'Rate on the App Store',
      'es': 'Calificar en la App Store',
    },
    'eqsnh3qm': {
      'fr': 'Noter sur Google Play',
      'en': 'Rate on Google Play',
      'es': 'Calificar en Google Play',
    },
  },
  // Miscellaneous
  {
    'nvvus0g1': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'm1qf4hrn': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'l87thk41': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'vly92w2a': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'wlitbbix': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '0z6w5nc3': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '5yhnobwj': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'mkk4ta9f': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'f8782sr5': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'x23itpbd': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'p7nherk0': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'zv6do7gr': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'qrk3g92f': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'qq87hoya': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '0olr2hie': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'wntdy86q': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'r9b2uxhj': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'hxm1neoh': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '2k3wrkab': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'zrvm5zmb': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'cta172nf': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'wjwsnyg5': {
      'fr': '',
      'en': '',
      'es': '',
    },
    'tgkn0d2j': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '2pzyf61s': {
      'fr': '',
      'en': '',
      'es': '',
    },
    '4d7c9cla': {
      'fr': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
