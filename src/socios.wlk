import viajes.*

class Socio {
	const actividadesRealizadas = []
	const maximoDeActividades 
	const idiomasQueHabla = #{}
	const property edad
	
	method registrarActividad(unaActividad) {
		if ( actividadesRealizadas.size() == maximoDeActividades) {
	 		self.error('El maximo de actividades ya esta completo.')
	 	}
	 	actividadesRealizadas.add(unaActividad)
	}
	method esAdoradorDelSol() = actividadesRealizadas.all({a => a.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividadesRealizadas.filter({a => a.implicaEsfuerzo()})
	method maximoDeActividades() = maximoDeActividades
	method leAtraeActividad(unaActividad)
	method actividadYaRealizada(unaActividad) = actividadesRealizadas.contains(unaActividad)
	
}

class SocioTranquilo inherits Socio {
	
	override method leAtraeActividad(unaActividad) = unaActividad.diasDeViaje() >= 4
}

class SocioCoherente inherits Socio {
	
	override method leAtraeActividad(unaActividad){
		return if (self.esAdoradorDelSol()){unaActividad.sirveParaBroncearse()}
			else{unaActividad.implicaEsfuerzo()}
	}
}

class SocioRelajado inherits Socio {
	
	override method leAtraeActividad(unaActividad) {
		return idiomasQueHabla.any({i => unaActividad.idiomas().contains(i)})
	}
}





