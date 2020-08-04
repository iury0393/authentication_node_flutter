import { Router } from 'express';
import ListUsersService from '../services/ListUsersService';
import CreateUserService from '../services/CreateUserService';
import GetUserService from '../services/GetUserService';

const usersRouter = Router();

usersRouter.get('/', async (request, response) => {
  const users = new ListUsersService();

  const listUsers = await users.execute();

  return response.json(listUsers);
});

usersRouter.get('/:email', async (request, response) => {
  const { email } = request.params;

  const getUserService = new GetUserService();

  const getUsers = await getUserService.execute({
    email,
  });

  return response.json(getUsers);
});

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
