React = require 'react';
Greet = require './Greet.cjsx';

App = React.createClass
    render: ->
            <div>
                <h1>React.js</h1>
                <Greet
                    data={this.props.data} />
            </div>

module.exports = App;

