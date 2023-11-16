import prisma from "../../../../../prisma";

import type { NextApiRequest, NextApiResponse } from "next";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method === "GET") {
    // Process a POST request
  } else {
    // Handle any other HTTP method
  }
}
