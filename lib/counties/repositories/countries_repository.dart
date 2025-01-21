import 'package:pokedex/counties/models/country_model.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';

class CountriesRepository {
  fecthCountries() {
    return [
      CountryModel(
        id: 1,
        description: 'Kanto',
        image:
            'https://www.pokemonmillennium.net/wp-content/uploads/2015/11/Mappa_Kanto.jpg',
        gen: EnumGen.one,
      ),
      CountryModel(
        id: 2,
        description: 'Johto',
        image:
            'https://www.pokemonmillennium.net/wp-content/uploads/2015/10/Johto_mappa.jpg',
        gen: EnumGen.two,
      ),
      CountryModel(
        id: 3,
        description: 'Hoenn',
        image:
            'https://www.pokemonmillennium.net/wp-content/uploads/2015/10/Hoenn.jpg',
        gen: EnumGen.three,
      ),
      CountryModel(
        id: 4,
        description: 'Sinnoh',
        image:
            'https://www.pokemonmillennium.net/wp-content/uploads/2015/10/Sinnoh.png',
        gen: EnumGen.four,
      ),
      CountryModel(
        id: 5,
        description: 'Unima',
        image:
            'https://www.pokemonmillennium.net/wp-content/uploads/2015/09/Unima.png',
        gen: EnumGen.five,
      ),
      CountryModel(
        id: 6,
        description: 'Kalos',
        image:
            'https://oyster.ignimgs.com/mediawiki/apis.ign.com/pokemon-x-y-version/e/e0/Kallos_region.png',
        gen: EnumGen.six,
      ),
      CountryModel(
        id: 7,
        description: 'Alola',
        image:
            'https://www.pokemonmillennium.net/wp-content/uploads/2016/06/alola-mappa.jpg',
        gen: EnumGen.seven,
      ),
    ];
  }
}
