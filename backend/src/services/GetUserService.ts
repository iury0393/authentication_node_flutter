import { getRepository } from 'typeorm';
import User from '../models/User';

interface Request {
  email: string;
}

export default class GetUserService {
  public async execute({ email }: Request): Promise<User[]> {
    const userRepository = getRepository(User);

    const getUser = await userRepository.find({
      select: ['name', 'email'],
      where: { email },
    });

    return getUser;
  }
}
