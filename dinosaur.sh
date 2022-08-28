#!/bin/bash

main() {
  . asciidinos.sh #Pull in ASCII dino functions
  echo "Pick a dinosaur."
  read -p "Press [Enter] when you have a dinosaur for me to guess."
  guessmethod
  read -p "I give up, what is it?" dinostoadd
  echo $dinostoadd >> dinostoadd.txt
}

triassicdinos="$(shuf -e Eoraptor Herrerasaurus Marasuchus Ichthyosaurus Nothosaurus Camposaurus Caseosaurus Chindesaurus Coelophysis Daemonosaurus Gojirasaurus Lepidus_praecisio Tawa_hallae Riojasaurus)"
jurassicdinos="$(shuf -e Stegosaurus Allosaurus Brachiosaurus Kentrosaurus Yangchuanosaurus Huayangosaurus Gigantspinosaurus Kentrosaurus Brachiosaurus Supersaurus Xinjiangtitan Diplodocus Apatosaurus Plesiosaurus Ichthyosaurus Pterodactylus Dimorphodon Dilophosaurus Sarahsaurus Mamenchisaurus Ceratosaurus Archaeopteryx Camarasaurus Megalosaurus)"
cretaceousdinos="$(shuf -e Baryonyx Velociraptor Oviraptor Utahraptor Dakotaraptor Dromaeosaurus Deinonychus Giganotasaurus T-Rex Gorgosaurus Spinosaurus Carcharodontosaurus Acrocanthosaurus Mapusaurus Troodon Nedoceratops Triceratops Protoceratops Styracosaurus Kosmoceratops Torosaurus Argentinosaurus Sauroposeidon Astrodon_Johnstoni Alamosaurus Ankylosaurus Euoplocephalus Anodontosaurus Nodosaurus Aletopelta Pachycephalosaurus Stygimoloch Dracorex Stegoceras Maiasaura Edmontosaurus Parasaurolophus Corythosaurus Iguanodon Gryposaurus Mosasaurus Cretoxyrhina Megalodon Kronosaurus Archelon Pteranodon Hatzegopteryx Quetzalcoatlus Pterodaustro Saltasaurus Mamenchisaurus Tarbosaurus Microceratus Pentaceratops Edmontonia Carnotaurus Psittacosaurus Gallimimus Albertosaurus Dromiceiomimus Muttaburrasaurus)"
fictionaldinos="$(shuf -e Christmasaurus Indominus_Rex Indoraptor Stegoceratops)"
dinofamilies="$(shuf -e raptor theropod stegosaur ceratopsian sauropod ankylosaur pachycephalosaur hadrosaur marine_reptile pterosaur)"
raptors="$(shuf -e Velociraptor Oviraptor Utahraptor Dakotaraptor Dromaeosaurus Deinonychyus Indoraptor)"
theropods="$(shuf -e T-Rex Allosaurus Baryonyx Christmasaurus Gorgosaurus Indominus_Rex Yangchuanosaurus Spinosaurus Giganotosaurus Carcharodontosaurus Acrocanthosaurus Mapusaurus Troodon Camposaurus Caseosaurus Chindesaurus Coelophysis Daemonosaurus Gojirasaurus Lepidus_praecisio Tawa_hallae Dilophosaurus Tarbosaurus Carnotaurus Ceratosaurus Gallimimus Albertosaurus Dromiceiomimus Megalosaurus)"
stegosaurs="$(shuf -e Huayangosaurus Gigantspinosaurus Stegosaurus Kentrosaurus)"
ceratopsians="$(shuf -e Nedoceratops Triceratops Protoceratops Styracosaurus Kosmoceratops Torosaurus Stegoceratops Microceratus Pentaceratops Psittacosaurus)"
sauropods="$(shuf -e Brachiosaurus Supersaurus Argentinosaurus Sauroposeidon Xinjiangtitan Astrodon_Johnstoni Diplodocus Apatosaurus Alamosaurus Plateosaurus Sarahsaurus Saltasaurus Mamenchisaurus Riojasaurus Camarasaurus)"
ankylosaurs="$(shuf -e Ankylosaurus Euoplocephalus Anodontosaurus Nodosaurus Aletopelta Edmontonia)"
pachycephalosaurs="$(shuf -e Pachycephalosaurus Stygimoloch Dracorex Stegoceras)"
hadrosaurs="$(shuf -e Maiasaura Edmontosaurus Parasaurolophus Corythosaurus Iguanodon Gryposaurus Muttaburrasaurus)"
marine_reptiles="$(shuf -e Mosasaurus Cretoxyrhina Megalodon Plesiosaurus Ichthyosaurus Nothosaurus Kronosaurus Archelon)"
pterosaurs="$(shuf -e Pteranodon Hatzegopteryx Pterodactylus Quetzalcoatlus Pterodaustro Dimorphodon Archaeopteryx)"

