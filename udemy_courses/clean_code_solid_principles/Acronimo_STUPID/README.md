# Acrónimo STUPID

STUPID reúne seis *code smells* (señales de que el diseño puede dificultar el mantenimiento). No son reglas absolutas: sirven para revisar el contexto y decidir si conviene cambiar el diseño.

## S — Singleton

El patrón Singleton restringe una clase a una instancia global. Puede ocultar dependencias y compartir estado entre partes del programa, lo que complica las pruebas.

```ts
class Database {
  private static instance = new Database();
  static getInstance() { return Database.instance; }
  query(sql: string) { /* ... */ }
}

// El consumidor depende de una instancia global concreta.
const users = Database.getInstance().query('SELECT * FROM users');
```

Cuando no se necesita una instancia global, es más fácil de probar recibir una abstracción o dependencia desde fuera.

## T — Tight Coupling (alto acoplamiento)

Un módulo está muy acoplado cuando depende directamente de detalles concretos de otro módulo. Un cambio en uno puede obligar a modificar varios consumidores.

```ts
class OrderService {
  private email = new SmtpEmailClient();

  placeOrder() {
    // Guardar pedido...
    this.email.send('cliente@ejemplo.com', 'Pedido recibido');
  }
}
```

`OrderService` está ligado a `SmtpEmailClient`. Inyectar una interfaz de envío permitiría cambiar el proveedor y usar un sustituto en pruebas.

## U — Untestability (difícil de probar)

El código se vuelve difícil de probar cuando combina lógica de negocio con efectos externos no controlados, como la hora del sistema, la red o el acceso a archivos.

```ts
function isExpired(expirationDate: Date): boolean {
  return expirationDate.getTime() < Date.now();
}
```

El resultado depende de la hora real. Se puede hacer más controlable pasando la hora actual como dependencia:

```ts
function isExpired(expirationDate: Date, now: Date): boolean {
  return expirationDate.getTime() < now.getTime();
}
```

## P — Premature Optimization (optimización prematura)

Optimizar antes de conocer el problema real puede añadir complejidad y hacer el código más difícil de mantener. Primero conviene implementar una solución clara y medir; después se optimiza el cuello de botella demostrado.

```ts
// Complejidad innecesaria para una colección pequeña sin mediciones
const result = items.sort(customQuickSort).filter(isValid);
```

La señal no es usar un algoritmo eficiente, sino añadir mecanismos complejos sin evidencia de que sean necesarios.

## I — Indescriptive Naming (nombres poco descriptivos)

Los nombres ambiguos esconden la intención y obligan a leer más código para comprenderlo.

```ts
const d = 30;
function calc(x: number) { return x * 1.18; }
```

Una alternativa más clara:

```ts
const paymentDeadlineDays = 30;
function addTax(amount: number) { return amount * 1.18; }
```

## D — Duplication (duplicación)

Duplicar una regla en varios lugares hace que cada cambio deba repetirse y aumenta el riesgo de inconsistencias.

```ts
function totalForInvoice(amount: number) {
  return amount + amount * 0.18;
}

function totalForReceipt(amount: number) {
  return amount + amount * 0.18;
}
```

Si ambas funciones representan la misma regla tributaria, conviene centralizarla:

```ts
function addTax(amount: number) {
  return amount * 1.18;
}
```

La abstracción debe reflejar una regla compartida real; no es necesario extraer código solo porque dos fragmentos se parecen superficialmente.
