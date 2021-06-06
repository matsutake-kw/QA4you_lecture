FROM jupyter/scipy-notebook:latest

# 毎回使うモジュールはコンテナ起動時にまとめてインストールする(なのでコード上でpip installする必要がなくなる)
RUN ["pip", "install", "dwave-ocean-sdk"]

# エンドポイントとtokenは講義では直書きしていたが, 使いまわすものなので環境変数にする
## これに伴って講義のコードを一部アレンジしているので注意
ENV ENDPOINT='https://cloud.dwavesys.com/sapi/'
# DWaveのトークンをここに書く
#  !!!!!!本来はトークンなどはsecretなどで管理し, こういうことろに書いてはいけない(セキュリティ的に)!!!!!
# 今回は講義ようなので, 作りを簡素化するためにゆるっとこういう書き方をしている
ENV TOKEN='<YOUR TOKEN>'

# notebookの実行コマンド
CMD ["start-notebook.sh", "--NotebookApp.token=''"]
