import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TestmedController } from './testmed.controller';
import { TestmedEntity } from './testmed.entity';
import { TestmedService } from './testmed.service';

@Module({
  imports: [TypeOrmModule.forFeature([TestmedEntity])],
  exports: [TestmedService],
  controllers: [TestmedController],
  providers: [TestmedService],
})
export class TestmedModule {}
