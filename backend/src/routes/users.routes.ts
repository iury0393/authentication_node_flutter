import { Router } from 'express';
import CreateUserService from '../services/CreateUserService';

const usersRouter = Router();

usersRouter.post('/', async (request, response) => {
  const { name, email, password } = request.body;

  const createUserService = new CreateUserService();

  const createUser = await createUserService.execute({
    name,
    email,
    password,
  });

  delete createUser.password;

  return response.json(createUser);
});

export default usersRouter;
