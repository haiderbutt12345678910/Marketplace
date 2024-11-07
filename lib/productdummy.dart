class ProductDummy {
  final String? productId;
  final String? subCatId;

  final String? title;
  final String? bidPrice;
  final bool? haveDeal;
  final String? description;
  final bool? isFreeShipping;
  final bool? isSponsored;
  final String? price;
  final String? bidTime;
  final List<String>? images;
  final List<String>? specifications;
  final double? rating;
  final int? totalRating;
  final String? soldItems;
  final String? categoryName;
  final String? categoryImageUrl;

  const ProductDummy({
    required this.categoryImageUrl,
    required this.subCatId,
    required this.categoryName,
    required this.productId,
    required this.title,
    required this.bidPrice,
    required this.haveDeal,
    required this.description,
    required this.isFreeShipping,
    required this.isSponsored,
    required this.price,
    required this.bidTime,
    required this.images,
    required this.specifications,
    required this.rating,
    required this.totalRating,
    required this.soldItems,
  });
}

class CategoryDummy {
  final String? catTitle;
  final String? catImageURL;
  final List<SubCategoryDummy>? subCategoryDummy;
  const CategoryDummy(
      {required this.catTitle,
      required this.subCategoryDummy,
      required this.catImageURL});
}

class SubCategoryDummy {
  final String? subCatTitle;
  final String? subCatImage;
  final String? subCatId;

  const SubCategoryDummy(
      {required this.subCatImage,
      required this.subCatTitle,
      required this.subCatId});
}

const List<CategoryDummy> catlist = [
  CategoryDummy(
    catTitle: "Electronics",
    subCategoryDummy: [
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.2d0fb1c0ae91d9057461f084c9c44182?rik=a0s2mfyyLFDXpA&pid=ImgRaw&r=0",
          subCatTitle: "Mobiles",
          subCatId: "mobiles"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/OIP.nliN1Ydy_fu_8qi2Zv9QDAHaHa?rs=1&pid=ImgDetMain",
          subCatTitle: "Laptops",
          subCatId: "laptops"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.c4a5514ff8043d3cb62864784a2d8570?rik=O0nBp7vr2sdHIw&pid=ImgRaw&r=0",
          subCatTitle: "Cameras",
          subCatId: "cameras"),
    ],
    catImageURL:
        "https://th.bing.com/th/id/OIP.r6FAZewL_GvlVnrFIwG-rAHaED?rs=1&pid=ImgDetMain",
  ),
  CategoryDummy(
    catTitle: "Clothing",
    subCategoryDummy: [
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.49091a6ed7292ec731c20236986f8393?rik=9CkmIV4B9ZTcQA&pid=ImgRaw&r=0",
          subCatTitle: "Men's",
          subCatId: "menswear"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.abddfab4acd6cbae60c997874be79a0a?rik=LqyIIRHHYjl0uQ&pid=ImgRaw&r=0",
          subCatTitle: "Women's",
          subCatId: "womenwear"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.16d0719ca374b34f183c080504ebe9b3?rik=U4aEeZ9dtYslEA&pid=ImgRaw&r=0",
          subCatTitle: "Kids",
          subCatId: "kidswear"),
    ],
    catImageURL:
        "https://th.bing.com/th/id/R.81f7ea1ddf488dd43464976a2bffed5a?rik=ryxpMCmi09pQig&pid=ImgRaw&r=0",
  ),
  CategoryDummy(
    catTitle: "Home Appliances",
    subCategoryDummy: [
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.47a07eadc054c89b3dc20facd41f1d22?rik=sERYlnIfL9VIMw&pid=ImgRaw&r=0",
          subCatTitle: "Kitchen",
          subCatId: "kitchen"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/OIP.MeXyGbqLfAa1nE3Nqb3hNQHaEv?rs=1&pid=ImgDetMain",
          subCatTitle: "Cleaning",
          subCatId: "cleaning"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.f9f56f839dcd6b1ab03f08051ab65f85?rik=21eqtFfBPciOWQ&riu=http%3a%2f%2fdesignlike.com%2fwp-content%2fuploads%2f2015%2f06%2fmultifunctional-furniture.jpg&ehk=9CsiXFjdyBPLibQ6ZlKHuka7V5J%2fpEkOSU9f17y4M%2fg%3d&risl=&pid=ImgRaw&r=0",
          subCatTitle: "Furniture",
          subCatId: "furniture"),
    ],
    catImageURL:
        "https://th.bing.com/th/id/R.b283d2e971f7f3a537806ac37df33591?rik=IBxK99twxIqZ5g&pid=ImgRaw&r=0",
  ),
  CategoryDummy(
    catTitle: "Books",
    subCategoryDummy: [
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.4671c2ca90739e60c287a9dab7d3fd88?rik=%2bI%2bVmfINto%2frug&pid=ImgRaw&r=0",
          subCatTitle: "Fiction",
          subCatId: "fiction"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/OIP.1QS3GO2XSYvoufP8i0k66QAAAA?rs=1&pid=ImgDetMain",
          subCatTitle: "Non-Fiction",
          subCatId: "nonfiction"),
      SubCategoryDummy(
          subCatImage:
              "https://th.bing.com/th/id/R.cebd2d0b0d38f25e7314a05fe12f18ed?rik=DR5J6mAf6w1pSw&riu=http%3a%2f%2fwww.scrolldroll.com%2fwp-content%2fuploads%2f2021%2f07%2fwill-in-the-world-biographies-and-autobiography-books.jpg&ehk=V206V8vp3ZbR6%2fLHMwUW%2bNoI%2b7h7BXTUP8SNOZxQQ%2bo%3d&risl=&pid=ImgRaw&r=0",
          subCatTitle: "Biographies",
          subCatId: "biography"),
    ],
    catImageURL:
        "https://th.bing.com/th/id/OIP.9j0kj9e2UhR1jB6q-9MviAHaEt?rs=1&pid=ImgDetMain",
  ),
];

