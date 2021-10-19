import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/models/country_model.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/test/test_helper.dart';
import 'package:demoapp/UI/commons/InternationalPhoneInput/utils/util.dart';
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';

/// Creates a list of Countries with a search textfield.
class CountrySearchListWidget extends StatefulWidget {
  final List<Country> countries;
  final InputDecoration? searchBoxDecoration;
  final String? locale;
  final ScrollController? scrollController;
  final bool autoFocus;
  final bool? showFlags;
  final bool? useEmoji;

  const CountrySearchListWidget(this.countries, this.locale,
      {Key? key, this.searchBoxDecoration,
        this.scrollController,
        this.showFlags,
        this.useEmoji,
        this.autoFocus = false}) : super(key: key);

  @override
  _CountrySearchListWidgetState createState() =>
      _CountrySearchListWidgetState();
}

class _CountrySearchListWidgetState extends State<CountrySearchListWidget> {
  final TextEditingController _searchController = TextEditingController();
  late List<Country> filteredCountries;

  @override
  void initState() {
    filteredCountries = filterCountries();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Returns [InputDecoration] of the search box
  InputDecoration getSearchBoxDecoration() {



    return widget.searchBoxDecoration ??
        const InputDecoration(labelText: 'Search by country name or dial code');
  }

  /// Filters the list of Country by text from the search box.
  List<Country> filterCountries() {
    final value = _searchController.text.trim();

    if (value.isNotEmpty) {
      return widget.countries
          .where(
            (Country country) =>
        country.countryCode!
            .toLowerCase()
            .startsWith(value.toLowerCase()) ||
            country.name!.toLowerCase().contains(value.toLowerCase()) ||
            getCountryName(country)!
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            country.phoneCode!.contains(value.toLowerCase()),
      )
          .toList();
    }

    return widget.countries;
  }

  /// Returns the country name of a [Country]. if the locale is set and translation in available.
  /// returns the translated name.
  String? getCountryName(Country country) {

    GetStorage getStorage = GetStorage();

    String? currentLocale = getStorage.read(StorageConstants.LanguageLocaleCode);

    if(currentLocale != null) {
      if(currentLocale == "en") {
        return country.name;
      } else {
        return country.nameAr;
      }
    } else {
      return country.name;
    }

    /*if (widget.locale != null && country.name != null) {
      String? translated = country.name!*//*[widget.locale!]*//*;
      if (translated.isNotEmpty) {
        return translated;
      }
    }
    return country.name;*/
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            key: const Key(TestHelper.CountrySearchInputKeyValue),
            decoration: getSearchBoxDecoration(),
            controller: _searchController,
            autofocus: widget.autoFocus,
            onChanged: (value) =>
                setState(() => filteredCountries = filterCountries()),
          ),
        ),
        Flexible(
          child: ListView.builder(
            controller: widget.scrollController,
            shrinkWrap: true,
            itemCount: filteredCountries.length,
            itemBuilder: (BuildContext context, int index) {
              Country country = filteredCountries[index];
              return ListTile(
                key: Key(TestHelper.countryItemKeyValue(country.countryCode)),
                leading: widget.showFlags!
                    ? _Flag(country: country, useEmoji: widget.useEmoji)
                    : null,
                title: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('${getCountryName(country)}',
                        textAlign: TextAlign.start)),
                subtitle: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(country.phoneCode ?? '',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start)),
                onTap: () => Navigator.of(context).pop(country),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

class _Flag extends StatelessWidget {
  final Country? country;
  final bool? useEmoji;

  const _Flag({Key? key, this.country, this.useEmoji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return country != null
        ? Container(
      child: useEmoji!
          ? Text(
        Utils.generateFlagEmojiUnicode(country?.phoneCode ?? ''),
        style: Theme.of(context).textTheme.headline5,
      )
          : country?.countryCode != null
          ? CircleAvatar(
        backgroundImage: AssetImage(
          'assets/flags/${country?.countryCode!.toLowerCase()}.png',
          /*package: 'intl_phone_number_input',*/
        ),
      )
          : const SizedBox.shrink(),
    )
        : const SizedBox.shrink();
  }
}