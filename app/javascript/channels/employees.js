$(document).on('turbolinks:load', function(){
  var employeess = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/employees/autocomplete?search_query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#employees_search').typeahead(null, {
    source: employees
  });
})