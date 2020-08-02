import React from "react";
import { HomeLink } from './HomeLink.jsx';
import { Link } from "react-router-dom";

export class UserBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = { user: [] };
  }

  componentDidMount() {
    const url = `/api/v1/users/${this.props.userId}`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ user: response }))
      .catch(() => this.props.history.push("/"));
  }

  render() {
    const { user } = this.state;
    const user_url = `/users/${this.props.userId}`;
    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-1">
            <HomeLink />
            <h3>
              <Link to={user_url}>
                {user.name}
              </Link>
              - {user.address}</h3>
          </div>
        </section>
      </>
    );
  }
}
export default UserBar;