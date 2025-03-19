import {z} from 'zod'

export const DocenteSchema = z.object({
    nombres: z.string().min(1, "El nombre es requerido").trim(),
    apellidos: z.string().min(1,'Los apellidos son requeridos').trim(),
    ci: z.string().min(1, "El numero de carnet de identidad es requerido"),
    fecha_nacimiento: z.coerce.date().nullable().optional(),
    celular: z.string().trim().max(8,"El numero de celular debe tener 8 digitos").optional(),
    email: z.string().email("Debe ser un email valido").optional(),
    activo: z.boolean().default(true),
})

type Docente = z.infer<typeof DocenteSchema>