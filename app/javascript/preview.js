document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('product-image')){
    const ImageList = document.getElementById('image-list');
    console.log(ImageList)
    document.getElementById('product-image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('image-list');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('height', 100)
      blobImage.setAttribute('class', 'image-list')

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);

      createImageHTML(blob);
    });
  }
});