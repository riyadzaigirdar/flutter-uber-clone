# Add custom fonts

    fonts:
    - family: Signatra <-- Name you will use in your code fontfamily
      fonts:
        - asset: assets/fonts/Signatra.ttf <-- absolute path to fonts 
    - family: Brand-Regular
      fonts:
        - asset: assets/fonts/bolt-regular.ttf
    - family: Brand Bold
      fonts:
        - asset: assets/fonts/bolt-semibold.ttf
    - family: Ibm-Flex-Sans
      fonts:
        - asset: assets/fonts/ibm-flex-sans.ttf

# AssetImage Widget can be added if you wrap that in image widget

    Image(
      image: AssetImage("path/to/image")
    )

# primary swatch textfield er focus color change kore

    Map<int, Color> color = {
      50: Colors.black,
      100: Colors.black,
      200: Colors.black,
      300: Colors.black,
      400: Colors.black,
      500: Colors.black,
      600: Colors.black,
      700: Colors.black,
      800: Colors.black,
      900: Colors.black,
      };

      MaterialColor colorCustom = MaterialColor(0xff123456, color);

# Add Border Radius to elevated button

    ElevatedButton(
      onPressed: (){}, 
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        backgroundColor: Colors.yellow,
        padding: EdgeInsets.symmetric(horizontal: 170.0, vertical: 20.0)
      ),
      child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
    )