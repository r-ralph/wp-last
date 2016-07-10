$(() => {
  // Disable Enter key in form input
  $("input"). keydown((e) => {
    if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
      return false;
    } else {
      return true;
    }
  });
  // Chech text input
  const checkInputChange = () => {
    var old = v =$('#form-text').val()
    return () => {
      v = $('#form-text').val()
      if(old != v){
        old = v
        onChange(v)
      }
    }
  }
  // Called when form input has been changed
  const onChange = (new_val) => {
    getAjaxGetPromise(getUrlWithParam(new_val)).then((json) => {
        onReceiveData(JSON.parse(json))
    }).catch((err) => {
        console.log(err)
    });
  }
  // Construct URL from current URL and add param
  const getUrlWithParam = (text) => {
    const url = window.location.toString()
    url.substring(0, url.lastIndexOf('/'))
    return url + 'emoji.cgi?text=' + text
  }
  // Construct Promise object
  const getAjaxGetPromise = (url) => {
      return new Promise((resolve, reject) => {
          const xhr = new XMLHttpRequest()
          xhr.onreadystatechange = () => {
              if (xhr.readyState === xhr.DONE) {
                  if (xhr.status === 200) {
                      resolve(xhr.responseText)
                  } else {
                      reject(event)
                  }
              }
          };
          xhr.open("GET", url)
          xhr.send()
      });
  }
  // Called when finish xhr request
  const onReceiveData = (json) => {
    const container = $('#emoji-container')
    // Remove all cells
    container.empty()
    // Construct new cells and insert
    json.result.forEach((value) => {
      const root = $('<div>').addClass('col-lg-3').addClass('col-md-4').addClass('col-sm-6').addClass('col-xs-12')
      const emoji_cell = $('<div>').addClass('emoji-cell')
      {
        // Title
        const emoji_title = $('<span>').addClass('emoji-title').text(':' + value.name + ':')
        emoji_cell.append(emoji_title)
      }
      {
        // Preview
        const emoji_preview = $('<span>').addClass('emoji-preview').text(String.fromCodePoint(parseInt(value.hex, 16)))
        emoji_cell.append(emoji_preview)
      }
      {
        // Unicode
        const emoji_tip_container = $('<div>').addClass('emoji-tip-container')
        {
          const emoji_subtitle = $('<div>').addClass('emoji-subtitle').text('Unicode')
          emoji_tip_container.append(emoji_subtitle)
        }
        {
          const emoji_text = $('<div>').addClass('emoji-text')
          {
            const emoji_unicode = $('<code>').text('U+' + value.hex)
            emoji_text.append(emoji_unicode)
          }
          emoji_tip_container.append(emoji_text)
        }
        emoji_cell.append(emoji_tip_container)
      }
      {
        // Description
        const emoji_tip_container = $('<div>').addClass('emoji-tip-container')
        {
          const emoji_subtitle = $('<div>').addClass('emoji-subtitle').text('Description')
          emoji_tip_container.append(emoji_subtitle)
        }
        {
          const emoji_text = $('<div>').addClass('emoji-text').text(value.description)
          emoji_tip_container.append(emoji_text)
        }
        emoji_cell.append(emoji_tip_container)
      }
      root.append(emoji_cell)
      container.append(root)
    })
  }
  $('#form-text').keyup(checkInputChange())
});
