import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { AmbulanceEntity } from './ambulance.entity';
import { AmbulanceInterface } from './ambulance.interface';

@Injectable()
export class AmbulanceService {
  constructor(
    @InjectRepository(AmbulanceEntity)
    private ambulanceRepository: Repository<AmbulanceEntity>,
  ) {}

  async create(car: AmbulanceInterface): Promise<AmbulanceEntity> {
    const newCar = this.ambulanceRepository.create(car);
    await this.ambulanceRepository.save(newCar);
    return newCar;
  }

  async findAll(): Promise<AmbulanceEntity[]> {
    return this.ambulanceRepository.find();
  }

  async findOne(Car_number: number): Promise<AmbulanceEntity> {
    const car = await this.ambulanceRepository.findOne({ Car_number });
    if (car) return car;
    throw new HttpException('Ambulance not found', HttpStatus.NOT_FOUND);
  }

  async update(Car_number: number, car: AmbulanceInterface) {
    await this.ambulanceRepository.update(Car_number, car);
    const updatedCar = await this.ambulanceRepository.findOne(Car_number);
    if (updatedCar) return updatedCar;
    throw new HttpException('Ambulance not found', HttpStatus.NOT_FOUND);
  }

  async delete(Car_number: number) {
    const deleteRes = await this.ambulanceRepository.delete(Car_number);
    if (!deleteRes.affected)
      throw new HttpException('Ambulance not found', HttpStatus.NOT_FOUND);
  }
}
