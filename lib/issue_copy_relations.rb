module IssueCopyRelations
  module IssuePatch
    private
    def after_create_from_copy
      return unless copy? && !@after_create_from_copy_handled
        relations_data = @copied_from.relations.map do |r|
          from_id = r.issue_from_id
          to_id = self.id
          if r.issue_from_id == @copied_from.id
            from_id = self.id
            to_id = r.issue_to_id
          end
          next unless r.relation_type == IssueRelation::TYPE_RELATES
          {issue_from_id: from_id, issue_to_id: to_id, relation_type: r.relation_type}
        end

        IssueRelation.create relations_data
      super
    end
  end
end
