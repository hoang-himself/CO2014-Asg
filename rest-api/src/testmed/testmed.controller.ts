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
import { TestmedEntity } from './testmed.entity';
import { TestmedInterface } from './testmed.interface';
import { TestmedService } from './testmed.service';

@Controller('testmed')
export class TestmedController {
  constructor(private readonly testmedService: TestmedService) {}

  @Post('new')
  @UseInterceptors(FileInterceptor(''))
  create(@Body() test: TestmedInterface): Promise<TestmedEntity> {
    return this.testmedService.create(test);
  }

  @Get('all')
  findAll(): Promise<TestmedEntity[]> {
    return this.testmedService.findAll();
  }

  @Get(':testID')
  @UseInterceptors(FileInterceptor(''))
  findOne(
    @Param('testID', ParseIntPipe) testID: number,
  ): Promise<TestmedEntity> {
    return this.testmedService.findOne(testID);
  }

  @Patch(':testID/edit')
  @UseInterceptors(FileInterceptor(''))
  update(
    @Param('testID', ParseIntPipe) testID: number,
    @Body() test: TestmedInterface,
  ) {
    return this.testmedService.update(testID, test);
  }

  @Delete('testID/delete')
  @UseInterceptors(FileInterceptor(''))
  delete(@Param('testID', ParseIntPipe) testID: number): void {
    this.testmedService.delete(testID);
  }
}
