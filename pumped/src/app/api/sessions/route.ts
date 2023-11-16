import prisma from "../../../../prisma";

import type { NextApiRequest, NextApiResponse } from "next";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method === "POST") {
    // Process a POST request
    try{
        const new_session = await prisma.sessions.create({
            data: { current_question: 0 }
        });
    } 
  } else {
    // Handle any other HTTP method
  }
}

// export async function POST(req: Request) {
//     try {
//       // Create a new room with the calculated room_id nextRoomId
//       const new_room = await prisma.rooms.create({
//         data: { current_question: 0 }
//       });
//       return NextResponse.json({ room_id: new_room.room_id });
      
//     } catch (error) {
//       console.error(`Error creating room: `, error);
//       return new NextResponse("", { status: 500});
//     }
//   }