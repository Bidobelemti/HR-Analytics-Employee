# HR Analytics Employee
Este proyecto implementa un pipeline de datos analíticos estructurado bajo la **Arquitectura Medallón** (Bronce, Plata, Oro). El flujo utiliza un enfoque **ELT (Extract, Load, Transform)** desplegado en un entorno *on-premises* para procesar datos de retención de empleados (HR Employee Attrition).

## Arquitectura y Tecnologías

El ecosistema local está construido con las siguientes herramientas para asegurar un flujo eficiente desde la extracción hasta la disponibilidad en tableros de inteligencia de negocios mediante DAX y Power BI:

*   **PostgreSQL:** Actúa como el Data Warehouse local donde ocurre el procesamiento analítico y la transformación estructural.
*   **Python (`psycopg2`, `python-dotenv`):** Actúa como el orquestador ágil para la etapa de Extracción y Carga masiva (EL).
*   **Arquitectura Medallón:** Separación lógica de los datos a través de esquemas físicos en la base de datos.

## Estado Actual del Proyecto: Ingesta Capa Bronce

Hasta el momento, se ha completado la fase **EL (Extract & Load)** hacia la capa Bronce. El script `main.py` automatiza la configuración inicial de la infraestructura y el volcado de datos:

1.  **Generación Dinámica de Esquemas:** El código de Python se encarga de crear el esquema `bronze` y definir explícitamente el código DDL de la tabla `employee_attrition` en PostgreSQL, garantizando el control sobre los tipos de datos desde el primer paso.
2.  **Patrón Truncate & Load:** Se implementó una limpieza de la tabla previa a la carga (`TRUNCATE TABLE`) para hacer el pipeline idempotente, asegurando que la tabla reciba la foto más reciente de los datos sin generar registros duplicados en ejecuciones sucesivas.
3.  **Carga Masiva Optimizada:** Se descartaron inserciones fila por fila (Pandas) a favor del comando nativo `COPY` de PostgreSQL a través del driver `psycopg2`. Esto inyecta el archivo CSV crudo directamente en el motor de la base de datos a máxima velocidad.

## Estructura del Proyecto

```text
HR Analytics Employee/
├── Data/
│   └── 01-bronze/
│       └── WA_Fn-UseC_-HR-Employee-Attrition.csv
├── .env
├── .gitignore
├── main.py
└── requirements.txt
```