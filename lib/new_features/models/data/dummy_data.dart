import 'package:appointment_app/new_features/models/category_model.dart';
import 'package:appointment_app/new_features/models/service_product.dart';

import '../staff_model.dart';

List<Category> availableCategories = [
  Category(
    id: 'c1',
    title: 'Facial Care',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dimond-Peel-with-whitening-services-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c2',
    title: 'Gluta Drips',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Gluta-Iv-Push-Vs-Drip-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c3',
    title: 'Massage Services',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c4',
    title: 'Eye Services',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Near-Me-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c5',
    title: 'Slimming Services',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Mesolipo-With-Rf-Cavitation-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c6',
    title: 'Carbon Laser Treatment',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Treatment-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c7',
    title: 'Laser Treatment Diode Hair Removal',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Face-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c8',
    title: 'Waxing Hair Removal',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Waxing-Hair-Removal-Jevelme-Beauty-Lounge.webp',
  ),
  Category(
    id: 'c9',
    title: 'Warts Removal',
    image:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Warts-Removal-Near-Me-Jevelme-Beauty-Lounge.webp',
  ),
];

const dummyServices = [
  /// -- Facial Care
  ServiceProduct(
    id: 's1',
    category: 'c1',
    title: 'Relaxing Facial',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Relaxing-Facial-Treatment-Jevelme-Beauty-Lounge.webp',
    description: 'De-stress and unwind with a soothing facial treatment.',
    price: '₱299',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's2',
    category: 'c1',
    title: 'Basic Facial w/ Whitening',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Basic-Facial-With-Whitening-Facial-Near-Me-Jevelme-Beauty-Lounge.webp',
    description:
        'Brighten your complexion with a cleansing and whitening facial.',
    price: '₱599',
    duration: '2 hours',
  ),
  ServiceProduct(
    id: 's3',
    category: 'c1',
    title: 'Diamond Peel w/ Whitening Facial',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dimond-Peel-with-whitening-services-Jevelme-Beauty-Lounge.webp',
    description:
        'Exfoliate and brighten with a diamond peel and whitening treatment.',
    price: '₱799',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's4',
    category: 'c1',
    title: 'Acne Facial w/ Led Light',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Services-Jevelme-Beauty-Lounge.webp',
    description:
        'Hydrate deeply, rejuvenate with a refreshing Hydra facial treatment.',
    price: '₱899',
    duration: '2 hours',
  ),
  ServiceProduct(
    id: 's5',
    category: 'c1',
    title: 'Hydra Facial',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Near-Me-Jevelme-Beauty-Lounge.webp',
    description:
        'Achieve radiant skin with hydra facial deep cleanse & hydration.',
    price: '₱999',
    duration: '2 hours',
  ),
  ServiceProduct(
    id: 's6',
    category: 'c1',
    title: 'European Facial (w/ RF)',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Center-Services-Jevelme-Beauty-Lounge.webp',
    description:
        "Renew skin's vitality, firmness with European facial and RF technology.",
    price: '₱899',
    duration: '2 hours',
  ),
  ServiceProduct(
    id: 's7',
    category: 'c1',
    title: 'V-Shape Facial (w/ RF)',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Center-Imus-Services-Jevelme-Beauty-Lounge.webp',
    description:
        "Renew skin's vitality, firmness with European facial and RF technology.",
    price: '₱899',
    duration: '2 hours',
  ),
  ServiceProduct(
    id: 's8',
    category: 'c1',
    title: 'Dermaplaning Facial',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Relaxing-Facial-Treatment-Jevelme-Beauty-Lounge.webp',
    description:
        'Smooth, refine skin texture with gentle dermaplaning facial treatments.',
    price: '₱799',
    duration: '1 hour 15 mins',
  ),
  ServiceProduct(
    id: 's9',
    category: 'c2',
    title: 'Perfect White Skin Push',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Perfect-Skin-Jevelme-Beauty-Lounge.webp',
    description: 'Illuminate with our whitening infusion therapy',
    price: '₱499',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's10',
    category: 'c2',
    title: 'Cleansing Push',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cleansing-Push-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Refresh and revitalize with our deep cleansing infusion.',
    price: '₱599',
    duration: '1 hour 15 mins',
  ),
  ServiceProduct(
    id: 's11',
    category: 'c2',
    title: 'Celebrity Pinkish Push',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Celebrity-Pinkish-Push-near-me-Jevelme-Beauty-Lounge.webp',
    description: 'Achieve a radiant, pinkish glow effortlessly.',
    price: '₱699',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's12',
    category: 'c2',
    title: 'JBL Signature White Drip',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Sexy-White-Drip-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Brighten skin tone for a radiant look.',
    price: '₱1499',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's13',
    category: 'c2',
    title: 'Cindella Drip',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cindella-Drip-Jevelme-Beauty-Lounge.webp',
    description: 'Achieve a youthful glow and even complexion.',
    price: '₱1799',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's14',
    category: 'c2',
    title: 'Cinderella Drip',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cinderella-Drip-Jevelme-Beauty-Lounge.webp',
    description: 'Get radiant and glass-like skin.',
    price: '₱1899',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's15',
    category: 'c2',
    title: 'Sexy White Drip',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/JBL-Signature-White-Drip-Jevelme-Beauty-Lounge.webp',
    description: 'Brighten skin for a healthy, sexy look.',
    price: '₱1299',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's16',
    category: 'c3',
    title: 'Swedish Massage',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Swedish-Massage-Jevelme-Beauty-Lounge.webp',
    description: 'Melt away tension with long, soothing strokes.',
    price: '₱299',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's17',
    category: 'c3',
    title: 'Regular Massage',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Regular-Massage-Jevelme-Beauty-Lounge.webp',
    description: 'Refresh your body and mind with classic techniques.',
    price: '₱349',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's18',
    category: 'c3',
    title: 'JBL Signature Massage',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Beauty-Lounge-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Experience deep relaxation with our signature therapy.',
    price: '₱399',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's19',
    category: 'c3',
    title: 'Deep Tissue',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Deep-Tissue-Massage-Jevelme-Beauty-Lounge.webp',
    description: 'Target deep muscle layers to release chronic tension.',
    price: '₱399',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's20',
    category: 'c3',
    title: 'Dry Massage',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dry-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'boost circulation and improves flexibility.',
    price: '₱499',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's21',
    category: 'c3',
    title: 'Foot Reflex',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Foot-Reflex-Massage-Jevelme-Beauty-Lounge.webp',
    description: 'Relieve foot pain and promote overall well-being.',
    price: '₱249',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's22',
    category: 'c3',
    title: 'Back Massage',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Back-Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Focus on relieving tension and knots in your back.',
    price: '₱199',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's23',
    category: 'c3',
    title: 'Head Massage',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Head-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Soothe headaches and improve scalp circulation.',
    price: '₱149',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's24',
    category: 'c3',
    title: 'Hand Massage',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Reflex-Massage-Jevelme-Beauty-Lounge.webp',
    description: 'Reduce stress and improve hand dexterity.',
    price: '₱149',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's25',
    category: 'c3',
    title: 'JBL MASSAGE W/ HOT STONE',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Package-Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Relax & unwind with heated stones.',
    price: '₱749',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's26',
    category: 'c3',
    title: 'JBL MASSAGE W/ HOT COMPRESS',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-Massage-With-Hot-Compress-Jevelme-Beauty-Lounge.webp',
    description: 'Soothes tension & promotes circulation.',
    price: '₱549',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's27',
    category: 'c3',
    title: 'JBL W/ VENTOSA',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-With-Ventosa-Jevelme-Beauty-Lounge.webp',
    description: 'Improves blood flow & reduces pain.',
    price: '₱499',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's28',
    category: 'c3',
    title: 'JBL MASSAGE TAKE ALL W/ BODY SCRUB',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-Massage-Take-All-With-Body-Scrub-Jevelme-Beauty-Lounge.webp',
    description: 'Buff away dead skin for a revitalized glow.',
    price: '₱799',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's29',
    category: 'c3',
    title: 'Ear Candle',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Ear-Candling-Jevelme-Beauty-Lounge.webp',
    description: 'Stress Relief & Relaxation with Ear Candle Treatment',
    price: '₱149',
    duration: '15 mins',
  ),
  ServiceProduct(
    id: 's30',
    category: 'c3',
    title: 'Hot Stone',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hot-Stone-Massage-Jevelme-Beauty-Lounge.webp',
    description: 'Deep Muscle Penetration with JBL Hot Stone Massage',
    price: '₱249',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's31',
    category: 'c3',
    title: 'Ventosa',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Ventosa-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Enhanced Detoxification with Our Ventosa Massage Services',
    price: '₱149',
    duration: '15 mins',
  ),
  ServiceProduct(
    id: 's32',
    category: 'c3',
    title: 'Hot Compress',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hot-Compress-Massage-Jevelme-Beauty-Lounge.webp',
    description: 'Balancing Energy Flow with Hot Compress Massage Services',
    price: '₱199',
    duration: '15 mins',
  ),
  ServiceProduct(
    id: 's33',
    category: 'c4',
    title: 'Eyelash Perming',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Perming-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Transform with our mesmerizing eyelash perming.',
    price: '₱399',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's34',
    category: 'c4',
    title: 'Eyelash Extension',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Jevelme-Beauty-Lounge.webp',
    description: 'Embrace luxurious, fluttery extensions.',
    price: '₱499',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's35',
    category: 'c4',
    title: 'Eyelash Removal',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Removal-Jevelme-Beauty-Lounge.webp',
    description: 'Refresh with a gentle eyelash removal treatment.',
    price: '₱249',
    duration: '15 mins',
  ),
  ServiceProduct(
    id: 's36',
    category: 'c5',
    title: 'Double Chin',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Double-Chin-Removal-Service-Jevelme-Beauty-Lounge.webp',
    description: 'Reduce puffiness for a defined look.',
    price: '₱1,500',
    duration: '1 hour 15 mins',
  ),
  ServiceProduct(
    id: 's37',
    category: 'c5',
    title: 'Barbie Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Barbie-Arms-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Tone and tighten for sculpted arms.',
    price: '₱1,699',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's38',
    category: 'c5',
    title: 'Sexy Belly',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Sexy-Belly-Jevelme-Beauty-Lounge.webp',
    description: 'Smoothen and flatten for a sleek core.',
    price: '₱2,299',
    duration: '2 hours',
  ),
  ServiceProduct(
    id: 's39',
    category: 'c5',
    title: 'Inner Thigh',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Inner-Thigh-Jevelme-Beauty-Lounge.webp',
    description: 'Reduce friction and achieve smoother skin.',
    price: '₱1,799',
    duration: '1 hour 45 mins',
  ),
  ServiceProduct(
    id: 's40',
    category: 'c5',
    title: 'Outer Thigh',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Outer-Thigh-Jevelme-Beauty-Lounge.webp',
    description: 'Improve tone and reduce the appearance of cellulite.',
    price: '₱1,599',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's41',
    category: 'c5',
    title: 'Upper Back',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Upper-Back-Rf-Jevelme-Beauty-Lounge.webp',
    description: 'Treat blemishes and improve texture.',
    price: '₱1,500',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's42',
    category: 'c5',
    title: 'RF Face',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Face-Treatment-Jevelme-Beauty-Lounge.webp',
    description: 'Sculpt and tighten for youthful radiance.',
    price: '₱349',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's43',
    category: 'c5',
    title: 'RF Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Arms-Jevelme-Beauty-Lounge.webp',
    description: 'Define arms with firmness and contour.',
    price: '₱499',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's44',
    category: 'c5',
    title: 'RF Tummy',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Tummy-Jevelme-Beauty-Lounge.webp',
    description: 'Flatten and tone to create a sleek silhouette.',
    price: '₱599',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's45',
    category: 'c5',
    title: 'RF Thigh',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Thigh-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Smooth and shape thighs with precision.',
    price: '₱699',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's46',
    category: 'c5',
    title: 'RF Back',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Back-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Refine back contours for a confident posture.',
    price: '₱499',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's47',
    category: 'c6',
    title: 'Carbon Laser Face',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Face-Jevelme-Beauty-Lounge.webp',
    description: 'Rejuvenate for a flawless complexion glow.',
    price: '₱999',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's48',
    category: 'c6',
    title: 'Carbon Laser Under Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Underarm-Jevelme-Beauty-Lounge.webp',
    description: 'Smooth, underarm perfection with laser technology.',
    price: '₱499',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's49',
    category: 'c6',
    title: 'Carbon Laser Elbow',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Elbow-Jevelme-Beauty-Lounge.webp',
    description: 'Renew skin texture with precision treatment care.',
    price: '₱499',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's50',
    category: 'c6',
    title: 'Carbon Laser Nape',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Nape-Jevelme-Beauty-Lounge.webp',
    description: 'Define elegance with a refined nape.',
    price: '₱399',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's51',
    category: 'c6',
    title: 'Carbon Laser Knees',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Knees-Jevelme-Beauty-Lounge.webp',
    description: 'Enhance knees with a smooth, youthful appearance.',
    price: '₱599',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's52',
    category: 'c6',
    title: 'Carbon Laser Bikini',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Bikini-Jevelme-Beauty-Lounge.webp',
    description: 'Laser beauty for confidence and allure',
    price: '₱799',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's53',
    category: 'c6',
    title: 'Carbon Laser Butt',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Butt-Jevelme-Beauty-Lounge.webp',
    description: 'Lift and firm with advanced laser therapy',
    price: '₱699',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's54',
    category: 'c6',
    title: 'Carbon Laser Brazilian',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Carbon-Laser-Brazilian-Jevelme-Beauty-Lounge.webp',
    description: 'Precision care for a flawless Brazilian look.',
    price: '₱1,199',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's55',
    category: 'c7',
    title: 'Diode Face',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Face-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Smooth contours, radiant complexion await you.',
    price: '₱499',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's56',
    category: 'c7',
    title: 'Diode Upper Lips & Chin',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Upper-Lips-Chin-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Say goodbye to unwanted facial hair.',
    price: '₱499',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's57',
    category: 'c7',
    title: 'Diode Half Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Half-Arms-Laser-Treatment-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Sculpted, toned arms in no time.',
    price: '₱599',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's58',
    category: 'c7',
    title: 'Diode Full Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Full-Arms-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Flaunt flawless arms with confidence.',
    price: '₱999',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's59',
    category: 'c7',
    title: 'Diode Tummy',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Tummy-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Achieve a slimmer, more defined waistline.',
    price: '₱1,199',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's60',
    category: 'c7',
    title: 'Diode Bikini',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Bikini-Jevelme-Beauty-Lounge.webp',
    description: 'Perfect for a confident beach-ready body.',
    price: '₱899',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's61',
    category: 'c7',
    title: 'Diode Butt',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Butt-Jevelme-Beauty-Lounge.webp',
    description: 'Lifted, firm, and contoured buttocks.',
    price: '₱699',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's62',
    category: 'c7',
    title: 'Diode Brazilian',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Brazilian-Jevelme-Beauty-Lounge.webp',
    description: 'Experience sleek confidence, perfectly defined.',
    price: '₱1,299',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's63',
    category: 'c7',
    title: 'Diode Half Legs',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Half-Legs-Jevelme-Beauty-Lounge.webp',
    description: 'Target specific areas for sleeker legs.',
    price: '₱799',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's64',
    category: 'c7',
    title: 'Diode Full Legs',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Full-Legs-Jevelme-Beauty-Lounge.webp',
    description: 'Flaunt sleek, toned legs confidently.',
    price: '₱1,199',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's65',
    category: 'c7',
    title: 'Diode Bikini Laser',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Bikini-Laser-Jevelme-Beauty-Lounge.webp',
    description: 'Experience hair-free confidence in intimate areas.',
    price: '₱1,000',
    duration: '1 hour 15 mins',
  ),
  ServiceProduct(
    id: 's66',
    category: 'c7',
    title: 'Diode Under Arm',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Diode-Underarm-Jevelme-Beauty-Lounge.webp',
    description: 'Say goodbye to underarm stubble effortlessly.',
    price: '₱499',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's67',
    category: 'c8',
    title: 'Upper Lip',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Waxing-Hair-Removal-Service-Jevelme-Beauty-Lounge.webp',
    description: 'Precision hair removal for a smooth, flawless finish.',
    price: '₱399',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's68',
    category: 'c8',
    title: 'Under Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hair-Waxing-Removal-Jevelme-Beauty-Lounge.webp',
    description: 'Experience smooth, stubble-free underarms.',
    price: '₱299',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's69',
    category: 'c8',
    title: 'Under Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hair-Removal-Waxing-Jevelme-Beauty-Lounge.webp',
    description: 'Achieve toned, hair-free arms with confidence.',
    price: '₱349',
    duration: '30 mins',
  ),
  ServiceProduct(
    id: 's70',
    category: 'c8',
    title: 'Under Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Waxing-Hair-Removal-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Target unwanted hair for sleeker, smoother legs',
    price: '₱449',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's71',
    category: 'c8',
    title: 'Full Legs',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Full-Legs-Wax-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Flaunt flawless, hair-free legs confidently.',
    price: '₱799',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's72',
    category: 'c8',
    title: 'Brazilian',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Waxing-Laser-Hair-Removal-Jevelme-Beauty-Lounge.webp',
    description: 'Experience sleek confidence with perfect definition.',
    price: '₱899',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's73',
    category: 'c8',
    title: 'Full Arms',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hair-Waxing-Removal-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Achieve toned, hair-free arms effortlessly.',
    price: '₱599',
    duration: '45 mins',
  ),
  ServiceProduct(
    id: 's74',
    category: 'c9',
    title: 'Face Warts Removal',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Warts-Jevelme-Beauty-Lounge-1.webp',
    description: 'Smooth, clear skin without facial warts.',
    price: '₱999',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's75',
    category: 'c9',
    title: 'Neck Warts Removal',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Wart-Removal-Jevelme-Beauty-Lounge-1.webp',
    description: 'Say farewell to neck warts for smoother skin.',
    price: '₱1,099',
    duration: '1 hour',
  ),
  ServiceProduct(
    id: 's76',
    category: 'c9',
    title: 'Chess Warts Removal',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Warts-Removal-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
    description: 'Flaunt a flawless chest with wart-free skin.',
    price: '₱1,399',
    duration: '1 hour 30 mins',
  ),
  ServiceProduct(
    id: 's77',
    category: 'c9',
    title: 'Back Warts Removal',
    imageUrl:
        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Warts-Removal-Services-Jevelme-Beauty-Lounge.webp',
    description: 'Achieve a smooth, clear back with wart removal.',
    price: '₱1,999',
    duration: '1 hour 30 mins',
  ),
];

const dummyStaff = [
  StaffModel(
    id: 's1',
    image: 'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/happy-woman-sitting-in-bed-using-cell-phone-e1716816253113.jpg',
    staffName: 'Jenny',
    location: 'Imus City, Cavite',
    position: 'Technician',
    rating: 4.4,
  ),
  StaffModel(
    id: 's2',
    image: 'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/portrait-young-beautiful-sexy-asian-korean-woman-slim-fit-body-isolated-of-touch-face-facial-e1716816114571.jpg',
    staffName: 'Cristy',
    location: 'Imus City, Cavite',
    position: 'Technician',
    rating: 4.4,
  ),
  StaffModel(
    id: 's3',
    image: 'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/beautiful-asian-women-smile-and-happy-with-singapore-city-view-e1716815723753.jpg',
    staffName: 'Jayvin',
    location: 'Imus City, Cavite',
    position: 'Technician',
    rating: 4.4,
  ),
  StaffModel(
    id: 's4',
    image: 'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/the-young-woman-post-in-the-city-for-photo-e1716815471832.jpg',
    staffName: 'Mary',
    location: 'Imus City, Cavite',
    position: 'Technician',
    rating: 4.4,
  ),
];
