import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";
import routes from "./routes/index.js";
import errorHandler from "./middleware/errorHandler.js";

const app = express();

const isProduction = process.env.NODE_ENV === "production";

// In production, the API must explicitly know which frontend is allowed
// to make cross-origin requests. This is especially important because
// authentication uses HttpOnly cookies.
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
