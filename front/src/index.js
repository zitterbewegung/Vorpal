import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App";
import { DrizzleProvider } from "drizzle-react";

// Import contract
import VorpalCoin from "./contracts/VorpalCoin.json";

console.log(VorpalCoin);

const options = {
  web3: {
    block: false,
    fallback: {
      type: "ws",
      url: "ws://127.0.0.1:7545"
    }
  },
  contracts: [VorpalCoin],
  events: {}
};

ReactDOM.render(
  <DrizzleProvider options={options}>
    <App />
  </DrizzleProvider>,
  document.getElementById("root")
);