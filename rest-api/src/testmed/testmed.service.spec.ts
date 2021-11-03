import { Test, TestingModule } from '@nestjs/testing';
import { TestmedService } from './testmed.service';

describe('TestmedService', () => {
  let service: TestmedService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TestmedService],
    }).compile();

    service = module.get<TestmedService>(TestmedService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
