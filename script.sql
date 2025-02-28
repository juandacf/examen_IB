CREATE TABLE metodo_pago (
    id_metodo INTEGER PRIMARY KEY,
    nom_metodo_pago VARCHAR
);

CREATE TABLE clientes (
    doc_identidad_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR,
    apellido VARCHAR,
    telefono VARCHAR,
    correo_electronico VARCHAR,
    sexo BOOLEAN,
    direccion VARCHAR
);

CREATE TABLE vendedores (
    id_empleado INTEGER PRIMARY KEY,
    doc_identidad INTEGER,
    nombre VARCHAR,
    apellido VARCHAR,
    fecha_contratacion DATE,
    direccion VARCHAR,
    telefono VARCHAR,
    sexo BOOLEAN
);

CREATE TABLE vehiculos (
    id_vehiculo INTEGER PRIMARY KEY,
    marca VARCHAR,
    modelo VARCHAR,
    year DECIMAL(5,0),
    numero_serie_VIN VARCHAR,
    precio INTEGER,
    estado BOOLEAN
);

CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY,
    doc_identidad_cliente INTEGER,
    id_vehiculo INTEGER,
    id_empleado INTEGER,
    fecha_venta DATE,
    costo_total INTEGER,
    id_metodo INTEGER,
     FOREIGN KEY (doc_identidad_cliente) REFERENCES clientes(doc_identidad_cliente),
     FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
     FOREIGN KEY (id_empleado) REFERENCES vendedores(id_empleado),
     FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo)
);

CREATE TABLE ventas_vehiculos (
    id_venta INTEGER,
    id_vehiculo INTEGER,
    PRIMARY KEY (id_venta, id_vehiculo),
     FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
     FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo)
);

CREATE TABLE mantenimiento (
    id_mantenimiento INTEGER PRIMARY KEY,
    fecha DATE,
    costo_total INTEGER,
    id_vehiculo INTEGER,
     FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo)
);

CREATE TABLE servicios (
    id_servicio INTEGER PRIMARY KEY,
    tipo_servicio VARCHAR,
    costo_unitario INTEGER
);

CREATE TABLE mantenimiento_servicio (
    id_mantenimiento INTEGER,
    id_servicio INTEGER,
    PRIMARY KEY (id_mantenimiento, id_servicio),
     FOREIGN KEY (id_mantenimiento) REFERENCES mantenimiento(id_mantenimiento),
     FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

CREATE TABLE colores (
    id_color INTEGER PRIMARY KEY,
    hexadecimal VARCHAR
);

CREATE TABLE colores_vehiculo (
    id_vehiculo INTEGER,
    id_color INTEGER,
    PRIMARY KEY (id_vehiculo, id_color),
     FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
     FOREIGN KEY (id_color) REFERENCES colores(id_color)
);

CREATE TABLE inventario (
    id_inventario INTEGER PRIMARY KEY,
    nom_inventario VARCHAR
);

CREATE TABLE vehiculos_inventario (
    id_vehiculo INTEGER,
    id_inventario INTEGER,
    PRIMARY KEY (id_vehiculo, id_inventario),
     FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
     FOREIGN KEY (id_inventario) REFERENCES inventario(id_inventario)
);

CREATE TABLE tipo_combustible (
    id_combustible INTEGER PRIMARY KEY,
    nom_combustible VARCHAR
);

CREATE TABLE vehiculos_combustible (
    id_vehiculo INTEGER,
    id_combustible INTEGER,
    PRIMARY KEY (id_vehiculo, id_combustible),
     FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
     FOREIGN KEY (id_combustible) REFERENCES tipo_combustible(id_combustible)
);

CREATE TABLE tipo_transmision (
    id_transmision INTEGER PRIMARY KEY,
    nom_transmision VARCHAR
);

CREATE TABLE transmision_vehiculo (
    id_vehiculo INTEGER,
    id_transmision INTEGER,
    PRIMARY KEY (id_vehiculo, id_transmision),
     FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
     FOREIGN KEY (id_transmision) REFERENCES tipo_transmision(id_transmision)
);
