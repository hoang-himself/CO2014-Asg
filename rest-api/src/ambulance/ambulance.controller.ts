import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';

import { AmbulanceEntity } from './ambulance.entity';
import { AmbulanceInterface } from './ambulance.interface';
import { AmbulanceService } from './ambulance.service';

@Controller('ambulance')
export class AmbulanceController {
  constructor(private readonly ambulanceService: AmbulanceService) {}

  @Post('new')
  @UseInterceptors(FileInterceptor(''))
  create(@Body() car: AmbulanceInterface): Promise<AmbulanceEntity> {
    return this.ambulanceService.create(car);
  }

  @Get('all')
  findAll(): Promise<AmbulanceEntity[]> {
    return this.ambulanceService.findAll();
  }

  @Get(':carNum')
  @UseInterceptors(FileInterceptor(''))
  findOne(
    @Param('carNum', ParseIntPipe) carNum: number,
  ): Promise<AmbulanceEntity> {
    return this.ambulanceService.findOne(carNum);
  }

  @Patch(':carNum/edit')
  @UseInterceptors(FileInterceptor(''))
  update(
    @Param('carNum', ParseIntPipe) carNum: number,
    @Body() car: AmbulanceInterface,
  ) {
    return this.ambulanceService.update(carNum, car);
  }

  @Delete(':carNum/delete')
  @UseInterceptors(FileInterceptor(''))
  delete(@Param('carNum', ParseIntPipe) carNum: number): void {
    this.ambulanceService.delete(carNum);
  }
}
