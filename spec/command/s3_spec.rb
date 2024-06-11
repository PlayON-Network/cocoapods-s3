require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::S3 do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ s3 }).should.be.instance_of Command::S3
      end
    end
  end
end

