# frozen_string_literal: true

module SolidusImporter
  module Processors
    class Log < Base
      def call(context)
        Spree::LogEntry.create!(
          source_id: context[:row_id],
          source_type: 'SolidusImporter::Row',
          details: context.except(:importer, :data).to_json
        )
      end
    end
  end
end
