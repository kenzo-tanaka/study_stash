const algoliasearch = require('algoliasearch');
const autocomplete = require('autocomplete.js');
const algolia_application_id = '0P3RHSPV3U';
const algolia_search_only_api_key = '1579f8897b40566e97ece93106502cdd';

const client = algoliasearch(algolia_application_id, algolia_search_only_api_key);
const index = client.initIndex('Portfolio');
autocomplete('#query', {hint: false}, [
  {
    source: autocomplete.sources.hits(index, {hitsPerPage: 5}),
    displayKey: function (suggestion) {
      return suggestion.title
    },
    templates: {
      suggestion: function (suggestion) {
        return `${suggestion._highlightResult.title.value}`;
      },
      empty: '検索キーワードを見直してください'
    }
  }
]).on('autocomplete:selected', function (event, suggestion, dataset, context) {
  console.log(event, suggestion, dataset, context);
  if (context.selectionMethod === 'click') {
    window.location.assign(`/portfolios?query=${suggestion.title}`);
    return;
  }
});