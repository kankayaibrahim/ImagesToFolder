# ImagesToFolder
windows context menu resim klasörleme </br>
Herhangi bir klasörde bir veya birden fazla seçtiğiniz *.jpg dosyasına sağ tıklayıp grupla dediğinizde sizden klasör adı girmenizi bekleyecektir klasörü adını belirledikten sonra seçtiğiniz resimleri ilgili klasöre taşıyıp isimlerini klasoradi-1.jpg, klasoradi-2.jpg olarak değiştirecektir.
Windows Gezgini menüsünden birden çok dosya seçildiğinde her seçim için ayrı process başlatılıyordu </br> 
bu sorun https://github.com/zenden2k/context-menu-launcher ile giderildi.
Örnek Kullanım https://github.com/kankayaibrahim/ImagesToFolder/releases/tag/v0.1.0
adresinden AddToRegedit.reg,ImagesToFolder.exe,singleinstance.exe dosylarını indirip
d:\MyPath dizinine taşıyın AddToRegedit.reg dosyasını çalıştırıp windows kayıt defterini güncelleyelim 
eğer farklı bir dizinde tutmak istiyorsanız AddToRegedit.reg içeriğini kendinize göre düzenleyin.

Örnek içerik </br>
<blockquote>
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\SystemFileAssociations\.jpg\Shell\Grupla]
"MultiSelectModel"="Player"
"Icon"="%SystemRoot%\\System32\\SHELL32.dll,19"

[HKEY_CLASSES_ROOT\SystemFileAssociations\.jpg\Shell\Grupla\Command]
@="\"D:\\MyPath\\singleinstance.exe\" \"%1\" \"D:\\MyPath\\ImagesToFolder.exe\" $files --si-timeout 400"
</blockquote>

