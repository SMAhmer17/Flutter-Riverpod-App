///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonFr common = _TranslationsCommonFr._(_root);
	@override late final _TranslationsHomeFr home = _TranslationsHomeFr._(_root);
	@override late final _TranslationsSettingsFr settings = _TranslationsSettingsFr._(_root);
	@override late final _TranslationsImagesFr images = _TranslationsImagesFr._(_root);
}

// Path: common
class _TranslationsCommonFr extends TranslationsCommonEn {
	_TranslationsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Modèle Flutter Riverpod';
	@override String get ok => 'OK';
	@override String get cancel => 'Annuler';
	@override String get error => 'Erreur';
}

// Path: home
class _TranslationsHomeFr extends TranslationsHomeEn {
	_TranslationsHomeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accueil';
	@override String get welcome => 'Bienvenue dans l\'application !';
	@override String get testAssets => 'Tester les ressources thématiques';
	@override String get architecture => 'Architecture Flutter de niveau senior';
	@override late final _TranslationsHomeFeaturesFr features = _TranslationsHomeFeaturesFr._(_root);
}

// Path: settings
class _TranslationsSettingsFr extends TranslationsSettingsEn {
	_TranslationsSettingsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override String get theme => 'Thème';
	@override String get language => 'Langue';
	@override String get appInfo => 'Informations sur l\'application';
	@override String get version => 'Version';
	@override String get buildNumber => 'Numéro de build';
	@override String get packageName => 'Nom du package';
}

// Path: images
class _TranslationsImagesFr extends TranslationsImagesEn {
	_TranslationsImagesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vérification des ressources et du thème';
	@override String get description => 'Cette page vérifie que les ressources basculent correctement entre les variations des modes clair et sombre en fonction du thème actuel.';
	@override String get icons => 'Icônes dynamiques (SVGs)';
	@override String get images => 'Images dynamiques';
	@override String get visible => 'Icône visible';
	@override String get invisible => 'Icône invisible';
	@override String get appLogo => 'Logo de l\'application / Image principale';
	@override String get toggleHint => 'Basculez le thème dans les paramètres pour voir les changements ici';
}

// Path: home.features
class _TranslationsHomeFeaturesFr extends TranslationsHomeFeaturesEn {
	_TranslationsHomeFeaturesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get riverpod => 'Gestion d\'état avec Riverpod';
	@override String get i18n => 'Multilingue (slang)';
	@override String get router => 'GoRouter (Routage Robuste)';
	@override String get theme => 'Extensions de thème personnalisées';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appName' => 'Modèle Flutter Riverpod',
			'common.ok' => 'OK',
			'common.cancel' => 'Annuler',
			'common.error' => 'Erreur',
			'home.title' => 'Accueil',
			'home.welcome' => 'Bienvenue dans l\'application !',
			'home.testAssets' => 'Tester les ressources thématiques',
			'home.architecture' => 'Architecture Flutter de niveau senior',
			'home.features.riverpod' => 'Gestion d\'état avec Riverpod',
			'home.features.i18n' => 'Multilingue (slang)',
			'home.features.router' => 'GoRouter (Routage Robuste)',
			'home.features.theme' => 'Extensions de thème personnalisées',
			'settings.title' => 'Paramètres',
			'settings.theme' => 'Thème',
			'settings.language' => 'Langue',
			'settings.appInfo' => 'Informations sur l\'application',
			'settings.version' => 'Version',
			'settings.buildNumber' => 'Numéro de build',
			'settings.packageName' => 'Nom du package',
			'images.title' => 'Vérification des ressources et du thème',
			'images.description' => 'Cette page vérifie que les ressources basculent correctement entre les variations des modes clair et sombre en fonction du thème actuel.',
			'images.icons' => 'Icônes dynamiques (SVGs)',
			'images.images' => 'Images dynamiques',
			'images.visible' => 'Icône visible',
			'images.invisible' => 'Icône invisible',
			'images.appLogo' => 'Logo de l\'application / Image principale',
			'images.toggleHint' => 'Basculez le thème dans les paramètres pour voir les changements ici',
			_ => null,
		};
	}
}
