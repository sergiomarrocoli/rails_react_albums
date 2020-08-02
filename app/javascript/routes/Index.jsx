import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Albums from "../components/Albums";
import Album from "../components/Album";
import User from "../components/User";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Albums} />
      <Route path="/albums/:id" exact component={Album} />
      <Route path="/users/:id" exact component={User} />
    </Switch>
  </Router>
);