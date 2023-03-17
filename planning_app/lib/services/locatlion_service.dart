const GOOGLEMAP_API = 'AIzaSyDUwuxjLQn8PFWFuawKi61Qu57ip-2nNYg';

class LocationService {

  static String generateLocationPreviewImage({ required double latitude, required double longitude, int zoom = 16}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=${latitude},${longitude}&zoom=$zoom&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C${latitude},${longitude}&key=${GOOGLEMAP_API}';
  }

}