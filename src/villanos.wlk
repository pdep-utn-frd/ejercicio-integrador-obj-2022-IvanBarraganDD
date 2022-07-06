import minionardos.*

class Villanos{
	var minions = []
	method nuevoMinion(){
		minions.add(new Minion(bananas=5,armas=[new Arma(nombre = "Rayo Congelante", potencia = 10)]))
	}
	method otorgarArma(armaEnPartic,minion){
		minion.agregarArma(armaEnPartic)
	}
	method alimentar (minion,cantidad){
		minion.meterBanana(cantidad)
	}
	method nivelDeConcentracion(){
		
	}
	method esPeligroso(){
		
	}
	
}