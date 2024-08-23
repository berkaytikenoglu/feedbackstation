import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';

import 'package:flutter/material.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    // final FAQController controller = Get.put(FAQController());

    return const Scaffold(
      appBar: AppbarWidget(title: "Ayarlar"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Center(
                child: Text(
                  'Sıkça Sorulan Sorular',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              leading: Icon(Icons.question_mark_outlined),
            ),
            ListTile(
              title: Text(
                "1. Beyaz Masa’ya nasıl başvuru yapabilirim?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Vatandaşlarımız, Beyaz Masa'ya başvurularını belediyemizin web sitesi üzerinden, 153 Beyaz Masa çağrı merkezini arayarak, mobil uygulamamızdan ya da bizzat belediyemize gelerek yapabilirler."),
            ),
            ListTile(
              title: Text(
                "2. Başvurumu nasıl takip edebilirim?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Başvurunuzu, başvuru numaranız ile belediyemizin web sitesi üzerinden veya 153 Beyaz Masa çağrı merkezinden takip edebilirsiniz. Ayrıca, e-posta adresinizi veya telefon numaranızı paylaşmanız durumunda, bilgilendirme mesajlarıyla da takip edebilirsiniz."),
            ),
            ListTile(
              title: Text(
                "3. Başvuru sonuçlanma süresi ne kadar sürer?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Başvurularınız, 7 iş günü içerisinde sonuçlandırılmak üzere ilgili birimlere iletilir. Bazı durumlarda, başvurunun niteliğine bağlı olarak bu süre uzayabilir."),
            ),
            ListTile(
              title: Text(
                "4. Hangi konularda başvuru yapabilirim?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Beyaz Masa’ya park ve bahçeler, temizlik hizmetleri, yol ve kaldırım çalışmaları, trafik sorunları, çevre şikayetleri, sosyal hizmetler gibi birçok konuda başvuru yapabilirsiniz. Ayrıca öneri, teşekkür ve taleplerinizi de iletebilirsiniz."),
            ),
            ListTile(
              title: Text(
                "5. Acil durumlarda nasıl bir yol izlemeliyim?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Acil durumlar için 112 Acil Çağrı Merkezi'ni aramanız gerekmektedir. Ancak, belediyemizin acil müdahale ekiplerinin görev alanına giren durumlarda (örneğin yol çökmeleri, ani çevre kirlilikleri vb.) Beyaz Masa üzerinden acil başvuru yapabilirsiniz."),
            ),
            ListTile(
              title: Text(
                "6. Beyaz Masa hizmetinden kimler yararlanabilir?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Beyaz Masa hizmetinden ilçemizde ikamet eden tüm vatandaşlar, ilçemizde faaliyet gösteren kurumlar ve ziyaretçiler yararlanabilir."),
            ),
            ListTile(
              title: Text(
                "7. Beyaz Masa başvurum hangi birime yönlendiriliyor?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Başvurular, içeriğine göre belediyemizin ilgili birimlerine (örn. Fen İşleri, Zabıta, Park ve Bahçeler) yönlendirilir ve ilgili birim tarafından çözülür."),
            ),
            ListTile(
              title: Text(
                "8. Başvuru yaparken kişisel bilgilerimi vermek zorunda mıyım?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Başvurularınızı anonim olarak yapabilirsiniz, ancak başvurunuzun sonucundan haberdar olmak için iletişim bilgilerinizi paylaşmanız tavsiye edilir."),
            ),
            ListTile(
              title: Text(
                "9. Beyaz Masa başvurularım gizli tutuluyor mu?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Evet, başvurularınız ve kişisel bilgileriniz gizli tutulur ve üçüncü şahıslarla paylaşılmaz. Sadece yetkili birimler başvurunuzla ilgili bilgilere erişebilir."),
            ),
            ListTile(
              title: Text(
                "10. Başvuruma olumsuz yanıt alırsam ne yapmalıyım?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Başvurunuz olumsuz sonuçlandığında, itiraz etmek veya daha fazla bilgi almak için 153 Beyaz Masa çağrı merkezimizi arayabilir veya belediyemizin ilgili birimine doğrudan başvurabilirsiniz."),
            ),
          ],
        ),
      ),
    );
  }
}
