import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/view/page/service_page.dart';

// Define the FAQItem class
class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

// Define the TestimonialBox widget
class TestimonialBox extends StatelessWidget {
  final String text;

  const TestimonialBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      width: 250, // Adjust the width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Verified TheraNest Therapy client',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// Define the HomeView widget
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FAQItem> faqs = [
      FAQItem(
        question: 'What is TheraNest Therapy?',
        answer: 'TheraNest Therapy is an online therapy platform that provides access to licensed therapists for mental health support and counseling.',
      ),
      FAQItem(
        question: 'How can online therapy improve my life?',
        answer: 'Online therapy can improve your life by providing convenient access to professional support, allowing you to address mental health concerns from the comfort of your own home, and offering a range of therapeutic modalities to suit your needs.',
      ),
      FAQItem(
        question: 'Who are the therapists?',
        answer: 'TheraNest Therapy has a wide network of therapists with diverse expertise and backgrounds. All Therapists in the network are licensed, trained, qualified and accredited with Masters Degree or Doctorate Degree in their field.',
      ),
      FAQItem(
        question: 'How are the therapists verified?',
        answer: '1. Therapists provide us their CV for initial review by our medical team.\n'
            '2. Therapists get interviewed.\n'
            '3. Therapists are asked to send all their certificates to be verified and reviewed by our medical team.',
      ),
      FAQItem(
        question: 'How am I billed?',
        answer: 'In the sign-up process, you will be asked to add your credit card information. At the moment, you can only pay by credit and debit cards. Paypal, Checks, and bank transfers are not accepted.',
      ),
      FAQItem(
        question: 'How do you protect my privacy?',
        answer: 'Your privacy and confidentiality are our top priority. TheraNest Therapy was designed with a specialized infrastructure and advanced technology to protect your data and information.\n\n'
            '1. You can choose to stay anonymous. We will only ask you to add a nickname to be identified on our system, we will not ask you for your full name or contact information.\n\n'
            '2. All data is encrypted using 256-bit TLS encryption. End-to-end chat encryption allows for secured communication where only the intended recipient can read the secured message. Zoom uses both asymmetric and symmetric algorithms to encrypt the session. Session keys are generated with a device-unique hardware ID to avoid data being read from other devices.\n\n'
            '3. Sessions are not recorded. Any video or audio communication with your therapist will not be recorded. Only text messages are saved for your reference if you’d like to refer back to them, and you always have the option to delete messages.',
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              title: Text(
                'Welcome!',
                style: TextStyle(
                  color: Color(0xFF684E39),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, color: Color(0xFF684E39)), // Outline icon
                onPressed: () {
                  // Add your message action here
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Color(0xFF684E39)), // Outline icon
                onPressed: () {
                  // Add your notification action here
                },
              ),
              
                  IconButton(
                    onPressed: () async {
              final firebaseRepo = FirebaseRepo();
              await firebaseRepo.signOut(context);
            },
                    icon: const Icon(Icons.exit_to_app),
                    iconSize: 25,
                   color: Colors.brown,
                  )
                ],
            
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      const Text(
                        'How it works',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xFF684E39),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFe9ebc4)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/nWork.jpg',
                            fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the container
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Testimonials',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xFF684E39),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 150.0, // Adjust height as needed
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            TestimonialBox(text: 'Very friendly, understanding, good listener, intellectual therapist.. it was so nice to start my therapy journey with an expert.'),
                            TestimonialBox(text: 'Perfect match, thank you so much looking forward to more sessions.'),
                            TestimonialBox(text: 'Video blocks for the exercises helped me in building good impression and making decisions.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xFFe9ebc4), backgroundColor: const Color(0xFF684E39), // text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // increased padding
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ServicePage()),
                            );
                          },
                          child: const Text(
                            'Book a session',
                            style: TextStyle(fontSize: 18), // increased font size
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'FAQs',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xFF684E39),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: faqs.length,
                        itemBuilder: (context, index) {
                          final faq = faqs[index];
                          return ExpansionTile(
                            title: Text(
                              faq.question,
                              style: const TextStyle(color: Color(0xFFa57e52)), // Light brown color
                            ),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(faq.answer),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 32.0), // Add some space before the new section
                      const Divider(), // Optional: add a divider
                      const SizedBox(height: 16.0), // Add some space after the divider
                      const Center(
                        child: Column(
                          children: [
                            Icon(Icons.lock_outline, size: 40,   color: Color(0xFF684E39)), // Lock icon
                            SizedBox(height: 8.0),
                            Text(
                              'Your information is yours and yours only',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF684E39),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'TheraNest Therapy uses encrypted servers to store all your information.',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF684E39),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}