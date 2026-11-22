# Principios SOLID

SOLID es un conjunto de cinco principios de diseño que ayuda a organizar el software para que sus responsabilidades sean claras y los cambios resulten más seguros. Son guías para evaluar decisiones, no reglas para crear abstracciones innecesarias.

## S — Principio de responsabilidad única (SRP)

Una clase o módulo debe tener una responsabilidad bien delimitada: un motivo principal para cambiar. Si una clase mezcla lógica de negocio, persistencia y notificaciones, los cambios en cualquiera de esas áreas pueden afectarla.

**Señales para revisar:** la clase cambia por solicitudes de áreas distintas o contiene tareas que pueden evolucionar de forma independiente.

Ejemplo en [01-srp.ts](01-srp.ts).

## O — Principio de abierto/cerrado (OCP)

Los componentes deben permitir extender su comportamiento sin tener que modificar repetidamente el código estable que ya los utiliza. Una forma común de lograrlo es depender de abstracciones e implementar nuevas variantes detrás de una interfaz.

**Señal para revisar:** cada nueva variante obliga a editar una cadena creciente de condiciones dentro de una clase existente.

Ejemplos en [02-open-close-a..ts](02-open-close-a..ts) y [02-open-close-b.ts](02-open-close-b.ts).

## L — Principio de sustitución de Liskov (LSP)

Una instancia de un subtipo debe poder sustituir a una instancia de su tipo base sin romper las expectativas válidas de quienes usan ese tipo. Las clases derivadas deben respetar los contratos y comportamientos prometidos por la clase base.

**Señal para revisar:** una subclase necesita rechazar operaciones que el tipo base promete, o requiere que el cliente conozca el subtipo para poder usarlo correctamente.

Ejemplos en [03-liskob-a.ts](03-liskob-a.ts) y [03-liskov-b.ts](03-liskov-b.ts).

## I — Principio de segregación de interfaces (ISP)

Los clientes no deberían depender de métodos que no utilizan. Es preferible ofrecer interfaces pequeñas y enfocadas a una interfaz grande que obliga a sus implementaciones a incluir operaciones irrelevantes.

**Señal para revisar:** una implementación deja métodos vacíos, lanza errores en operaciones que no soporta o cambia por razones que no le corresponden.

## D — Principio de inversión de dependencias (DIP)

Los módulos de alto nivel, que contienen reglas importantes del negocio, no deberían depender directamente de detalles de bajo nivel, como una base de datos o un proveedor de correo. Ambos deben depender de abstracciones, y los detalles concretos deben implementar esas abstracciones.

La inyección de dependencias es una técnica para entregar a un componente las dependencias que necesita, en lugar de crearlas u obtenerlas de forma oculta. Esto hace explícitas las colaboraciones y facilita sustituir implementaciones.

## Relación con la arquitectura

Las reglas de negocio suelen cambiar por motivos distintos a los detalles de infraestructura, como la interfaz de usuario, la persistencia o la comunicación con servicios externos. Mantener esas dependencias apuntando hacia abstracciones ayuda a que el dominio tolere cambios en la infraestructura.

La arquitectura hexagonal aplica esta idea mediante puertos (abstracciones) y adaptadores (integraciones concretas). Estos apuntes podrán ampliarse con ejemplos específicos a medida que avance el curso.
