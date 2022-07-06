import minionardos.*
import villanos.*

class Maldades {
	var property minionsAsignados = []
	method asignarMinions(minionsito){
		minionsAsignados.add(minionsito)
	}
	method ejecutar(ciudad){
		if (minionsAsignados.size()>0){
		}
		else {
			throw new Exception (message = "Sin minions asignados")
	}
	}
	method maldadEn(ciudad)
	method maldadRealizadaPor(minionsito) 
	method esCapaz(minionsito)
}

class Congelar inherits Maldades{
	override method maldadEn(ciudad){
		ciudad.modificarTemp(-30)
	}
	override method maldadRealizadaPor(minionsito){
		minionsito.alimentar(minionsito,10)
	}
	override method esCapaz(minionsito){
		return (minionsito.armas().filter({armita => armita.nombre()=="Rayo Congelante"}).
			 size() > 0 and minionsito.nivelDeConcentracion() == 500)
	}
} 
class Robar inherits Maldades{
	var property objetivo 
	override method maldadEn(ciudad){
		ciudad.perder(objetivo)
	}
	override method maldadRealizadaPor(minionsito){
		objetivo.maldadRealizadaPor(minionsito)
	}
	override method esCapaz(minionsito){
		return (minionsito.esPeligroso() 
				and 
				objetivo.esCapaz(minionsito))
	}
}

object piramides{
	var property altura
	method esCapaz(minions){
		return (minions.nivelDeConcentracion()>= altura/2)
}
	method maldadRealizadaPor(minionsito){
		minionsito.alimentar(10)
	}
}
object sueroMutante{
	method esCapaz(minions){
		return (minions.bananas()>=100 and minions.nivelDeConcentracion()>=23)
	}
	method maldadRealizadaPor(minionsito){
		minionsito.consumirSuero()
	}
}
object luna{
	method esCapaz(minions){
		return minions.armas("Rayo para encoger")
	}
	method maldadRealizadaPor(minionsito){
		minionsito.otorgarArma(new Arma(nombre = "Rayo Congelante",potencia = 10))
	}
}

class Ciudad {
	var property temperatura
	const elementos = []
	method modificarTemp(temp){
		temperatura += temp
	}
	method perder(objeto){
		elementos.remove(objeto)
	}
}

