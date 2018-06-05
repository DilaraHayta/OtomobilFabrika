# :nodoc:
module ApplicationHelper
  def left_menu
    left_menu_entries(left_menu_content)
  end

  private

  def selected_locale
    locale = FastGettext.locale
    locale_list.detect {|entry| entry[:locale] == locale}
  end

  def locale_list
    [
      {
        flag: 'us',
        locale: 'en',
        name: 'English (US)',
        alt_name: 'United States'
      },
      {
        flag: 'fr',
        locale: 'fr',
        name: 'Français',
        alt_name: 'France'
      },
      {
        flag: 'es',
        locale: 'es',
        name: 'Español',
        alt_name: 'Spanish'
      },
      {
        flag: 'de',
        locale: 'de',
        name: 'Deutsch',
        alt_name: 'German'
      },
      {
        flag: 'jp',
        locale: 'ja',
        name: '日本語',
        alt_name: 'Japan'
      },
      {
        flag: 'cn',
        locale: 'zh',
        name: '中文',
        alt_name: 'China'
      },
      {
        flag: 'it',
        locale: 'it',
        name: 'Italiano',
        alt_name: 'Italy'
      },
      {
        flag: 'pt',
        locale: 'pt',
        name: 'Portugal',
        alt_name: 'Portugal'
      },
      {
        flag: 'ru',
        locale: 'ru',
        name: 'Русский язык',
        alt_name: 'Russia'
      },
      {
        flag: 'kr',
        locale: 'kr',
        name: '한국어',
        alt_name: 'Korea'
      },
    ]
  end

  def left_menu_entries(entries = [])
    output = ''
    entries.each do |entry|
      children_selected = entry[:children] &&
        entry[:children].any? {|child| current_page?(child[:href]) }
      entry_selected =  current_page?(entry[:href])
      li_class =
      case
        when children_selected
          'open'
        when entry_selected
          'active'
      end
      output +=
        content_tag(:li, class: li_class) do
          subentry = ''
          subentry +=
            link_to entry[:href], title: entry[:title], class: entry[:class], target: entry[:target] do
              link_text = ''
              link_text += entry[:content].html_safe
              if entry[:children]
                if children_selected
                  link_text += '<b class="collapse-sign"><em class="fa fa-minus-square-o"></em></b>'
                else
                  link_text += '<b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b>'
                end
              end

              link_text.html_safe
            end
          if entry[:children]
            if children_selected
              ul_style = 'display: block'
            else
              ul_style = ''
            end
            subentry +=
              "<ul style='#{ul_style}'>" +
                left_menu_entries(entry[:children]) +
                "</ul>"
          end

          subentry.html_safe
        end
    end
    output.html_safe
  end

  def left_menu_content
    [
      {
        href: '#',
        title: _('Dashboard'),
        content: "<i class='fa fa-lg fa-fw fa-home'></i> <span class='menu-item-parent'>" + _('Dashboard') + "</span>",
        children: [
          {
            href: root_path,
            title: _('Dashboard'),
            content: "<span class='menu-item-parent'>" + _('Analitik Dashboard') + "</span>"
          }
        ]
      },
      {
        href: '#',
        title: _('Ürünler'),
        content: "<i class='fa fa-lg fa-fw fa-cube'></i> <span class='menu-item-parent'>" + _('Ürünler') + "</span>",
        children: [
          {
            href: parts_path,
            title: _('Ürünler'),
            content: "<span class='menu-item-parent'>" + _('Parçalar') + "</span>"
          },
          {
            href: cars_path,
            title: _('Ürünler'),
            content: "<span class='menu-item-parent'>" + _('Otomobiller') + "</span>"
          },
        ]
      },
      {
        href: car_orders_path,
        title: _('Siparişler'),
        content: "<i class='fa fa-shopping-cart'></i> <span class='menu-item-parent'>" + _('Siparişler') + "</span>",
      },
      {
        href: car_orders_invoice_path,
        title: _('Faturalar'),
        content: "<i class='fa fa-lg fa-fw fa-table'></i> <span class='menu-item-parent'>" + _('Faturalar') + "</span>",
      },
      {
        href: outlook_inbox_path,
        content: "<i class='fa fa-lg fa-fw fa-inbox'></i> <span class='menu-item-parent'>" + _('Outlook') + "</span> <span class='badge pull-right inbox-badge margin-right-13'>14</span>",
      },
      {
        href: '#',
        content: "<i class='fa fa-lg fa-fw fa-bar-chart-o'></i> <span class='menu-item-parent'>" + _('Graphs') + "</span>",
        children: [
          {
            href: graphs_flot_chart_path,
            content: _('Flot Chart')
          },
          {
            href: graphs_morris_charts_path,
            content: _('Morris Charts')
          },
          {
            href: graphs_sparklines_path,
            content: _('Sparklines')
          },
          {
            href: graphs_easy_pie_charts_path,
            content: _('EasyPieCharts')
          },
          {
            href: graphs_dygraphs_path,
            content: _('Dygraphs')
          },
          {
            href: graphs_chart_js_path,
            content: _('Chart.js')
          },
          {
            href: graphs_highchart_table_path,
            content: "" + _('HighchartTable') + " <span class='badge pull-right inbox-badge bg-color-yellow'>" + _('new') + "</span>"
          },
        ]
      },
      {
        href: widgets_path,
        content: "<i class='fa fa-lg fa-fw fa-list-alt'></i> <span class='menu-item-parent'>" + _('Widgets') + "</span>"
      },
      {
        href: '#',
        content: "<i class='fa fa-lg fa-fw fa-cloud'><em>3</em></i> <span class='menu-item-parent'>" + _('Cool Features!') + "</span>",
        children: [
          {
            href: cool_features_calendar_path,
            content: "<i class='fa fa-lg fa-fw fa-calendar'></i> <span class='menu-item-parent'>" + _('Calendar') + "</span>"
          }
        ]
      },
      {
        href: '#',
        content: "<i class='fa fa-lg fa-fw fa-windows'></i> <span class='menu-item-parent'>" + _('Diğer') + "</span>",
        children: [
          {
            href: miscellaneous_login_path,
            content: _('Login')
          },
          {
            href: miscellaneous_register_path,
            content: _('Register')
          },
          {
            href: miscellaneous_forgot_password_path,
            content: _('Forgot Password')
          },
          {
            href: miscellaneous_locked_screen_path,
            content: _('Locked Screen')
          },
          {
            href: miscellaneous_error_404_path,
            content: _('Error 404')
          },
          {
            href: miscellaneous_error_500_path,
            content: _('Error 500')
          },
          {
            href: miscellaneous_blank_page_path,
            content: _('Blank Page')
          },
        ]
      },
    ]
  end

end
