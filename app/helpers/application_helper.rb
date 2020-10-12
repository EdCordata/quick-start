module ApplicationHelper

  def boolean_icon(boolean)
    if boolean
      content_tag(:i, nil, class: 'fa fa-check-square-o', 'aria-hidden': true)
    else
      content_tag(:i, nil, class: 'fa fa-square-o', 'aria-hidden': true)
    end
  end

  def visible_search_collection
    [
      [t('activerecord.shared.visible'), true],
      [t('activerecord.shared.invisible'), false]
    ]
  end

  def yes_no_search_collection
    [
      [t('activerecord.shared.no'), false],
      [t('activerecord.shared.yes'), true]
    ]
  end

end
