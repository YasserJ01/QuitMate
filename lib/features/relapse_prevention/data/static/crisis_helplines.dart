/// Static, offline crisis helpline data.
///
/// These are hardcoded strings — no network requests, no API calls.
/// Displayed on the [HelpSafetyScreen] which is accessible without
/// authentication per SRS §15.
class CrisisHelpline {
  final String countryFlag;
  final String countryCode;
  final String organizationName;
  final String phoneNumber; // null if web-only
  final String? websiteUrl; // display only, no in-app browser
  final bool isSmsLine;

  const CrisisHelpline({
    required this.countryFlag,
    required this.countryCode,
    required this.organizationName,
    required this.phoneNumber,
    this.websiteUrl,
    this.isSmsLine = false,
  });
}

/// All crisis helplines displayed on the Help & Safety screen.
const kCrisisHelplines = <CrisisHelpline>[
  // ── USA ──────────────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇺🇸',
    countryCode: 'US',
    organizationName: 'SAMHSA National Helpline',
    phoneNumber: '1-800-662-4357',
  ),
  CrisisHelpline(
    countryFlag: '🇺🇸',
    countryCode: 'US',
    organizationName: 'Crisis Text Line',
    phoneNumber: '741741',
    isSmsLine: true,
  ),
  CrisisHelpline(
    countryFlag: '🇺🇸',
    countryCode: 'US',
    organizationName: '988 Suicide & Crisis Lifeline',
    phoneNumber: '988',
  ),

  // ── UK ───────────────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇬🇧',
    countryCode: 'GB',
    organizationName: 'Samaritans',
    phoneNumber: '116 123',
  ),

  // ── Australia ────────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇦🇺',
    countryCode: 'AU',
    organizationName: 'Lifeline Australia',
    phoneNumber: '13 11 14',
  ),

  // ── Canada ───────────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇨🇦',
    countryCode: 'CA',
    organizationName: 'Crisis Services Canada',
    phoneNumber: '1-833-456-4566',
  ),

  // ── Germany ──────────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇩🇪',
    countryCode: 'DE',
    organizationName: 'Telefonseelsorge',
    phoneNumber: '0800 111 0 111',
  ),

  // ── France ───────────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇫🇷',
    countryCode: 'FR',
    organizationName: 'SOS Amitié',
    phoneNumber: '09 72 39 40 50',
  ),

  // ── Netherlands ──────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇳🇱',
    countryCode: 'NL',
    organizationName: '113 Zelfmoordpreventie',
    phoneNumber: '0800-0113',
  ),

  // ── India ────────────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🇮🇳',
    countryCode: 'IN',
    organizationName: 'iCall Helpline',
    phoneNumber: '9152987821',
  ),

  // ── International ────────────────────────────────────────────────────────
  CrisisHelpline(
    countryFlag: '🌍',
    countryCode: 'INT',
    organizationName: 'Find A Helpline (web directory)',
    phoneNumber: '',
    websiteUrl: 'findahelpline.com',
  ),
];