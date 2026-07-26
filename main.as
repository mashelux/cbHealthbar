using namespace CB;
using namespace B3D;

Image@ HealthMeter, HealthIcon;

void Hook_Initialize() {
    HealthMeter = LoadImage("GFX\\HealthMeter.png", 1.0);
    HealthIcon = LoadImage("GFX\\HealthIcon.png", 1.0);
}

bool Hook_DrawHUD() {
    DrawHealthMeter();
    return false;
}

void DrawHealthMeter() {
    int x = 80 * Menu::HUDScale;
    int y = 582 * Menu::HUDScale;
    int width = 204 * Menu::HUDScale;
    float filled = (100.0 - Player::Bloodloss) / 100.0;
    Menu::DrawBar(HealthMeter, x, y, width, filled);
}

void DrawHealthIcon() {
    // TODO: implement health icon
}