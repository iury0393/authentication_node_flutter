import { getRepository } from 'typeorm';

import User from '../models/User';

export default class ListUsersService {
  public async execute(): Promise<User[]> {
    const userRepository = getRepository(User);

    const listUsers = await userRepository.find({
      select: ['id', 'name', 'email'],
    });

    return listUsers;
  }
}
