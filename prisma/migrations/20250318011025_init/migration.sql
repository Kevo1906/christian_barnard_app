-- CreateTable
CREATE TABLE "Estudiante" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nombres" TEXT NOT NULL,
    "apellidos" TEXT NOT NULL,
    "ci" TEXT NOT NULL,
    "fecha_nacimiento" DATETIME,
    "celular" TEXT,
    "email" TEXT,
    "activo" BOOLEAN NOT NULL DEFAULT true
);

-- CreateTable
CREATE TABLE "Docente" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nombres" TEXT NOT NULL,
    "apellidos" TEXT NOT NULL,
    "ci" TEXT NOT NULL,
    "fecha_nacimiento" DATETIME,
    "celular" TEXT,
    "email" TEXT,
    "activo" BOOLEAN NOT NULL DEFAULT true
);

-- CreateTable
CREATE TABLE "Curso" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "horario" TEXT NOT NULL,
    "docente_id" TEXT NOT NULL,
    CONSTRAINT "Curso_docente_id_fkey" FOREIGN KEY ("docente_id") REFERENCES "Docente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Mensualidad" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "estudiante_id" TEXT NOT NULL,
    "monto" REAL NOT NULL,
    "fecha_pago" DATETIME NOT NULL,
    "estado" TEXT NOT NULL DEFAULT 'pendiente',
    CONSTRAINT "Mensualidad_estudiante_id_fkey" FOREIGN KEY ("estudiante_id") REFERENCES "Estudiante" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Asistencia" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "docente_id" TEXT NOT NULL,
    "curso_id" TEXT NOT NULL,
    "fecha" DATETIME NOT NULL,
    "hora_entrada" DATETIME,
    "hora_salida" DATETIME,
    CONSTRAINT "Asistencia_docente_id_fkey" FOREIGN KEY ("docente_id") REFERENCES "Docente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Asistencia_curso_id_fkey" FOREIGN KEY ("curso_id") REFERENCES "Curso" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Inscripcion" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "estudiante_id" TEXT NOT NULL,
    "curso_id" TEXT NOT NULL,
    "fecha_inscripcion" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Inscripcion_estudiante_id_fkey" FOREIGN KEY ("estudiante_id") REFERENCES "Estudiante" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Inscripcion_curso_id_fkey" FOREIGN KEY ("curso_id") REFERENCES "Curso" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Asignatura" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "curso_id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    CONSTRAINT "Asignatura_curso_id_fkey" FOREIGN KEY ("curso_id") REFERENCES "Curso" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Nota" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "inscripcion_id" TEXT NOT NULL,
    "asignatura_id" TEXT NOT NULL,
    "valor" REAL NOT NULL,
    "fecha" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Nota_inscripcion_id_fkey" FOREIGN KEY ("inscripcion_id") REFERENCES "Inscripcion" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Nota_asignatura_id_fkey" FOREIGN KEY ("asignatura_id") REFERENCES "Asignatura" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Estudiante_email_key" ON "Estudiante"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Estudiante_nombres_apellidos_ci_key" ON "Estudiante"("nombres", "apellidos", "ci");

-- CreateIndex
CREATE UNIQUE INDEX "Docente_email_key" ON "Docente"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Docente_nombres_apellidos_ci_key" ON "Docente"("nombres", "apellidos", "ci");
