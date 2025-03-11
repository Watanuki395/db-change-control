# Configuración del Formato y Linter de SQL

## Descripción

Este proyecto es una solución integral diseñada para gestionar esquemas de bases de datos y procesos de despliegue de manera eficiente. Incorpora mecanismos robustos para manejar scripts de Lenguaje de Definición de Datos (DDL) y estrategias de despliegue para garantizar la consistencia e integridad en nuestros entornos de bases de datos.

## Requisitos Previos

### Instalando Python ^3.12 

#### macOS

1. **Instalar Homebrew** (si no está instalado):

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2. **Instalar Python**:

    ```bash
    brew install python
    ```

#### Linux

1. **Actualizar la lista de paquetes**:

    ```bash
    sudo apt update
    ```

2. **Instalar Python**:

    ```bash
    sudo apt install python3 python3-venv python3-pip
    ```

#### Windows

1. **Descargar el instalador de Python** desde el [sitio web oficial de Python](https://www.python.org/downloads/).

2. **Ejecutar el instalador** y seguir las indicaciones. Asegúrate de marcar la casilla que dice "Agregar Python al PATH".

**IMPORTANTE para usuarios de Windows:** 

1. `Si ya tienes una instalación de Python en Windows, asegúrate de instalar la versión Python ^3.12 en el mismo PATH de la instalación anterior.`

2. `Por favor, asegúrate de usar el terminal predeterminado de Visual Studio o Powershell al seguir estos pasos en el sistema operativo Windows. Cualquier otro terminal externo, como bash, o una instalación como el subsistema de Linux para Windows, no funcionará para la configuración descrita en esta guía.`

### Configuración de un Entorno Virtual

1. **Navegar a tu directorio de proyecto**:

- Accede al lugar donde guardaste este proyecto.

2. **Crear un entorno virtual**:

    ```bash
    python3 -m venv myenv
    ```

3. **Activar el entorno virtual**:

    - **macOS/Linux**:

        ```bash
        source myenv/bin/activate
        ```

    - **Windows**:

        ```bash
        .\myenv\Scripts\activate
        ```

### Instalación de Dependencias

1. **Asegúrate de estar en tu directorio de proyecto y con el entorno virtual activado**.

2. **Instalar dependencias** desde `pyproject.toml` usando `Poetry`:

    Si no tienes `Poetry` instalado, puedes instalarlo con:

    * Método recomendado por Poetry --> curl

    ```bash
    curl -sSL https://install.python-poetry.org | python3 -
    ```

    - o

    ```bash
    pip install poetry
    ```

    - Después de instalar Poetry, por favor ejecuta el siguiente comando:

    ```bash
    poetry install
    ```

    - Instalar todas las dependencias de pre-commit

    ```bash
    pre-commit install
    ```

### SQLFluff

1. **Instalar la extensión de SQLFluff para Visual Studio Code**:

    - Abre Visual Studio Code.
    - Ve a la vista de Extensiones haciendo clic en el icono de Extensiones en la Barra Lateral o presionando `Ctrl+Shift+X`.
    - Busca "SQLFluff".
    - Haz clic en "Instalar".

2. **Verificar la configuración de la extensión en el archivo setting.json**

    Estas son las configuraciones actuales para la extensión SQLfluff en Linux y Mac OS. 

    **Si eres usuario de Windows, por favor actualiza el archivo de configuración con esta línea:**  `"sqlfluff.executablePath": ".\\myenv\\Scripts\\sqlfluff.exe"` 

    ```json
    {
      "sqlfluff.config": "${workspaceFolder}/.sqlfluff",
      "sqlfluff.dialect": "postgres",
      "sqlfluff.env.environmentVariables": [
        {
          "key": "example_key",
          "value": "example_value"
        }
      ],
      "sqlfluff.env.useDotEnvFile": true,
      "sqlfluff.excludeRules": [],
      "sqlfluff.executablePath": "./myenv/bin/sqlfluff", /* -- Por favor, usa esta ruta si utilizas el sistema operativo Windows -- ".\\myenv\\Scripts\\sqlfluff.exe", */
      "sqlfluff.ignoreLocalConfig": false,
      "sqlfluff.ignoreParsing": false,
      "sqlfluff.rules": [],
      "sqlfluff.suppressNotifications": true,
      "sqlfluff.workingDirectory": "",

      "sqlfluff.linter.arguments": [],
      "sqlfluff.linter.diagnosticSeverity": "error",
      "sqlfluff.linter.diagnosticSeverityByRule": [
        {
          "rule": "L010",
          "severity": "warning"
        }
      ],
      "sqlfluff.linter.lintEntireProject": false,

      "sqlfluff.format.arguments": [
        "--FIX-EVEN-UNPARSABLE"
      ],
      "sqlfluff.format.enabled": true,
      "sqlfluff.linter.run": "onSave",
      "sqlfluff.experimental.format.executeInTerminal": true,
      "editor.formatOnSave": true,
      "files.saveConflictResolution": "overwriteFileOnDisk",
    }
    ```

## Uso

### Ejecutando SQLFluff

Para ejecutar SQLFluff en tus archivos SQL:

ejemplo:
```bash
sqlfluff lint  DDL/table/sqlfile.sql
```

### Para corregir problemas automáticamente:

ejemplo:
```bash
sqlfluff fix DDL/table/sqlfile.sql
```
## Directrices de Contribución

Por favor, sigue el enfoque estructurado para asegurar la consistencia y calidad. Se espera que los contribuyentes sigan las convenciones de nomenclatura, estructuras de directorios y estándares de formato descritos en las directrices.

Al adherirse a estas prácticas, este proyecto tiene como objetivo mantener altos estándares de calidad y fiabilidad en la gestión de esquemas de bases de datos y procesos de despliegue. Proporciona un marco claro y organizado para gestionar tanto cambios urgentes como planificados, asegurando que nuestros entornos de bases de datos se mantengan estables y bien mantenidos.

### Estructura del Proyecto

- **Directorio DDL**: Contiene subdirectorios para tablas, funciones, desencadenadores y vistas, con cada script nombrado para que coincida con el objeto de base de datos correspondiente.

- **Directorio de Despliegue**: Dividido en subdirectorios `hotfix` y `scripts`, asegurando una clara separación entre parches urgentes y actualizaciones de desarrollo regular.

- **Directorio de Hotfix**: Contiene subdirectorios basados en fechas, cada uno con scripts nombrados por número de ticket para un fácil seguimiento y aplicación de correcciones urgentes.

- **Directorio de Scripts**: Organizado por fases y sprints, con scripts nombrados para reflejar el escuadrón contribuyente y el orden del script, asegurando claridad y orden en el proceso de despliegue.

### Estructura DDL

Dentro del directorio DDL, hay cuatro carpetas:

- **tablas**
- **funciones**
- **desencadenadores**
- **vistas**

#### Agregar Nuevos Objetos

- Al agregar un nuevo objeto a la base de datos, incluye el script DDL en la carpeta correspondiente.

- Nombra el archivo exactamente como el objeto se nombra en la base de datos. Por ejemplo, si creas una tabla llamada `clients_tb`, el archivo debe llamarse `clients_tb.sql`.

- Si un objeto de base de datos existente cambia, también incluye el script DDL actualizado en la carpeta correspondiente.

### Estructura de Despliegue

El área de despliegue contiene dos carpetas:

- **hotfix**
- **scripts**

#### Carpeta de Hotfix

- La carpeta de hotfix es para parches que deben aplicarse urgentemente a la base de datos, ya que afectan el entorno de producción.

- Crea una nueva carpeta con la fecha actual en el formato `YYYYMMDD`. Por ejemplo, para un hotfix aplicado el 18 de junio de 2024, crea una carpeta llamada `20240618`.

- Dentro de esta carpeta, crea el archivo del script de hotfix nombrado con el número de ticket del problema reportado. Por ejemplo, si el número de ticket es `123456`, nombra el archivo `123456.sql`.

#### Carpeta de Scripts

- La carpeta de scripts es más compleja y rastrea las fases de desarrollo, sprints y escuadrones.

- Para una nueva fase, crea una carpeta llamada `fase` seguida del número de fase, por ejemplo, `fase-15`.

- Dentro de la carpeta de fase, crea una carpeta para el sprint, por ejemplo, `sprint-2`.

- Dentro de la carpeta de sprint, crea el archivo de script con el nombre del escuadrón y el número de script, por ejemplo, `squad1-01.sql` indica que es el primer script para el escuadrón 1 en ese sprint.

- Si se necesitan varios scripts para el mismo escuadrón en el mismo sprint, incrementa el número de script en consecuencia, por ejemplo, `squad1-01.sql`, `squad1-02.sql`.

### Ejemplo de jerarquia de objetos
```
.
├── ddl
│ ├── tables
│ │ └── example_table.sql
│ ├── functions
│ │ └── example_function.sql
│ ├── triggers
│ │ └── example_trigger.sql
│ └── views
│   └── example_view.sql
└── deployment
├── hotfix
│ └── 20240618
│  └── 123456.sql
└── scripts
  └── phase-15
    └── sprint-2
      └── squada-01.sql
```

### Directrices Generales

- Asegúrate de que tu código sigue las pautas de estilo del proyecto.
- Escribe mensajes de commit claros y concisos.
- Abre un pull request con una descripción detallada de tus cambios.
- Asegúrate de que todos los scripts SQL estén correctamente formateados utilizando SQLFluff.

### Ejecutando SQLFluff

Para ejecutar SQLFluff en tus archivos SQL:

ejemplo:
```bash
sqlfluff lint  DDL/table/sqlfile.sql
```

## Ejecutando el Linting Manualmente en Todo el Proyecto
Para ejecutar el linting de SQLFluff en todo el proyecto, asegúrate de tener activado tu entorno virtual y luego ejecuta:

```bash
sqlfluff lint .
```

### Tecnologías Utilizadas
- **Python**: El lenguaje principal para scripting y automatización.
- **SQLFluff**: Una herramienta para hacer linting y formatear scripts SQL para aplicar estándares de codificación.
- **Poetry**: Usado para la gestión de dependencias y empaquetado.
- **Liquibase**: 

## Comando para ejecutar Liquibase

### Se ejecutan todos los cambios descritos en el changelog
- liquibase --changeLogFile=db.changelog-master.yaml update

### Utilizando el label, solo se ejecutan los changelogs asociados al mismo
- liquibase --changeLogFile=db.changelog-master.yaml --labels=squad-1 update
