using namespace CB;
using namespace B3D;

Image@ HealthMeter;

void Hook_Initialize() {
    HealthMeter = LoadImage("GFX\\HealthMeter.png", 1.0);
}

bool Hook_DrawHUD() {
    int x = 80 * Menu::HUDScale;
    int y = 582 * Menu::HUDScale;
    int width = 204 * Menu::HUDScale;
    Menu::DrawBar(HealthMeter, x, y, width, Player::Bloodloss / 100.0);
    return false;
}
