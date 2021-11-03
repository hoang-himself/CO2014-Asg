import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { TestmedEntity } from './testmed.entity';
import { TestmedInterface } from './testmed.interface';

@Injectable()
export class TestmedService {
  constructor(
    @InjectRepository(TestmedEntity)
    private testmedRepository: Repository<TestmedEntity>,
  ) {}

  async create(test: TestmedInterface): Promise<TestmedEntity> {
    const newTest = this.testmedRepository.create(test);
    await this.testmedRepository.save(newTest);
    return newTest;
  }

  async findAll(): Promise<TestmedEntity[]> {
    return this.testmedRepository.find();
  }

  async findOne(Test_id: number): Promise<TestmedEntity> {
    const test = await this.testmedRepository.findOne({ Test_id });
    if (test) return test;
    throw new HttpException('Test not found', HttpStatus.NOT_FOUND);
  }

  async update(Test_id: number, test: TestmedInterface) {
    await this.testmedRepository.update(Test_id, test);
    const updatedTest = await this.testmedRepository.findOne(Test_id);
    if (updatedTest) return updatedTest;
    throw new HttpException('Test not found', HttpStatus.NOT_FOUND);
  }

  async delete(Test_id: number) {
    const deleteRest = await this.testmedRepository.delete(Test_id);
    if (!deleteRest.affected)
      throw new HttpException('Test not found', HttpStatus.NOT_FOUND);
  }
}
