## ⚙️ Setup

1. Make sure you have [Flutter](https://docs.flutter.dev/get-started/install) installed.
2. Start an emulator or connect a physical device.
3. Get the dependencies
   ```shell
   flutter pub get
   ```
4. Run the app.
   ```shell
   flutter run --release
   ```
   > **Warning** You need to setup the backend server first!<br>
   > If you want to run it offline, run the following command instead; it runs the app with some hardcoded dummy data
   ```shell
   flutter run --release --dart-define="dummy="
   ```
