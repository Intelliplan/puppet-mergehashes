require_relative '../lib/puppet/parser/util/merger'

include Puppet::Parser::Util

describe 'merge_hashes', :type => :puppet_function do
  let(:kvs1) { { :a => 1, :b => { :c => { :x => 2 }, :d => 3, :z => 4 } } }
  let(:kvs2) { { :b => { :c => { :x => 5 }, :d => 6 }, :e => 7 } }
  subject { Merger.new(kvs1, kvs2).compute }
  it { subject.should eq({:a=>1, :b=>{:c=>{:x=>5}, :d=>6, :z=>4}, :e=>7}) }
end
