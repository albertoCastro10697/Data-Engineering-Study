# Context7 MCP Dummy Example

This dummy file records a simple Context7 MCP lookup and the example it was used
for.

## MCP Lookup

- MCP server: Context7
- Library resolved: `/reactjs/react.dev`
- Query: React `useState` counter example

## Example

```jsx
import { useState } from 'react';

export default function Counter() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    <button onClick={handleClick}>
      You clicked {count} times
    </button>
  );
}
```

The key pattern is that component state is read from `count` and updated through
the setter returned by `useState`.
