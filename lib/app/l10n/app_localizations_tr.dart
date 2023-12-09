import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'To Do App';

  @override
  String get langEng => 'İngilizce';

  @override
  String get langTr => 'Türkçe';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'Hayır';

  @override
  String get next => 'İler';

  @override
  String get ok => 'Tamam';

  @override
  String get cancel => 'İptal';

  @override
  String get add => 'Ekle';

  @override
  String get update => 'Güncelle';

  @override
  String get delete => 'Sil';

  @override
  String get create => 'Oluştur';
}
