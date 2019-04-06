# React Component Template Engine
## Description
A simple bash script that creates the file structure and boilerplate of React components via the terminal.


## Example

I recommend setting an alias in your `~/.bashrc` that includes the path to the script
```bash
alias rc="sh /path/to/create-react-component/createcomponent.sh"
```
Running `rc One Two` will generate:

#### /src/components/One/One.js
```js
import React from 'react';
import './One.scss';

class One extends React.Component {
  render () {
    return (
      <div className='One'>

      </div>
    );
  }
};

export default One;

```
#### /src/components/One/One.scss
```css
.One {

}
```
#### /src/components/Two/Two.js
```js
import React from 'react';
import './Two.css';

class Two extends React.Component {
  render () {
    return (
      <div className='Two'>

      </div>
    );
  }
};

export default Two;

```
#### /src/components/Two/Two.scss
```css
.Two {

}
```

