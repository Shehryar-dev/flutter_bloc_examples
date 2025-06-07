
import '../../../constants/screen_path.dart';

class CurrencyConverterScreen extends StatelessWidget {
  const CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              child: const Text('Convert currencies in real-time',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            FadeInLeft(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: FadeInLeft(
                    delay: const Duration(milliseconds: 100),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'From',
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      items: ['USD', 'EUR', 'PKR'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) {},
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FadeInRight(
                    delay: const Duration(milliseconds: 200),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'To',
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      items: ['USD', 'EUR', 'PKR'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: FadeInUp(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.swap_horiz),
                  label: const Text('Convert'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
