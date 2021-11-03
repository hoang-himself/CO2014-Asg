import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import * as Joi from '@hapi/joi';
import { AppController } from './app.controller';
import { AppService } from './app.service';

import { DatabaseModule } from './database/database.module';
import { AmbulanceModule } from './ambulance/ambulance.module';
import { AmbulanceController } from './ambulance/ambulance.controller';
import { TestmedModule } from './testmed/testmed.module';
import { TestmedController } from './testmed/testmed.controller';

@Module({
  imports: [
    ConfigModule.forRoot({
      validationSchema: Joi.object({
        POSTGRES_HOST: Joi.string().required(),
        POSTGRES_PORT: Joi.number().required(),
        POSTGRES_USER: Joi.string().required(),
        POSTGRES_PASSWORD: Joi.string().required(),
        POSTGRES_DB: Joi.string().required(),
      }),
    }),
    DatabaseModule,
    AmbulanceModule,
    TestmedModule,
  ],
  controllers: [AppController, AmbulanceController, TestmedController],
  providers: [AppService],
})
export class AppModule {}
