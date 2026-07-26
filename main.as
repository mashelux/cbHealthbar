using namespace CB;
using namespace B3D;

Image@ HealthMeter;

void Hook_Initialize() {
    HealthMeter = LoadImage("GFX\\HealthMeter.png", 1.0);
}

bool Hook_DrawHUD() {
    // TODO: implement health icon
    DrawHealthBar();
    return false;
}

void DrawHealthBar() {
    int x = 80 * Menu::HUDScale;
    int y = 582 * Menu::HUDScale;
    int width = 204 * Menu::HUDScale;
    float filled = 100.0 - Player::Bloodloss;
    Menu::DrawBar(HealthMeter, x, y, width, filled);
}

void DrawHealthIcon() {

}