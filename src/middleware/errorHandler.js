/**
 * Convert application errors into a consistent API response.
 * Unknown errors fall back to a generic 500 response so that
 * internal implementation details are not exposed to the client.
 */
const errorHandler = (err, req, res, next) => {
  const statusCode = err.statusCode || 500;

  res.status(statusCode).json({
    error: {
      code: err.code || "INTERNAL_ERROR",
      message: err.message || "Something went wrong",
      details: err.details || null,
    },
  });
};

export default errorHandler;
