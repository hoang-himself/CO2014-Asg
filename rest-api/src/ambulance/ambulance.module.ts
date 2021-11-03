import { Module } from '@nestjs/common';
import { AmbulanceController } from './ambulance.controller';
import { AmbulanceService } from './ambulance.service';
import { AmbulanceEntity } from './ambulance.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([AmbulanceEntity])],
  exports: [AmbulanceService],
  controllers: [AmbulanceController],
  providers: [AmbulanceService],
})
export class AmbulanceModule {}
