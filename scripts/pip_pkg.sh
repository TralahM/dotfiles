#!/usr/bin/env sh
echo "upgrading pip..."
pip install --upgrade pip
echo "youtube downloader"
pip install youtube-dl --upgrade
echo "pip fabric neovim-rpc scrapy ansible pylint autopep8..."
pip install fabric neovim ansible scrapy pylint autopep8 --upgrade

echo "django,rest-framework,heroku,psycopg2-binary"
pip install django django-rest-framework django-heroku psycopg2-binary --upgrade
