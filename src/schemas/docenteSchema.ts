import {z} from 'zod'

export const DocenteSchema = z.object({
    nombres: z.string().min(1, "El nombre es requerido").trim().transform(val=>val.toLowerCase().replace(/\s+/g,' ')),
    apellidos: z.string().min(1,'Los apellidos son requeridos').trim().transform(val=>val.toLowerCase().replace(/\s+/g,' ')),
    ci: z.string().min(1, "El numero de carnet de identidad es requerido").transform(val=>val.toLowerCase().replace(/\s+|((lp|cb|sc|or|pt|ch|tj|bn|pd))/g,'')),
    fecha_nacimiento: z.coerce.date().nullable().optional(),
    celular: z.string().trim().max(8,"El numero de celular debe tener 8 digitos").optional().transform(val=>val?.replace(/\s+/g,'')),
    email: z.string().email("Debe ser un email valido"),
    activo: z.boolean().default(true),
})

type Docente = z.infer<typeof DocenteSchema>

export const DocenteEditSchema = DocenteSchema.partial()