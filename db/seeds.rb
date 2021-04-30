# Users !
mrsolarius = User.new(
  login: 'MrSolarius',
  name: 'louis',
  bio: "Allez, on va commencer la dictée.
Kevin, va écrire la date au tableau. T'as mis tes gants ? Prends une nouvelle craie surtout.
Marvin, éternue DANS TON COUDE ! C'est la 3ème fois qu'on change de masque depuis ce matin ! Va te laver les mains, AVEC DU SAVON cette fois-ci ! Oui, je sais qu'il n'y avait plus de savon la dernière fois...
Vous avez écrit la date, c'est bon ?",
  location: 'Grenoble',
  imageB64: File.open(Rails.root.join('db/seeds/1.gif'), encoding: 'BINARY').read,
  imageName: '1.gif'
)
mrsolarius.save


tim = User.new(
  login: 'patate',
  name: 'Tim',
  bio: 'Tuturu rututu steins gate !',
  location: 'ItoMori',
  imageB64: File.open(Rails.root.join('db/seeds/2.png'), encoding: 'BINARY').read,
  imageName: '2.png'
)
tim.save

mumix = User.new(
  login: 'mumix',
  name: 'Clément mi Britannia',
  bio: "C'est cool la plage",
  location: 'Bordeau',
  imageB64: File.open(Rails.root.join('db/seeds/3.png'), encoding: 'BINARY').read,
  imageName: '3.png'
)
mumix.save

marty = User.new(
  login: 'trm',
  name: 'Marty',
  location: 'ItoMori',
  imageB64: File.open(Rails.root.join('db/seeds/4.png'), encoding: 'BINARY').read,
  imageName: '4.png'
)
marty.save

era = User.new(
  login: 'eraheather',
  name: 'Era',
  bio: 'Mon arme : mes crayon !',
  location: 'En enfers',
  imageB64: File.open(Rails.root.join('db/seeds/5.png'), encoding: 'BINARY').read,
  imageName: '5.png'
)
era.save

joey = User.new(
  login: 'Chauve',
  name: 'Baldus Maximus',
  bio: 'Chauve un Jour Chauve Toujours !',
  location: 'Dans une sombre Cave',
  imageB64: File.open(Rails.root.join('db/seeds/6.png'), encoding: 'BINARY').read,
  imageName: '6.png'
)
joey.save

mega = User.new(
  login: 'mega',
  name: 'MegaStunt',
  bio: '😭Concours dans 2 jour !',
  location: 'Au sommet d\'une grue !',
  imageB64: File.open(Rails.root.join('db/seeds/7.jpeg'), encoding: 'BINARY').read,
  imageName: '7.jpeg'
)
mega.save

rock = User.new(
  login: 'rock',
  name: 'Bec de l\'Aigle',
  bio: 'Je suis une montagne qui aime les aigles !',
  location: 'Vercore',
  imageB64: File.open(Rails.root.join('db/seeds/8.jpg'), encoding: 'BINARY').read,
  imageName: '8.png'
)
rock.save

lyceDesAlpe = User.new(
  login: 'LeLyse',
  name: 'Le Lyse des Alpes',
  bio: 'Je suis une fleur rare trouvable que sur les plus grand sommet alors respecter moi !',
  location: 'Les Haut  Sommet',
  imageB64: File.open(Rails.root.join('db/seeds/9.jpg'), encoding: 'BINARY').read,
  imageName: '9.png'
)
lyceDesAlpe.save

laBelle = User.new(
  login: 'laBelle',
  name: 'Belldone',
  bio: "Je suis une très heureuse montagne draper d'une jolie robe banche qui me rend plus jolie et brillante :)",
  location: 'Alpes',
  imageB64: File.open(Rails.root.join('db/seeds/10.jpg'), encoding: 'BINARY').read,
  imageName: '10.png'
)
laBelle.save

