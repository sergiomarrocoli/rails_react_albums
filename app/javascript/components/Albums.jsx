import React from "react";
import { Link } from "react-router-dom";
import Pagination from './Pagination';

class Albums extends React.Component {
    constructor() {
        super();

        var albums = [];

        this.state = {
            albums: albums,
            pageOfItems: []
        };

        // bind function in constructor instead of render (https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-no-bind.md)
        this.onChangePage = this.onChangePage.bind(this);
    }

    componentDidMount() {
      const url = "/api/v1/albums";
      fetch(url)
        .then(response => {
          if (response.ok) {
            return response.json();
          }
          throw new Error("Network response was not ok.");
        })
        .then(response => this.setState({ albums: response }))
        .catch(() => this.props.history.push("/"));
    }

    onChangePage(pageOfItems) {
        // update state with new page of items
        this.setState({ pageOfItems: pageOfItems });
    }

    render() {
      var myDivs = this.state.pageOfItems.map((album, index) => (
        <div key={index} className="col-md-6 col-lg-2 d-flex align-items-stretch">
          <div className="card mb-4 card-width"> 
            <img
              src={album.thumbnail_url}
              className="card-img-top"
              alt={`${album.name} image`}
            />
            <div className="card-body">
              <div>
                <Link to={`/users/${album.userId}`}>
                  { album.username }
                </Link>
                <h5 className="card-title">{album.title}</h5>
                <Link to={`/albums/${album.id}?user_id=${album.userId}`} className="btn custom-button">
                  View Album
                </Link>
              </div>
            </div>
          </div>
        </div>
      ));

      return (
        <>
          <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
          <section className="jumbotron jumbotron-fluid text-center" id="app">
            <div className="container py-1">
              <h1 className="display-4">Photo Albums</h1>
            </div>
          </section>
          <div className="py-5">
            <main className="container">
              <div className="row">
                { myDivs }
              </div>
              <div className="text-center">
                <Pagination items={this.state.albums} onChangePage={this.onChangePage} />
              </div>
            </main>
          </div>
        </>
      );
    }
}
export default Albums;