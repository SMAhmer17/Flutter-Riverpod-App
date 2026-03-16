///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsImagesEn images = TranslationsImagesEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Flutter Riverpod Template'
	String get appName => 'Flutter Riverpod Template';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Error'
	String get error => 'Error';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get title => 'Home';

	/// en: 'Welcome to the App!'
	String get welcome => 'Welcome to the App!';

	/// en: 'Test Theme-Aware Assets'
	String get testAssets => 'Test Theme-Aware Assets';

	/// en: 'Senior Level Flutter Architecture'
	String get architecture => 'Senior Level Flutter Architecture';

	late final TranslationsHomeFeaturesEn features = TranslationsHomeFeaturesEn.internal(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'App Information'
	String get appInfo => 'App Information';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Build Number'
	String get buildNumber => 'Build Number';

	/// en: 'Package Name'
	String get packageName => 'Package Name';
}

// Path: images
class TranslationsImagesEn {
	TranslationsImagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Assets & Theme Check'
	String get title => 'Assets & Theme Check';

	/// en: 'This page verifies that assets correctly switch between Light and Dark mode variations based on the current theme.'
	String get description => 'This page verifies that assets correctly switch between Light and Dark mode variations based on the current theme.';

	/// en: 'Dynamic Icons (SVGs)'
	String get icons => 'Dynamic Icons (SVGs)';

	/// en: 'Dynamic Images'
	String get images => 'Dynamic Images';

	/// en: 'Visible Icon'
	String get visible => 'Visible Icon';

	/// en: 'Invisible Icon'
	String get invisible => 'Invisible Icon';

	/// en: 'App Logo / Primary Image'
	String get appLogo => 'App Logo / Primary Image';

	/// en: 'Toggle theme in Settings to see changes here'
	String get toggleHint => 'Toggle theme in Settings to see changes here';
}

// Path: home.features
class TranslationsHomeFeaturesEn {
	TranslationsHomeFeaturesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Riverpod State Management'
	String get riverpod => 'Riverpod State Management';

	/// en: 'Multi-language (slang)'
	String get i18n => 'Multi-language (slang)';

	/// en: 'GoRouter (Robust Routing)'
	String get router => 'GoRouter (Robust Routing)';

	/// en: 'Custom Theme Extensions'
	String get theme => 'Custom Theme Extensions';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appName' => 'Flutter Riverpod Template',
			'common.ok' => 'OK',
			'common.cancel' => 'Cancel',
			'common.error' => 'Error',
			'home.title' => 'Home',
			'home.welcome' => 'Welcome to the App!',
			'home.testAssets' => 'Test Theme-Aware Assets',
			'home.architecture' => 'Senior Level Flutter Architecture',
			'home.features.riverpod' => 'Riverpod State Management',
			'home.features.i18n' => 'Multi-language (slang)',
			'home.features.router' => 'GoRouter (Robust Routing)',
			'home.features.theme' => 'Custom Theme Extensions',
			'settings.title' => 'Settings',
			'settings.theme' => 'Theme',
			'settings.language' => 'Language',
			'settings.appInfo' => 'App Information',
			'settings.version' => 'Version',
			'settings.buildNumber' => 'Build Number',
			'settings.packageName' => 'Package Name',
			'images.title' => 'Assets & Theme Check',
			'images.description' => 'This page verifies that assets correctly switch between Light and Dark mode variations based on the current theme.',
			'images.icons' => 'Dynamic Icons (SVGs)',
			'images.images' => 'Dynamic Images',
			'images.visible' => 'Visible Icon',
			'images.invisible' => 'Invisible Icon',
			'images.appLogo' => 'App Logo / Primary Image',
			'images.toggleHint' => 'Toggle theme in Settings to see changes here',
			_ => null,
		};
	}
}
