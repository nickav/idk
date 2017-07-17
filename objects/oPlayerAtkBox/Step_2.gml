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


with (oBulletDestructible) {
    if (!(bbox_left > other.bboxright + 10 || bbox_right < other.bboxleft - 10 || bbox_top > other.bboxbottom + 10 || bbox_bottom < other.bboxtop - 10)) {
        instance_destroy();
		
		with (oPlayer) {
			vy = -jumpHeight;
		}
    }
}

with (oParSolidDestructible) {
	if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
		instance_destroy();
    }
}

with (oEnemy) {
	if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
		hp -= 1;
    }
}