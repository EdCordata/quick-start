module VersionsHelper


  def versions_model_link(version)
    name = version.model + ' #' + version.model_id.to_s

    if version.model == 'User'
      link_to_if can?(:show, @version.model_instance), name, admin_user_path(version.model_id)
    else
      name
    end
  end


  def versions_editor_link(version)
    if version.editor_id
      link_to_if can?(:show, version.editor), version.editor.email, admin_user_path(version.editor)
    else
      '-'
    end
  end


  def versions_fields_changed_badges(version)
    previous = version.previous

    version.fields_changed.map do |field_changed|
      title = []
      title << previous.body[field_changed] if previous
      title << version.body[field_changed]

      content_tag(
        :span, field_changed,
        class: 'badge badge-dark',
        style: 'margin: 0 1px;',
        title: title.map { |x| "\"#{x}\"" }.join(' > ')
      )
    end.join('').html_safe
  end


end
