import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";
import routes from "./routes/index.js";
import errorHandler from "./middleware/errorHandler.js";
import { env } from "./config/env.js";

const app = express();

const corsOptions = {
  origin: env.FRONTEND_URL,
  credentials: true,
};

app.use(cors(corsOptions));
app.use(express.json());

// Parses the Cookie header and exposes cookies through req.cookies.
// This is required for reading the refresh token during /refresh.
app.use(cookieParser());

app.get("/health", (req, res) => {
  res.status(200).json({ ok: true });
});

app.use("/api", routes);

// Error handler must be registered after all routes and other middleware
// so that errors thrown during request processing are handled here.
app.use(errorHandler);

export default app;
