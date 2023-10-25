class Viaje {
	const idiomas = #{}
	    
	method diasDeViaje()
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method agregarIdiomas(conjDeIdiomas) {
		idiomas.addAll(conjDeIdiomas)
	}
	method esInteresante() = idiomas.size() > 1
	
}

class ViajeDePlaya inherits Viaje {
	const largoDePlaya
	
	override method diasDeViaje() = largoDePlaya / 500
	override method implicaEsfuerzo() = largoDePlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcurcionACiudad inherits Viaje {
	const atraccionesAVisitar
	
	override method diasDeViaje() = atraccionesAVisitar / 2
	override method implicaEsfuerzo() = atraccionesAVisitar.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() || atraccionesAVisitar == 5
}

class ExcurcionACiudadTropical inherits ExcurcionACiudad {
	
	override method diasDeViaje() = super() + 1
	override method sirveParaBroncearse() = true
	
}

class SalidaDeTrekking  inherits Viaje {
	const kilometrosARecorrer
	const diasDeSol
	
	override method diasDeViaje() = kilometrosARecorrer / 50
	override method implicaEsfuerzo() = kilometrosARecorrer > 80
	override method sirveParaBroncearse() {
		return (diasDeSol > 200) || (diasDeSol.between(100,200) && kilometrosARecorrer > 120)
	}
	override method esInteresante() = super() && diasDeSol > 140
	
}

class ClaseDeGimnasia inherits Viaje {
	
	method idioma() {
		self.agregarIdiomas(#{'Español'})
	}
	override method diasDeViaje() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
}







