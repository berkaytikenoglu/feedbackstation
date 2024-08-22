import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';

class AppList {
  static List<User> userList = [];
  static List<AppRequest> requestsList = [
    // AppRequest(
    //   id: 1,
    //   reportuser: User(
    //     id: 1,
    //     avatar: Media(
    //       id: 1,
    //       type: MediaType.image,
    //       bigUrl: "https://picsum.photos/seed/picsum/600/600",
    //       normalUrl: "https://picsum.photos/seed/picsum/300/300",
    //       minUrl: "https://picsum.photos/seed/picsum/100/100",
    //       isLocal: false,
    //     ),
    //     displayname: "Test Kullanıcı",
    //     email: "test@kullanici.com",
    //     firstname: "Test",
    //     lastname: "Kullanıcı",
    //     serialNumber: "213456",
    //   ),
    //   subject: "Hatalı Park",
    //   adresses: AddresModel(
    //     neighbourhood: "neighbourhood",
    //     streetAvenue: "streetAvenue",
    //     streetAvenueAlley: "streetAvenueAlley",
    //     insideDoor: "insideDoor",
    //     outDoor: "outDoor",
    //     neighborhoodDirections: "neighborhoodDirections",
    //   ),
    //   category: FeedbackCategory.report,
    //   description:
    //       "Sayın Belediye Yetkilileri,Ben, [Adınız ve Soyadınız], [Adresiniz] adresinde ikamet eden bir vatandaş olarak, şehir merkezinde yaşanan bir trafik sorununu dikkatinize sunmak istiyorum.Son günlerde, [Tarih] tarihinde, [Otoparkın Adı] otoparkının giriş ve çıkışları önündeki cadde üzerinde bazı araçların hatalı park edilmesi nedeniyle ciddi bir trafik sıkışıklığı yaşanmaktadır. Bu araçlar, otoparkın giriş ve çıkışlarını engellemekte ve otoparkı kullanan sürücüler ile cadde üzerinde ilerlemekte olan diğer araçlar için büyük bir zorluk oluşturmaktadır.",
    //   status: AppStatus.completed,
    //   date: DateTime(2002, 01, 10),
    //   documents: [
    //     "https://trthaberstatic.cdn.wp.trt.com.tr/resimler/2264000/kaza-aa-2265415.jpg",
    //     "https://www.fatsagazetesi.net/static/2022/05/17/fatsada-sokaklar-sicak-asfalt-le-bulutu_247_large.webp"
    //   ],
    //   messages: [
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Etem Kibar",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://www.orduulak.com/images/biyografiler/2021/12/ibrahim-etem-kibar-5685.jpg",
    //           normalUrl:
    //               "https://www.orduulak.com/images/biyografiler/2021/12/ibrahim-etem-kibar-5685.jpg",
    //           minUrl:
    //               "https://www.orduulak.com/images/biyografiler/2021/12/ibrahim-etem-kibar-5685.jpg",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "alsşkdasşlfklasşgşsdklg lsjgserılgjler godrgjo rşg okdrs jr5ıg şs rşogjsrıoş",
    //     ),
    //   ],
    // ),
    // AppRequest(
    //   id: 1,
    //   reportuser: User(
    //     id: 1,
    //     avatar: Media(
    //       id: 1,
    //       type: MediaType.image,
    //       bigUrl: "https://picsum.photos/seed/picsum/600/600",
    //       normalUrl: "https://picsum.photos/seed/picsum/300/300",
    //       minUrl: "https://picsum.photos/seed/picsum/100/100",
    //       isLocal: false,
    //     ),
    //     displayname: "Test Kullanıcı",
    //     email: "test@kullanici.com",
    //     firstname: "Test",
    //     lastname: "Kullanıcı",
    //     serialNumber: "213456",
    //   ),
    //   subject: "Hatalı Park",
    //   adresses: AddresModel(
    //     neighbourhood: "neighbourhood",
    //     streetAvenue: "streetAvenue",
    //     streetAvenueAlley: "streetAvenueAlley",
    //     insideDoor: "insideDoor",
    //     outDoor: "outDoor",
    //     neighborhoodDirections: "neighborhoodDirections",
    //   ),
    //   category: FeedbackCategory.report,
    //   description:
    //       "Sayın Belediye Yetkilileri,Ben, [Adınız ve Soyadınız], [Adresiniz] adresinde ikamet eden bir vatandaş olarak, şehir merkezinde yaşanan bir trafik sorununu dikkatinize sunmak istiyorum.Son günlerde, [Tarih] tarihinde, [Otoparkın Adı] otoparkının giriş ve çıkışları önündeki cadde üzerinde bazı araçların hatalı park edilmesi nedeniyle ciddi bir trafik sıkışıklığı yaşanmaktadır. Bu araçlar, otoparkın giriş ve çıkışlarını engellemekte ve otoparkı kullanan sürücüler ile cadde üzerinde ilerlemekte olan diğer araçlar için büyük bir zorluk oluşturmaktadır.",
    //   status: AppStatus.completed,
    //   date: DateTime(2002, 01, 10),
    //   documents: [
    //     "https://trthaberstatic.cdn.wp.trt.com.tr/resimler/2264000/kaza-aa-2265415.jpg",
    //     "https://www.fatsagazetesi.net/static/2022/05/17/fatsada-sokaklar-sicak-asfalt-le-bulutu_247_large.webp"
    //   ],
    //   messages: [
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Etem Kibar",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://www.orduulak.com/images/biyografiler/2021/12/ibrahim-etem-kibar-5685.jpg",
    //           normalUrl:
    //               "https://www.orduulak.com/images/biyografiler/2021/12/ibrahim-etem-kibar-5685.jpg",
    //           minUrl:
    //               "https://www.orduulak.com/images/biyografiler/2021/12/ibrahim-etem-kibar-5685.jpg",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "alsşkdasşlfklasşgşsdklg lsjgserılgjler godrgjo rşg okdrs jr5ıg şs rşogjsrıoş",
    //     ),
    //   ],
    // ),
    // AppRequest(
    //   id: 2,
    //   reportuser: User(
    //     id: 1,
    //     avatar: Media(
    //       id: 1,
    //       type: MediaType.image,
    //       bigUrl: "https://picsum.photos/seed/picsum/600/600",
    //       normalUrl: "https://picsum.photos/seed/picsum/300/300",
    //       minUrl: "https://picsum.photos/seed/picsum/100/100",
    //       isLocal: false,
    //     ),
    //     displayname: "Test Kullanıcı",
    //     email: "test@kullanici.com",
    //     firstname: "Test",
    //     lastname: "Kullanıcı",
    //     serialNumber: "213456",
    //   ),
    //   subject: "Sokak Hayvanları",
    //   adresses: AddresModel(
    //     neighbourhood: "neighbourhood",
    //     streetAvenue: "streetAvenue",
    //     streetAvenueAlley: "streetAvenueAlley",
    //     insideDoor: "insideDoor",
    //     outDoor: "outDoor",
    //     neighborhoodDirections: "neighborhoodDirections",
    //   ),
    //   category: FeedbackCategory.thanks,
    //   description:
    //       "Sayın Belediye Yetkilileri,Ben, [Adınız ve Soyadınız], [Adresiniz] adresinde ikamet eden bir vatandaş olarak, mahallemizdeki sokak hayvanlarıyla ilgili yaşanan ciddi bir sorunu dikkatinize sunmak istiyorum.Son zamanlarda, [Mahalle Adı veya Cadde Adı] bölgesinde, sokak hayvanlarının açlık çektiğini gözlemliyorum. Özellikle sabah ve akşam saatlerinde, bu hayvanların yiyecek bulmakta zorlandıklarını ve açlık nedeniyle sağlıklarının tehlikeye girdiğini üzülerek görmekteyim. Bu durum, hem hayvanların yaşam kalitesini olumsuz etkiliyor hem de bölge sakinleri olarak bizi endişelendirmektedir.Sokak hayvanlarının açlık çekmelerinin önlenmesi ve sağlıklı bir yaşam sürdürebilmeleri için düzenli bir gıda temini sağlanması gerektiğini düşünüyorum. Hayvanlara düzenli olarak gıda ve su sağlanabilecek yerlerin belirlenmesi ve bu konuda gerekli düzenlemelerin yapılması önem arz etmektedir.Bu konuya acilen el atılmasını ve sokak hayvanlarının açlık sorununu çözmeye yönelik gerekli önlemlerin alınmasını rica ederim.Göstereceğiniz hassasiyet için teşekkür eder, konuya ilişkin geri dönüşünüzü beklerim.Saygılarımla,[Adınız ve Soyadınız][İletişim Bilgileriniz][İmza (varsa)]",
    //   status: AppStatus.completed,
    //   date: DateTime(2023, 01, 1),
    //   documents: [
    //     "https://pbs.twimg.com/profile_images/1780894982490001408/Pht4DVle_400x400.jpg",
    //     "https://pbs.twimg.com/profile_images/1653157500986744832/wu0ArmY8_400x400.jpg",
    //   ],
    //   messages: [
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Engin Sazçalmaz",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://d1bvpoagx8hqbg.cloudfront.net/259/a8614298007daac2402860eeb6c8e190.jpg",
    //           normalUrl:
    //               "https://d1bvpoagx8hqbg.cloudfront.net/259/a8614298007daac2402860eeb6c8e190.jpg",
    //           minUrl:
    //               "https://d1bvpoagx8hqbg.cloudfront.net/259/a8614298007daac2402860eeb6c8e190.jpg",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "alsşkdasşlfklasşgşsdklg lsjgserılgjler godrgjo rşg okdrs jr5ıg şs rşogjsrıoş",
    //     ),
    //   ],
    // ),
    // AppRequest(
    //   id: 3,
    //   reportuser: User(
    //     id: 1,
    //     avatar: Media(
    //       id: 1,
    //       type: MediaType.image,
    //       bigUrl: "https://picsum.photos/seed/picsum/600/600",
    //       normalUrl: "https://picsum.photos/seed/picsum/300/300",
    //       minUrl: "https://picsum.photos/seed/picsum/100/100",
    //       isLocal: false,
    //     ),
    //     displayname: "Test Kullanıcı",
    //     email: "test@kullanici.com",
    //     firstname: "Test",
    //     lastname: "Kullanıcı",
    //     serialNumber: "213456",
    //   ),
    //   subject: "Zam İstiyoruz",
    //   adresses: AddresModel(
    //     neighbourhood: "neighbourhood",
    //     streetAvenue: "streetAvenue",
    //     streetAvenueAlley: "streetAvenueAlley",
    //     insideDoor: "insideDoor",
    //     outDoor: "outDoor",
    //     neighborhoodDirections: "neighborhoodDirections",
    //   ),
    //   category: FeedbackCategory.request,
    //   description:
    //       "Sayın [Yetkili Kişinin Adı veya İnsan Kaynakları Yöneticisi],Ben, [Adınız ve Soyadınız], [Görev ve Pozisyonunuz] olarak [Şirket/Firma Adı]’nda görev yapmaktayım. Bu dilekçeyi, mevcut maaşımın artışıyla ilgili bir talepte bulunmak amacıyla yazıyorum.Son dönemde, iş yükümdeki artış, görev ve sorumluluklarımda meydana gelen değişiklikler ve genel yaşam koşullarındaki mali zorluklar göz önüne alındığında, maaşımda bir artış yapılmasının gerekli olduğunu düşünmekteyim. Çalıştığım süre zarfında, şirketimize katkılarımın yanı sıra, iş süreçlerindeki iyileştirmeler ve başarılarım da göz önünde bulundurularak, maaşımın artışı konusunun değerlendirilmesini rica ediyorum.Şirketimize olan bağlılığım ve işime olan katkılarım doğrultusunda, maaşımda uygun bir artış yapılmasını talep ediyorum. Bu konuda olumlu bir değerlendirme yapılmasını ve gerekirse bir görüşme gerçekleştirilmesini rica ederim.İlginiz ve anlayışınız için teşekkür eder, en kısa sürede geri dönüş yapmanızı beklerim.Saygılarımla,",
    //   status: AppStatus.completed,
    //   date: DateTime(2020, 08, 19),
    //   documents: [
    //     "https://i.dunya.com/storage/files/images/2023/01/12/zamli-memur-maasli-zamli-yonetici-m-iDI4_cover.jpg",
    //     "https://img.ekonomim.com/storage/files/images/2024/08/09/2-osvb.jpg"
    //   ],
    //   messages: [
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Aykut işyapmaz",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://i.pinimg.com/564x/1c/21/fa/1c21fa553b592628de89182df74b0a98.jpg",
    //           normalUrl:
    //               "https://i.pinimg.com/564x/1c/21/fa/1c21fa553b592628de89182df74b0a98.jpg",
    //           minUrl:
    //               "https://i.pinimg.com/564x/1c/21/fa/1c21fa553b592628de89182df74b0a98.jpg",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "alsşkdasşlfklasşgşsdklg lsjgserılgjler godrgjo rşg okdrs jr5ıg şs rşogjsrıoş",
    //     ),
    //   ],
    // ),
    // AppRequest(
    //   id: 4,
    //   reportuser: User(
    //     id: 1,
    //     avatar: Media(
    //       id: 1,
    //       type: MediaType.image,
    //       bigUrl: "https://picsum.photos/seed/picsum/600/600",
    //       normalUrl: "https://picsum.photos/seed/picsum/300/300",
    //       minUrl: "https://picsum.photos/seed/picsum/100/100",
    //       isLocal: false,
    //     ),
    //     displayname: "Test Kullanıcı",
    //     email: "test@kullanici.com",
    //     firstname: "Test",
    //     lastname: "Kullanıcı",
    //     serialNumber: "213456",
    //   ),
    //   subject: "Pis Koku",
    //   adresses: AddresModel(
    //     neighbourhood: "neighbourhood",
    //     streetAvenue: "streetAvenue",
    //     streetAvenueAlley: "streetAvenueAlley",
    //     insideDoor: "insideDoor",
    //     outDoor: "outDoor",
    //     neighborhoodDirections: "neighborhoodDirections",
    //   ),
    //   category: FeedbackCategory.complaint,
    //   description:
    //       "Sayın Belediye Yetkilileri,Ben, [Adınız ve Soyadınız], [Adresiniz] adresinde ikamet eden bir vatandaş olarak, [Mahalle Adı veya Cadde Adı] bölgesinde yaşanan pis koku sorununu dikkatinize sunmak istiyorum.Son günlerde, bölgedeki [Belirli Bir Nokta veya Alan, örneğin çöp konteynerleri, kanalizasyon, vb.] kaynaklı kötü bir koku yayılmaktadır. Bu koku, hem çevredeki yaşam kalitesini ciddi şekilde olumsuz etkilemekte hem de bölge sakinleri olarak bizleri rahatsız etmektedir. Koku, özellikle sıcak havalarda daha da belirgin hale gelmekte ve bu durum sosyal yaşamımızı zorlaştırmaktadır.",
    //   status: AppStatus.inprogress,
    //   date: DateTime(2022, DateTime.april, 21),
    //   documents: [
    //     "https://isbh.tmgrup.com.tr/sbh/2021/07/01/650x344/fatsada-copte-ikili-toplama-sistemi-1625133639153.jpg",
    //     "https://www.evrensel.net/upload/dosya/175278.jpg",
    //     "https://fatsa.bel.tr/upload/albums/fatsa-fotograflari/fatsa-fotograflari_7004.jpg"
    //   ],
    //   messages: [
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Hiko ÇATAR",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://tr.web.img4.acsta.net/c_310_420/img/19/09/1909363a78fc7120dc54d26471cf2e1c.png",
    //           normalUrl:
    //               "https://tr.web.img4.acsta.net/c_310_420/img/19/09/1909363a78fc7120dc54d26471cf2e1c.png",
    //           minUrl:
    //               "https://tr.web.img4.acsta.net/c_310_420/img/19/09/1909363a78fc7120dc54d26471cf2e1c.png",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "alsşkdasşlfklasşgşsdklg lsjgserılgjler godrgjo rşg okdrs jr5ıg şs rşogjsrıoş",
    //     ),
    //   ],
    // ),
    // AppRequest(
    //   id: 5,
    //   reportuser: User(
    //     id: 1,
    //     avatar: Media(
    //       id: 1,
    //       type: MediaType.image,
    //       bigUrl: "https://picsum.photos/seed/picsum/600/600",
    //       normalUrl: "https://picsum.photos/seed/picsum/300/300",
    //       minUrl: "https://picsum.photos/seed/picsum/100/100",
    //       isLocal: false,
    //     ),
    //     displayname: "Test Kullanıcı",
    //     email: "test@kullanici.com",
    //     firstname: "Test",
    //     lastname: "Kullanıcı",
    //     serialNumber: "213456",
    //   ),
    //   subject: "Vergi borcu",
    //   adresses: AddresModel(
    //     neighbourhood: "neighbourhood",
    //     streetAvenue: "streetAvenue",
    //     streetAvenueAlley: "streetAvenueAlley",
    //     insideDoor: "insideDoor",
    //     outDoor: "outDoor",
    //     neighborhoodDirections: "neighborhoodDirections",
    //   ),
    //   category: FeedbackCategory.informationRequest,
    //   description:
    //       "Tarih: [GÜN/AY/YIL] Konu: Vergi Borcu Yapılandırma/Ödeme Kolaylığı Talebi [Vergi Dairesinin Adı] Vergi Dairesi Müdürlüğüne, Mükellef No: [Mükellef Numarası] Vergi Kimlik No: [Vergi Kimlik Numarası] Ad/Soyad veya Şirket Adı: [Adınız Soyadınız veya Şirket Adınız] Adres: [Adresiniz] Sayın Yetkili, [Vergi Dairesi'nin Adı] vergi dairesine bağlı olarak mükellefi bulunduğum [belirtilen vergi türü: gelir vergisi, KDV, vb.] konusunda biriken vergi borçlarımı ödemekte zorlandığımı üzülerek bildiririm. İçinde bulunduğum maddi zorluklar nedeniyle borcumu düzenli olarak ödeme imkânım kalmamıştır. Bu nedenle, borcumu ödeyebilmek amacıyla 6111 Sayılı Kanun ve diğer ilgili mevzuat çerçevesinde borcumu yapılandırmak ve uygun ödeme kolaylıklarından faydalanmak istiyorum. Borçlarımın yeniden yapılandırılması ve ödeme planının tarafıma sunulması konusunda yardımlarınızı rica ederim. Vergi borcuma ilişkin gerekli işlemlerin yapılmasını ve tarafıma bilgi verilmesini saygılarımla arz ederim.",
    //   status: AppStatus.completed,
    //   date: DateTime(2020, 06, 14),
    //   documents: [
    //     "https://pbs.twimg.com/profile_images/1780894982490001408/Pht4DVle_400x400.jpg",
    //     "https://pbs.twimg.com/profile_images/1653157500986744832/wu0ArmY8_400x400.jpg"
    //   ],
    //   messages: [
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Yusuf Tekatar",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://static.birgun.net/resim/haber/2024/08/08/yusuf-dikec-olimpiyata-3-gun-kala-silahimin-tetigi-kirildi-tornaci-arkadasim-yapti.jpg",
    //           normalUrl:
    //               "https://static.birgun.net/resim/haber/2024/08/08/yusuf-dikec-olimpiyata-3-gun-kala-silahimin-tetigi-kirildi-tornaci-arkadasim-yapti.jpg",
    //           minUrl:
    //               "https://static.birgun.net/resim/haber/2024/08/08/yusuf-dikec-olimpiyata-3-gun-kala-silahimin-tetigi-kirildi-tornaci-arkadasim-yapti.jpg",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "alsşkdasşlfklasşgşsdklg lsjgserılgjler godrgjo rşg okdrs jr5ıg şs rşogjsrıoş",
    //     ),
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Yusuf Tekatar",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://static.birgun.net/resim/haber/2024/08/08/yusuf-dikec-olimpiyata-3-gun-kala-silahimin-tetigi-kirildi-tornaci-arkadasim-yapti.jpg",
    //           normalUrl:
    //               "https://static.birgun.net/resim/haber/2024/08/08/yusuf-dikec-olimpiyata-3-gun-kala-silahimin-tetigi-kirildi-tornaci-arkadasim-yapti.jpg",
    //           minUrl:
    //               "https://static.birgun.net/resim/haber/2024/08/08/yusuf-dikec-olimpiyata-3-gun-kala-silahimin-tetigi-kirildi-tornaci-arkadasim-yapti.jpg",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "alsşkdasşlfklasşgşsdklg lsjgserılgjler godrgjo rşg okdrs jr5ıg şs rşogjsrıoş",
    //     ),
    //   ],
    // ),
    // AppRequest(
    //   id: 6,
    //   reportuser: User(
    //     id: 1,
    //     avatar: Media(
    //       id: 1,
    //       type: MediaType.image,
    //       bigUrl: "https://picsum.photos/seed/picsum/600/600",
    //       normalUrl: "https://picsum.photos/seed/picsum/300/300",
    //       minUrl: "https://picsum.photos/seed/picsum/100/100",
    //       isLocal: false,
    //     ),
    //     displayname: "Test Kullanıcı",
    //     email: "test@kullanici.com",
    //     firstname: "Test",
    //     lastname: "Kullanıcı",
    //     serialNumber: "213456",
    //   ),
    //   subject: "Kaçak inşaat",
    //   adresses: AddresModel(
    //     neighbourhood: "neighbourhood",
    //     streetAvenue: "streetAvenue",
    //     streetAvenueAlley: "streetAvenueAlley",
    //     insideDoor: "insideDoor",
    //     outDoor: "outDoor",
    //     neighborhoodDirections: "neighborhoodDirections",
    //   ),
    //   category: FeedbackCategory.projectStatement,
    //   description:
    //       "Tarih: [GÜN/AY/YIL] Konu: Kaçak İnşaat Hakkında Bilgi ve Müdahale Talebi [Belediyenin Adı] Belediye Başkanlığına,[Mahalle Adı] Mahallesi, [Cadde/Sokak Adı] Caddesi/Sokağı üzerinde yer alan, [Bina No] numaralı binada kaçak inşaat yapıldığını tespit etmiş bulunmaktayım.İlgili yapının gerekli yasal izinler alınmadan ve imar mevzuatına aykırı bir şekilde inşa edildiği kanaatindeyim. Söz konusu yapının ruhsatı olmadığı, belediyeniz tarafından herhangi bir denetim ve izin sürecine tabi tutulmadan yapıldığı gözlemlenmektedir. Bu durum hem çevre güvenliğini tehdit etmekte hem de kentimizin planlı yapılaşma düzenine aykırı bir durum teşkil etmektedir. Bu bağlamda, aşağıdaki hususların belediyenizce ivedilikle değerlendirilmesini ve gerekli yasal işlemlerin yapılmasını arz ederim:",
    //   status: AppStatus.pending,
    //   date: DateTime(2022, 2, 2),
    //   documents: [
    //     "https://pervasizcomtr.teimg.com/crop/1280x720/pervasiz-com-tr/uploads/2024/06/03-06-24-kacak-insaat-1.jpg",
    //   ],
    //   messages: [
    //     MessageModel(
    //       receiverId: 1,
    //       senderId: 2,
    //       senderUser: User(
    //         id: 1,
    //         firstname: "Sadece Hüseyin",
    //         avatar: Media(
    //           id: 1,
    //           type: MediaType.image,
    //           bigUrl:
    //               "https://liderhabercomtr.teimg.com/liderhaber-com-tr/uploads/2024/01/cayci-huseyini-yeni-imaji1.webp",
    //           normalUrl:
    //               "https://liderhabercomtr.teimg.com/liderhaber-com-tr/uploads/2024/01/cayci-huseyini-yeni-imaji1.webp",
    //           minUrl:
    //               "https://liderhabercomtr.teimg.com/liderhaber-com-tr/uploads/2024/01/cayci-huseyini-yeni-imaji1.webp",
    //           isLocal: false,
    //         ),
    //       ),
    //       message:
    //           "ÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARRÇAYLARR",
    //     ),
    //   ],
    // ),
  ];
}
