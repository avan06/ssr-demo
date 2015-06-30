var React = require('react');
var App = require('./components/App.jsx');

//給前端頁面呼叫
window.renderOnClient = function (initialData) {
    React.render(
        <App data={initialData} />,
        document.getElementById('content')
    );
};

//給後端程式呼叫
window.renderOnServer = function (initialData) {
    //initialData = Java.from(initialData); Listの場合
    return React.renderToString(
        <App data={initialData} />
    );
};

