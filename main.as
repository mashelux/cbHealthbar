using namespace CB;
using namespace B3D;

Image HealthMeter;

void Hook_Initialize() {
    HealthMeter = LoadImage("GFX\\HealthMeter.png");
}

void Hook_DrawHUD() {
    float x = 80 * Options::HUDScaleFactor;
    float y = 162 * Options::HUDScaleFactor;
    float width = 204 * Options::HUDScaleFactor;
    DrawBar(HealthMeter, x, y, width, Player::Bloodloss / 100.0);
}

// DrawBar() from CB, implemented for AS by mashelux
// Note that this is for the bar/meter only and not the icon.
// img: The image you want as a bar (BlinkMeter, StaminaMeter, etc)
// x, y: Where the bar is positioned
// width: Self explanatory
// filled: How much filled is the bar (100 = full, 0 = depleted)
// centerX: Unsure what this does, but in CB its set to false most of the time
void DrawBar(Image img, float x, float y, float width, float filled, bool centerX = false) {
    int spacing = img.Width + 2;
    width = int(width / spacing) * spacing + 3;
    
    int height = img.Height + 6;

    if (centerX) {
        x -= width / 2; 
    }

    SetColor(255, 255, 255);
    Rect(x, y, width, height, 0);

    for (int i = 1; i < int(((width - 6) * filled) / spacing); i++) {
        img.Draw(x + 3 + spacing * (i - 1), y + 3);
    }
}