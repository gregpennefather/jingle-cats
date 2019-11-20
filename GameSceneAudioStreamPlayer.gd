extends AudioStreamPlayer

export (AudioStream) var BlaghSound
export (AudioStream) var DoingGreatSound
export (AudioStream) var BeansedItSound

func play_Blagh():
	stop()
	volume_db = -3
	stream = BlaghSound
	play()
	
func play_Doing_Great():
	stop()
	volume_db = -5
	stream = DoingGreatSound
	play()
		
func play_Beans():
	stop()
	volume_db = -3
	stream = BeansedItSound
	play()
	