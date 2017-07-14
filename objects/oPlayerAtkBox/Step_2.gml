with (oParGrass) {
    if (!cut) {
    // Chop grass
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
            GrassCut();
            xskew = round(random_range(2, 4)) * choose(-1, 1);
        }
        
        alarm[0] = 3;
        cut = true;
    }
}

with (oParCrate) {
    // Break crate
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
        instance_destroy();
    }
}


with (oParSolid) {
	if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
		instance_destroy();
		instance_create(x + sprite_width / 2, y + sprite_height / 2, oCratePoof);
    }
}