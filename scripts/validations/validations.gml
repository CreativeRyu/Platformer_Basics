/// @returns {Bool}
/// @description  Prüft ob ein trampolin berührt wird oder nicht

function is_on_tramp(x, y, object_index){
	return place_meeting(x, y, object_index);
}