import 'package:flutter/material.dart';

class Exercise3LayoutDemo extends StatelessWidget {
  const Exercise3LayoutDemo({super.key});

  final List<Map<String, String>> movies = const [
    {
      'title': 'Mai',
      'year': '2024',
      'description':
      'Mai kể về một người phụ nữ có cuộc sống nhiều khó khăn và những biến cố trong tình cảm. Bộ phim tập trung vào câu chuyện tình yêu, gia đình và những lựa chọn trong cuộc sống.'
    },
    {
      'title': 'Nhà Bà Nữ',
      'year': '2023',
      'description':
      'Nhà Bà Nữ xoay quanh một gia đình nhiều thế hệ sống cùng nhau. Những mâu thuẫn giữa cha mẹ và con cái dần bộc lộ, qua đó thể hiện những vấn đề quen thuộc trong đời sống gia đình Việt Nam.'
    },
    {
      'title': 'Bố Già',
      'year': '2021',
      'description':
      'Bố Già kể về cuộc sống của một gia đình lao động tại Sài Gòn. Bộ phim khai thác tình cảm cha con, sự khác biệt giữa các thế hệ và những khó khăn trong cuộc sống.'
    },
    {
      'title': 'Mắt Biếc',
      'year': '2019',
      'description':
      'Mắt Biếc kể về tình cảm của Ngạn dành cho Hà Lan từ khi còn nhỏ. Câu chuyện theo chân họ qua nhiều giai đoạn của cuộc đời với những tình cảm đẹp nhưng cũng đầy tiếc nuối.'
    },
    {
      'title': 'Hai Phượng',
      'year': '2019',
      'description':
      'Hai Phượng kể về hành trình của một người mẹ tìm kiếm con gái sau khi cô bé bị bắt cóc. Bộ phim có nhiều cảnh hành động và tập trung vào tình mẫu tử.'
    },
    {
      'title': 'Em Và Trịnh',
      'year': '2022',
      'description':
      'Em Và Trịnh lấy cảm hứng từ cuộc đời và âm nhạc của nhạc sĩ Trịnh Công Sơn, đồng thời kể về những mối quan hệ và những người phụ nữ có ảnh hưởng đến cuộc đời ông.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 - Layout Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Movie List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Row(
              children: [
                Icon(Icons.movie),
                SizedBox(width: 8),
                Text(
                  'Popular Movies',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(movie['title']!),
                      subtitle: Text('Year: ${movie['year']}'),
                      trailing: const Icon(Icons.arrow_forward_ios),

                      // Open movie detail screen
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(
                              title: movie['title']!,
                              year: movie['year']!,
                              description: movie['description']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String year;
  final String description;

  const MovieDetailScreen({
    super.key,
    required this.title,
    required this.year,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.movie,
              size: 80,
              color: Colors.blue,
            ),

            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Release year: $year',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}