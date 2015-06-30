React = require 'react';

Greet = React.createClass
    getInitialState: ->
        this.props.data ||
            {id: 0, content: 'Now Loading...'};

    loadFromServer: ->
        request = new XMLHttpRequest();
        
        request.open('GET', 'http://rest-service.guides.spring.io/greeting', true);
        request.onreadystatechange = (->
            if request.readyState != 4 then return;
            if request.status != 200
                alert(request.status + ' error!');
                this.setState({"id":999,"content":"error Hello, World!"});
            else
                this.setState(JSON.parse(request.responseText));
        ).bind this;
        request.send();

    componentDidMount: ->
        this.loadFromServer();

    onClick: ->
        this.loadFromServer();

    render: ->
            <div>
                <p>{this.state.id} {this.state.content}</p>
                <button onClick={this.onClick}>Reload</button>
            </div>

module.exports = Greet;