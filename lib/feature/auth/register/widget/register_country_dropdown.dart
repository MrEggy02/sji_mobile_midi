import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final String? selectedCountry;
  final Function(String?) onChanged;

  const CountryDropdown({
    super.key,
    required this.selectedCountry,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> countries = [
      'United States of America',
      'United Kingdom of Great Britain and Northern Ireland',
      'Canada',
      'Commonwealth of Australia',
      'Kingdom of Thailand',
      'Republic of Singapore',
      'Japan',
      'Republic of Korea',
      'Federal Republic of Germany',
      'French Republic',
      'Lao People\'s Democratic Republic',
      'Republic of India',
      'People\'s Republic of China',
      'Russian Federation',
      'Federative Republic of Brazil',
      'Republic of South Africa',
      'Italian Republic',
      'Kingdom of Spain',
      'Kingdom of the Netherlands',
      'Swiss Confederation',
      'Kingdom of Belgium',
      'Republic of the Philippines',
      'Republic of Indonesia',
      'United Mexican States',
      'Argentine Republic',
      'Arab Republic of Egypt',
      'Republic of Türkiye',
      'Kingdom of Saudi Arabia',
      'United Arab Emirates',
      'New Zealand',
      'Other'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            "COUNTRY",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[50],
            border: Border.all(
              color: Colors.grey[200]!,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              value: selectedCountry,
              isExpanded: true,
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down_rounded, color: Color(0xFF2D1B69)),
              hint: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Select your country',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              items: countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      country,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2D1B69),
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}