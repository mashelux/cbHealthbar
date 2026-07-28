using namespace CB;
using namespace B3D;

Image@ HealthMeter, HealthIcon;

void Hook_Initialize() {
    HealthMeter = LoadImage("GFX\\HealthMeter.png", 1.0);
    HealthIcon = LoadImage("GFX\\HealthIcon.png", 1.0);
}

bool Hook_DrawHUD() {
    // meter
    int width = 204 * HUD::Scale;
    int x = HUD::StartX + 80 * HUD::Scale;
    int y = HUD::EndY - 95 * HUD::Scale;
    Menu::DrawBar(HealthMeter, x, y, width, (100.0 - Player::Bloodloss) / 100.0);
    
    // icon
    SetColor(255, 255, 255);
    Rect(x - 51 * HUD::Scale, y - 1, 32 * HUD::Scale, 32 * HUD::Scale, 0);
    HealthIcon.Draw(x - 50 * HUD::Scale, y);

    return false;
}

// FIXME: hud scale factor bugging out meter and icon
// FIXME: hud offset not affecting meter and icon
// FIXME: different resolutions break meter and icon
