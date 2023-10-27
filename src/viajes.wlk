import socios.*

class Actividad {
	const idiomas = #{}
	    
	method diasDeActividad()
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method agregarIdiomas(conjDeIdiomas) {
		idiomas.addAll(conjDeIdiomas)
	}
	method esInteresante() = idiomas.size() > 1
	method idiomas() = idiomas.asList()
	method esRecomendada(unSocio){
		return self.esInteresante() && unSocio.leAtraeActividad(self) && !unSocio.actividadYaRealizada(self)
	}
}

class ViajeDePlaya inherits Actividad {
	const largoDePlaya
	
	override method diasDeActividad() = largoDePlaya / 500
	override method implicaEsfuerzo() = largoDePlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcurcionACiudad inherits Actividad {
	const atraccionesAVisitar
	
	override method diasDeActividad() = atraccionesAVisitar / 2
	override method implicaEsfuerzo() = atraccionesAVisitar.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() || atraccionesAVisitar == 5
}

class ExcurcionACiudadTropical inherits ExcurcionACiudad {
	
	override method diasDeActividad() = super() + 1
	override method sirveParaBroncearse() = true
	
}

class SalidaDeTrekking  inherits Actividad {
	const kilometrosARecorrer
	const diasDeSol
	
	override method diasDeActividad() = kilometrosARecorrer / 50
	override method implicaEsfuerzo() = kilometrosARecorrer > 80
	override method sirveParaBroncearse() {
		return (diasDeSol > 200) || (diasDeSol.between(100,200) && kilometrosARecorrer > 120)
	}
	override method esInteresante() = super() && diasDeSol > 140
	
}

class ClaseDeGimnasia inherits Actividad {
	
	override method idiomas() = #{'Español'}
	override method diasDeActividad() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method esRecomendada(unSocio) = unSocio.edad().between(20,30)
}

class TallerLiterario inherits Actividad {
	const libros = []
	
	method idiomasUsados() = libros.map({l => l.idioma()})
	
	override method diasDeActividad() = libros.size() + 1
	override method implicaEsfuerzo() = libros.any({l => l.cantPaginas() > 500})
	override method sirveParaBroncearse() = false
	
	method hayMasDeUnLibro() = libros.size() > 1
	method todosDelMismoAutor() {
		if (!self.hayMasDeUnLibro()) {
			self.error('Debe haber mas de un libro.')
		}
		return libros.all({l => l.nombreDelAutor() == l.nombreDelAutor()})
	}
	
	override method esRecomendada(unSocio) = unSocio.idiomasQueHabla() > 1
}

class Libros {
	const property idioma
	const property cantPaginas
	const property nombreDelAutor
	
}





