class Corsa {
    const property color

    method capacidad() = 4
    method peso() = 1300
    method velocidadMaxima() = 150
}

class Kwid {
  const property tanqueExtra

  method peso() = if(tanqueExtra) 1350 else 1200
  method capacidad() = if(tanqueExtra) 3 else 4 
  method velocidadMaxima() = if(tanqueExtra) 120 else 110
  method color() = azul
}

object trafic {
  var motor = pulenta
  var interior = comodo

  method cambiarMotor(nuevoMotor) {motor = nuevoMotor}
  method cambiarInterior(nuevoInterior) {interior = nuevoInterior}

  method peso() = 4000 + motor.peso() + interior.peso()
  method capacidad() = interior.capacidad()
  method velocidadMaxima() = motor.capacidadMaxima()
  method color() = blanco
}

object popular {
  method capacidad() = 12
  method peso() = 1000
}

object comodo {
  method capacidad() = 5
  method peso() = 700
}

//motores
object pulenta {
  method peso() = 800
  method velocidadMaxima() = 130
}

object bataton {
  method peso() = 500
  method velocidadMaxima() = 80
}

class AutoEspecial {
  const property capacidad
  const property velocidadMaxima
  const property peso
  const property color
}

//dependencias

class Dependencia {
  const cantidadEmpleados
  const flotaRodados= []
  method agregarRodado(rodado) {
    flotaRodados.add(rodado)
  }
  method quitarRodado(rodado) {
    flotaRodados.remove(rodado)
  }
  method pesoTotalFlota() = flotaRodados.sum({r=>r.peso()})
  method estaBienEquipada() = flotaRodados.size() >= 3 and flotaRodados.all({r=>r.velocidadMaxima()>= 100})
  method capacidadTotalEnColor(color) = flotaRodados.filter({r=>r.color() == color}).sum({r=>r.capacidad()})
  method colorDelRodadoMasRapido() = flotaRodados.max({r => r.velocidadMaxima()}).color()
  method capacidadTotalFlota() = flotaRodados.sum({r => r.capacidad()})
  method capacidadFaltante() = cantidadEmpleados - self.capacidadTotalFlota()
  method esGrande() = cantidadEmpleados > 39 and flotaRodados.size() > 4
}