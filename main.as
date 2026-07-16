using namespace CB;
using namespace B3D;

void Hook_Initialize() {
    
}

void Hook_DrawHUD() {

}

// DrawBar() from CB, implemented for AS by mashelux
// Note that this is for the bar/meter only and not the icon.
// img: The image you want as a bar (BlinkMeter, StaminaMeter, etc)
// x, y: Where the bar is positioned
// width: Self explanatory
// filled: How much filled is the bar (100 = full, 0 = depleted)
// centerX: Unsure what this does, but in CB its set to false most of the time
void DrawBar(Image img, int x, int y, int width, int filled, bool centerX = false) {
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