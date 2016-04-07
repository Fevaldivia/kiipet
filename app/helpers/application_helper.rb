module ApplicationHelper
  def wizard_menu
    step_links = @wizard_steps.map do |s|
      text = t("profile.after_singup_keeper.menu.#{s}")

      current_index = @wizard_steps.index(@step)
      step_index = @wizard_steps.index(s)
      profile_index = @wizard_steps.index(@profile) || @wizard_steps.size

      text += content_tag(:span, " ", class: 'label label-info fa fa-paw')


      css_classes = ['btn']
      url = 'javascript:void(0);'

      if step_index < current_index || step_index <= profile_index
        url = profile_after_signup_keeper_path(s, profile_id: @profile) if @profile.persisted?
      end

      if step_index == current_index
        css_classes << 'active'
      elsif step_index < current_index || step_index <= profile_index
        css_classes << 'success'
      else
        css_classes << 'disabled'
      end

      link_to raw(text), url, class: css_classes.join(' ')
    end

    content_tag(:div, raw(step_links.join("\n")), class: 'btn-group wizard-steps')
  end
end
