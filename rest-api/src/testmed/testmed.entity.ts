import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity('TEST')
export class TestmedEntity {
  @PrimaryColumn()
  public Test_id: number;

  @Column({
    type: 'text',
    nullable: true,
  })
  public Test_name: string | null;

  @Column({
    type: 'text',
    nullable: true,
  })
  public Description: string | null;
}
