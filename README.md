# HR Analytics Employee
Este proyecto implementa un pipeline de datos analíticos estructurado bajo la **Arquitectura Medallón** (Bronce, Plata, Oro). El flujo utiliza un enfoque **ELT (Extract, Load, Transform)** desplegado en un entorno *on-premises* para procesar datos de retención de empleados (HR Employee Attrition).

## Arquitectura y Tecnologías

El ecosistema local está construido con las siguientes herramientas para asegurar un flujo eficiente desde la extracción hasta la disponibilidad en tableros de inteligencia de negocios mediante DAX y Power BI:

*   **PostgreSQL:** Actúa como el Data Warehouse local donde ocurre el procesamiento analítico y la transformación estructural.
*   **Python (`psycopg2`, `python-dotenv`):** Actúa como el orquestador ágil para la etapa de Extracción y Carga masiva (EL).
*   **Arquitectura Medallón:** Separación lógica de los datos a través de esquemas físicos en la base de datos.

## Fases del Pipeline de Datos (ELT)

El pipeline se ha completado exitosamente a través de sus tres capas lógicas:

### 1. Capa Bronce (Ingesta Cruda)
Se completó la fase **EL (Extract & Load)** utilizando Python para automatizar la configuración inicial de la infraestructura y el volcado masivo de datos:
*   **Generación Dinámica de Esquemas:** Creación automatizada del esquema `bronze` y definición explícita del código DDL.
*   **Patrón Truncate & Load:** Implementación de limpieza de tabla previa a la carga para garantizar un pipeline idempotente (sin duplicados en recargas).
*   **Carga Masiva Optimizada:** Uso del comando nativo `COPY` de PostgreSQL a través del driver `psycopg2`, inyectando el CSV en crudo a máxima velocidad, reemplazando las inserciones fila por fila.

### 2. Capa Plata (Limpieza y Estandarización)
Se delegó el procesamiento a PostgreSQL para realizar transformaciones puramente con SQL:
*   **Refactorización y Convenciones:** Estandarización de todas las columnas al formato `snake_case`.
*   **Limpieza de Texto:** Uso de funciones anidadas (`REPLACE`) para limpiar caracteres no deseados (ej. guiones en la columna `business_travel`).
*   **Reducción de Ruido:** Eliminación de columnas sin varianza o valor analítico (ej. `EmployeeCount`, `StandardHours`, `Over18`).
*   **Integridad:** Definición de la llave primaria (`id_employee`) para asegurar la unicidad de los registros.

### 3. Capa Oro (Modelado Dimensional)
Se construyó un **Esquema de Estrella (Star Schema)** optimizado para herramientas de Business Intelligence:
*   **Tablas de Dimensión:** Creación de catálogos estáticos (ej. `dim_education`, `dim_environment_satisfaction`, `dim_job_involvement`) asignando identificadores únicos.
*   **Tabla de Hechos:** Creación de la tabla central `employee_attrition` que consolida las métricas numéricas e integra los identificadores de las dimensiones.
*   **Integridad Referencial:** Implementación de restricciones de llaves foráneas (`FOREIGN KEY`) para conectar la tabla de hechos con sus dimensiones de forma robusta.

## Estructura del Proyecto

```text
HR Analytics Employee/
├── Data/
│   └── 01-bronze/
│       └── WA_Fn-UseC_-HR-Employee-Attrition.csv
├── sql/
├── .env
├── .gitignore
├── main.py
└── requirements.txt
```