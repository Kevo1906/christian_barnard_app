import { NextResponse } from "next/server";
import prisma from "@/lib/prisma";
import { DocenteSchema } from "@/schemas/docenteSchema";

export async function GET(request:Request) {
    try{
        const docentes = await prisma.docente.findMany({
            where: {
                activo: true
            }
        })
        return NextResponse.json(docentes)
        console.log("Prueba git datax")
    } catch (error){
        return NextResponse.json({ error: 'Error al obtener docentes.'}, {status:500})
    }
}

export async function POST(request:Request) {
    try{
        const data = await request.json()
        const validateData = DocenteSchema.parse(data)

        console.log(validateData)
        return NextResponse.json({mensaje: "Exito"},{status:200})
    } catch(error){
        console.error(error)
        return NextResponse.json({error: `Error al crear al docente: `},{status:500})
    }
}