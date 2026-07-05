import express from "express";
import cors from "cors";
import routes from "./routes/index.js";

const app = express();

const isProduction = process.env.NODE_ENV === "production";

if (isProduction && !process.env.FRONTEND_URL) {
  throw new Error("FRONTEND_URL environment variable is not defined.");
}

const corsOptions = isProduction
  ? {
      origin: process.env.FRONTEND_URL,
    }
  : {};

app.use(cors(corsOptions));
app.use(express.json());

app.get("/health", (req, res) => {
  res.status(200).json({ ok: true });
});

app.use("/api", routes);

export default app;
