Redmine::Plugin.register :redmine_issue_copy_relations do
  name 'Redmine Issue Copy Relations plugin'
  author 'bokos'
  description 'Copies relations of the type "relates", when you copy an issue.'
  version '0.0.1'
  url 'https://github.com/bokos/redmine_issue_copy_relations'
  author_url 'https://github.com/bokos'


  RedmineApp::Application.config.after_initialize do
    Issue.send(:prepend, IssueCopyRelations::IssuePatch)
  end
end
