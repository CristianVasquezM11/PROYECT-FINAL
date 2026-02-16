// Variables utiles 
// Precio base de la cotizaci—n, en quetzales, lo puede cambiar
var precio_base = 2000;

// Valores de los recargos 
var edad_18 = 0.1; // 10%
var edad_25 = 0.2; // 20%
var edad_50 = 0.3; // 30%

var casado_18 = 0.1; // 10%
var casado_25 = 0.2; // 20%
var casado_50 = 0.3; // 30%

var hijos_recargo = 0.2; // 20% (recargo por cada hijo, configurable)

// Recargo
var recargo = 0;
var recargo_total = 0;

// Precio final 
var precio_final = 0;

// Mensajes de alerta para ingresar datos 
var nombre = (prompt("Ingrese su nombre, por favor") || "").trim();

// Valida nombre
if (nombre.length === 0) {
  alert("Debe ingresar un nombre para continuar.");
}

// Edad del asegurado
var edad = prompt("ÀCu‡ntos a–os tiene? Ingrese solamente nœmeros") || "0";
var edad_numero = parseInt(edad, 10);
if (isNaN(edad_numero)) edad_numero = 0;

// ÀEst‡ casado actualmente?
var casado = (prompt("ÀEst‡ casado actualmente? (SI/NO)") || "NO").trim();

// Edad del c—nyuge (solo si est‡ casado)
var edad_conyuge_numero = 0;
if (casado.toUpperCase() === "SI" || casado.toUpperCase() === "YES") {
  var edad_conyuge = prompt("ÀQuŽ edad tiene su esposo/a?", "0") || "0";
  edad_conyuge_numero = parseInt(edad_conyuge, 10);
  if (isNaN(edad_conyuge_numero)) edad_conyuge_numero = 0;
}

// Cantidad de hijos
var hijos = prompt("ÀTiene hijos o hijas? (ingrese un nœmero)") || "0";
var cantidad_hijos = parseInt(hijos, 10);
if (isNaN(cantidad_hijos)) cantidad_hijos = 0;

// 1) Recargo por edad del asegurado
if (edad_numero >= 18 && edad_numero < 25) {
  recargo = precio_base * edad_18;
  recargo_total += recargo;
} else if (edad_numero >= 25 && edad_numero < 50) {
  recargo = precio_base * edad_25;
  recargo_total += recargo;
} else if (edad_numero >= 50) {
  recargo = precio_base * edad_50;
  recargo_total += recargo;
} // Si menor de 18, no aplica recargo (puedes decidir otra l—gica)

// 2) Recargo por la edad del c—nyuge (si aplica)
if (casado.toUpperCase() === "SI" || casado.toUpperCase() === "YES") {
  if (edad_conyuge_numero >= 18 && edad_conyuge_numero < 25) {
    recargo = precio_base * casado_18;
    recargo_total += recargo;
  } else if (edad_conyuge_numero >= 25 && edad_conyuge_numero < 50) {
    recargo = precio_base * casado_25;
    recargo_total += recargo;
  } else if (edad_conyuge_numero >= 50) {
    recargo = precio_base * casado_50;
    recargo_total += recargo;
  }
}

// 3) Recargo por la cantidad de hijos
if (cantidad_hijos > 0) {
  // Por ejemplo: 20% del precio base por cada hijo
  var recargo_hijos = precio_base * hijos_recargo * cantidad_hijos;
  recargo_total += recargo_hijos;
}

// Precio final 
precio_final = precio_base + recargo_total;

// Resultados
alert("Para el asegurado " + nombre);
alert("El recargo total sera de: " + recargo_total);
alert("El precio sera de: " + precio_final);
