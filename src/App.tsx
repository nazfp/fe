import { useState } from "react";
import reactLogo from "./assets/react.svg";
import "./App.css";
import Register from "./Component/Register";

function App() {
  const [userId, setUserId] = useState(false);

  return (
    <div className="App">
      <Register/>
    </div>
  );
}

export default App;
