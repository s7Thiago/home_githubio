echo ======Gerando release para web======\n\n;
flutter build web;
git status;
git add .;
git commit -m "Deployed a new web release";
echo ======Mandando arquivos para a branch develop======\n\n;
git push origin develop;
echo ======Alterando branch para master======\n\n;
git checkout master;
echo ======Fazendo merge master <- develop ======\n\n;
git merge develop;
echo ======Publicando arquivos na branch master======\n\n;
git push origin master;
echo ======Alterando branch para develop======\n\n;
git checkout develop;
echo ======          Fim!          ======\n\n;
cls;

