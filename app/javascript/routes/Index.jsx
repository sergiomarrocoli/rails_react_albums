import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Albums from "../components/Albums";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Albums} />
    </Switch>
  </Router>
);