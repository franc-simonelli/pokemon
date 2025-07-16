getStoneEvolution(String reasonStone) {
  if (reasonStone.toLowerCase().contains('fire')) {
    return 'assets/images/fire_stone.webp';
  } else if (reasonStone.toLowerCase().contains('water')) {
    return 'assets/images/water_stone.png';
  } else if (reasonStone.toLowerCase().contains('thunder')) {
    return 'assets/images/thunder_stone.png';
  } else if (reasonStone.toLowerCase().contains('leaf')) {
    return 'assets/images/leaf_stone.png';
  } else if (reasonStone.toLowerCase().contains('moon')) {
    return 'assets/images/moon_stone.png';
  } else if (reasonStone.toLowerCase().contains('sun')) {
    return 'assets/images/sun_stone.png';
  } else if (reasonStone.toLowerCase().contains('shiny')) {
    return 'assets/images/shiny_stone.png';
  } else if (reasonStone.toLowerCase().contains('dawn')) {
    return 'assets/images/dawn_stone.png';
  } else if (reasonStone.toLowerCase().contains('dusk')) {
    return 'assets/images/dusk_stone.png';
  } else if (reasonStone.toLowerCase().contains('ice')) {
    return 'assets/images/ice_stone.png';
  }
}

getItemEvolution(String reasonStone) {
  if (reasonStone.toLowerCase().contains('whipped dream')) {
    return 'assets/images/whipped_dream.png';
  } else if (reasonStone.toLowerCase().contains('sachet')) {
    return 'assets/images/sachet.png';
  } else if (reasonStone.toLowerCase().contains('protector')) {
    return 'assets/images/protector.png';
  } else if (reasonStone.toLowerCase().contains('deep sea tooth')) {
    return 'assets/images/deep_sea_tooth.png';
  } else if (reasonStone.toLowerCase().contains('dubious disc')) {
    return 'assets/images/dubious_disc.png';
  } else if (reasonStone.toLowerCase().contains('electirizer')) {
    return 'assets/images/electirizer.png';
  } else if (reasonStone.toLowerCase().contains('magmarizer')) {
    return 'assets/images/magmarizer.png';
  } else if (reasonStone.toLowerCase().contains('metal coat')) {
    return 'assets/images/metal_coat.png';
  } else if (reasonStone.toLowerCase().contains('kings rock')) {
    return 'assets/images/kings_rock.png';
  } else if (reasonStone.toLowerCase().contains('prism scale')) {
    return 'assets/images/prism_scale.png';
  } else if (reasonStone.toLowerCase().contains('dragon scale')) {
    return 'assets/images/dragon_scale.png';
  } else if (reasonStone.toLowerCase().contains('deep sea scale')) {
    return 'assets/images/deep_sea_scale.png';
  } else if (reasonStone.toLowerCase().contains('reaper cloth')) {
    return 'assets/images/reaper_cloth.png';
  } else if (reasonStone.toLowerCase().contains('up grade')) {
    return 'assets/images/up_grade.png';
  }
}
