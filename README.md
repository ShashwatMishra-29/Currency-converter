💱 Currency Converter – Flutter App
Currency Converter is a lightweight Flutter app that allows users to convert between international currencies using real-time exchange rates. Built with a clean UI and responsive design, this app is ideal for travelers, traders, and anyone needing quick and reliable currency conversions.

🚀 Features
🔁 Real-Time Currency Conversion using API

🌍 Support for 100+ world currencies (USD, EUR, INR, GBP, JPY, etc.)

💾 Save frequently used conversions (optional feature)

🎨 Dark/Light Mode Toggle

🔎 Searchable currency dropdowns for easy navigation

📱 Fully responsive design for Android & iOS

🛠️ Setup Instructions
Clone the Repo


git clone https://github.com/your-username/currency-converter.git
cd currency-converter
Install Dependencies


flutter pub get
Run the App


flutter run
(Optional) Set up Environment Variables

If your API key is required (for premium API access), use flutter_dotenv or constants.dart to store it securely.

🔌 API Details
🧮 Currency Exchange Rates – [ExchangeRate API or similar]
Endpoint:


https://api.exchangerate-api.com/v4/latest/USD
Returns:

json

{
  "base": "USD",
  "date": "2024-04-10",
  "rates": {
    "EUR": 0.91,
    "INR": 83.12,
    "JPY": 151.12,
    ...
  }
}
Used in: api_service.dart

Updates every 24 hours (for free-tier APIs)

📁 Folder Structure Overview

lib/
├── main.dart               # App entry point
├── models/
│   └── currency_model.dart # Currency model
├── services/
│   └── api_service.dart    # Fetches exchange rates
├── providers/
│   └── currency_provider.dart # State management (optional)
├── screens/
│   ├── home_screen.dart    # Main converter UI
│   └── saved_screen.dart   # (Optional) Saved currencies
├── widgets/
│   └── currency_dropdown.dart
│   └── convert_button.dart
├── theme/
│   └── app_theme.dart      # Light/Dark mode
🧠 State Management
Can use Riverpod, Provider, or setState depending on the complexity you prefer.

Theme switching and conversion logic can be efficiently managed using ChangeNotifier or Riverpod.

📸 Screenshots
(Insert your UI screenshots here for better repo presentation)

🙌 Contributing
Pull requests are welcome! If you'd like to propose a new feature or fix a bug, open an issue first to discuss the changes.

📬 Contact
For questions, suggestions, or collaborations, feel free to reach out via issues or contact me through GitHub. 
