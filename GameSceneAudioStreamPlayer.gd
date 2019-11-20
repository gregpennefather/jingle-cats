extends AudioStreamPlayer

export (AudioStream) var BlaghSound
export (AudioStream) var DoingGreatSound
export (AudioStream) var BeansedItSound

func play_Blagh():
	stop()
	stream = BlaghSound
	play()