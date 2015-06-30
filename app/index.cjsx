React = require 'react';
App = require './components/App.cjsx';

###給前端頁面呼叫###
window.renderOnClient = (initialData)->
    React.render(
        <App data={initialData} />,
        document.getElementById('content')
    )

###給後端程式呼叫###
window.renderOnServer = (initialData)->
    ###initialData = Java.from(initialData); Listの場合###
    React.renderToString(
        <App data={initialData} />)

