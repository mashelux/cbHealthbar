using namespace CB;
using namespace B3D;

Image@ HealthMeter, HealthIcon;

int _y = 945;

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
    int x = HUD::StartX + 80 * HUD::Scale;
    int y = HUD::EndY - _y * HUD::Scale;
    int width = 204 * HUD::Scale;
    float filled = (100.0 - Player::Bloodloss) / 100.0;
    Menu::DrawBar(HealthMeter, x, y, width, filled);
}

void DrawHealthIcon() {
    int x = HUD::StartX + 30 * HUD::Scale;
    int y = HUD::EndY - _y * HUD::Scale;
    int width = 30 * HUD::Scale;
    int height = 30 * HUD::Scale;
    SetColor(255, 255, 255);
    Rect(x - 1 , y - 1, width + 2, height + 2);
    HealthIcon.Draw(x, y);
}