const List<ProductDummy> productList = [
  // Electronics Category Products
  // Subcategory ID: 1 (Mobiles)
  ProductDummy(
    productId: "1",
    subCatId: "mobiles",
    title: "Huwaies Mobile Note 5 With Glass Coated",
    bidPrice: "600",
    haveDeal: true,
    description: "Huwaies Mobile Note 5 With Glass Coated.",
    isFreeShipping: true,
    isSponsored: true,
    price: "700",
    bidTime: "2024-05-20",
    images: [
      "https://th.bing.com/th/id/R.677c02172c547bba18d376beefb86970?rik=yfj2xnTAfPppRg&pid=ImgRaw&r=0",
      "https://th.bing.com/th/id/R.677c02172c547bba18d376beefb86970?rik=yfj2xnTAfPppRg&pid=ImgRaw&r=0",
      "https://th.bing.com/th/id/R.677c02172c547bba18d376beefb86970?rik=yfj2xnTAfPppRg&pid=ImgRaw&r=0",
    ],
    specifications: [
      "6.7-inch Super AMOLED display",
      "Snapdragon 888 processor",
      "12GB RAM, 256GB storage",
      "5000mAh battery",
    ],
    rating: 4.5,
    totalRating: 100,
    soldItems: "500",
    categoryName: "Electronics",
    categoryImageUrl: "https://example.com/category_electronics.jpg",
  ),
  // Add 9 more products for subcategory ID: 1 (Mobiles)

  // Subcategory ID: 2 (Laptops)
  ProductDummy(
    productId: "2",
    subCatId: "laptops",
    title:
        "Lenovo IdeaPad 3 Gaming Notebook, 15.6 120Hz FHD Display, AMD Ryzen 5 ...",
    bidPrice: "800",
    haveDeal: false,
    description:
        "Lenovo IdeaPad 3 Gaming Notebook, 15.6 120Hz FHD Display, AMD Ryzen 5",
    isFreeShipping: true,
    isSponsored: false,
    price: "900",
    bidTime: "2024-05-21",
    images: [
      "https://th.bing.com/th/id/OIP.mJpylUq_iUVWWGSYXTyXzwHaFj?rs=1&pid=ImgDetMain",
      "https://th.bing.com/th/id/OIP.mJpylUq_iUVWWGSYXTyXzwHaFj?rs=1&pid=ImgDetMain",
      "https://th.bing.com/th/id/OIP.mJpylUq_iUVWWGSYXTyXzwHaFj?rs=1&pid=ImgDetMain",
    ],
    specifications: [
      "15.6-inch Full HD display",
      "Intel Core i7 processor",
      "16GB RAM, 512GB SSD",
      "NVIDIA GeForce RTX 3060",
    ],
    rating: 4.7,
    totalRating: 150,
    soldItems: "300",
    categoryName: "Electronics",
    categoryImageUrl: "https://example.com/category_electronics.jpg",
  ),

  ProductDummy(
    productId: "3",
    subCatId: "mobiles",
    title: "Samsung Note Book S 11 pro with 6.7 led inches screen",
    bidPrice: "600",
    haveDeal: true,
    description: "Samsung Note Book S 11 pro with 6.7 led inches screen",
    isFreeShipping: true,
    isSponsored: true,
    price: "700",
    bidTime: "2024-05-20 ",
    images: [
      "https://example.com/mobile_image1.jpg",
      "https://example.com/mobile_image2.jpg",
      "https://example.com/mobile_image3.jpg",
    ],
    specifications: [
      "6.7-inch Super AMOLED display",
      "Snapdragon 888 processor",
      "12GB RAM, 256GB storage",
      "5000mAh battery",
    ],
    rating: 4.5,
    totalRating: 100,
    soldItems: "500",
    categoryName: "Electronics",
    categoryImageUrl: "https://example.com/category_electronics.jpg",
  ),

  ProductDummy(
    productId: "4",
    subCatId: "menswear",
    title: "Men's Casual Shirt",
    bidPrice: "40",
    haveDeal: true,
    description: "Comfortable and stylish casual shirt for men.",
    isFreeShipping: true,
    isSponsored: false,
    price: "50",
    bidTime: "2024-05-22",
    images: [
      "https://example.com/menswear_shirt_image1.jpg",
      "https://example.com/menswear_shirt_image2.jpg",
      "https://example.com/menswear_shirt_image3.jpg",
    ],
    specifications: [
      "100% cotton material",
      "Available in various sizes",
      "Machine washable",
      "Color: Blue",
    ],
    rating: 4.3,
    totalRating: 80,
    soldItems: "200",
    categoryName: "Clothing",
    categoryImageUrl: "https://example.com/category_clothing.jpg",
  ),
  ProductDummy(
    productId: "5",
    subCatId: "kitchen",
    title: "Stainless Steel Cooking Pot",
    bidPrice: "30",
    haveDeal: false,
    description: "Durable and easy-to-clean cooking pot for your kitchen.",
    isFreeShipping: true,
    isSponsored: true,
    price: "35",
    bidTime: "2024-05-23",
    images: [
      "https://example.com/kitchen_pot_image1.jpg",
      "https://example.com/kitchen_pot_image2.jpg",
      "https://example.com/kitchen_pot_image3.jpg",
    ],
    specifications: [
      "Stainless steel material",
      "Capacity: 5 liters",
      "Suitable for all cooktops",
      "Easy-grip handles",
    ],
    rating: 4.8,
    totalRating: 120,
    soldItems: "150",
    categoryName: "Home Appliances",
    categoryImageUrl: "https://example.com/category_home_appliances.jpg",
  ),

  ProductDummy(
    productId: "6",
    subCatId: "fiction",
    title: "The Great Gatsby",
    bidPrice: "15",
    haveDeal: true,
    description: "Classic novel by F. Scott Fitzgerald.",
    isFreeShipping: true,
    isSponsored: false,
    price: "20",
    bidTime: "2024-05-24",
    images: [
      "https://example.com/great_gatsby_cover.jpg",
      "https://example.com/great_gatsby_page1.jpg",
      "https://example.com/great_gatsby_page2.jpg",
    ],
    specifications: [
      "Author: F. Scott Fitzgerald",
      "Genre: Fiction, Classic",
      "Hardcover",
      "Published: 1925",
    ],
    rating: 4.9,
    totalRating: 200,
    soldItems: "300",
    categoryName: "Books",
    categoryImageUrl: "https://example.com/category_books.jpg",
  ),
  ProductDummy(
    productId: "7",
    subCatId: "cleaning",
    title: "Robotic Vacuum Cleaner",
    bidPrice: "200",
    haveDeal: false,
    description: "Efficient and intelligent robotic vacuum cleaner.",
    isFreeShipping: true,
    isSponsored: true,
    price: "250",
    bidTime: "2024-05-25",
    images: [
      "https://example.com/vacuum_cleaner_image1.jpg",
      "https://example.com/vacuum_cleaner_image2.jpg",
      "https://example.com/vacuum_cleaner_image3.jpg",
    ],
    specifications: [
      "Smart navigation technology",
      "Multi-surface cleaning",
      "Wi-Fi connectivity",
      "Voice control compatible",
    ],
    rating: 4.6,
    totalRating: 180,
    soldItems: "100",
    categoryName: "Home Appliances",
    categoryImageUrl: "https://example.com/category_home_appliances.jpg",
  ),

  ProductDummy(
    productId: "8",
    subCatId: "furniture",
    title: "Modern Sectional Sofa",
    bidPrice: "800",
    haveDeal: true,
    description: "Contemporary design sectional sofa for your living room.",
    isFreeShipping: true,
    isSponsored: false,
    price: "1000",
    bidTime: "2024-05-26",
    images: [
      "https://example.com/sectional_sofa_image1.jpg",
      "https://example.com/sectional_sofa_image2.jpg",
      "https://example.com/sectional_sofa_image3.jpg",
    ],
    specifications: [
      "Dimensions: 120\"W x 80\"D x 30\"H",
      "Upholstery: Fabric",
      "Color: Gray",
      "Includes ottoman",
    ],
    rating: 4.8,
    totalRating: 120,
    soldItems: "80",
    categoryName: "Home Appliances",
    categoryImageUrl: "https://example.com/category_home_appliances.jpg",
  ),
  ProductDummy(
    productId: "9",
    subCatId: "nonfiction",
    title: "Sapiens: A Brief History of Humankind",
    bidPrice: "20",
    haveDeal: false,
    description: "Bestselling book by Yuval Noah Harari.",
    isFreeShipping: true,
    isSponsored: true,
    price: "25",
    bidTime: "2024-05-27",
    images: [
      "https://example.com/sapiens_book_cover.jpg",
      "https://example.com/sapiens_page1.jpg",
      "https://example.com/sapiens_page2.jpg",
    ],
    specifications: [
      "Author: Yuval Noah Harari",
      "Genre: Non-fiction, History",
      "Paperback",
      "Published: 2011",
    ],
    rating: 4.7,
    totalRating: 250,
    soldItems: "400",
    categoryName: "Books",
    categoryImageUrl: "https://example.com/category_books.jpg",
  ),

  ProductDummy(
    productId: "10",
    subCatId: "cleaning",
    title: "Robotic Vacuum Cleaner",
    bidPrice: "300",
    haveDeal: true,
    description: "Efficient robotic vacuum cleaner for hassle-free cleaning.",
    isFreeShipping: true,
    isSponsored: false,
    price: "350",
    bidTime: "2024-05-28",
    images: [
      "https://example.com/robotic_vacuum_image1.jpg",
      "https://example.com/robotic_vacuum_image2.jpg",
      "https://example.com/robotic_vacuum_image3.jpg",
    ],
    specifications: [
      "Automatically cleans carpets, hardwood, tile, and laminate floors",
      "Smart navigation technology",
      "Wi-Fi connectivity for remote control",
      "Self-charging",
    ],
    rating: 4.6,
    totalRating: 80,
    soldItems: "120",
    categoryName: "Home Appliances",
    categoryImageUrl: "https://example.com/category_home_appliances.jpg",
  ),
  ProductDummy(
    productId: "11",
    subCatId: "fiction",
    title: "The Silent Patient",
    bidPrice: "15",
    haveDeal: true,
    description: "A gripping psychological thriller by Alex Michaelides.",
    isFreeShipping: true,
    isSponsored: true,
    price: "20",
    bidTime: "2024-05-29",
    images: [
      "https://example.com/silent_patient_cover.jpg",
      "https://example.com/silent_patient_page1.jpg",
      "https://example.com/silent_patient_page2.jpg",
    ],
    specifications: [
      "Author: Alex Michaelides",
      "Genre: Fiction, Thriller",
      "Paperback",
      "Published: 2019",
    ],
    rating: 4.9,
    totalRating: 300,
    soldItems: "600",
    categoryName: "Books",
    categoryImageUrl: "https://example.com/category_books.jpg",
  ),
  // Add 9 more products for subcategory ID: 1 (Mobiles)
];
