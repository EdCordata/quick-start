if (window.init === undefined) window.init = {};

init.select2 = function () {
  var params = {
    theme:    'bootstrap4',
    language: {
      searching:       function ()     { return gon.locales.translations.select2.searching;        },
      noResults:       function ()     { return gon.locales.translations.select2.no_records_found; },
      loadingMore:     function ()     { return gon.locales.translations.select2.loading_more;     },
      errorLoading:    function ()     { return gon.locales.translations.select2.error_loading;    },
      inputTooLong:    function (args) { return gon.locales.translations.select2.input_too_long;   },
      inputTooShort:   function (args) { return gon.locales.translations.select2.input_too_short;  },
      maximumSelected: function (args) { return gon.locales.translations.select2.max_selected;     }
    }
  };


  // regular select
  $('*[data-js-select]').each(function (i, select) {
    var $select = $(select);
    var p       = params;

    if ($select.attr('data-search') === 'true') {
      p['minimumResultsForSearch'] = 0;
    } else {
      p['minimumResultsForSearch'] = Infinity;
    }

    $select.select2(p);

    // fix problem where dropdown is in wrong place (not next to select).
    // this usually happens when some other elements above initialized select2
    // change page height.
    $select.select2('open');
    $select.select2('close');
  });


  // tags
  $('*[data-js-select-tags]').each(function (i, select) {
    var $select = $(select);
    var p       = params;

    p['tags']                   = true;
    p['tokenSeparators']        = [','];
    p['multiple']               = true;
    p['maximumSelectionLength'] = 20; // max tags
    p['minimumInputLength']     = 1;
    p['maximumInputLength']     = 50;

    if ($select.attr('data-drop-down') === 'false') p['dropdownCssClass']        = 'hidden';
    if ($select.attr('data-search') !== 'true')     p['minimumResultsForSearch'] = Infinity;

    $select.select2(p);

    // fixes empty tag getting added: https://github.com/select2/select2/issues/4742#issuecomment-398325568
    // -------------------------------------
    $select.on('select2:select', function (e) {
      var render = $(e.target).parent().find('ul.select2-selection__rendered');

      render.html(render.find('li.select2-selection__choice').filter(function () {
        return $(this).attr('title') !== '';
      }));

      $(e.target.selectedOptions).replaceWith(($(e.target.selectedOptions).filter(function () {
        return this.firstChild !== null;
      })));

      $select.trigger('change');

      $(e.target).parent().find('.select2-search__field').focus();
    });
    // -------------------------------------

  });
};
