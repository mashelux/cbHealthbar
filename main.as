using namespace CB;
using namespace B3D;

Image@ HealthMeter;

void Hook_Initialize() {
    HealthMeter = LoadImage("GFX\HealthMeter.png");
}

bool Hook_DrawHUD() {
    int x = 80 * Menu::HUDScale;
    int y = 850 * Menu::HUDScale;
    int width = 204 * Menu::HUDScale;
    Menu::DrawBar(HealthMeter, x, y, width, Player::Bloodloss / 100.0);
    return false;
}
