import React from "react";
import { HomeLink } from './HomeLink.jsx';
import { AlbumList } from './AlbumList.jsx';

class User extends React.Component {
  constructor(props) {
    super(props);
    this.state = { user: [] };
  }

  componentDidMount() {
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/users/${id}`;

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

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-1">
            <HomeLink />
            <h1 className="display-4">{user.name} ({user.username})</h1>
            <h3>email: {user.email}</h3>
            <div className="row">
              <div className="col">
                website: {user.website} 
              </div>
              <div className="col">
                phone: {user.phone} 
              </div>
              <div className="col-5">
                address: {user.address} 
              </div>
            </div>
            <div className="container">
            <div className="text-center">
                Company: {user.company_name} - {user.catch_phrase} - {user.bs}
              </div>
            </div>
          </div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="row">
              <div className="col-6">
                <AlbumList userId={this.props.match.params.id}/>
              </div>
              <div className="col-6">
              </div>
            </div>
          </main>
        </div>
      </>
    );
  }
}
export default User;