anonymous = User.new(
  login: '404',
  name: 'erreur',
  bio: "Je suis la personne la plus anonyme de tous l'internet",
  location: 'Matrice'
)
anonymous.save
sleep 2
Tweet.new(tweet: "Un noueaux nis de rapasse c'est poser sur mon dos un jour merveilleux en somme #faune #montagne ", user: joey).save
Tweet.new(tweet: 'Le js > all', user: joey).save
Tweet.new(
tweet: "Depuis quelle que jour maintenant de jolie marmotte sorte de la #montagne hate de les voirs de plus prêt #faune", user: joey).save
Tweet.new(tweet: "Meilleurs #php code ever :
try{
  //se que tu veut
}catch(Execption $e){
  header('location : https://stackoverflow.com/search?q=[php] '.$e->getMessage()
}
#php #CodingPractice
", user: joey).save

t = Tweet.new(tweet: "@Chauve Le vrais meilleurs code ever :
set_exception_handler(function(Throwable $e){
    header('Location: https://stackoverflow.com/search?q=[php] ' . $e->getMessage());
});
#CodingPractice
", user: mrsolarius).save

Tweet.new(tweet:"Je pense que les situation diverse son parfois enuiyeuse #oups",user: mumix).save

Tweet.new(tweet:"-10% de reduction sur tout les Vetements #ZARA dans tout les magasins #promo",user:era).save

Tweet.new(tweet:"La #neige et mon drap préférer je m'en amuse et je l'adore !",user:laBelle).save

Tweet.new(tweet:"L'hiver mes sommet les plus haut ce gèle et mes lac les plus beau se glace #montagne #lac",user:laBelle).save

Tweet.new(tweet: "Point Jardinage.
Donc ce matin, j'ai eu la visite de la #police_municipale car une personne leur a signalé que je faisais pousser des plants de beuh sur le balcon.
Ce sont des papyrus et un érable du #japon.
Voilà, voilà.",user:marty).save

Tweet.new(tweet: "Aujourd'huis, Via Ferrata au @rock et randonnée pour le retour.
Approximativement 2h30 accrochés aux rochers et 4h de marche.
Rencotre avec les rapace absolument fantastique.
Des vues magnifiques, du dévers et jusqu’à 250m de vide sous nos pieds !
#montagne #faune",user:marty).save

Tweet.new(tweet: "Ce tweet est sponsorisé par #SudVPN... Avec le code 'PIGEON' vous aurez un mois gratuit ! Faites un tour sur l'application gratuite SudVPN
Toujours être positif ! Ah merde oui c'est la covid... Je suis positif snif....",user:mega).save


Tweet.new(tweet:"La #flore et importante pour la surive de tous ici bas",user:lyceDesAlpe).save

Tweet.new(
tweet:"Vous savez, moi je ne crois pas qu'il y ait de bonne ou de mauvaise situation. Moi, si je devais résumer ma vie aujourd'hui avec vous, je dirais que c'est d'abord des rencontres. Des gens qui m'ont tendu la main, peut-être à un moment où je ne pouvais pas, où j'étais seul chez moi.",user:mega).save

Tweet.new(tweet:"#minami @MrSolarius LOVE YOU <3", user:tim).save

Tweet.new(tweet:"#sayuri @patate je préfère ça moi...", user:mrsolarius).save

Tweet.new(tweet: "#kimetsuNoYaiba @MrSolarius LE FILM DEMON SLAYER SORT AU CINEMA LE 19 MAI 2021 !!!!!! <3", 
          user: tim).save

Tweet.new(tweet:"Sans #insesct et sans #abbeille mes conseur de lyse ne peuvent survire !
alors proteger les elle sont importante",user:lyceDesAlpe).save

Tweet.new(
tweet:"C'est vrai que #minami est vraiment la best des bests ! J'ai bien fait d'écouter tes conseils @patate", user:mumix).save

Tweet.new(tweet: "#minami sore ga futashika demo zutto boku wa
okubyou to machi tsuzuketen da
hari wa boku wo oitsuzuketa
kimi wa boku no tonari no suuji de
matte kureru yo na
meimu de ii ya

yappa kyou mo dame na boku da na
tsunette mo nijimu dake daro
kawaita ame machi tsuzuketeita", user:marty).save

Tweet.new(tweet:"@eraheather tu es la femme qui a ravivé la flemme de mon coeur !", user:joey).save

Tweet.new(tweet:"La #montagne et magnifique et j'adore y trouver la #faunes", user:mrsolarius).save



Follow.new(follower_user_id: anonymous.id, followed_user_id: mrsolarius.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: tim.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: mumix.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: era.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: joey.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: marty.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: mega.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: rock.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: lyceDesAlpe.id).save
Follow.new(follower_user_id: anonymous.id, followed_user_id: laBelle.id).save

Follow.new(follower_user_id: mrsolarius.id, followed_user_id: tim.id).save
Follow.new(follower_user_id: mrsolarius.id, followed_user_id: joey.id).save
Follow.new(follower_user_id: mrsolarius.id, followed_user_id: laBelle.id).save

Follow.new(follower_user_id: tim.id, followed_user_id: mrsolarius.id).save
Follow.new(follower_user_id: tim.id, followed_user_id: era.id).save
Follow.new(follower_user_id: tim.id, followed_user_id: mega.id).save
Follow.new(follower_user_id: tim.id, followed_user_id: rock.id).save
Follow.new(follower_user_id: tim.id, followed_user_id: laBelle.id).save

Follow.new(follower_user_id: mumix.id, followed_user_id: tim.id).save
Follow.new(follower_user_id: mumix.id, followed_user_id: era.id).save
Follow.new(follower_user_id: mumix.id, followed_user_id: laBelle.id).save

Follow.new(follower_user_id: era.id, followed_user_id: laBelle.id).save

Follow.new(follower_user_id: marty.id, followed_user_id: mrsolarius.id).save
Follow.new(follower_user_id: marty.id, followed_user_id: rock.id).save

Follow.new(follower_user_id: mega.id, followed_user_id: era.id).save
Follow.new(follower_user_id: mega.id, followed_user_id: joey.id).save
Follow.new(follower_user_id: mega.id, followed_user_id: lyceDesAlpe.id).save
Follow.new(follower_user_id: mega.id, followed_user_id: laBelle.id).save

Follow.new(follower_user_id: mega.id, followed_user_id: mrsolarius.id).save
Follow.new(follower_user_id: mega.id, followed_user_id: marty.id).save

Follow.new(follower_user_id: rock.id, followed_user_id: mumix.id).save
Follow.new(follower_user_id: rock.id, followed_user_id: lyceDesAlpe.id).save

Follow.new(follower_user_id: lyceDesAlpe.id, followed_user_id: tim.id).save
Follow.new(follower_user_id: lyceDesAlpe.id, followed_user_id: mumix.id).save
Follow.new(follower_user_id: lyceDesAlpe.id, followed_user_id: marty.id).save
Follow.new(follower_user_id: lyceDesAlpe.id, followed_user_id: laBelle.id).save

Follow.new(follower_user_id: laBelle.id, followed_user_id: mrsolarius.id).save
Follow.new(follower_user_id: laBelle.id, followed_user_id: mumix.id).save
Follow.new(follower_user_id: laBelle.id, followed_user_id: mega.id).save
