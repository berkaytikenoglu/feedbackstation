import 'package:flutter/material.dart';

extension FeedbackServices on FeedbackCategory {
  int get id {
    switch (this) {
      case FeedbackCategory.request:
        return 1;

      case FeedbackCategory.complaint:
        return 2;

      case FeedbackCategory.projectStatement:
        return 3;

      case FeedbackCategory.informationRequest:
        return 4;

      case FeedbackCategory.report:
        return 5;

      case FeedbackCategory.thanks:
        return 6;
    }
  }

  String get title {
    switch (this) {
      case FeedbackCategory.request:
        return "İstek";
      case FeedbackCategory.complaint:
        return "Şikayet";
      case FeedbackCategory.projectStatement:
        return "Proje Bildirimi";
      case FeedbackCategory.informationRequest:
        return "Bilgi Talebi";
      case FeedbackCategory.report:
        return "İhbar";
      case FeedbackCategory.thanks:
        return "Teşekkür";
    }
  }

  String get departmentLogo {
    switch (this) {
      case FeedbackCategory.request:
        return "https://logowik.com/content/uploads/images/belediye-zabita7556.logowik.com.webp";
      case FeedbackCategory.complaint:
        return "https://logowik.com/content/uploads/images/belediye-zabita7556.logowik.com.webp";
      case FeedbackCategory.projectStatement:
        return "https://logowik.com/content/uploads/images/belediye-zabita7556.logowik.com.webp";
      case FeedbackCategory.informationRequest:
        return "https://logowik.com/content/uploads/images/belediye-zabita7556.logowik.com.webp";
      case FeedbackCategory.report:
        return "https://logowik.com/content/uploads/images/belediye-zabita7556.logowik.com.webp";
      case FeedbackCategory.thanks:
        return "https://logowik.com/content/uploads/images/belediye-zabita7556.logowik.com.webp";
    }
  }

  String get subtitle {
    switch (this) {
      case FeedbackCategory.request:
        return "Belediyemizin İstek Bölümü, vatandaşlarımızın taleplerini iletebileceği bir platformdur. Daha iyi hizmet sunmak ve katılımcılığı artırmak için oluşturulmuş olup, tüm başvurular dikkatle değerlendirilir ve en kısa sürede geri dönüş yapılır";

      case FeedbackCategory.complaint:
        return "Belediyemizin Şikayet Bölümü, vatandaşlarımızın sorunlarını iletebileceği bir platformdur. Şikayetler titizlikle incelenir ve en kısa sürede geri dönüş yapılır.";

      case FeedbackCategory.projectStatement:
        return "Belediyemizin Proje Bildirimi Bölümü, şehirle ilgili öneri ve projelerinizi iletebileceğiniz bir platformdur. Öneriler titizlikle değerlendirilir ve uygun olanlar hayata geçirilir.";

      case FeedbackCategory.informationRequest:
        return "Belediyemizin Bilgi Talebi Bölümü, bilgi taleplerinizi iletebileceğiniz bir platformdur. Şeffaflık ve erişilebilirlik için oluşturulmuş olup, talepleriniz titizlikle incelenir ve hızlıca geri dönüş sağlanır.";

      case FeedbackCategory.report:
        return "Belediyemizin İhbar Bölümü, vatandaşlarımızın ihbarlarını iletebileceği bir platformdur. Şeffaflık ve güvenlik amacıyla oluşturulmuş olup, ihbarlar titizlikle incelenir ve gerekli önlemler alınarak hızlıca geri dönüş sağlanır.";

      case FeedbackCategory.thanks:
        return "Belediyemizin Teşekkür Bölümü, vatandaşlarımızın teşekkürlerini iletebileceği bir platformdur. Bu bölüm, memnuniyeti ve takdiri ifade etme amacıyla oluşturulmuştur. Teşekkürleriniz titizlikle değerlendirilir ve ilgili birimler tarafından dikkate alınır.";
    }
  }

  Color get backGrndcolor {
    switch (this) {
      case FeedbackCategory.request:
        return const Color(0xFF3C4CBD);
      case FeedbackCategory.complaint:
        return const Color(0xFF3C4CBD);

      case FeedbackCategory.projectStatement:
        return const Color(0xFF3C4CBD);

      case FeedbackCategory.informationRequest:
        return const Color(0xFF3C4CBD);

      case FeedbackCategory.report:
        return const Color(0xFF3C4CBD);
      case FeedbackCategory.thanks:
        return const Color(0xFF3C4CBD);
    }
  }

  Icon get homepgIcon {
    switch (this) {
      case FeedbackCategory.request:
        return const Icon(
          Icons.assignment,
          color: Colors.white,
          size: 50,
        );
      case FeedbackCategory.complaint:
        return const Icon(
          Icons.error,
          color: Colors.white,
          size: 50,
        );
      case FeedbackCategory.projectStatement:
        return const Icon(
          Icons.engineering,
          color: Colors.white,
          size: 50,
        );
      case FeedbackCategory.informationRequest:
        return const Icon(
          Icons.search,
          color: Colors.white,
          size: 50,
        );
      case FeedbackCategory.report:
        return const Icon(
          Icons.report,
          color: Colors.white,
          size: 50,
        );
      case FeedbackCategory.thanks:
        return const Icon(
          Icons.emoji_emotions,
          color: Colors.white,
          size: 50,
        );
    }
  }
}

enum FeedbackCategory {
  request,
  complaint,
  projectStatement,
  informationRequest,
  report,
  thanks,
}
