require 'rails_helper'

RSpec.describe Announcement, type: :model do

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :content }

  describe '::create_from_xml' do
    let(:valid_announcement_xml) do
      <<~XML
        <announcement>
          <title>My announcement</title>
          <content>Please read with care</content>
        </announcement>
      XML
    end
    let(:invalid_announcement_xml) do
      <<~XML
        <announcement>
          <foo>My announcement</foo>
          <content>Please read with care</content>
        </announcement>
      XML
    end

    context 'with a valid xml description' do
      subject { Announcement.create_from_xml(valid_announcement_xml) }

      it 'creates an announcement from a valid xml' do
        is_expected.to be_persisted
        expect(subject.title).to eq('My announcement')
        expect(subject.content).to eq('Please read with care')
      end
    end

    context 'with an ivalid xml description' do
      subject { Announcement.create_from_xml(invalid_announcement_xml) }

      it 'return an unsaved announcement object' do
        is_expected.not_to be_persisted
        expect(subject.errors.full_messages.to_sentence).to eq("Title can't be blank")
      end
    end
  end
end
