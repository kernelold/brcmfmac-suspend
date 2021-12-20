pkgname=brcmfmac-sleep
pkgver=0.0.1
pkgrel=1
pkgdesc="Script for brcmfmac suspend and wakeup"
arch=(x86_64)
license=('MIT')
##source=("$pkgname-$pkgver-source.tar.gz::https://${_vendor}/archive/v${pkgver}.tar.gz")
#sha256sums=('SKIP')
source=()

#build() {
#	cp -r "$startdir/brcmfmac-suspend.sh" $srcdir
#}

prepare() {
  cp -r "$startdir/brcmfmac-suspend.sh" $srcdir
}

package() {
  install -Dm755 brcmfmac-suspend.sh $pkgdir/usr/lib/systemd/system-sleep/brcmfmac-suspend.sh
}
