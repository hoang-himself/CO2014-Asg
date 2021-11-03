import { Test, TestingModule } from '@nestjs/testing';
import { AmbulanceController } from './ambulance.controller';

describe('AmbulanceController', () => {
  let controller: AmbulanceController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [AmbulanceController],
    }).compile();

    controller = module.get<AmbulanceController>(AmbulanceController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
