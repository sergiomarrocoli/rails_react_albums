import React from "react";
import { UserBar } from './UserBar.jsx';
import Pagination from './Pagination';

class Album extends React.Component {
  constructor() {
    super();

    var photos = [];

    this.state = {
        photos: photos,
        pageOfItems: []
    };

    // bind function in constructor instead of render (https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-no-bind.md)
    this.onChangePage = this.onChangePage.bind(this);
}

  componentDidMount() {
        const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/albums/${id}${this.props.location.search}`;
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ photos: response }))
      .catch(() => this.props.history.push("/"));
  }
    
  onChangePage(pageOfItems) {
      // update state with new page of items
      this.setState({ pageOfItems: pageOfItems });
  }

  render() {
    const userId = this.props.location.search.split("=")[1];
    var myDivs = this.state.pageOfItems.map((album, index) => (
      <div key={index} className="col-md-6 col-lg-3 d-flex align-items-stretch">
        <div className="card mb-4">
          <img
            src={album.url}
            className="card-img-top"
            alt={`${album.name} image`}
          />
          <div className="card-body">
            <h4 className="card-title">{album.title}</h4>
          </div>
        </div>
      </div>
    ));

    return (
      <>
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
        <UserBar userId={userId}/>
        <div className="py-5">
          <main className="container">
            <div className="row">
              { myDivs }
            </div>
            <div className="text-center">
              <Pagination items={this.state.photos} onChangePage={this.onChangePage} />
            </div>
          </main>
        </div>
      </>
    );
  }
}

export default Album;