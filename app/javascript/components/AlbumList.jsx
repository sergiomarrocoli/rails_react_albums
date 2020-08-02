import React from "react";
import { Link } from "react-router-dom";

export class AlbumList extends React.Component {
  constructor() {
    super();

    var exampleItems = [];

    this.state = {
        exampleItems: exampleItems
    };
  }

  componentDidMount() {
    const userId = this.props.userId;

    const url = `/api/v1/users/${userId}/albums`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ exampleItems: response }))
      .catch(() => this.props.history.push("/"));
  }

  render() {
    var myDivs = this.state.exampleItems.map((album, index) => (
      <li>
        <Link to={`/albums/${album.id}?user_id=${album.userId}`}>
          {album.title}
        </Link>
      </li>
    ));

    return (
      <>
      <h3>Albums</h3>
      <ul>
        {myDivs}
      </ul>
      </>
    );
  }
}