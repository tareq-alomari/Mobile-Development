// lib/product_card.dart
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final List<String> productImages = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'مواد غذائية',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 20),

        //---------------------------------------------------------
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //---------------------------------------------------------
                      const Text(
                        'حليب طازج كامل الدسم',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'حليب طازج عالي الجودة غني بالفيتامينات والمعادن الطبيعية',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 16),

                      //---------------------------------------------------------
                      RichText(
                        textAlign: TextAlign.right,
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Color(0xFF0F172A),
                          ),
                          children: [
                            TextSpan(
                              text: '250',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' ريال',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      //---------------------------------------------------------
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('(4/5)', style: TextStyle(fontSize: 12)),
                          SizedBox(width: 4),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      //---------------------------------------------------------
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F172A),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 0,
                              ),
                              child: const Text('إضافة للسلة'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                side: BorderSide(color: Colors.grey.shade300),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text(
                                'تفاصيل',
                                style: TextStyle(color: Color(0xFF0F172A)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                //---------------------------------------------------------
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: PageView.builder(
                            itemCount: productImages.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Image.asset(
                                productImages[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),

                      //---------------------------------------------------------
                      Positioned(
                        bottom: 10.0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(productImages.length, (
                            index,
                          ) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2.0,
                              ),
                              height: 6.0,
                              width: _currentPage == index ? 18.0 : 6.0,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? Colors.white
                                    : Colors.white54,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          }),
                        ),
                      ),
                      //---------------------------------------------------------
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD1FAE5),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: const Text(
                            'متاح',
                            style: TextStyle(
                              color: Color(0xFF10B981),
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
