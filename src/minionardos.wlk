class Minion {
	var property color = amarillo 
	var property bananas = 0
	var property armas = []
	var maldadesRealizadas = 0
	
	method otorgarArma(arma){
		armas.add(arma)
	}
	method agregarArma(armaEnPartic){
		armas.add(armaEnPartic)
	}
	
	method consumirSuero(){
		color.tomarSuero(self)
		bananas = (bananas - 1).max(0)
	}
	method armaConMasPoder(minion){
		return (minion.armas().max({unArma => unArma.potencia()}).potencia())
	}
	method esPeligroso(){
		return color.esPeligroso(self)
	}
	method nivelDeConcentracion (){
		color.nivelDeConcentracion(self)
	}
	method realizarMaldad(){
		maldadesRealizadas +=1
	}
	method meterBanana(cant){
		bananas += cant
	}
}

object amarillo{
	
	
	method nivelDeConcentracion(minion){
		return minion.armaConMasPoder() + minion.bananas() // nivel de concentracion = max poder de un arma + cantidad de bananas
	}
	method esPeligroso(minion){
		return (minion.armas().size()>2)		//es peligroso cuando tiene mas de 2 armas
	}
	method tomarSuero(minion){
		minion.color(violeta)					//cambio de color
		minion.armas().clear()       			//le quito todas las armas
	}
}


object violeta{
	method nivelDeConcentracion(minion){
		return minion.bananas()					// nivel de concentracion = cantidad de bananas
	}
	method esPeligroso(minion){
		return true								// siempre es peligroso
	}
	method tomarSuero(minion){
		minion.color(amarillo)					// cambio de color
	}
}

class Arma{
	var property nombre
	var property potencia
}