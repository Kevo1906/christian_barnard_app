import prisma from "@/lib/prisma";
import { DocenteEditSchema } from "@/schemas/docenteSchema";
import { NextResponse } from "next/server";

interface Params {
    id:string
}
export async function GET(request:Request,context:{params:Params}) {
    try{
        const params = await context.params
        const docente = await prisma.docente.findUnique({
            where:{
                id:params.id
            }
        })
        if (!docente) return NextResponse.json({ error: `No existe el docente: ${params.id}`}, {status:400})

        return NextResponse.json({mensaje: "Exito",docente}, {status:200})

    } catch(error:any){
        return NextResponse.json({ error: error.message}, {status:500})
    }
}

export async function PUT(request:Request,context:{params:Params}) {
    try{
        const params = await context.params
        const body = await request.json()
        const validateData = DocenteEditSchema.parse(body)

        const docente = await prisma.docente.update({
            where:{
                id:params.id
            },
            data:validateData
        })
        if (!docente) return NextResponse.json({ error: `No existe el docente: ${params.id}`}, {status:400})

        return NextResponse.json({mensaje: "Docente actualizado con exito",docente}, {status:200})

    } catch(error:any){
        return NextResponse.json({ error: error.message}, {status:500})
    }
}

export async function DELETE(request:Request,context:{params:Params}) {
    try{
        const params = await context.params
        const docente = await prisma.docente.update({
            where:{
                id:params.id
            },
            data:{
                activo:false
            }
        })
        if (!docente) return NextResponse.json({ error: `No existe el docente: ${params.id}`}, {status:400})

        return NextResponse.json({mensaje:"Docente eliminado con exito"}, {status:200})

    } catch(error:any){
        return NextResponse.json({ error: error.message}, {status:500})
    }
}
