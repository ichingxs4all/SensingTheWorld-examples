// WiFi stuff

//Change this for your own Wifi settings
const char* ssid = "techlab2G";
const char* pwd = "t3chl4b!";

//Wifi setup routines...nothing to change here ;-)

void setupWiFi() {
  // WiFi stuff (no timeout setting for WiFi)
#if defined(ESP_PLATFORM) || defined(ARDUINO_ARCH_RP2040)
#ifdef ESP_PLATFORM
  WiFi.disconnect(true, true);  // disable wifi, erase ap info
#else
  WiFi.disconnect(true);  // disable wifi
#endif
  delay(1000);
  WiFi.mode(WIFI_STA);
#endif

  WiFi.begin(ssid, pwd);

//WiFi.config(ip, gateway, subnet);

while (WiFi.status() != WL_CONNECTED) {
    if (debug) Serial.print(".");
    ledState = !ledState;
    digitalWrite(LED_BUILTIN, ledState);
    delay(100);
}
if (debug) Serial.print("WiFi connected, IP = ");
if (debug) Serial.println(WiFi.localIP());
}

