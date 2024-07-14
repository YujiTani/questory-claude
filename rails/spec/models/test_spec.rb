require 'rails_helper'

RSpec.describe 'TestModel' do
  # テスト用のモックオブジェクトを作成
  let(:test_model) { double('TestModel') }

  it 'can be mocked' do
    # モックオブジェクトで仮想メソッドを呼び出し、期待する値を返すことを指示
    allow(test_model).to receive(:some_method).and_return('Hello, World!')
    # モックオブジェクトの仮想メソッドが、期待する値を返すことを確認
    expect(test_model.some_method).to eq('Hello, World!')
  end

  it 'passes a simple test' do
    expect(true).to be true
  end

  # Rails.envがテスト環境（'test'）に設定されていることを確認
  it 'has access to Rails environment' do
    expect(Rails.env).to eq('test')
  end

  # DBに接続できることを確認
  it 'can connect to the database' do
    expect(ActiveRecord::Base.connection).to be_active
  end
end
