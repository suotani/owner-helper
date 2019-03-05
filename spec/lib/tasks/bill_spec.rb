require 'rails_helper'
require 'rake'

RSpec.describe 'bill task' do

  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'tasks/bill' # Point 1
    Rake::Task.define_task(:environment)
    @owners = create_list(:owner, 3)
    @owners.each do |o|
      create_list(:house, 2, owner_id: o.id)
    end
  end
  
  describe 'update' do
    let(:task){'bill:update'}
    it '2日以外の日にちには実行されない' do
    end
    
    # it 'test' do
    #   @rake[task]
    # end
  end

  describe 'create' do
    let(:task){'bill:update'}
    it '25日以外の日にちには実行されない' do
    end
    it 'test' do
      @rake[task]
    end
  end

  # describe 'pay' do
  #   let(:task){'bill:update'}
    # it '15日以外の日にちには実行されない' do
    # end
  #   it 'test' do
  #     @rake[task]
  #   end
  # end
end