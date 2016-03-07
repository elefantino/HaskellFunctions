myWeather x m
	|x1 <= (-25) = "It is very cold"
	|x1 <= 0 = "It is cold"
	|x1 <= 25 = "It is warm"
	|otherwise = "It is hot"
	where x1 = case m of
		"Celsius" -> x
		"Kelvin" -> x - 273.15
		"Fahrenheit" -> (x - 32) *5 /9
		m -> error "Such measures do not exist"