import AuthorizationError from "../errors/AuthorizationError.js";

const requireRole = (role) => {
  return (req, res, next) => {
    if (req.user?.role !== role) {
      throw new AuthorizationError();
    }

    next();
  };
};

export default requireRole;
