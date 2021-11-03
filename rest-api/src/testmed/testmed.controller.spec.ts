import { Test, TestingModule } from '@nestjs/testing';
import { TestmedController } from './testmed.controller';

describe('TestmedController', () => {
  let controller: TestmedController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TestmedController],
    }).compile();

    controller = module.get<TestmedController>(TestmedController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
