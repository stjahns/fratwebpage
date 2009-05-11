// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function set_photo_order()
{
  $('album_photo_order').value=($('current_photos').childElements().collect(function(e){return e.id.gsub(/photo\_/,'')}))
}