guessmethod() {
  echo "How would you like to play?"
  select method in family period randomly; do
    case $method in
      "family")
        family
        ;;
      "period")
        period
        ;;
      "randomly")
        random
        ;;
      *)
        echo "Please try again."
        guessmethod
        ;;
    esac
    break
  done
} #guessmethod

period() {
  echo "Which period did your dinosaur live in?"
  select period in Triassic Jurassic Cretaceous Fictional; do
    case $period in
      "Triassic")
        triassic
      ;;
      "Jurassic")
        jurassic
      ;;
      "Cretaceous")
        cretaceous
      ;;
      "Fictional")
        fictional
      ;;
      *)
        echo "Invalid choice. Please try again."
        period
      ;;
    esac
    break
  done
} #period

triassic() {
  for dino in $triassicdinos; do
    dinoclass $dino "yes"
  done
}

jurassic() {
  for dino in $jurassicdinos; do
    dinoclass $dino "yes"
  done
}

cretaceous() {
  for dino in $cretaceousdinos; do
    dinoclass $dino "yes"
  done
}

fictional() {
  for dino in $fictionaldinos; do
    dinoclass $dino "yes"
  done
}

random() {
  dinos=$(shuf -e $triassicdinos $jurassicdinos $cretaceousdinos $fictionaldinos)
  for dino in $dinos; do
    dinoclass $dino "yes"
  done 
}

family() {
guess=""
for class in $dinofamilies; do
  dinoclass $class
  if [[ ! $guess == "" ]]; then
    break
  fi
done

case $guess in
  "raptor")
    for guess2 in $raptors; do
      dinoclass $guess2 "yes"
    done
    ;;
  "theropod")
    for guess2 in $theropods; do
      dinoclass $guess2 "yes"
    done
    ;;
  "stegosaur")
    for guess2 in $stegosaurs; do
      dinoclass $guess2 "yes"
    done
    ;;
  "ceratopsian")
    for guess2 in $ceratopsians; do
      dinoclass $guess2 "yes"
    done
    ;;
  "sauropod")
    for guess2 in $sauropods; do
      dinoclass $guess2 "yes"
    done
    ;;
  "ankylosaur")
    for guess2 in $ankylosaurs; do
      dinoclass $guess2 "yes"
    done
    ;;
  "pachycephalosaur")
    for guess2 in $pachycephalosaurs; do
      dinoclass $guess2 "yes"
    done
    ;;
  "hadrosaur")
    for guess2 in $hadrosaurs; do
      dinoclass $guess2 "yes"
    done
    ;;
  "marine_reptile")
    for guess2 in $marine_reptiles; do
      dinoclass $guess2 "yes"
    done
    ;;
  "pterosaur")
    for guess2 in $pterosaurs; do
      dinoclass $guess2 "yes"
    done
    ;;
esac
} #family

dinoclass() {
  class=$1
  species=$2
  case $1 in
    "Parasaurolophus")
      parasaurolophus
    ;;
    "Spinosaurus")
      spinosaurus
    ;;
    "Ankylosaurus")
      ankylosaurus
    ;;
  esac
  echo "Is your dinosaur a/an $class?"
  read answer
  case $answer in
    "y"|"Y"|"yes"|"YES")
      echo "So, your dinosaur is a/an $class."
      guess=$class
      if [[ "$species" == "yes" ]]; then
        echo "Yay, I figured out your dinosaur."
        exit
      fi
#      return
      ;;
    *)
      echo "Your dinosaur is NOT a $class...Hmmm..."
      ;;
  esac
}

main
