import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Albums from "../components/Albums";
import Album from "../components/Album";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Albums} />
      <Route path="/albums/:id" exact component={Album} />
    </Switch>
  </Router>
);