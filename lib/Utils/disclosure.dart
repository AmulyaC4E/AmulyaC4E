import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProminentDisclosure extends StatefulWidget {
  const ProminentDisclosure({super.key});

  @override
  State<ProminentDisclosure> createState() => _ProminentDisclosureState();
}

class _ProminentDisclosureState extends State<ProminentDisclosure> {
  bool accepted = false;
  Future<void>? _launched;

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(
          // headers: <String, String>{'my_header_key': 'my_header_value'}
          ),
    )) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Prominent Disclosure",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Privacy Policy",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Boutique&Beautique app is a commercial app by Care 4 Edu Solutions Pvt Ltd. This page is used to inform visitors regarding our policies with the collection, use, sharing and disclosure of Personal Information for anyone using the app and website of Boutique&Beautique. By using Boutique&Beautique, you consent to the terms of our privacy policy ('Privacy Policy') in addition to our Terms of Service. We encourage you to read this Privacy Policy regarding the collection, use, sharing and disclosure of your information from time to time to keep yourself updated with the changes that we make to this Privacy Policy.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Personal Identification Information",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Identification Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                TextButton(
                  onPressed: () {
                    final Uri deleteLaunch =
                        Uri.parse('https://privacy-policy-bnb.care4edu.com/');
                    setState(() {
                      _launched = _launchInWebViewOrVC(deleteLaunch);
                    });
                  },
                  child: const Text("https://privacy-policy-bnb.care4edu.com/"),
                ),
                const SizedBox(height: 5),
                Text(
                  "The personal information you provide on Care 4 Edu Platform when you fill out your profile will be available for all the users who use our application such as your name, location, gender, profilepicture, education and professional info including where you are working. This is hereinafter called UserProfile. Your userProfile will be available on our app.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We may collect Personal Identification Information of users including the information that is available on the internet, such as from Facebook, LinkedIn, Twitter and Google, or Userly available information that we acquire from service consultants. We collect this information to identify users for better communication, processing and personalization of the Services provided by Boutique&Beautique.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Usage and Technical Information",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We may collect the information about how you interact with our Service. This information may include your geographical location.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Information Collection",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "For a better experience, while using our Service, you are required to provide us with certain personally identifiable information for your UserProfile, including but not limited to:",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 5),
                // Text(
                //   "\u2022 Identity information, such as your first name, last name, gender, date of birth, username;",
                //   style: Theme.of(context).textTheme.labelMedium,
                //   textAlign: TextAlign.start,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "\u2022 Identity information,",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text:
                              " such as your first name, last name, gender, date of birth, username.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // Text(
                //   "\u2022 Contact information, such as your mobile number, postal address, email address and telephone number;",
                //   style: Theme.of(context).textTheme.labelMedium,
                //   textAlign: TextAlign.start,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "\u2022 Contact information,",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text:
                              " such as your mobile number, postal address, email address and telephone number.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // Text(
                //   "\u2022 Professional information, such as your education, work experience, skills, photo, city, area and other relevant details. Professional information helps you to get more from our Services. ",
                //   style: Theme.of(context).textTheme.labelMedium,
                //   textAlign: TextAlign.start,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "\u2022 Professional information,",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text:
                              " such as your education, work experience, skills, photo, city, area and other relevant details. Professional information helps you to get more from our Services.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // Text(
                //   " \u2022 Feedback and correspondence, such as information you provide when you respond to surveys, participate in market research activities, report a problem with Service, receive customer support or otherwise correspond with us;",
                //   style: Theme.of(context).textTheme.labelMedium,
                //   textAlign: TextAlign.start,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "\u2022 Feedback and correspondence,",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text:
                              " such as information you provide when you respond to surveys, participate in market research activities, report a problem with Service, receive customer support or otherwise correspond with us.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // Text(
                //   "\u2022 Usage information, such as information about how you use the Service and interact with us; and",
                //   style: Theme.of(context).textTheme.titleMedium,
                //   textAlign: TextAlign.start,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "\u2022 Usage information,",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text:
                              " such as information about how you use the Service and interact with us.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "\u2022 Marketing information,",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text:
                              "such as your preferences for receiving marketing communications and details about how you engage with them.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  "Boutique&Beautique Platform’s mission is to connect learner and consultant. We are committed to be transparent about the data we collect about you, how it is used and with whom it is shared.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  "When you use the services of our customers and consultants, such as employers or prospective employers, we share your UserProfile (e.g., your name, email, phone number etc) with consultantsto enable you to get classes/webinars.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  "What information we collect",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Location Information.",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "When you give location permission, we access information that is derived from your GPS. We may use third-party cookies and similar technologies to collect some of this information.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Storage.",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "When you opt-in for storage permission, we access your device storage like gallery photos, documents like pdf, docx etc.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Camera.",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Granting camera permission allows us to access the photo that you click to be displayed on yourprofle.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Microphone.",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Voice and audio information when you use audio features.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Feedback & Correspondence.",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Such as information you provide when you respond to survey’s participate in market research activities, report a problem with service, receive customer support or otherwise correspond with us.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "How we use information?",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Location Information.",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "\u2022 Why we are using precise location?",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "To provide you with location-based services like finding consultants near you, we will collect your location coordinates and calculate distance from your location to consultant’s location to provide proper service.",
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "\u2022 Storage.",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.start,
                    "To allow you to select your profile picture from your existing photos in the gallery and to upload required documents like educational qualifications, professional certifications etc. for completion of your registration on our Boutique&Beautique App",
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "To effectively provide and introduce any new Services to you, we collect and use certain information, including, but not limited to, such as:",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We may use your email id to send younotifications on upcoming webinars/classes.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We receive data from your devices including location data to find the best available consultants in and around your location.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We may further request and store additional information.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "To communicate directly with you, including by sending you information about new courses, offers and services.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "How we protect your information?",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We adopt appropriate data collection, storage and processing practices and security measures to protect against unauthorized access, alteration, disclosure or destruction of your personal information, username, password, transaction information and data stored on our app. The data is stored securely on our servers - https://care4edu.com",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  "Sharing your personal information",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We do not sell, trade, or rent users personal identification information to any third party. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "The app does use third-party services that may collect information used to identify you.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Link to privacy policy of third-party service consultantsused by the app",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    final Uri googleLaunch =
                        Uri.parse('https://policies.google.com/privacy');
                    setState(() {
                      _launched = _launchInWebViewOrVC(googleLaunch);
                    });
                  },
                  child: const Text("Google play services"),
                ),
                // TextButton(
                //   onPressed: () {
                //     final Uri ccAvenue =
                //         Uri.parse('https://www.ccavenue.com/privacy.jsp');
                //     setState(() {
                //       _launched = _launchInWebViewOrVC(ccAvenue);
                //     });
                //   },
                //   child: const Text("CCAvenue"),
                // ),
                // TextButton(
                //   onPressed: () {
                //     final Uri razorPay =
                //         Uri.parse('https://razorpay.com/privacy/');
                //     setState(() {
                //       _launched = _launchInWebViewOrVC(razorPay);
                //     });
                //   },
                //   child: const Text("Razor Pay"),
                // ),
                TextButton(
                  onPressed: () {
                    final Uri phonepe =
                        Uri.parse('https://www.phonepe.com/terms-conditions/');
                    setState(() {
                      _launched = _launchInWebViewOrVC(phonepe);
                    });
                  },
                  child: const Text("Phone Pe"),
                ),

                TextButton(
                  onPressed: () {
                    final Uri fireBase = Uri.parse(
                        'https://firebase.google.com/support/privacy/');
                    setState(() {
                      _launched = _launchInWebViewOrVC(fireBase);
                    });
                  },
                  child: const Text("Firebase"),
                ),
                Text(
                  "We do not disclose, transfer or share your personal information with others except with:",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Our affiliates, group companies, consultants and verified institutesto the extent required for our internal business and/or administrative purposes and/or general corporate operations and for provision of services.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Third parties including enforcement, regulatory and judicial authorities, if we determine that disclosure of your personal information is required to a) respond to court orders, or legal process, or to establish or exercise our legal rights or defend against legal claims or b) investigate, prevent, or take action regarding illegal activities, suspected fraud, situations involving potential threats to the physical safety of any person, violations of our Terms of Service or as otherwise required by law.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "In the event of a merger, acquisition, financing, or sale of assets or any other situation involving the transfer of some or all of our business assets we may disclose personal information to those involved in the negotiation or transfer.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Third service consultants and marketing partners that we engage to a provide services over the Platform on our behalf b) maintain the Platform and mailing lists or c) communicate with you on our behalf about offers relating to its products and/or services. We will take reasonable steps to ensure that these third-party service consultantsare obligated to protect your personal information and are also subject to appropriate confidentiality / non-disclosure obligations.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "You, hereby agree and acknowledge that you will use the information shared with you only for the purpose of the Services. You shall not use such information for any personal or other business purposes. In the event you are found to be misusing the information shared with you, we shall, at our sole discretion, delete your account with immediate effect and you will be blocked from using/ accessing Boutique&BeautiquePlatform in future.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Log Data",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Whenever you use our Service, including our sites, app and platform technology, such as when you view or click on content or perform a search, install or update one of our mobile apps, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as log-ins, cookies, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics to identify you and log your use.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Cookies/Cache",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Cookies/Cacheare files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "This Service does not use these 'cookies' explicitly. However, the app may use third party code and libraries that use 'cookies' to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Service Consultants",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We may employ third-party companies and individuals due to the following reasons:",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "To facilitate our Service, toprovide the Service on our behalf, To perform Service-related services, or To assist us in analyzing how our Service is used. We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use theinformation for any other purpose.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Geo Location",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Our Geo Location policy prioritizes the responsible handling of user's geolocation data to enhance their experience while safeguarding their privacy. We leverage geolocation data in several ways: firstly, to connect users with nearby service consultants like tutors, trainers, and consultants. Additionally, this data ensures that search results are tailored to user's geographical regions, allowing them to discover services available in their vicinity. Geolocation assists in refining search outcomes by proximity, simplifying the process of finding suitable service consultants. Moreover, stored geolocation information is used for verifying user's locations when they engage with services, fostering transparency and building trust. For those interested in webinars, geolocation confirms eligibility based on the region.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We prioritize user consent and control over their data. We obtain explicit permission to access geolocation data, granting users the choice to approve or decline this access at any time. Users also have the autonomy to manage location permissions for the app through their device settings. To ensure data security, we implement robust measures such as encryption and secure storage on our servers. Adhering to industry standards, we employ advanced security protocols to prevent unauthorized access, use, or disclosure of geolocation data.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Respecting user's privacy is paramount. We refrain from sharing precise geolocation data with third parties without user's consent, except when required by law. In terms of data retention, we retain geolocation data only as long as necessary to deliver requested services and comply with relevant laws. We acknowledge the potential for policy updates and commit to transparency throughout. If we make substantial changes to this Geo Location Policy, we will promptly notify users and obtain their consent if mandated by law. This comprehensive policy underscores our dedication to responsibly utilizing geolocation data to enhance user experiences while ensuring their privacy and control remain intact.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Payment",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "You’ll honor your payment obligations and you are okay with us storing your payment information. You understand that there may be fees and taxes that are added to our prices.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Refunds are subject to our",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),

                Text(
                  "If you buy any of our paid Services (“Premium Services”), you agree to pay us the applicable fees and taxes and to additional terms specific to the paid Services. Failure to pay these fees will result in the termination of your paid Services. Also, you agree that:",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "If you purchase a subscription, your payment method automatically will be charged at the start of each subscription period for the fees and taxes applicable to that period. ",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We may calculate taxes payable by you based on the billing information that you provide us at the time of purchase.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "You can get a copy of your invoice through your Boutique&Beautiqueaccount settings under “SubscriptionDetails”.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "One-to-one messages/Feedback",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Boutique&Beautique has access to the one-to-one feedbackof users of the app and we review these messages periodically for moderation of trust and safety related concerns. However, Boutique&Beautique never shares this data with any third-party.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Security",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Links to Other Sites",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Children's Privacy",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "These Services do not address anyone under the age of 18. We do not knowingly collect personally identifiable information from children under 18. In the case we discover that a child under 18has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "No Impersonation or False Information to be provided",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "You have to use your actual name on the Platform, you are required to input your correct phone number to use our Services. You will be getting services based on Boutique&Beautique account. You will not falsely represent yourself as another person or representative of another person to use our Services. You will not under any circumstancesfalsify your information.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Trust and Safety",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Boutique&Beautique takes the trust and safety all its users seriously. We do not allow content that promotes abuse, fraud, MLM/network marketing, job openings that charge fees, suicide, self-harm, or is intended to shock or disgust users. Strict action is taken against such content and with people posting such messages/content in the group.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "To ensure the best possible experience for all the users of the app, we have established some basic guidelines called the Community Guidelines. The Community Guidelines gets updated periodically. You will be notified when this happens.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "\nDisclaimer",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Boutique&Beautique does not hold any responsibility for any incident, fraud, cheat or crime that may happen to any users. We advise you to check and verify information of other users before proceeding with any transactions or interaction among users. Also, do not share your private information on group, to prevent the use of such information for any un-safe purposes.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Changes to This Privacy Policy",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We may notnotify you of any changes about the new Privacy Policy on this page. These changes are effective immediately after they are posted on website/app.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Have a complaint/concern ",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "In accordance with Information Technology Act 2000 and rules made under, the name and contact details of the Grievance Officer who can be contacted with respect to any complaints or concerns including those pertaining to breach of Boutique&Beautique’s Terms of Use, Privacy Policy and other polices or questions are published as under: ",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Grievance Email address: contact@care4edu.com ",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  "Office can be contacted between 9:00AM to 5:00PM from Monday to Friday except on public holidays. Email -contact@care4edu.com",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                TextButton(
                  onPressed: () {
                    final Uri c4eTerms = Uri.parse(
                        'https://privacy-policy-bnb.care4edu.com/Termsofuse.html');
                    setState(() {
                      _launched = _launchInWebViewOrVC(c4eTerms);
                    });
                  },
                  child: const Text("Terms of use"),
                ),
                const SizedBox(height: 10),
                Text(
                  "By accepting you agree to our terms of use, privacy policy & Payment - Refund policy",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                )
              ],
            );
  }
}