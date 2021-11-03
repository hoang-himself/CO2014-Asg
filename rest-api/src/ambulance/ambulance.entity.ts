import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity('AMBULANCE')
export class AmbulanceEntity {
  @PrimaryColumn()
  public Car_number: number;

  @Column()
  public License_plate: number;

  @Column()
  public DRIVER_Employee_id: number;
}
