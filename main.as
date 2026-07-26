using namespace CB;
using namespace B3D;

Image@ HealthMeter, HealthIcon;

void Hook_Initialize() {
    HealthMeter = LoadImage("GFX\\HealthMeter.png", 1.0);
    HealthIcon = LoadImage("GFX\\HealthIcon.png", 1.0);
}

bool Hook_DrawHUD() {
    DrawHealthMeter();
    DrawHealthIcon();
    return false;
}

// FIXME: hud scale factor bugging out meter and icon
// FIXME: hud offset not affecting meter and icon
// FIXME: different resolutions break meter and icon

void DrawHealthMeter() {
    int x = 80 * Menu::HUDScale;
    int y = 582 * Menu::HUDScale;
    int width = 204 * Menu::HUDScale;
    float filled = (100.0 - Player::Bloodloss) / 100.0;
    Menu::DrawBar(HealthMeter, x, y, width, filled);
}

void DrawHealthIcon() {
    int x = 30 * Menu::HUDScale;
    int y = 582 * Menu::HUDScale;
    int width = 30 * Menu::HUDScale;
    int height = 30 * Menu::HUDScale;
    SetColor(255, 255, 255);
    Rect(x - 1 , y - 1, width + 2, height + 2);
    HealthIcon.Draw(x, y);
}