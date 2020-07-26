import { getRepository } from 'typeorm';
import { hash } from 'bcryptjs';
import User from '../models/User';
import AppError from '../errors/AppError';

interface request {
  name: string;
  email: string;
  password: string;
}

export default class CreateUserService {
  public async execute({ name, email, password }: request): Promise<User> {
    const userRepository = getRepository(User);

    const checkUserEmailExist = await userRepository.findOne({
      where: { email },
    });

    if (checkUserEmailExist) {
      throw new AppError('Email do usuário já está sendo usado.');
    }

    const criptoPass = await hash(password, 8);

    const createUser = userRepository.create({
      name,
      email,
      password: criptoPass,
    });

    await userRepository.save(createUser);

    return createUser;
  }
}
