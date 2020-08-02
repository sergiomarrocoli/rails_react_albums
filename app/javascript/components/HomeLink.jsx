import React from "react";
import { Link } from "react-router-dom";

export class HomeLink extends React.Component {

  render() {
    return (
      <div className="float-right">
        <Link to="/" className="btn btn-link">
          Home
        </Link>
      </div>
    )
  }
}
export default HomeLink;