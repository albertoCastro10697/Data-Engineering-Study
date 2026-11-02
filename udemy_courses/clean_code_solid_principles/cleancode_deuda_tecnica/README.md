# Clean Code y deuda técnica

## ¿Qué es la deuda técnica?

La deuda técnica es la falta de calidad en algún aspecto del software. Puede generarse de forma intencional o involuntaria y afectar al código, las pruebas o la documentación. También puede acumularse cuando se pospone una refactorización necesaria.

Por ejemplo, cuando se prioriza una salida a producción y se deja pendiente una mejora o corrección, se puede asumir deuda técnica.

### ¿Qué consecuencias tiene?

La falta de calidad puede repercutir en el futuro y generar costos económicos por el tiempo adicional necesario para:

- Realizar mantenimiento.
- Refactorizar el código.
- Comprender cómo funciona.
- Transferir el conocimiento del código a otras personas.

> La mala calidad del software siempre termina siendo asumida por alguien.

## Cuadrantes de la deuda técnica

En mis apuntes se mencionan cuatro cuadrantes. Por ahora, tengo registrados estos tres:

| Tipo de deuda | Descripción |
| --- | --- |
| Imprudente y deliberada | Se toman decisiones de forma consciente e imprudente, aun sabiendo que perjudican la calidad. |
| Inadvertida | Se genera sin advertirla, por falta de experiencia o conocimiento. |
| Prudente | Se reconoce la deuda y se acepta su existencia. Si no se resuelve a tiempo, después se pagan sus «intereses». |

**Pendiente:** completar el cuarto cuadrante y precisar la clasificación de los cuatro.

## ¿Cómo se paga la deuda técnica?

Una forma de reducirla es mediante la **refactorización**: mejorar la estructura interna del código sin alterar su comportamiento, para que sea más entendible y más fácil de adaptar a cambios.

Lo ideal es contar con **pruebas automáticas** que ayuden a verificar que el comportamiento se mantiene después de los cambios.

## ¿Qué es Clean Code?

**Clean Code es código escrito con la intención de que otra persona lo entienda.**

Una de sus prácticas es utilizar nombres claros y comprensibles para los conceptos, las variables y las funciones.

### Nombres pronunciables y expresivos

Los nombres deben comunicar qué representa cada elemento.

| Nombre poco claro | Nombre más expresivo |
| --- | --- |
| `n` | `numberOfUnits` |
| `tx` | `tax` |
| `cat` | `category` |
| `ddmmyyyy` | `birthDate` |

### Funciones: parámetros y argumentos

Apuntes visuales sobre parámetros y argumentos:

![Parámetros y argumentos de las funciones](parametros_argumentos_funciones.png)

### Orden de los argumentos y buenas prácticas

Apuntes visuales sobre el orden de los argumentos y las buenas prácticas al llamar a una función:

![Orden de los argumentos y buenas prácticas al llamar a funciones](parametros_argumentos_funciones_2.png)
