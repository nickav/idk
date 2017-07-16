/// array_includes(array, search);
/// @param array
/// @param search

var array = argument0;
var search = argument1;

for (var i=0; i < array_length_1d(array); i++) {
	if (array[@ i] == search) {
		return true;
	}
}

return false;