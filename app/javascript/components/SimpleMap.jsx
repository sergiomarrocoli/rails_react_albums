import React, { Component } from 'react';
import GoogleMapReact from 'google-map-react';
import { GoLocation } from 'react-icons/go';
 
const AnyReactComponent = () => <div><GoLocation /></div>;

export class SimpleMap extends Component {
  constructor(props) {
    super(props);
    this.state = {
      center: {
        lat: "",
        lng: ""
      },
      api_key: ""
    };
  }

  componentDidMount() {
    const url = `/api/v1/users/${this.props.userId}/location`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({
        center: {
          lat: Number(response.lat),
          lng: Number(response.lng)
        },
        api_key: response.api_key
      })
      )
      .catch(() => this.props.history.push("/"));
  }
 
  render() {
    const zoom = 0;
    var map;
    if (this.state.center.lat === ""){
      map = (
        <div></div>
      );
    } else {
      map = (
        <div className="map" style={{ height: '50vh', width: '100%' }}>
          <GoogleMapReact
            bootstrapURLKeys={{ key: this.state.api_key }}
            defaultCenter={this.state.center}
            defaultZoom={zoom}
          >
            <AnyReactComponent
              lat={this.state.lat}
              lng={this.state.lng}
            />
          </GoogleMapReact>
        </div>
      )
    }

    return (
      <div>
        { map }
      </div>
    );
  }
}