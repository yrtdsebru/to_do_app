import 'app_localizations.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'To Do App';

  @override
  String get splashLogo => 'Catty ᓚᘏᗢ';

  @override
  String get langEng => 'English';

  @override
  String get langTr => 'Turkish';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get next => 'İleri';

  @override
  String get ok => 'Okey';

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String get delete => 'Delete';

  @override
  String get create => 'Create';

  @override
  String get registration => 'Registration';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get regAndSignIn => 'Register and Auto Sign In';
}
