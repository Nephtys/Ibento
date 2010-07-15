class CreateParticipationStates < ActiveRecord::Migration
  def self.up
    create_table :participation_states do |t|
      t.string :label
      t.integer :state_id

      t.timestamps
    end
    ParticipationState.create(:state_id => 0, :label => 'Not decided')
    ParticipationState.create(:state_id => 1, :label => 'Accepted')
    ParticipationState.create(:state_id => 2, :label => 'Declined')
  end

  def self.down
    drop_table :participation_states
  end
end
