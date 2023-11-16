import prisma from "../../../../prisma";

import type { NextApiRequest, NextApiResponse } from "next";

export async function POST(req: Request) {
  if (req.method === "POST") {
    // Process a POST request
    const res = await req.json();
    // const { name, date, workouts } =
    //   typeof res.body == "string" ? JSON.parse(req.body) : req.body;
    console.log("***", res);

    try {
      console.log("test");
      const new_session = await prisma.sessions.create({
        data: { name: res.name, date: res.date },
      });
      //   res.json(new_session);
      console.log("successfully created workout!");
      return new Response("created new session", { status: 200 });
    } catch (error) {
      console.log("Error creating session: ", error);
      return new Response("", { status: 500 });
    }
  }
}
