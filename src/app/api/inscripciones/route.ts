import { NextResponse } from "next/server";
import prisma from "@/lib/prisma";

export async function GET(request:Request) {
    try{

    } catch (error) {

    }
}

export async function POST(request:Request) {
    try {
        const data = await request.json()

    } catch (error) {
        return NextResponse.json({ error: 'Error al crear inscripcion'}, {status:500})
    }
}