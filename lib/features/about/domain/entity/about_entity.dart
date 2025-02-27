class AboutEntity {
  final String appTitle;
  final String appDescription;
  final String mission;
  final String vision;
  final Map<String, dynamic> contactInfo;
  final List<Map<String, dynamic>> socialMediaLinks;

  AboutEntity({
    required this.appTitle,
    required this.appDescription,
    required this.mission,
    required this.vision,
    required this.contactInfo,
    required this.socialMediaLinks,
  });
}
