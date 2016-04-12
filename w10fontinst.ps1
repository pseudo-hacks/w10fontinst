<#
    w10fontinst
    Copyright (C) 2016 pseudo-hacks.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#>

#requires -version 3.0

$DebugPreference = "SilentlyContinue"
#$DebugPreference = "Continue"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

<# variables #>

$software_name = "w10fontinst"
$mutexObject = New-Object System.Threading.Mutex($false, $software_name)
if (-not $mutexObject.WaitOne(0, $false)) {
    [System.Windows.Forms.MessageBox]::Show("既に起動されています", "確認 - " + $software_name, "OK", "Error")
    exit
}

$font_infos = @(
   # Noto Fonts
   @{ name = 'Noto Sans CJK JP'
     ;url = 'https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip'
     ;fonts = @(
        ,@{ file = 'NotoSansCJKjp-Black.otf'; names = @(,'Noto Sans CJK JP Black') }
        ,@{ file = 'NotoSansCJKjp-Bold.otf'; names = @(,'Noto Sans CJK JP Bold') }
        ,@{ file = 'NotoSansCJKjp-DemiLight.otf'; names = @(,'Noto Sans CJK JP DemiLight') }
        ,@{ file = 'NotoSansCJKjp-Light.otf'; names = @(,'Noto Sans CJK JP Light') }
        ,@{ file = 'NotoSansCJKjp-Medium.otf'; names = @(,'Noto Sans CJK JP Medium') }
        ,@{ file = 'NotoSansCJKjp-Regular.otf'; names = @(,'Noto Sans CJK JP Regular') }
        ,@{ file = 'NotoSansCJKjp-Thin.otf'; names = @(,'Noto Sans CJK JP Thin') }
        ,@{ file = 'NotoSansMonoCJKjp-Bold.otf'; names = @(,'Noto Sans Mono CJK JP Bold') }
        ,@{ file = 'NotoSansMonoCJKjp-Regular.otf'; names = @(,'Noto Sans Mono CJK JP Regular') }
     )
  }

<#
  ,@{ name = 'Noto Sans'
     ;url = 'https://noto-website-2.storage.googleapis.com/pkgs/NotoSans-hinted.zip'
     ;fonts = @(
        ,@{ file = 'NotoSans-Bold.ttf'; names = @(,'Noto Sans') }
        ,@{ file = 'NotoSans-BoldItalic.ttf'; names = @(,'Noto Sans') }
        ,@{ file = 'NotoSans-Italic.ttf'; names = @(,'Noto Sans') }
        ,@{ file = 'NotoSans-Regular.ttf'; names = @(,'Noto Sans') }
     )
  }

  ,@{ name = 'Noto Serif'
     ;url = 'https://noto-website-2.storage.googleapis.com/pkgs/NotoSerif-hinted.zip'
     ;fonts = @(
        ,@{ file = 'NotoSerif-Bold.ttf'; names = @(,'Noto Serif') }
        ,@{ file = 'NotoSerif-BoldItalic.ttf'; names = @(,'Noto Serif') }
        ,@{ file = 'NotoSerif-Italic.ttf'; names = @(,'Noto Serif') }
        ,@{ file = 'NotoSerif-Regular.ttf'; names = @(,'Noto Serif') }
     )
  }
#>

  # 源ノ角
  ,@{ name = '源ノ角ゴシック'
     ;url = 'https://raw.githubusercontent.com/adobe-fonts/source-han-sans/release/SubsetOTF/SourceHanSansJP.zip'
     ;fonts = @(
        ,@{ file = 'SourceHanSansJP-Bold.otf'; names = @(,'源ノ角ゴシック JP Bold') }
        ,@{ file = 'SourceHanSansJP-ExtraLight.otf'; names = @(,'源ノ角ゴシック JP ExtraLight') }
        ,@{ file = 'SourceHanSansJP-Heavy.otf'; names = @(,'源ノ角ゴシック JP Heavy') }
        ,@{ file = 'SourceHanSansJP-Light.otf'; names = @(,'源ノ角ゴシック JP Light') }
        ,@{ file = 'SourceHanSansJP-Medium.otf'; names = @(,'源ノ角ゴシック JP Medium') }
        ,@{ file = 'SourceHanSansJP-Normal.otf'; names = @(,'源ノ角ゴシック JP Normal') }
        ,@{ file = 'SourceHanSansJP-Regular.otf'; names = @(,'源ノ角ゴシック JP Regular') }
     )
  }
  ,@{ name = '源ノ角ゴシック Code JP'
     ;url = 'https://github.com/adobe-fonts/source-han-code-jp/archive/2.000R.zip'
     ;fonts = @(
        ,@{ file = 'SourceHanCodeJP-Bold.otf'; names = @(,'源ノ角ゴシック Code JP B') }
        ,@{ file = 'SourceHanCodeJP-BoldIt.otf'; names = @(,'源ノ角ゴシック Code JP B It') }
        ,@{ file = 'SourceHanCodeJP-ExtraLight.otf'; names = @(,'源ノ角ゴシック Code JP EL') }
        ,@{ file = 'SourceHanCodeJP-ExtraLightIt.otf'; names = @(,'源ノ角ゴシック Code JP EL It') }
        ,@{ file = 'SourceHanCodeJP-Heavy.otf'; names = @(,'源ノ角ゴシック Code JP H') }
        ,@{ file = 'SourceHanCodeJP-HeavyIt.otf'; names = @(,'源ノ角ゴシック Code JP H It') }
        ,@{ file = 'SourceHanCodeJP-Light.otf'; names = @(,'源ノ角ゴシック Code JP L') }
        ,@{ file = 'SourceHanCodeJP-LightIt.otf'; names = @(,'源ノ角ゴシック Code JP L It') }
        ,@{ file = 'SourceHanCodeJP-Medium.otf'; names = @(,'源ノ角ゴシック Code JP M') }
        ,@{ file = 'SourceHanCodeJP-MediumIt.otf'; names = @(,'源ノ角ゴシック Code JP M It') }
        ,@{ file = 'SourceHanCodeJP-Normal.otf'; names = @(,'源ノ角ゴシック Code JP N') }
        ,@{ file = 'SourceHanCodeJP-NormalIt.otf'; names = @(,'源ノ角ゴシック Code JP N It') }
        ,@{ file = 'SourceHanCodeJP-Regular.otf'; names = @(,'源ノ角ゴシック Code JP R') }
        ,@{ file = 'SourceHanCodeJP-RegularIt.otf'; names = @(,'源ノ角ゴシック Code JP R It') }
     )
  }

  # M+ OUTLINE FONTS
  ,@{ name = 'M+ OUTLINE FONTS'
     ;url = 'http://jaist.dl.osdn.jp/mplus-fonts/62344/mplus-TESTFLIGHT-060.tar.xz'
     ;fonts = @(
        ,@{ file = 'mplus-1c-black.ttf'; names = @(,'M+ 1c black') }
        ,@{ file = 'mplus-1c-bold.ttf'; names = @(,'M+ 1c bold') }
        ,@{ file = 'mplus-1c-heavy.ttf'; names = @(,'M+ 1c heavy') }
        ,@{ file = 'mplus-1c-light.ttf'; names = @(,'M+ 1c light') }
        ,@{ file = 'mplus-1c-medium.ttf'; names = @(,'M+ 1c medium') }
        ,@{ file = 'mplus-1c-regular.ttf'; names = @(,'M+ 1c regular') }
        ,@{ file = 'mplus-1c-thin.ttf'; names = @(,'M+ 1c thin') }
        ,@{ file = 'mplus-1m-bold.ttf'; names = @(,'M+ 1m bold') }
        ,@{ file = 'mplus-1m-light.ttf'; names = @(,'M+ 1m light') }
        ,@{ file = 'mplus-1m-medium.ttf'; names = @(,'M+ 1m medium') }
        ,@{ file = 'mplus-1m-regular.ttf'; names = @(,'M+ 1m regular') }
        ,@{ file = 'mplus-1m-thin.ttf'; names = @(,'M+ 1m thin') }
        ,@{ file = 'mplus-1mn-bold.ttf'; names = @(,'M+ 1mn bold') }
        ,@{ file = 'mplus-1mn-light.ttf'; names = @(,'M+ 1mn light') }
        ,@{ file = 'mplus-1mn-medium.ttf'; names = @(,'M+ 1mn medium') }
        ,@{ file = 'mplus-1mn-regular.ttf'; names = @(,'M+ 1mn regular') }
        ,@{ file = 'mplus-1mn-thin.ttf'; names = @(,'M+ 1mn thin') }
        ,@{ file = 'mplus-1p-black.ttf'; names = @(,'M+ 1p black') }
        ,@{ file = 'mplus-1p-bold.ttf'; names = @(,'M+ 1p bold') }
        ,@{ file = 'mplus-1p-heavy.ttf'; names = @(,'M+ 1p heavy') }
        ,@{ file = 'mplus-1p-light.ttf'; names = @(,'M+ 1p light') }
        ,@{ file = 'mplus-1p-medium.ttf'; names = @(,'M+ 1p medium') }
        ,@{ file = 'mplus-1p-regular.ttf'; names = @(,'M+ 1p regular') }
        ,@{ file = 'mplus-1p-thin.ttf'; names = @(,'M+ 1p thin') }
        ,@{ file = 'mplus-2c-black.ttf'; names = @(,'M+ 2c black') }
        ,@{ file = 'mplus-2c-bold.ttf'; names = @(,'M+ 2c bold') }
        ,@{ file = 'mplus-2c-heavy.ttf'; names = @(,'M+ 2c heavy') }
        ,@{ file = 'mplus-2c-light.ttf'; names = @(,'M+ 2c light') }
        ,@{ file = 'mplus-2c-medium.ttf'; names = @(,'M+ 2c medium') }
        ,@{ file = 'mplus-2c-regular.ttf'; names = @(,'M+ 2c regular') }
        ,@{ file = 'mplus-2c-thin.ttf'; names = @(,'M+ 2c thin') }
        ,@{ file = 'mplus-2m-bold.ttf'; names = @(,'M+ 2m bold') }
        ,@{ file = 'mplus-2m-light.ttf'; names = @(,'M+ 2m light') }
        ,@{ file = 'mplus-2m-medium.ttf'; names = @(,'M+ 2m medium') }
        ,@{ file = 'mplus-2m-regular.ttf'; names = @(,'M+ 2m regular') }
        ,@{ file = 'mplus-2m-thin.ttf'; names = @(,'M+ 2m thin') }
        ,@{ file = 'mplus-2p-black.ttf'; names = @(,'M+ 2p black') }
        ,@{ file = 'mplus-2p-bold.ttf'; names = @(,'M+ 2p bold') }
        ,@{ file = 'mplus-2p-heavy.ttf'; names = @(,'M+ 2p heavy') }
        ,@{ file = 'mplus-2p-light.ttf'; names = @(,'M+ 2p light') }
        ,@{ file = 'mplus-2p-medium.ttf'; names = @(,'M+ 2p medium') }
        ,@{ file = 'mplus-2p-regular.ttf'; names = @(,'M+ 2p regular') }
        ,@{ file = 'mplus-2p-thin.ttf'; names = @(,'M+ 2p thin') }
     )
  }

  # IPA
  ,@{ name = 'IPAフォント'
     ;url = 'http://dl.ipafont.ipa.go.jp/IPAfont/IPAfont00303.zip'
     ;fonts = @(
        ,@{ file = 'ipag.ttf'; names = @(,'IPAゴシック') }
        ,@{ file = 'ipagp.ttf'; names = @(,'IPA Pゴシック') }
        ,@{ file = 'ipam.ttf'; names = @(,'IPA明朝') }
        ,@{ file = 'ipamp.ttf'; names = @(,'IPA P明朝') }
     )
  }
  ,@{ name = 'IPAexフォント'
     ;url = 'http://dl.ipafont.ipa.go.jp/IPAexfont/IPAexfont00301.zip'
     ;fonts = @(
        ,@{ file = 'ipaexg.ttf'; names = @(,'IPAexゴシック') }
        ,@{ file = 'ipaexm.ttf'; names = @(,'IPAex明朝') }
     )
  }

  # モトヤ
  ,@{ name = 'モトヤLシーダ3'
     ;url = 'https://raw.githubusercontent.com/android/platform_frameworks_base/master/data/fonts/MTLc3m.ttf'
     ;fonts = @(
        ,@{ file = 'MTLc3m.ttf'; names = @(,'モトヤLシータ゛3等幅') }
     )
  }
  ,@{ name = 'モトヤLマルベリ3'
     ;url = 'https://raw.githubusercontent.com/android/platform_frameworks_base/master/data/fonts/MTLmr3m.ttf'
     ;fonts = @(
        ,@{ file = 'MTLmr3m.ttf'; names = @(,'モトヤLマルベリ3等幅') }
     )
  }

  # Y.OzFont
  ,@{ name = 'ペン字版 Y.OzFont'
     ;url = 'http://yozvox.web.fc2.com/YOzFont-13.11.7z'
     ;fonts = @(
        # YOzFont/標準かな
        ,@{ file = 'YOzRS.TTC'; names = @(,'YOzFont','YOzFont90') }
        ,@{ file = 'YOzBS.TTC'; names = @(,'YOzFont','YOzFont90') } # 太字
        ,@{ file = 'YOzRSF.TTC'; names = @(,'YOzFontF','YOzFontF90') } # 等幅
        ,@{ file = 'YOzBSF.TTC'; names = @(,'YOzFontF','YOzFontF90') } # 太字等幅
        ,@{ file = 'YOzRSP.TTC'; names = @(,'YOzFontP','YOzFontP90') } # プロポーショナル
        ,@{ file = 'YOzBSP.TTC'; names = @(,'YOzFontP','YOzFontP90') } # 太字プロポーショナル
        ,@{ file = 'YOzRSX.ttc'; names = @(,'YOzFontX','YOzFontX90','YOzFontXF','YOzFontXF90','YOzFontXM','YOzFontXM90') } # 英数字ブロック体

        # YOzFontN/新かな
        ,@{ file = 'YOzRN.TTC'; names = @(,'YOzFontN','YOzFontN90','YOzFontNM','YOzFontNM90') }
        ,@{ file = 'YOzBN.TTC'; names = @(,'YOzFontN','YOzFontN90','YOzFontNM','YOzFontNM90') }
        ,@{ file = 'YOzRNF.TTC'; names = @(,'YOzFontNF','YOzFontNF90','YOzFontNMF','YOzFontNMF90') }
        ,@{ file = 'YOzBNF.TTC'; names = @(,'YOzFontNF','YOzFontNF90','YOzFontNMF','YOzFontNMF90') }
        ,@{ file = 'YOzRNX.ttc'; names = @(,'YOzFontNX','YOzFontNX90','YOzFontNXF','YOzFontNXF90','YOzFontNXM','YOzFontNXM90') }

        # YOzFontA/あんちっくかな
        ,@{ file = 'YOzRA.TTC'; names = @(,'YOzFontA','YOzFontA90') }
        ,@{ file = 'YOzBA.TTC'; names = @(,'YOzFontA','YOzFontA90') }
        ,@{ file = 'YOzRAF.TTC'; names = @(,'YOzFontAF','YOzFontAF90') }
        ,@{ file = 'YOzBAF.TTC'; names = @(,'YOzFontAF','YOzFontAF90') }
        ,@{ file = 'YOzRAP.TTC'; names = @(,'YOzFontAP','YOzFontAP90') }
        ,@{ file = 'YOzBAP.TTC'; names = @(,'YOzFontAP','YOzFontAP90') }

        # YOzFontC/キュートかな
        ,@{ file = 'YOzRC.TTC'; names = @(,'YOzFontC','YOzFontC90') }
        ,@{ file = 'YOzBC.TTC'; names = @(,'YOzFontC','YOzFontC90') }
        ,@{ file = 'YOzRCF.TTC'; names = @(,'YOzFontCF','YOzFontCF90') }
        ,@{ file = 'YOzBCF.TTC'; names = @(,'YOzFontCF','YOzFontCF90') }

        # YOzFontE04/教育かな
        ,@{ file = 'YOzRE.TTC'; names = @(,'YOzFontE','YOzFontE90','YOzFontEM','YOzFontEM90') }
        ,@{ file = 'YOzBE.TTC'; names = @(,'YOzFontE','YOzFontE90','YOzFontEM','YOzFontEM90') }
        ,@{ file = 'YOzBEF.TTC'; names = @(,'YOzFontEF','YOzFontEF90','YOzFontEMF','YOzFontEMF90') }
        ,@{ file = 'YOzBEF.TTC'; names = @(,'YOzFontEF','YOzFontEF90','YOzFontEMF','YOzFontEMF90') }
        ,@{ file = 'YOzREX.ttc'; names = @(,'YOzFontEX','YOzFontEX90','YOzFontEXF','YOzFontEXF90','YOzFontEXM','YOzFontEXM90') }
     )
  }
  ,@{ name = '毛筆版 Y.OzFont'
     ;url = 'http://yozvox.web.fc2.com/YOzFontKM-7.01.7z'
     ;fonts = @(
        ,@{ file = 'YOzK.TTC'; names = @(,'YOzFontK','YOzFontK90')}
        ,@{ file = 'YOzKB.TTC'; names = @(,'YOzFontK','YOzFontK90')}
        ,@{ file = 'YOzKA.TTC'; names = @(,'YOzFontKA','YOzFontKA90')}
        ,@{ file = 'YOzKAB.TTC'; names = @(,'YOzFontKA','YOzFontKA90')}
        ,@{ file = 'YOzM90.ttf'; names = @(,'YOzFontM90')}
        ,@{ file = 'YOzMB90.ttf'; names = @(,'YOzFontM90')}
     )
  }
  <#
  ,@{ name = '英字版 Y.OzFont'
     ;url = 'http://yozvox.web.fc2.com/YOzEng-1.40.7z'
     ;fonts = @(
        ,@{ file = 'YOz14s.ttf'; names = @(,'YOzFont14s')}
        ,@{ file = 'YOz5x7dB.ttf'; names = @(,'YOzFont5x7dB')}
        ,@{ file = 'YOz5x7dEL.ttf'; names = @(,'YOzFont5x7dEL')}
        ,@{ file = 'YOz5x7dL.ttf'; names = @(,'YOzFont5x7dL')}
        ,@{ file = 'YOz5x7dM.ttf'; names = @(,'YOzFont5x7dM')}
        ,@{ file = 'YOz5x7dR.ttf'; names = @(,'YOzFont5x7dR')}
        ,@{ file = 'YOzOT.ttc'; names = @(,'YOzFontOTW','YOzFontOTWD','YOzFontOTWL')}
        ,@{ file = 'YOzOTBd.ttc'; names = @(,'YOzFontOTW','YOzFontOTWD','YOzFontOTWL')}
        ,@{ file = 'YOzOTBI.ttc'; names = @(,'YOzFontOTW','YOzFontOTWD','YOzFontOTWL')}
        ,@{ file = 'YOzOTIt.ttc'; names = @(,'YOzFontOTW','YOzFontOTWD','YOzFontOTWL')}
        ,@{ file = 'YOzOTLI.ttc'; names = @(,'YOzFontOTW Light','YOzFontOTWD Light','YOzFontOTWL Light')}
        ,@{ file = 'YOzOTLt.ttc'; names = @(,'YOzFontOTW Light','YOzFontOTWD Light','YOzFontOTWL Light')}
     )
  }
  ,@{ name = 'モボゴシック/モガゴシック/モガ明朝'
     ;url = 'http://yozvox.web.fc2.com/MoboMoga-001.02.14.7z'
     ;fonts = @(
        ,@{ file = 'mobog.ttc'; names = @(,'Mobo90Gothic','MoboEx90Gothic','MoboExGothic','MoboGothic')}
        ,@{ file = 'mobogb.ttc'; names = @(,'Mobo90Gothic','MoboEx90Gothic','MoboExGothic','MoboGothic')}
        ,@{ file = 'mogag.ttc'; names = @(,'Moga90Gothic','MogaEx90Gothic','MogaExGothic','MogaGothic')}
        ,@{ file = 'mogagb.ttc'; names = @(,'Moga90Gothic','MogaEx90Gothic','MogaExGothic','MogaGothic')}
        ,@{ file = 'mogam.ttc'; names = @(,'Moga90Mincho','MogaEx90Mincho','MogaExMincho','MogaMincho')}
        ,@{ file = 'mogamb.ttc'; names = @(,'Moga90Mincho','MogaEx90Mincho','MogaExMincho','MogaMincho')}
        ,@{ file = 'mogahm.ttc'; names = @(,'Moga90HMincho','MogaEx90HMincho','MogaExHMincho','MogaHMincho')}
        ,@{ file = 'mogahmb.ttc'; names = @(,'Moga90HMincho','MogaEx90HMincho','MogaExHMincho','MogaHMincho')}
     )
  }
  #>

  # 瀬戸フォント
  ,@{ name = '瀬戸フォント'
     ;url = 'http://iij.dl.osdn.jp/setofont/61995/setofont_v_6_20.zip'
     ;fonts = @(
        ,@{ file = 'setofont.ttf'; names = @(,'瀬戸フォント')}
     )
  }

  # 梅フォント
  ,@{ name = '梅フォント'
     ;url = 'http://iij.dl.osdn.jp/ume-font/22212/umefont_610.7z'
     ;fonts = @(
        ,@{ file = 'ume-pgc4.ttf'; names = @(,'梅PゴシックC4') }
        ,@{ file = 'ume-pgc5.ttf'; names = @(,'梅PゴシックC5') }
        ,@{ file = 'ume-pgo4.ttf'; names = @(,'梅Pゴシック') }
        ,@{ file = 'ume-pgo5.ttf'; names = @(,'梅PゴシックO5') }
        ,@{ file = 'ume-pgs4.ttf'; names = @(,'梅PゴシックS4') }
        ,@{ file = 'ume-pgs5.ttf'; names = @(,'梅PゴシックS5') }
        ,@{ file = 'ume-pmo3.ttf'; names = @(,'梅P明朝') }
        ,@{ file = 'ume-pms3.ttf'; names = @(,'梅P明朝S3') }
        ,@{ file = 'ume-tgc4.ttf'; names = @(,'梅ゴシックC4') }
        ,@{ file = 'ume-tgc5.ttf'; names = @(,'梅ゴシックC5') }
        ,@{ file = 'ume-tgo4.ttf'; names = @(,'梅ゴシック') }
        ,@{ file = 'ume-tgo5.ttf'; names = @(,'梅ゴシックO5') }
        ,@{ file = 'ume-tgs4.ttf'; names = @(,'梅ゴシックS4') }
        ,@{ file = 'ume-tgs5.ttf'; names = @(,'梅ゴシックS5') }
        ,@{ file = 'ume-tmo3.ttf'; names = @(,'梅明朝') }
        ,@{ file = 'ume-tms3.ttf'; names = @(,'梅明朝S3') }
        ,@{ file = 'ume-ugo4.ttf'; names = @(,'梅UIゴシック') }
        ,@{ file = 'ume-ugo5.ttf'; names = @(,'梅UIゴシックO5') }
     )
  }

  # VLゴシック
  ,@{ name = 'VLゴシック'
     ;url = 'http://iij.dl.osdn.jp/vlgothic/62375/VLGothic-20141206.zip'
     ;fonts = @(
        ,@{ file = 'VL-Gothic-Regular.ttf'; names = @(,'VL ゴシック') }
        ,@{ file = 'VL-PGothic-Regular.ttf'; names = @(,'VL Pゴシック') }
     )
  }

  # 自家製フォント工房
  ,@{ name = '自家製 Rounded M+ 丸さ標準'
     ;url = 'http://iij.dl.osdn.jp/users/8/8574/rounded-mplus-20150529.zip'
     ;fonts = @(
        ,@{ file = 'rounded-mplus-1c-black.ttf'; names = @(,'Rounded M+ 1c black')}
        ,@{ file = 'rounded-mplus-1c-bold.ttf'; names = @(,'Rounded M+ 1c bold')}
        ,@{ file = 'rounded-mplus-1c-heavy.ttf'; names = @(,'Rounded M+ 1c heavy')}
        ,@{ file = 'rounded-mplus-1c-light.ttf'; names = @(,'Rounded M+ 1c light')}
        ,@{ file = 'rounded-mplus-1c-medium.ttf'; names = @(,'Rounded M+ 1c medium')}
        ,@{ file = 'rounded-mplus-1c-regular.ttf'; names = @(,'Rounded M+ 1c regular')}
        ,@{ file = 'rounded-mplus-1c-thin.ttf'; names = @(,'Rounded M+ 1c thin')}
        ,@{ file = 'rounded-mplus-1m-bold.ttf'; names = @(,'Rounded M+ 1m bold')}
        ,@{ file = 'rounded-mplus-1m-light.ttf'; names = @(,'Rounded M+ 1m light')}
        ,@{ file = 'rounded-mplus-1m-medium.ttf'; names = @(,'Rounded M+ 1m medium')}
        ,@{ file = 'rounded-mplus-1m-regular.ttf'; names = @(,'Rounded M+ 1m regular')}
        ,@{ file = 'rounded-mplus-1m-thin.ttf'; names = @(,'Rounded M+ 1m thin')}
        ,@{ file = 'rounded-mplus-1mn-bold.ttf'; names = @(,'Rounded M+ 1mn bold')}
        ,@{ file = 'rounded-mplus-1mn-light.ttf'; names = @(,'Rounded M+ 1mn light')}
        ,@{ file = 'rounded-mplus-1mn-medium.ttf'; names = @(,'Rounded M+ 1mn medium')}
        ,@{ file = 'rounded-mplus-1mn-regular.ttf'; names = @(,'Rounded M+ 1mn regular')}
        ,@{ file = 'rounded-mplus-1mn-thin.ttf'; names = @(,'Rounded M+ 1mn thin')}
        ,@{ file = 'rounded-mplus-1p-black.ttf'; names = @(,'Rounded M+ 1p black')}
        ,@{ file = 'rounded-mplus-1p-bold.ttf'; names = @(,'Rounded M+ 1p bold')}
        ,@{ file = 'rounded-mplus-1p-heavy.ttf'; names = @(,'Rounded M+ 1p heavy')}
        ,@{ file = 'rounded-mplus-1p-light.ttf'; names = @(,'Rounded M+ 1p light')}
        ,@{ file = 'rounded-mplus-1p-medium.ttf'; names = @(,'Rounded M+ 1p medium')}
        ,@{ file = 'rounded-mplus-1p-regular.ttf'; names = @(,'Rounded M+ 1p regular')}
        ,@{ file = 'rounded-mplus-1p-thin.ttf'; names = @(,'Rounded M+ 1p thin')}
        ,@{ file = 'rounded-mplus-2c-black.ttf'; names = @(,'Rounded M+ 2c black')}
        ,@{ file = 'rounded-mplus-2c-bold.ttf'; names = @(,'Rounded M+ 2c bold')}
        ,@{ file = 'rounded-mplus-2c-heavy.ttf'; names = @(,'Rounded M+ 2c heavy')}
        ,@{ file = 'rounded-mplus-2c-light.ttf'; names = @(,'Rounded M+ 2c light')}
        ,@{ file = 'rounded-mplus-2c-medium.ttf'; names = @(,'Rounded M+ 2c medium')}
        ,@{ file = 'rounded-mplus-2c-regular.ttf'; names = @(,'Rounded M+ 2c regular')}
        ,@{ file = 'rounded-mplus-2c-thin.ttf'; names = @(,'Rounded M+ 2c thin')}
        ,@{ file = 'rounded-mplus-2m-bold.ttf'; names = @(,'Rounded M+ 2m bold')}
        ,@{ file = 'rounded-mplus-2m-light.ttf'; names = @(,'Rounded M+ 2m light')}
        ,@{ file = 'rounded-mplus-2m-medium.ttf'; names = @(,'Rounded M+ 2m medium')}
        ,@{ file = 'rounded-mplus-2m-regular.ttf'; names = @(,'Rounded M+ 2m regular')}
        ,@{ file = 'rounded-mplus-2m-thin.ttf'; names = @(,'Rounded M+ 2m thin')}
        ,@{ file = 'rounded-mplus-2p-black.ttf'; names = @(,'Rounded M+ 2p black')}
        ,@{ file = 'rounded-mplus-2p-bold.ttf'; names = @(,'Rounded M+ 2p bold')}
        ,@{ file = 'rounded-mplus-2p-heavy.ttf'; names = @(,'Rounded M+ 2p heavy')}
        ,@{ file = 'rounded-mplus-2p-light.ttf'; names = @(,'Rounded M+ 2p light')}
        ,@{ file = 'rounded-mplus-2p-medium.ttf'; names = @(,'Rounded M+ 2p medium')}
        ,@{ file = 'rounded-mplus-2p-regular.ttf'; names = @(,'Rounded M+ 2p regular')}
        ,@{ file = 'rounded-mplus-2p-thin.ttf'; names = @(,'Rounded M+ 2p thin')}
     )
  }
  ,@{ name = '自家製 Rounded M+ 丸さ控えめ'
     ;url = 'http://iij.dl.osdn.jp/users/8/8572/rounded-l-mplus-20150529.zip'
     ;fonts = @(
        ,@{ file = 'rounded-l-mplus-1c-black.ttf'; names = @(,'Rounded-L M+ 1c black')}
        ,@{ file = 'rounded-l-mplus-1c-bold.ttf'; names = @(,'Rounded-L M+ 1c bold')}
        ,@{ file = 'rounded-l-mplus-1c-heavy.ttf'; names = @(,'Rounded-L M+ 1c heavy')}
        ,@{ file = 'rounded-l-mplus-1c-light.ttf'; names = @(,'Rounded-L M+ 1c light')}
        ,@{ file = 'rounded-l-mplus-1c-medium.ttf'; names = @(,'Rounded-L M+ 1c medium')}
        ,@{ file = 'rounded-l-mplus-1c-regular.ttf'; names = @(,'Rounded-L M+ 1c regular')}
        ,@{ file = 'rounded-l-mplus-1c-thin.ttf'; names = @(,'Rounded-L M+ 1c thin')}
        ,@{ file = 'rounded-l-mplus-1m-bold.ttf'; names = @(,'Rounded-L M+ 1m bold')}
        ,@{ file = 'rounded-l-mplus-1m-light.ttf'; names = @(,'Rounded-L M+ 1m light')}
        ,@{ file = 'rounded-l-mplus-1m-medium.ttf'; names = @(,'Rounded-L M+ 1m medium')}
        ,@{ file = 'rounded-l-mplus-1m-regular.ttf'; names = @(,'Rounded-L M+ 1m regular')}
        ,@{ file = 'rounded-l-mplus-1m-thin.ttf'; names = @(,'Rounded-L M+ 1m thin')}
        ,@{ file = 'rounded-l-mplus-1mn-bold.ttf'; names = @(,'Rounded-L M+ 1mn bold')}
        ,@{ file = 'rounded-l-mplus-1mn-light.ttf'; names = @(,'Rounded-L M+ 1mn light')}
        ,@{ file = 'rounded-l-mplus-1mn-medium.ttf'; names = @(,'Rounded-L M+ 1mn medium')}
        ,@{ file = 'rounded-l-mplus-1mn-regular.ttf'; names = @(,'Rounded-L M+ 1mn regular')}
        ,@{ file = 'rounded-l-mplus-1mn-thin.ttf'; names = @(,'Rounded-L M+ 1mn thin')}
        ,@{ file = 'rounded-l-mplus-1p-black.ttf'; names = @(,'Rounded-L M+ 1p black')}
        ,@{ file = 'rounded-l-mplus-1p-bold.ttf'; names = @(,'Rounded-L M+ 1p bold')}
        ,@{ file = 'rounded-l-mplus-1p-heavy.ttf'; names = @(,'Rounded-L M+ 1p heavy')}
        ,@{ file = 'rounded-l-mplus-1p-light.ttf'; names = @(,'Rounded-L M+ 1p light')}
        ,@{ file = 'rounded-l-mplus-1p-medium.ttf'; names = @(,'Rounded-L M+ 1p medium')}
        ,@{ file = 'rounded-l-mplus-1p-regular.ttf'; names = @(,'Rounded-L M+ 1p regular')}
        ,@{ file = 'rounded-l-mplus-1p-thin.ttf'; names = @(,'Rounded-L M+ 1p thin')}
        ,@{ file = 'rounded-l-mplus-2c-black.ttf'; names = @(,'Rounded-L M+ 2c black')}
        ,@{ file = 'rounded-l-mplus-2c-bold.ttf'; names = @(,'Rounded-L M+ 2c bold')}
        ,@{ file = 'rounded-l-mplus-2c-heavy.ttf'; names = @(,'Rounded-L M+ 2c heavy')}
        ,@{ file = 'rounded-l-mplus-2c-light.ttf'; names = @(,'Rounded-L M+ 2c light')}
        ,@{ file = 'rounded-l-mplus-2c-medium.ttf'; names = @(,'Rounded-L M+ 2c medium')}
        ,@{ file = 'rounded-l-mplus-2c-regular.ttf'; names = @(,'Rounded-L M+ 2c regular')}
        ,@{ file = 'rounded-l-mplus-2c-thin.ttf'; names = @(,'Rounded-L M+ 2c thin')}
        ,@{ file = 'rounded-l-mplus-2m-bold.ttf'; names = @(,'Rounded-L M+ 2m bold')}
        ,@{ file = 'rounded-l-mplus-2m-light.ttf'; names = @(,'Rounded-L M+ 2m light')}
        ,@{ file = 'rounded-l-mplus-2m-medium.ttf'; names = @(,'Rounded-L M+ 2m medium')}
        ,@{ file = 'rounded-l-mplus-2m-regular.ttf'; names = @(,'Rounded-L M+ 2m regular')}
        ,@{ file = 'rounded-l-mplus-2m-thin.ttf'; names = @(,'Rounded-L M+ 2m thin')}
        ,@{ file = 'rounded-l-mplus-2p-black.ttf'; names = @(,'Rounded-L M+ 2p black')}
        ,@{ file = 'rounded-l-mplus-2p-bold.ttf'; names = @(,'Rounded-L M+ 2p bold')}
        ,@{ file = 'rounded-l-mplus-2p-heavy.ttf'; names = @(,'Rounded-L M+ 2p heavy')}
        ,@{ file = 'rounded-l-mplus-2p-light.ttf'; names = @(,'Rounded-L M+ 2p light')}
        ,@{ file = 'rounded-l-mplus-2p-medium.ttf'; names = @(,'Rounded-L M+ 2p medium')}
        ,@{ file = 'rounded-l-mplus-2p-regular.ttf'; names = @(,'Rounded-L M+ 2p regular')}
        ,@{ file = 'rounded-l-mplus-2p-thin.ttf'; names = @(,'Rounded-L M+ 2p thin')}
     )
  }
  ,@{ name = '自家製 Rounded M+ 丸さ強め'
     ;url = 'http://iij.dl.osdn.jp/users/8/8573/rounded-x-mplus-20150529.zip'
     ;fonts = @(
        ,@{ file = 'rounded-x-mplus-1c-black.ttf'; names = @(,'Rounded-X M+ 1c black')}
        ,@{ file = 'rounded-x-mplus-1c-bold.ttf'; names = @(,'Rounded-X M+ 1c bold')}
        ,@{ file = 'rounded-x-mplus-1c-heavy.ttf'; names = @(,'Rounded-X M+ 1c heavy')}
        ,@{ file = 'rounded-x-mplus-1c-light.ttf'; names = @(,'Rounded-X M+ 1c light')}
        ,@{ file = 'rounded-x-mplus-1c-medium.ttf'; names = @(,'Rounded-X M+ 1c medium')}
        ,@{ file = 'rounded-x-mplus-1c-regular.ttf'; names = @(,'Rounded-X M+ 1c regular')}
        ,@{ file = 'rounded-x-mplus-1m-bold.ttf'; names = @(,'Rounded-X M+ 1m bold')}
        ,@{ file = 'rounded-x-mplus-1m-light.ttf'; names = @(,'Rounded-X M+ 1m light')}
        ,@{ file = 'rounded-x-mplus-1m-medium.ttf'; names = @(,'Rounded-X M+ 1m medium')}
        ,@{ file = 'rounded-x-mplus-1m-regular.ttf'; names = @(,'Rounded-X M+ 1m regular')}
        ,@{ file = 'rounded-x-mplus-1mn-bold.ttf'; names = @(,'Rounded-X M+ 1mn bold')}
        ,@{ file = 'rounded-x-mplus-1mn-light.ttf'; names = @(,'Rounded-X M+ 1mn light')}
        ,@{ file = 'rounded-x-mplus-1mn-medium.ttf'; names = @(,'Rounded-X M+ 1mn medium')}
        ,@{ file = 'rounded-x-mplus-1mn-regular.ttf'; names = @(,'Rounded-X M+ 1mn regular')}
        ,@{ file = 'rounded-x-mplus-1p-black.ttf'; names = @(,'Rounded-X M+ 1p black')}
        ,@{ file = 'rounded-x-mplus-1p-bold.ttf'; names = @(,'Rounded-X M+ 1p bold')}
        ,@{ file = 'rounded-x-mplus-1p-heavy.ttf'; names = @(,'Rounded-X M+ 1p heavy')}
        ,@{ file = 'rounded-x-mplus-1p-light.ttf'; names = @(,'Rounded-X M+ 1p light')}
        ,@{ file = 'rounded-x-mplus-1p-medium.ttf'; names = @(,'Rounded-X M+ 1p medium')}
        ,@{ file = 'rounded-x-mplus-1p-regular.ttf'; names = @(,'Rounded-X M+ 1p regular')}
        ,@{ file = 'rounded-x-mplus-2c-black.ttf'; names = @(,'Rounded-X M+ 2c black')}
        ,@{ file = 'rounded-x-mplus-2c-bold.ttf'; names = @(,'Rounded-X M+ 2c bold')}
        ,@{ file = 'rounded-x-mplus-2c-heavy.ttf'; names = @(,'Rounded-X M+ 2c heavy')}
        ,@{ file = 'rounded-x-mplus-2c-light.ttf'; names = @(,'Rounded-X M+ 2c light')}
        ,@{ file = 'rounded-x-mplus-2c-medium.ttf'; names = @(,'Rounded-X M+ 2c medium')}
        ,@{ file = 'rounded-x-mplus-2c-regular.ttf'; names = @(,'Rounded-X M+ 2c regular')}
        ,@{ file = 'rounded-x-mplus-2m-bold.ttf'; names = @(,'Rounded-X M+ 2m bold')}
        ,@{ file = 'rounded-x-mplus-2m-light.ttf'; names = @(,'Rounded-X M+ 2m light')}
        ,@{ file = 'rounded-x-mplus-2m-medium.ttf'; names = @(,'Rounded-X M+ 2m medium')}
        ,@{ file = 'rounded-x-mplus-2m-regular.ttf'; names = @(,'Rounded-X M+ 2m regular')}
        ,@{ file = 'rounded-x-mplus-2p-black.ttf'; names = @(,'Rounded-X M+ 2p black')}
        ,@{ file = 'rounded-x-mplus-2p-bold.ttf'; names = @(,'Rounded-X M+ 2p bold')}
        ,@{ file = 'rounded-x-mplus-2p-heavy.ttf'; names = @(,'Rounded-X M+ 2p heavy')}
        ,@{ file = 'rounded-x-mplus-2p-light.ttf'; names = @(,'Rounded-X M+ 2p light')}
        ,@{ file = 'rounded-x-mplus-2p-medium.ttf'; names = @(,'Rounded-X M+ 2p medium')}
        ,@{ file = 'rounded-x-mplus-2p-regular.ttf'; names = @(,'Rounded-X M+ 2p regular')}
     )
  }
  ,@{ name = '源真ゴシック'
     ;url = 'http://iij.dl.osdn.jp/users/8/8634/genshingothic-20150607.7z'
     ;fonts = @(
        ,@{ file = 'GenShinGothic-Bold.ttf'; names = @(,'源真ゴシック Bold')}
        ,@{ file = 'GenShinGothic-ExtraLight.ttf'; names = @(,'源真ゴシック ExtraLight')}
        ,@{ file = 'GenShinGothic-Heavy.ttf'; names = @(,'源真ゴシック Heavy')}
        ,@{ file = 'GenShinGothic-Light.ttf'; names = @(,'源真ゴシック Light')}
        ,@{ file = 'GenShinGothic-Medium.ttf'; names = @(,'源真ゴシック Medium')}
        ,@{ file = 'GenShinGothic-Monospace-Bold.ttf'; names = @(,'源真ゴシック等幅 Bold')}
        ,@{ file = 'GenShinGothic-Monospace-ExtraLight.ttf'; names = @(,'源真ゴシック等幅 ExtraLight')}
        ,@{ file = 'GenShinGothic-Monospace-Heavy.ttf'; names = @(,'源真ゴシック等幅 Heavy')}
        ,@{ file = 'GenShinGothic-Monospace-Light.ttf'; names = @(,'源真ゴシック等幅 Light')}
        ,@{ file = 'GenShinGothic-Monospace-Medium.ttf'; names = @(,'源真ゴシック等幅 Medium')}
        ,@{ file = 'GenShinGothic-Monospace-Normal.ttf'; names = @(,'源真ゴシック等幅 Normal')}
        ,@{ file = 'GenShinGothic-Monospace-Regular.ttf'; names = @(,'源真ゴシック等幅 Regular')}
        ,@{ file = 'GenShinGothic-Normal.ttf'; names = @(,'源真ゴシック Normal')}
        ,@{ file = 'GenShinGothic-P-Bold.ttf'; names = @(,'源真ゴシックP Bold')}
        ,@{ file = 'GenShinGothic-P-ExtraLight.ttf'; names = @(,'源真ゴシックP ExtraLight')}
        ,@{ file = 'GenShinGothic-P-Heavy.ttf'; names = @(,'源真ゴシックP Heavy')}
        ,@{ file = 'GenShinGothic-P-Light.ttf'; names = @(,'源真ゴシックP Light')}
        ,@{ file = 'GenShinGothic-P-Medium.ttf'; names = @(,'源真ゴシックP Medium')}
        ,@{ file = 'GenShinGothic-P-Normal.ttf'; names = @(,'源真ゴシックP Normal')}
        ,@{ file = 'GenShinGothic-P-Regular.ttf'; names = @(,'源真ゴシックP Regular')}
        ,@{ file = 'GenShinGothic-Regular.ttf'; names = @(,'源真ゴシック Regular')}
     )
  }
  ,@{ name = '源柔ゴシック 丸さ標準'
     ;url = 'http://iij.dl.osdn.jp/users/8/8642/genjyuugothic-20150607.zip'
     ;fonts = @(
        ,@{ file = 'GenJyuuGothic-Bold.ttf'; names = @(,'源柔ゴシック Bold')}
        ,@{ file = 'GenJyuuGothic-ExtraLight.ttf'; names = @(,'源柔ゴシック ExtraLight')}
        ,@{ file = 'GenJyuuGothic-Heavy.ttf'; names = @(,'源柔ゴシック Heavy')}
        ,@{ file = 'GenJyuuGothic-Light.ttf'; names = @(,'源柔ゴシック Light')}
        ,@{ file = 'GenJyuuGothic-Medium.ttf'; names = @(,'源柔ゴシック Medium')}
        ,@{ file = 'GenJyuuGothic-Monospace-Bold.ttf'; names = @(,'源柔ゴシック等幅 Bold')}
        ,@{ file = 'GenJyuuGothic-Monospace-ExtraLight.ttf'; names = @(,'源柔ゴシック等幅 ExtraLight')}
        ,@{ file = 'GenJyuuGothic-Monospace-Heavy.ttf'; names = @(,'源柔ゴシック等幅 Heavy')}
        ,@{ file = 'GenJyuuGothic-Monospace-Light.ttf'; names = @(,'源柔ゴシック等幅 Light')}
        ,@{ file = 'GenJyuuGothic-Monospace-Medium.ttf'; names = @(,'源柔ゴシック等幅 Medium')}
        ,@{ file = 'GenJyuuGothic-Monospace-Normal.ttf'; names = @(,'源柔ゴシック等幅 Normal')}
        ,@{ file = 'GenJyuuGothic-Monospace-Regular.ttf'; names = @(,'源柔ゴシック等幅 Regular')}
        ,@{ file = 'GenJyuuGothic-Normal.ttf'; names = @(,'源柔ゴシック Normal')}
        ,@{ file = 'GenJyuuGothic-P-Bold.ttf'; names = @(,'源柔ゴシックP Bold')}
        ,@{ file = 'GenJyuuGothic-P-ExtraLight.ttf'; names = @(,'源柔ゴシックP ExtraLight')}
        ,@{ file = 'GenJyuuGothic-P-Heavy.ttf'; names = @(,'源柔ゴシックP Heavy')}
        ,@{ file = 'GenJyuuGothic-P-Light.ttf'; names = @(,'源柔ゴシックP Light')}
        ,@{ file = 'GenJyuuGothic-P-Medium.ttf'; names = @(,'源柔ゴシックP Medium')}
        ,@{ file = 'GenJyuuGothic-P-Normal.ttf'; names = @(,'源柔ゴシックP Normal')}
        ,@{ file = 'GenJyuuGothic-P-Regular.ttf'; names = @(,'源柔ゴシックP Regular')}
        ,@{ file = 'GenJyuuGothic-Regular.ttf'; names = @(,'源柔ゴシック Regular')}
     )
  }
  ,@{ name = '源柔ゴシック 丸さ控えめ'
     ;url = 'http://iij.dl.osdn.jp/users/8/8643/genjyuugothic-l-20150607.zip'
     ;fonts = @(
        ,@{ file = 'GenJyuuGothicL-Bold.ttf'; names = @(,'源柔ゴシックL Bold')}
        ,@{ file = 'GenJyuuGothicL-ExtraLight.ttf'; names = @(,'源柔ゴシックL ExtraLight')}
        ,@{ file = 'GenJyuuGothicL-Heavy.ttf'; names = @(,'源柔ゴシックL Heavy')}
        ,@{ file = 'GenJyuuGothicL-Light.ttf'; names = @(,'源柔ゴシックL Light')}
        ,@{ file = 'GenJyuuGothicL-Medium.ttf'; names = @(,'源柔ゴシックL Medium')}
        ,@{ file = 'GenJyuuGothicL-Monospace-Bold.ttf'; names = @(,'源柔ゴシックL等幅 Bold')}
        ,@{ file = 'GenJyuuGothicL-Monospace-ExtraLight.ttf'; names = @(,'源柔ゴシックL等幅 ExtraLight')}
        ,@{ file = 'GenJyuuGothicL-Monospace-Heavy.ttf'; names = @(,'源柔ゴシックL等幅 Heavy')}
        ,@{ file = 'GenJyuuGothicL-Monospace-Light.ttf'; names = @(,'源柔ゴシックL等幅 Light')}
        ,@{ file = 'GenJyuuGothicL-Monospace-Medium.ttf'; names = @(,'源柔ゴシックL等幅 Medium')}
        ,@{ file = 'GenJyuuGothicL-Monospace-Normal.ttf'; names = @(,'源柔ゴシックL等幅 Normal')}
        ,@{ file = 'GenJyuuGothicL-Monospace-Regular.ttf'; names = @(,'源柔ゴシックL等幅 Regular')}
        ,@{ file = 'GenJyuuGothicL-Normal.ttf'; names = @(,'源柔ゴシックL Normal')}
        ,@{ file = 'GenJyuuGothicL-P-Bold.ttf'; names = @(,'源柔ゴシックLP Bold')}
        ,@{ file = 'GenJyuuGothicL-P-ExtraLight.ttf'; names = @(,'源柔ゴシックLP ExtraLight')}
        ,@{ file = 'GenJyuuGothicL-P-Heavy.ttf'; names = @(,'源柔ゴシックLP Heavy')}
        ,@{ file = 'GenJyuuGothicL-P-Light.ttf'; names = @(,'源柔ゴシックLP Light')}
        ,@{ file = 'GenJyuuGothicL-P-Medium.ttf'; names = @(,'源柔ゴシックLP Medium')}
        ,@{ file = 'GenJyuuGothicL-P-Normal.ttf'; names = @(,'源柔ゴシックLP Normal')}
        ,@{ file = 'GenJyuuGothicL-P-Regular.ttf'; names = @(,'源柔ゴシックLP Regular')}
        ,@{ file = 'GenJyuuGothicL-Regular.ttf'; names = @(,'源柔ゴシックL Regular')}
     )
  }
  ,@{ name = '源柔ゴシック 丸さ強め'
     ;url = 'http://iij.dl.osdn.jp/users/8/8644/genjyuugothic-x-20150607.zip'
     ;fonts = @(
        ,@{ file = 'GenJyuuGothicX-Bold.ttf'; names = @(,'源柔ゴシックX Bold')}
        ,@{ file = 'GenJyuuGothicX-ExtraLight.ttf'; names = @(,'源柔ゴシックX ExtraLight')}
        ,@{ file = 'GenJyuuGothicX-Heavy.ttf'; names = @(,'源柔ゴシックX Heavy')}
        ,@{ file = 'GenJyuuGothicX-Light.ttf'; names = @(,'源柔ゴシックX Light')}
        ,@{ file = 'GenJyuuGothicX-Medium.ttf'; names = @(,'源柔ゴシックX Medium')}
        ,@{ file = 'GenJyuuGothicX-Monospace-Bold.ttf'; names = @(,'源柔ゴシックX等幅 Bold')}
        ,@{ file = 'GenJyuuGothicX-Monospace-ExtraLight.ttf'; names = @(,'源柔ゴシックX等幅 ExtraLight')}
        ,@{ file = 'GenJyuuGothicX-Monospace-Heavy.ttf'; names = @(,'源柔ゴシックX等幅 Heavy')}
        ,@{ file = 'GenJyuuGothicX-Monospace-Light.ttf'; names = @(,'源柔ゴシックX等幅 Light')}
        ,@{ file = 'GenJyuuGothicX-Monospace-Medium.ttf'; names = @(,'源柔ゴシックX等幅 Medium')}
        ,@{ file = 'GenJyuuGothicX-Monospace-Normal.ttf'; names = @(,'源柔ゴシックX等幅 Normal')}
        ,@{ file = 'GenJyuuGothicX-Monospace-Regular.ttf'; names = @(,'源柔ゴシックX等幅 Regular')}
        ,@{ file = 'GenJyuuGothicX-Normal.ttf'; names = @(,'源柔ゴシックX Normal')}
        ,@{ file = 'GenJyuuGothicX-P-Bold.ttf'; names = @(,'源柔ゴシックXP Bold')}
        ,@{ file = 'GenJyuuGothicX-P-ExtraLight.ttf'; names = @(,'源柔ゴシックXP ExtraLight')}
        ,@{ file = 'GenJyuuGothicX-P-Heavy.ttf'; names = @(,'源柔ゴシックXP Heavy')}
        ,@{ file = 'GenJyuuGothicX-P-Light.ttf'; names = @(,'源柔ゴシックXP Light')}
        ,@{ file = 'GenJyuuGothicX-P-Medium.ttf'; names = @(,'源柔ゴシックXP Medium')}
        ,@{ file = 'GenJyuuGothicX-P-Normal.ttf'; names = @(,'源柔ゴシックXP Normal')}
        ,@{ file = 'GenJyuuGothicX-P-Regular.ttf'; names = @(,'源柔ゴシックXP Regular')}
        ,@{ file = 'GenJyuuGothicX-Regular.ttf'; names = @(,'源柔ゴシックX Regular')}
     )
  }
  ,@{ name = 'Mgen+'
     ;url = 'http://iij.dl.osdn.jp/users/8/8597/mgenplus-20150602.7z'
     ;fonts = @(
        ,@{ file = 'mgenplus-1c-black.ttf'; names = @(,'Mgen+ 1c black')}
        ,@{ file = 'mgenplus-1c-bold.ttf'; names = @(,'Mgen+ 1c bold')}
        ,@{ file = 'mgenplus-1c-heavy.ttf'; names = @(,'Mgen+ 1c heavy')}
        ,@{ file = 'mgenplus-1c-light.ttf'; names = @(,'Mgen+ 1c light')}
        ,@{ file = 'mgenplus-1c-medium.ttf'; names = @(,'Mgen+ 1c medium')}
        ,@{ file = 'mgenplus-1c-regular.ttf'; names = @(,'Mgen+ 1c regular')}
        ,@{ file = 'mgenplus-1c-thin.ttf'; names = @(,'Mgen+ 1c thin')}
        ,@{ file = 'mgenplus-1cp-black.ttf'; names = @(,'Mgen+ 1cp black')}
        ,@{ file = 'mgenplus-1cp-bold.ttf'; names = @(,'Mgen+ 1cp bold')}
        ,@{ file = 'mgenplus-1cp-heavy.ttf'; names = @(,'Mgen+ 1cp heavy')}
        ,@{ file = 'mgenplus-1cp-light.ttf'; names = @(,'Mgen+ 1cp light')}
        ,@{ file = 'mgenplus-1cp-medium.ttf'; names = @(,'Mgen+ 1cp medium')}
        ,@{ file = 'mgenplus-1cp-regular.ttf'; names = @(,'Mgen+ 1cp regular')}
        ,@{ file = 'mgenplus-1cp-thin.ttf'; names = @(,'Mgen+ 1cp thin')}
        ,@{ file = 'mgenplus-1m-bold.ttf'; names = @(,'Mgen+ 1m bold')}
        ,@{ file = 'mgenplus-1m-light.ttf'; names = @(,'Mgen+ 1m light')}
        ,@{ file = 'mgenplus-1m-medium.ttf'; names = @(,'Mgen+ 1m medium')}
        ,@{ file = 'mgenplus-1m-regular.ttf'; names = @(,'Mgen+ 1m regular')}
        ,@{ file = 'mgenplus-1m-thin.ttf'; names = @(,'Mgen+ 1m thin')}
        ,@{ file = 'mgenplus-1mn-bold.ttf'; names = @(,'Mgen+ 1mn bold')}
        ,@{ file = 'mgenplus-1mn-light.ttf'; names = @(,'Mgen+ 1mn light')}
        ,@{ file = 'mgenplus-1mn-medium.ttf'; names = @(,'Mgen+ 1mn medium')}
        ,@{ file = 'mgenplus-1mn-regular.ttf'; names = @(,'Mgen+ 1mn regular')}
        ,@{ file = 'mgenplus-1mn-thin.ttf'; names = @(,'Mgen+ 1mn thin')}
        ,@{ file = 'mgenplus-1p-black.ttf'; names = @(,'Mgen+ 1p black')}
        ,@{ file = 'mgenplus-1p-bold.ttf'; names = @(,'Mgen+ 1p bold')}
        ,@{ file = 'mgenplus-1p-heavy.ttf'; names = @(,'Mgen+ 1p heavy')}
        ,@{ file = 'mgenplus-1p-light.ttf'; names = @(,'Mgen+ 1p light')}
        ,@{ file = 'mgenplus-1p-medium.ttf'; names = @(,'Mgen+ 1p medium')}
        ,@{ file = 'mgenplus-1p-regular.ttf'; names = @(,'Mgen+ 1p regular')}
        ,@{ file = 'mgenplus-1p-thin.ttf'; names = @(,'Mgen+ 1p thin')}
        ,@{ file = 'mgenplus-1pp-black.ttf'; names = @(,'Mgen+ 1pp black')}
        ,@{ file = 'mgenplus-1pp-bold.ttf'; names = @(,'Mgen+ 1pp bold')}
        ,@{ file = 'mgenplus-1pp-heavy.ttf'; names = @(,'Mgen+ 1pp heavy')}
        ,@{ file = 'mgenplus-1pp-light.ttf'; names = @(,'Mgen+ 1pp light')}
        ,@{ file = 'mgenplus-1pp-medium.ttf'; names = @(,'Mgen+ 1pp medium')}
        ,@{ file = 'mgenplus-1pp-regular.ttf'; names = @(,'Mgen+ 1pp regular')}
        ,@{ file = 'mgenplus-1pp-thin.ttf'; names = @(,'Mgen+ 1pp thin')}
        ,@{ file = 'mgenplus-2c-black.ttf'; names = @(,'Mgen+ 2c black')}
        ,@{ file = 'mgenplus-2c-bold.ttf'; names = @(,'Mgen+ 2c bold')}
        ,@{ file = 'mgenplus-2c-heavy.ttf'; names = @(,'Mgen+ 2c heavy')}
        ,@{ file = 'mgenplus-2c-light.ttf'; names = @(,'Mgen+ 2c light')}
        ,@{ file = 'mgenplus-2c-medium.ttf'; names = @(,'Mgen+ 2c medium')}
        ,@{ file = 'mgenplus-2c-regular.ttf'; names = @(,'Mgen+ 2c regular')}
        ,@{ file = 'mgenplus-2c-thin.ttf'; names = @(,'Mgen+ 2c thin')}
        ,@{ file = 'mgenplus-2cp-black.ttf'; names = @(,'Mgen+ 2cp black')}
        ,@{ file = 'mgenplus-2cp-bold.ttf'; names = @(,'Mgen+ 2cp bold')}
        ,@{ file = 'mgenplus-2cp-heavy.ttf'; names = @(,'Mgen+ 2cp heavy')}
        ,@{ file = 'mgenplus-2cp-light.ttf'; names = @(,'Mgen+ 2cp light')}
        ,@{ file = 'mgenplus-2cp-medium.ttf'; names = @(,'Mgen+ 2cp medium')}
        ,@{ file = 'mgenplus-2cp-regular.ttf'; names = @(,'Mgen+ 2cp regular')}
        ,@{ file = 'mgenplus-2cp-thin.ttf'; names = @(,'Mgen+ 2cp thin')}
        ,@{ file = 'mgenplus-2m-bold.ttf'; names = @(,'Mgen+ 2m bold')}
        ,@{ file = 'mgenplus-2m-light.ttf'; names = @(,'Mgen+ 2m light')}
        ,@{ file = 'mgenplus-2m-medium.ttf'; names = @(,'Mgen+ 2m medium')}
        ,@{ file = 'mgenplus-2m-regular.ttf'; names = @(,'Mgen+ 2m regular')}
        ,@{ file = 'mgenplus-2m-thin.ttf'; names = @(,'Mgen+ 2m thin')}
        ,@{ file = 'mgenplus-2p-black.ttf'; names = @(,'Mgen+ 2p black')}
        ,@{ file = 'mgenplus-2p-bold.ttf'; names = @(,'Mgen+ 2p bold')}
        ,@{ file = 'mgenplus-2p-heavy.ttf'; names = @(,'Mgen+ 2p heavy')}
        ,@{ file = 'mgenplus-2p-light.ttf'; names = @(,'Mgen+ 2p light')}
        ,@{ file = 'mgenplus-2p-medium.ttf'; names = @(,'Mgen+ 2p medium')}
        ,@{ file = 'mgenplus-2p-regular.ttf'; names = @(,'Mgen+ 2p regular')}
        ,@{ file = 'mgenplus-2p-thin.ttf'; names = @(,'Mgen+ 2p thin')}
        ,@{ file = 'mgenplus-2pp-black.ttf'; names = @(,'Mgen+ 2pp black')}
        ,@{ file = 'mgenplus-2pp-bold.ttf'; names = @(,'Mgen+ 2pp bold')}
        ,@{ file = 'mgenplus-2pp-heavy.ttf'; names = @(,'Mgen+ 2pp heavy')}
        ,@{ file = 'mgenplus-2pp-light.ttf'; names = @(,'Mgen+ 2pp light')}
        ,@{ file = 'mgenplus-2pp-medium.ttf'; names = @(,'Mgen+ 2pp medium')}
        ,@{ file = 'mgenplus-2pp-regular.ttf'; names = @(,'Mgen+ 2pp regular')}
        ,@{ file = 'mgenplus-2pp-thin.ttf'; names = @(,'Mgen+ 2pp thin')}
     )
  }
  ,@{ name = 'Rounded Mgen+ 丸さ標準'
     ;url = 'http://iij.dl.osdn.jp/users/8/8598/rounded-mgenplus-20150602.7z'
     ;fonts = @(
        ,@{ file = 'rounded-mgenplus-1c-black.ttf'; names = @(,'Rounded Mgen+ 1c black')}
        ,@{ file = 'rounded-mgenplus-1c-bold.ttf'; names = @(,'Rounded Mgen+ 1c bold')}
        ,@{ file = 'rounded-mgenplus-1c-heavy.ttf'; names = @(,'Rounded Mgen+ 1c heavy')}
        ,@{ file = 'rounded-mgenplus-1c-light.ttf'; names = @(,'Rounded Mgen+ 1c light')}
        ,@{ file = 'rounded-mgenplus-1c-medium.ttf'; names = @(,'Rounded Mgen+ 1c medium')}
        ,@{ file = 'rounded-mgenplus-1c-regular.ttf'; names = @(,'Rounded Mgen+ 1c regular')}
        ,@{ file = 'rounded-mgenplus-1c-thin.ttf'; names = @(,'Rounded Mgen+ 1c thin')}
        ,@{ file = 'rounded-mgenplus-1cp-black.ttf'; names = @(,'Rounded Mgen+ 1cp black')}
        ,@{ file = 'rounded-mgenplus-1cp-bold.ttf'; names = @(,'Rounded Mgen+ 1cp bold')}
        ,@{ file = 'rounded-mgenplus-1cp-heavy.ttf'; names = @(,'Rounded Mgen+ 1cp heavy')}
        ,@{ file = 'rounded-mgenplus-1cp-light.ttf'; names = @(,'Rounded Mgen+ 1cp light')}
        ,@{ file = 'rounded-mgenplus-1cp-medium.ttf'; names = @(,'Rounded Mgen+ 1cp medium')}
        ,@{ file = 'rounded-mgenplus-1cp-regular.ttf'; names = @(,'Rounded Mgen+ 1cp regular')}
        ,@{ file = 'rounded-mgenplus-1cp-thin.ttf'; names = @(,'Rounded Mgen+ 1cp thin')}
        ,@{ file = 'rounded-mgenplus-1m-bold.ttf'; names = @(,'Rounded Mgen+ 1m bold')}
        ,@{ file = 'rounded-mgenplus-1m-light.ttf'; names = @(,'Rounded Mgen+ 1m light')}
        ,@{ file = 'rounded-mgenplus-1m-medium.ttf'; names = @(,'Rounded Mgen+ 1m medium')}
        ,@{ file = 'rounded-mgenplus-1m-regular.ttf'; names = @(,'Rounded Mgen+ 1m regular')}
        ,@{ file = 'rounded-mgenplus-1m-thin.ttf'; names = @(,'Rounded Mgen+ 1m thin')}
        ,@{ file = 'rounded-mgenplus-1mn-bold.ttf'; names = @(,'Rounded Mgen+ 1mn bold')}
        ,@{ file = 'rounded-mgenplus-1mn-light.ttf'; names = @(,'Rounded Mgen+ 1mn light')}
        ,@{ file = 'rounded-mgenplus-1mn-medium.ttf'; names = @(,'Rounded Mgen+ 1mn medium')}
        ,@{ file = 'rounded-mgenplus-1mn-regular.ttf'; names = @(,'Rounded Mgen+ 1mn regular')}
        ,@{ file = 'rounded-mgenplus-1mn-thin.ttf'; names = @(,'Rounded Mgen+ 1mn thin')}
        ,@{ file = 'rounded-mgenplus-1p-black.ttf'; names = @(,'Rounded Mgen+ 1p black')}
        ,@{ file = 'rounded-mgenplus-1p-bold.ttf'; names = @(,'Rounded Mgen+ 1p bold')}
        ,@{ file = 'rounded-mgenplus-1p-heavy.ttf'; names = @(,'Rounded Mgen+ 1p heavy')}
        ,@{ file = 'rounded-mgenplus-1p-light.ttf'; names = @(,'Rounded Mgen+ 1p light')}
        ,@{ file = 'rounded-mgenplus-1p-medium.ttf'; names = @(,'Rounded Mgen+ 1p medium')}
        ,@{ file = 'rounded-mgenplus-1p-regular.ttf'; names = @(,'Rounded Mgen+ 1p regular')}
        ,@{ file = 'rounded-mgenplus-1p-thin.ttf'; names = @(,'Rounded Mgen+ 1p thin')}
        ,@{ file = 'rounded-mgenplus-1pp-black.ttf'; names = @(,'Rounded Mgen+ 1pp black')}
        ,@{ file = 'rounded-mgenplus-1pp-bold.ttf'; names = @(,'Rounded Mgen+ 1pp bold')}
        ,@{ file = 'rounded-mgenplus-1pp-heavy.ttf'; names = @(,'Rounded Mgen+ 1pp heavy')}
        ,@{ file = 'rounded-mgenplus-1pp-light.ttf'; names = @(,'Rounded Mgen+ 1pp light')}
        ,@{ file = 'rounded-mgenplus-1pp-medium.ttf'; names = @(,'Rounded Mgen+ 1pp medium')}
        ,@{ file = 'rounded-mgenplus-1pp-regular.ttf'; names = @(,'Rounded Mgen+ 1pp regular')}
        ,@{ file = 'rounded-mgenplus-1pp-thin.ttf'; names = @(,'Rounded Mgen+ 1pp thin')}
        ,@{ file = 'rounded-mgenplus-2c-black.ttf'; names = @(,'Rounded Mgen+ 2c black')}
        ,@{ file = 'rounded-mgenplus-2c-bold.ttf'; names = @(,'Rounded Mgen+ 2c bold')}
        ,@{ file = 'rounded-mgenplus-2c-heavy.ttf'; names = @(,'Rounded Mgen+ 2c heavy')}
        ,@{ file = 'rounded-mgenplus-2c-light.ttf'; names = @(,'Rounded Mgen+ 2c light')}
        ,@{ file = 'rounded-mgenplus-2c-medium.ttf'; names = @(,'Rounded Mgen+ 2c medium')}
        ,@{ file = 'rounded-mgenplus-2c-regular.ttf'; names = @(,'Rounded Mgen+ 2c regular')}
        ,@{ file = 'rounded-mgenplus-2c-thin.ttf'; names = @(,'Rounded Mgen+ 2c thin')}
        ,@{ file = 'rounded-mgenplus-2cp-black.ttf'; names = @(,'Rounded Mgen+ 2cp black')}
        ,@{ file = 'rounded-mgenplus-2cp-bold.ttf'; names = @(,'Rounded Mgen+ 2cp bold')}
        ,@{ file = 'rounded-mgenplus-2cp-heavy.ttf'; names = @(,'Rounded Mgen+ 2cp heavy')}
        ,@{ file = 'rounded-mgenplus-2cp-light.ttf'; names = @(,'Rounded Mgen+ 2cp light')}
        ,@{ file = 'rounded-mgenplus-2cp-medium.ttf'; names = @(,'Rounded Mgen+ 2cp medium')}
        ,@{ file = 'rounded-mgenplus-2cp-regular.ttf'; names = @(,'Rounded Mgen+ 2cp regular')}
        ,@{ file = 'rounded-mgenplus-2cp-thin.ttf'; names = @(,'Rounded Mgen+ 2cp thin')}
        ,@{ file = 'rounded-mgenplus-2m-bold.ttf'; names = @(,'Rounded Mgen+ 2m bold')}
        ,@{ file = 'rounded-mgenplus-2m-light.ttf'; names = @(,'Rounded Mgen+ 2m light')}
        ,@{ file = 'rounded-mgenplus-2m-medium.ttf'; names = @(,'Rounded Mgen+ 2m medium')}
        ,@{ file = 'rounded-mgenplus-2m-regular.ttf'; names = @(,'Rounded Mgen+ 2m regular')}
        ,@{ file = 'rounded-mgenplus-2m-thin.ttf'; names = @(,'Rounded Mgen+ 2m thin')}
        ,@{ file = 'rounded-mgenplus-2p-black.ttf'; names = @(,'Rounded Mgen+ 2p black')}
        ,@{ file = 'rounded-mgenplus-2p-bold.ttf'; names = @(,'Rounded Mgen+ 2p bold')}
        ,@{ file = 'rounded-mgenplus-2p-heavy.ttf'; names = @(,'Rounded Mgen+ 2p heavy')}
        ,@{ file = 'rounded-mgenplus-2p-light.ttf'; names = @(,'Rounded Mgen+ 2p light')}
        ,@{ file = 'rounded-mgenplus-2p-medium.ttf'; names = @(,'Rounded Mgen+ 2p medium')}
        ,@{ file = 'rounded-mgenplus-2p-regular.ttf'; names = @(,'Rounded Mgen+ 2p regular')}
        ,@{ file = 'rounded-mgenplus-2p-thin.ttf'; names = @(,'Rounded Mgen+ 2p thin')}
        ,@{ file = 'rounded-mgenplus-2pp-black.ttf'; names = @(,'Rounded Mgen+ 2pp black')}
        ,@{ file = 'rounded-mgenplus-2pp-bold.ttf'; names = @(,'Rounded Mgen+ 2pp bold')}
        ,@{ file = 'rounded-mgenplus-2pp-heavy.ttf'; names = @(,'Rounded Mgen+ 2pp heavy')}
        ,@{ file = 'rounded-mgenplus-2pp-light.ttf'; names = @(,'Rounded Mgen+ 2pp light')}
        ,@{ file = 'rounded-mgenplus-2pp-medium.ttf'; names = @(,'Rounded Mgen+ 2pp medium')}
        ,@{ file = 'rounded-mgenplus-2pp-regular.ttf'; names = @(,'Rounded Mgen+ 2pp regular')}
        ,@{ file = 'rounded-mgenplus-2pp-thin.ttf'; names = @(,'Rounded Mgen+ 2pp thin')}
     )
  }
  ,@{ name = 'Rounded Mgen+ 丸さ控えめ'
     ;url = 'http://iij.dl.osdn.jp/users/8/8600/rounded-l-mgenplus-20150602.7z'
     ;fonts = @(
        ,@{ file = 'rounded-l-mgenplus-1c-black.ttf'; names = @(,'Rounded-L Mgen+ 1c black')}
        ,@{ file = 'rounded-l-mgenplus-1c-bold.ttf'; names = @(,'Rounded-L Mgen+ 1c bold')}
        ,@{ file = 'rounded-l-mgenplus-1c-heavy.ttf'; names = @(,'Rounded-L Mgen+ 1c heavy')}
        ,@{ file = 'rounded-l-mgenplus-1c-light.ttf'; names = @(,'Rounded-L Mgen+ 1c light')}
        ,@{ file = 'rounded-l-mgenplus-1c-medium.ttf'; names = @(,'Rounded-L Mgen+ 1c medium')}
        ,@{ file = 'rounded-l-mgenplus-1c-regular.ttf'; names = @(,'Rounded-L Mgen+ 1c regular')}
        ,@{ file = 'rounded-l-mgenplus-1c-thin.ttf'; names = @(,'Rounded-L Mgen+ 1c thin')}
        ,@{ file = 'rounded-l-mgenplus-1cp-black.ttf'; names = @(,'Rounded-L Mgen+ 1cp black')}
        ,@{ file = 'rounded-l-mgenplus-1cp-bold.ttf'; names = @(,'Rounded-L Mgen+ 1cp bold')}
        ,@{ file = 'rounded-l-mgenplus-1cp-heavy.ttf'; names = @(,'Rounded-L Mgen+ 1cp heavy')}
        ,@{ file = 'rounded-l-mgenplus-1cp-light.ttf'; names = @(,'Rounded-L Mgen+ 1cp light')}
        ,@{ file = 'rounded-l-mgenplus-1cp-medium.ttf'; names = @(,'Rounded-L Mgen+ 1cp medium')}
        ,@{ file = 'rounded-l-mgenplus-1cp-regular.ttf'; names = @(,'Rounded-L Mgen+ 1cp regular')}
        ,@{ file = 'rounded-l-mgenplus-1cp-thin.ttf'; names = @(,'Rounded-L Mgen+ 1cp thin')}
        ,@{ file = 'rounded-l-mgenplus-1m-bold.ttf'; names = @(,'Rounded-L Mgen+ 1m bold')}
        ,@{ file = 'rounded-l-mgenplus-1m-light.ttf'; names = @(,'Rounded-L Mgen+ 1m light')}
        ,@{ file = 'rounded-l-mgenplus-1m-medium.ttf'; names = @(,'Rounded-L Mgen+ 1m medium')}
        ,@{ file = 'rounded-l-mgenplus-1m-regular.ttf'; names = @(,'Rounded-L Mgen+ 1m regular')}
        ,@{ file = 'rounded-l-mgenplus-1m-thin.ttf'; names = @(,'Rounded-L Mgen+ 1m thin')}
        ,@{ file = 'rounded-l-mgenplus-1mn-bold.ttf'; names = @(,'Rounded-L Mgen+ 1mn bold')}
        ,@{ file = 'rounded-l-mgenplus-1mn-light.ttf'; names = @(,'Rounded-L Mgen+ 1mn light')}
        ,@{ file = 'rounded-l-mgenplus-1mn-medium.ttf'; names = @(,'Rounded-L Mgen+ 1mn medium')}
        ,@{ file = 'rounded-l-mgenplus-1mn-regular.ttf'; names = @(,'Rounded-L Mgen+ 1mn regular')}
        ,@{ file = 'rounded-l-mgenplus-1mn-thin.ttf'; names = @(,'Rounded-L Mgen+ 1mn thin')}
        ,@{ file = 'rounded-l-mgenplus-1p-black.ttf'; names = @(,'Rounded-L Mgen+ 1p black')}
        ,@{ file = 'rounded-l-mgenplus-1p-bold.ttf'; names = @(,'Rounded-L Mgen+ 1p bold')}
        ,@{ file = 'rounded-l-mgenplus-1p-heavy.ttf'; names = @(,'Rounded-L Mgen+ 1p heavy')}
        ,@{ file = 'rounded-l-mgenplus-1p-light.ttf'; names = @(,'Rounded-L Mgen+ 1p light')}
        ,@{ file = 'rounded-l-mgenplus-1p-medium.ttf'; names = @(,'Rounded-L Mgen+ 1p medium')}
        ,@{ file = 'rounded-l-mgenplus-1p-regular.ttf'; names = @(,'Rounded-L Mgen+ 1p regular')}
        ,@{ file = 'rounded-l-mgenplus-1p-thin.ttf'; names = @(,'Rounded-L Mgen+ 1p thin')}
        ,@{ file = 'rounded-l-mgenplus-1pp-black.ttf'; names = @(,'Rounded-L Mgen+ 1pp black')}
        ,@{ file = 'rounded-l-mgenplus-1pp-bold.ttf'; names = @(,'Rounded-L Mgen+ 1pp bold')}
        ,@{ file = 'rounded-l-mgenplus-1pp-heavy.ttf'; names = @(,'Rounded-L Mgen+ 1pp heavy')}
        ,@{ file = 'rounded-l-mgenplus-1pp-light.ttf'; names = @(,'Rounded-L Mgen+ 1pp light')}
        ,@{ file = 'rounded-l-mgenplus-1pp-medium.ttf'; names = @(,'Rounded-L Mgen+ 1pp medium')}
        ,@{ file = 'rounded-l-mgenplus-1pp-regular.ttf'; names = @(,'Rounded-L Mgen+ 1pp regular')}
        ,@{ file = 'rounded-l-mgenplus-1pp-thin.ttf'; names = @(,'Rounded-L Mgen+ 1pp thin')}
        ,@{ file = 'rounded-l-mgenplus-2c-black.ttf'; names = @(,'Rounded-L Mgen+ 2c black')}
        ,@{ file = 'rounded-l-mgenplus-2c-bold.ttf'; names = @(,'Rounded-L Mgen+ 2c bold')}
        ,@{ file = 'rounded-l-mgenplus-2c-heavy.ttf'; names = @(,'Rounded-L Mgen+ 2c heavy')}
        ,@{ file = 'rounded-l-mgenplus-2c-light.ttf'; names = @(,'Rounded-L Mgen+ 2c light')}
        ,@{ file = 'rounded-l-mgenplus-2c-medium.ttf'; names = @(,'Rounded-L Mgen+ 2c medium')}
        ,@{ file = 'rounded-l-mgenplus-2c-regular.ttf'; names = @(,'Rounded-L Mgen+ 2c regular')}
        ,@{ file = 'rounded-l-mgenplus-2c-thin.ttf'; names = @(,'Rounded-L Mgen+ 2c thin')}
        ,@{ file = 'rounded-l-mgenplus-2cp-black.ttf'; names = @(,'Rounded-L Mgen+ 2cp black')}
        ,@{ file = 'rounded-l-mgenplus-2cp-bold.ttf'; names = @(,'Rounded-L Mgen+ 2cp bold')}
        ,@{ file = 'rounded-l-mgenplus-2cp-heavy.ttf'; names = @(,'Rounded-L Mgen+ 2cp heavy')}
        ,@{ file = 'rounded-l-mgenplus-2cp-light.ttf'; names = @(,'Rounded-L Mgen+ 2cp light')}
        ,@{ file = 'rounded-l-mgenplus-2cp-medium.ttf'; names = @(,'Rounded-L Mgen+ 2cp medium')}
        ,@{ file = 'rounded-l-mgenplus-2cp-regular.ttf'; names = @(,'Rounded-L Mgen+ 2cp regular')}
        ,@{ file = 'rounded-l-mgenplus-2cp-thin.ttf'; names = @(,'Rounded-L Mgen+ 2cp thin')}
        ,@{ file = 'rounded-l-mgenplus-2m-bold.ttf'; names = @(,'Rounded-L Mgen+ 2m bold')}
        ,@{ file = 'rounded-l-mgenplus-2m-light.ttf'; names = @(,'Rounded-L Mgen+ 2m light')}
        ,@{ file = 'rounded-l-mgenplus-2m-medium.ttf'; names = @(,'Rounded-L Mgen+ 2m medium')}
        ,@{ file = 'rounded-l-mgenplus-2m-regular.ttf'; names = @(,'Rounded-L Mgen+ 2m regular')}
        ,@{ file = 'rounded-l-mgenplus-2m-thin.ttf'; names = @(,'Rounded-L Mgen+ 2m thin')}
        ,@{ file = 'rounded-l-mgenplus-2p-black.ttf'; names = @(,'Rounded-L Mgen+ 2p black')}
        ,@{ file = 'rounded-l-mgenplus-2p-bold.ttf'; names = @(,'Rounded-L Mgen+ 2p bold')}
        ,@{ file = 'rounded-l-mgenplus-2p-heavy.ttf'; names = @(,'Rounded-L Mgen+ 2p heavy')}
        ,@{ file = 'rounded-l-mgenplus-2p-light.ttf'; names = @(,'Rounded-L Mgen+ 2p light')}
        ,@{ file = 'rounded-l-mgenplus-2p-medium.ttf'; names = @(,'Rounded-L Mgen+ 2p medium')}
        ,@{ file = 'rounded-l-mgenplus-2p-regular.ttf'; names = @(,'Rounded-L Mgen+ 2p regular')}
        ,@{ file = 'rounded-l-mgenplus-2p-thin.ttf'; names = @(,'Rounded-L Mgen+ 2p thin')}
        ,@{ file = 'rounded-l-mgenplus-2pp-black.ttf'; names = @(,'Rounded-L Mgen+ 2pp black')}
        ,@{ file = 'rounded-l-mgenplus-2pp-bold.ttf'; names = @(,'Rounded-L Mgen+ 2pp bold')}
        ,@{ file = 'rounded-l-mgenplus-2pp-heavy.ttf'; names = @(,'Rounded-L Mgen+ 2pp heavy')}
        ,@{ file = 'rounded-l-mgenplus-2pp-light.ttf'; names = @(,'Rounded-L Mgen+ 2pp light')}
        ,@{ file = 'rounded-l-mgenplus-2pp-medium.ttf'; names = @(,'Rounded-L Mgen+ 2pp medium')}
        ,@{ file = 'rounded-l-mgenplus-2pp-regular.ttf'; names = @(,'Rounded-L Mgen+ 2pp regular')}
        ,@{ file = 'rounded-l-mgenplus-2pp-thin.ttf'; names = @(,'Rounded-L Mgen+ 2pp thin')}
     )
  }
  ,@{ name = 'Rounded Mgen+ 丸さ強め'
     ;url = 'http://iij.dl.osdn.jp/users/8/8599/rounded-x-mgenplus-20150602.7z'
     ;fonts = @(
        ,@{ file = 'rounded-x-mgenplus-1c-black.ttf'; names = @(,'Rounded-X Mgen+ 1c black')}
        ,@{ file = 'rounded-x-mgenplus-1c-bold.ttf'; names = @(,'Rounded-X Mgen+ 1c bold')}
        ,@{ file = 'rounded-x-mgenplus-1c-heavy.ttf'; names = @(,'Rounded-X Mgen+ 1c heavy')}
        ,@{ file = 'rounded-x-mgenplus-1c-light.ttf'; names = @(,'Rounded-X Mgen+ 1c light')}
        ,@{ file = 'rounded-x-mgenplus-1c-medium.ttf'; names = @(,'Rounded-X Mgen+ 1c medium')}
        ,@{ file = 'rounded-x-mgenplus-1c-regular.ttf'; names = @(,'Rounded-X Mgen+ 1c regular')}
        ,@{ file = 'rounded-x-mgenplus-1c-thin.ttf'; names = @(,'Rounded-X Mgen+ 1c thin')}
        ,@{ file = 'rounded-x-mgenplus-1cp-black.ttf'; names = @(,'Rounded-X Mgen+ 1cp black')}
        ,@{ file = 'rounded-x-mgenplus-1cp-bold.ttf'; names = @(,'Rounded-X Mgen+ 1cp bold')}
        ,@{ file = 'rounded-x-mgenplus-1cp-heavy.ttf'; names = @(,'Rounded-X Mgen+ 1cp heavy')}
        ,@{ file = 'rounded-x-mgenplus-1cp-light.ttf'; names = @(,'Rounded-X Mgen+ 1cp light')}
        ,@{ file = 'rounded-x-mgenplus-1cp-medium.ttf'; names = @(,'Rounded-X Mgen+ 1cp medium')}
        ,@{ file = 'rounded-x-mgenplus-1cp-regular.ttf'; names = @(,'Rounded-X Mgen+ 1cp regular')}
        ,@{ file = 'rounded-x-mgenplus-1cp-thin.ttf'; names = @(,'Rounded-X Mgen+ 1cp thin')}
        ,@{ file = 'rounded-x-mgenplus-1m-bold.ttf'; names = @(,'Rounded-X Mgen+ 1m bold')}
        ,@{ file = 'rounded-x-mgenplus-1m-light.ttf'; names = @(,'Rounded-X Mgen+ 1m light')}
        ,@{ file = 'rounded-x-mgenplus-1m-medium.ttf'; names = @(,'Rounded-X Mgen+ 1m medium')}
        ,@{ file = 'rounded-x-mgenplus-1m-regular.ttf'; names = @(,'Rounded-X Mgen+ 1m regular')}
        ,@{ file = 'rounded-x-mgenplus-1m-thin.ttf'; names = @(,'Rounded-X Mgen+ 1m thin')}
        ,@{ file = 'rounded-x-mgenplus-1mn-bold.ttf'; names = @(,'Rounded-X Mgen+ 1mn bold')}
        ,@{ file = 'rounded-x-mgenplus-1mn-light.ttf'; names = @(,'Rounded-X Mgen+ 1mn light')}
        ,@{ file = 'rounded-x-mgenplus-1mn-medium.ttf'; names = @(,'Rounded-X Mgen+ 1mn medium')}
        ,@{ file = 'rounded-x-mgenplus-1mn-regular.ttf'; names = @(,'Rounded-X Mgen+ 1mn regular')}
        ,@{ file = 'rounded-x-mgenplus-1mn-thin.ttf'; names = @(,'Rounded-X Mgen+ 1mn thin')}
        ,@{ file = 'rounded-x-mgenplus-1p-black.ttf'; names = @(,'Rounded-X Mgen+ 1p black')}
        ,@{ file = 'rounded-x-mgenplus-1p-bold.ttf'; names = @(,'Rounded-X Mgen+ 1p bold')}
        ,@{ file = 'rounded-x-mgenplus-1p-heavy.ttf'; names = @(,'Rounded-X Mgen+ 1p heavy')}
        ,@{ file = 'rounded-x-mgenplus-1p-light.ttf'; names = @(,'Rounded-X Mgen+ 1p light')}
        ,@{ file = 'rounded-x-mgenplus-1p-medium.ttf'; names = @(,'Rounded-X Mgen+ 1p medium')}
        ,@{ file = 'rounded-x-mgenplus-1p-regular.ttf'; names = @(,'Rounded-X Mgen+ 1p regular')}
        ,@{ file = 'rounded-x-mgenplus-1p-thin.ttf'; names = @(,'Rounded-X Mgen+ 1p thin')}
        ,@{ file = 'rounded-x-mgenplus-1pp-black.ttf'; names = @(,'Rounded-X Mgen+ 1pp black')}
        ,@{ file = 'rounded-x-mgenplus-1pp-bold.ttf'; names = @(,'Rounded-X Mgen+ 1pp bold')}
        ,@{ file = 'rounded-x-mgenplus-1pp-heavy.ttf'; names = @(,'Rounded-X Mgen+ 1pp heavy')}
        ,@{ file = 'rounded-x-mgenplus-1pp-light.ttf'; names = @(,'Rounded-X Mgen+ 1pp light')}
        ,@{ file = 'rounded-x-mgenplus-1pp-medium.ttf'; names = @(,'Rounded-X Mgen+ 1pp medium')}
        ,@{ file = 'rounded-x-mgenplus-1pp-regular.ttf'; names = @(,'Rounded-X Mgen+ 1pp regular')}
        ,@{ file = 'rounded-x-mgenplus-1pp-thin.ttf'; names = @(,'Rounded-X Mgen+ 1pp thin')}
        ,@{ file = 'rounded-x-mgenplus-2c-black.ttf'; names = @(,'Rounded-X Mgen+ 2c black')}
        ,@{ file = 'rounded-x-mgenplus-2c-bold.ttf'; names = @(,'Rounded-X Mgen+ 2c bold')}
        ,@{ file = 'rounded-x-mgenplus-2c-heavy.ttf'; names = @(,'Rounded-X Mgen+ 2c heavy')}
        ,@{ file = 'rounded-x-mgenplus-2c-light.ttf'; names = @(,'Rounded-X Mgen+ 2c light')}
        ,@{ file = 'rounded-x-mgenplus-2c-medium.ttf'; names = @(,'Rounded-X Mgen+ 2c medium')}
        ,@{ file = 'rounded-x-mgenplus-2c-regular.ttf'; names = @(,'Rounded-X Mgen+ 2c regular')}
        ,@{ file = 'rounded-x-mgenplus-2c-thin.ttf'; names = @(,'Rounded-X Mgen+ 2c thin')}
        ,@{ file = 'rounded-x-mgenplus-2cp-black.ttf'; names = @(,'Rounded-X Mgen+ 2cp black')}
        ,@{ file = 'rounded-x-mgenplus-2cp-bold.ttf'; names = @(,'Rounded-X Mgen+ 2cp bold')}
        ,@{ file = 'rounded-x-mgenplus-2cp-heavy.ttf'; names = @(,'Rounded-X Mgen+ 2cp heavy')}
        ,@{ file = 'rounded-x-mgenplus-2cp-light.ttf'; names = @(,'Rounded-X Mgen+ 2cp light')}
        ,@{ file = 'rounded-x-mgenplus-2cp-medium.ttf'; names = @(,'Rounded-X Mgen+ 2cp medium')}
        ,@{ file = 'rounded-x-mgenplus-2cp-regular.ttf'; names = @(,'Rounded-X Mgen+ 2cp regular')}
        ,@{ file = 'rounded-x-mgenplus-2cp-thin.ttf'; names = @(,'Rounded-X Mgen+ 2cp thin')}
        ,@{ file = 'rounded-x-mgenplus-2m-bold.ttf'; names = @(,'Rounded-X Mgen+ 2m bold')}
        ,@{ file = 'rounded-x-mgenplus-2m-light.ttf'; names = @(,'Rounded-X Mgen+ 2m light')}
        ,@{ file = 'rounded-x-mgenplus-2m-medium.ttf'; names = @(,'Rounded-X Mgen+ 2m medium')}
        ,@{ file = 'rounded-x-mgenplus-2m-regular.ttf'; names = @(,'Rounded-X Mgen+ 2m regular')}
        ,@{ file = 'rounded-x-mgenplus-2m-thin.ttf'; names = @(,'Rounded-X Mgen+ 2m thin')}
        ,@{ file = 'rounded-x-mgenplus-2p-black.ttf'; names = @(,'Rounded-X Mgen+ 2p black')}
        ,@{ file = 'rounded-x-mgenplus-2p-bold.ttf'; names = @(,'Rounded-X Mgen+ 2p bold')}
        ,@{ file = 'rounded-x-mgenplus-2p-heavy.ttf'; names = @(,'Rounded-X Mgen+ 2p heavy')}
        ,@{ file = 'rounded-x-mgenplus-2p-light.ttf'; names = @(,'Rounded-X Mgen+ 2p light')}
        ,@{ file = 'rounded-x-mgenplus-2p-medium.ttf'; names = @(,'Rounded-X Mgen+ 2p medium')}
        ,@{ file = 'rounded-x-mgenplus-2p-regular.ttf'; names = @(,'Rounded-X Mgen+ 2p regular')}
        ,@{ file = 'rounded-x-mgenplus-2p-thin.ttf'; names = @(,'Rounded-X Mgen+ 2p thin')}
        ,@{ file = 'rounded-x-mgenplus-2pp-black.ttf'; names = @(,'Rounded-X Mgen+ 2pp black')}
        ,@{ file = 'rounded-x-mgenplus-2pp-bold.ttf'; names = @(,'Rounded-X Mgen+ 2pp bold')}
        ,@{ file = 'rounded-x-mgenplus-2pp-heavy.ttf'; names = @(,'Rounded-X Mgen+ 2pp heavy')}
        ,@{ file = 'rounded-x-mgenplus-2pp-light.ttf'; names = @(,'Rounded-X Mgen+ 2pp light')}
        ,@{ file = 'rounded-x-mgenplus-2pp-medium.ttf'; names = @(,'Rounded-X Mgen+ 2pp medium')}
        ,@{ file = 'rounded-x-mgenplus-2pp-regular.ttf'; names = @(,'Rounded-X Mgen+ 2pp regular')}
        ,@{ file = 'rounded-x-mgenplus-2pp-thin.ttf'; names = @(,'Rounded-X Mgen+ 2pp thin')}
     )
  }
<#
  ,@{ name = 'KHドットフォント'
     ;url = 'http://iij.dl.osdn.jp/users/8/8545/khdotfont-20150527.7z'
     ;fonts = @(
        ,@{ file = 'KH-Dot-Akihabara-16.ttf'; names = @(,'KHドット秋葉原16')}
        ,@{ file = 'KH-Dot-Dougenzaka-12.ttf'; names = @(,'KHドット道玄坂12')}
        ,@{ file = 'KH-Dot-Dougenzaka-16.ttf'; names = @(,'KHドット道玄坂16')}
        ,@{ file = 'KH-Dot-Hatchoubori-16.ttf'; names = @(,'KHドット八丁堀16')}
        ,@{ file = 'KH-Dot-Hibiya-24.ttf'; names = @(,'KHドット日比谷24')}
        ,@{ file = 'KH-Dot-Hibiya-32.ttf'; names = @(,'KHドット日比谷32')}
        ,@{ file = 'KH-Dot-Kabutochou-16.ttf'; names = @(,'KHドット兜町16')}
        ,@{ file = 'KH-Dot-Kagurazaka-12.ttf'; names = @(,'KHドット神楽坂12')}
        ,@{ file = 'KH-Dot-Kagurazaka-16.ttf'; names = @(,'KHドット神楽坂16')}
        ,@{ file = 'KH-Dot-Kodenmachou-12-Ki.ttf'; names = @(,'KHドット小伝馬町12 幾何学的カナ')}
        ,@{ file = 'KH-Dot-Kodenmachou-12-Ko.ttf'; names = @(,'KHドット小伝馬町12 小かな')}
        ,@{ file = 'KH-Dot-Kodenmachou-12.ttf'; names = @(,'KHドット小伝馬町12')}
        ,@{ file = 'KH-Dot-Kodenmachou-16-Ki.ttf'; names = @(,'KHドット小伝馬町16 幾何学的カナ')}
        ,@{ file = 'KH-Dot-Kodenmachou-16.ttf'; names = @(,'KHドット小伝馬町16')}
        ,@{ file = 'KH-Dot-Ningyouchou-16.ttf'; names = @(,'KHドット人形町16')}
     )
  }
  ,@{ name = 'JFドットフォント'
     ;url = 'http://iij.dl.osdn.jp/users/8/8541/jfdotfont-20150527.7z'
     ;fonts = @(
        ,@{ file = 'JF-Dot-Ayu18.ttf'; names = @(,'JFドットAyuゴシック18')}
        ,@{ file = 'JF-Dot-Ayu20.ttf'; names = @(,'JFドットAyuゴシック20')}
        ,@{ file = 'JF-Dot-AyuMin18.ttf'; names = @(,'JFドットAyu明朝18')}
        ,@{ file = 'JF-Dot-Izumi16.ttf'; names = @(,'JFドット出水ゴシック16')}
        ,@{ file = 'JF-Dot-Izumi16B.ttf'; names = @(,'JFドット出水ゴシック16')}
        ,@{ file = 'JF-Dot-jiskan16-1990.ttf'; names = @(,'JFドットjiskan16-1990')}
        ,@{ file = 'JF-Dot-jiskan16-2000.ttf'; names = @(,'JFドットjiskan16-2000')}
        ,@{ file = 'JF-Dot-jiskan16.ttf'; names = @(,'JFドットjiskan16')}
        ,@{ file = 'JF-Dot-jiskan16s-1990.ttf'; names = @(,'JFドットjiskan16s-1990')}
        ,@{ file = 'JF-Dot-jiskan16s-2000.ttf'; names = @(,'JFドットjiskan16s-2000')}
        ,@{ file = 'JF-Dot-jiskan16s.ttf'; names = @(,'JFドットjiskan16s')}
        ,@{ file = 'JF-Dot-jiskan24-2000.ttf'; names = @(,'JFドットjiskan24-2000')}
        ,@{ file = 'JF-Dot-jiskan24.ttf'; names = @(,'JFドットjiskan24')}
        ,@{ file = 'JF-Dot-jiskan24h-2000.ttf'; names = @(,'JFドットjiskan24h-2000')}
        ,@{ file = 'JF-Dot-jiskan24h.ttf'; names = @(,'JFドットjiskan24h')}
        ,@{ file = 'JF-Dot-K12.ttf'; names = @(,'JFドットK12')}
        ,@{ file = 'JF-Dot-K12B.ttf'; names = @(,'JFドットK12')}
        ,@{ file = 'JF-Dot-k12x10.ttf'; names = @(,'JFドットk12x10')}
        ,@{ file = 'JF-Dot-K14-2004.ttf'; names = @(,'JFドットK14-2004')}
        ,@{ file = 'JF-Dot-K14.ttf'; names = @(,'JFドットK14')}
        ,@{ file = 'JF-Dot-K14B-2004.ttf'; names = @(,'JFドットK14-2004')}
        ,@{ file = 'JF-Dot-K14B.ttf'; names = @(,'JFドットK14')}
        ,@{ file = 'JF-Dot-k6x8.ttf'; names = @(,'JFドットk6x8')}
        ,@{ file = 'JF-Dot-Kaname12.ttf'; names = @(,'JFドット要町12')}
        ,@{ file = 'JF-Dot-Kappa20-0213.ttf'; names = @(,'JFドットKappa20-0213')}
        ,@{ file = 'JF-Dot-Kappa20.ttf'; names = @(,'JFドットKappa20')}
        ,@{ file = 'JF-Dot-Kappa20B.ttf'; names = @(,'JFドットKappa20')}
        ,@{ file = 'JF-Dot-milkjf16.ttf'; names = @(,'JFドットmilkjf16')}
        ,@{ file = 'JF-Dot-milkjf16B.ttf'; names = @(,'JFドットmilkjf16')}
        ,@{ file = 'JF-Dot-MPlus10.ttf'; names = @(,'JFドットM+10')}
        ,@{ file = 'JF-Dot-MPlus10B.ttf'; names = @(,'JFドットM+10')}
        ,@{ file = 'JF-Dot-MPlus12.ttf'; names = @(,'JFドットM+12')}
        ,@{ file = 'JF-Dot-MPlus12B.ttf'; names = @(,'JFドットM+12')}
        ,@{ file = 'JF-Dot-MPlusH10.ttf'; names = @(,'JFドットM+H10')}
        ,@{ file = 'JF-Dot-MPlusH10B.ttf'; names = @(,'JFドットM+H10')}
        ,@{ file = 'JF-Dot-MPlusH12.ttf'; names = @(,'JFドットM+H12')}
        ,@{ file = 'JF-Dot-MPlusH12B.ttf'; names = @(,'JFドットM+H12')}
        ,@{ file = 'JF-Dot-MPlusQ10.ttf'; names = @(,'JFドットM+Q10')}
        ,@{ file = 'JF-Dot-MPlusS10.ttf'; names = @(,'JFドットM+S10')}
        ,@{ file = 'JF-Dot-MPlusS10B.ttf'; names = @(,'JFドットM+S10')}
        ,@{ file = 'JF-Dot-Shinonome12.ttf'; names = @(,'JFドット東雲ゴシック12')}
        ,@{ file = 'JF-Dot-Shinonome12B.ttf'; names = @(,'JFドット東雲ゴシック12')}
        ,@{ file = 'JF-Dot-Shinonome14.ttf'; names = @(,'JFドット東雲ゴシック14')}
        ,@{ file = 'JF-Dot-Shinonome14B.ttf'; names = @(,'JFドット東雲ゴシック14')}
        ,@{ file = 'JF-Dot-Shinonome16.ttf'; names = @(,'JFドット東雲ゴシック16')}
        ,@{ file = 'JF-Dot-Shinonome16B.ttf'; names = @(,'JFドット東雲ゴシック16')}
        ,@{ file = 'JF-Dot-ShinonomeMaru12.ttf'; names = @(,'JFドット東雲まるもじ12')}
        ,@{ file = 'JF-Dot-ShinonomeMaru12B.ttf'; names = @(,'JFドット東雲まるもじ12')}
        ,@{ file = 'JF-Dot-ShinonomeMin12.ttf'; names = @(,'JFドット東雲明朝12')}
        ,@{ file = 'JF-Dot-ShinonomeMin12B.ttf'; names = @(,'JFドット東雲明朝12')}
        ,@{ file = 'JF-Dot-ShinonomeMin14.ttf'; names = @(,'JFドット東雲明朝14')}
        ,@{ file = 'JF-Dot-ShinonomeMin14B.ttf'; names = @(,'JFドット東雲明朝14')}
        ,@{ file = 'JF-Dot-ShinonomeMin16.ttf'; names = @(,'JFドット東雲明朝16')}
        ,@{ file = 'JF-Dot-ShinonomeMin16B.ttf'; names = @(,'JFドット東雲明朝16')}
     )
  }
#>

  # Kazesawaフォント
  ,@{ name = 'Kazesawaフォント'
     ;url = 'https://github.com/kazesawa/kazesawa/releases/download/alpha-v1/kazesawa.zip'
     ;fonts = @(
        ,@{ file = 'Kazesawa-Bold.ttf'; names = @(,'Kazesawa Bold')}
        ,@{ file = 'Kazesawa-Extrabold.ttf'; names = @(,'Kazesawa Extrabold')}
        ,@{ file = 'Kazesawa-ExtraLight.ttf'; names = @(,'Kazesawa ExtraLight')}
        ,@{ file = 'Kazesawa-Light.ttf'; names = @(,'Kazesawa Light')}
        ,@{ file = 'Kazesawa-Regular.ttf'; names = @(,'Kazesawa Regular')}
        ,@{ file = 'Kazesawa-Semibold.ttf'; names = @(,'Kazesawa Semibold')}
     )
  }

  # MigMix / Migu
  ,@{ name = 'MigMix 1P'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63544/migmix-1p-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migmix-1p-bold.ttf'; names = @(,'MigMix 1P')}
        ,@{ file = 'migmix-1p-regular.ttf'; names = @(,'MigMix 1P')}
     )
  }
  ,@{ name = 'MigMix 2P'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63544/migmix-2p-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migmix-2p-bold.ttf'; names = @(,'MigMix 2P')}
        ,@{ file = 'migmix-2p-regular.ttf'; names = @(,'MigMix 2P')}
     )
  }
  ,@{ name = 'MigMix 1M'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63544/migmix-1m-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migmix-1m-bold.ttf'; names = @(,'MigMix 1M')}
        ,@{ file = 'migmix-1m-regular.ttf'; names = @(,'MigMix 1M')}
     )
  }
  ,@{ name = 'MigMix 2M'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63544/migmix-2m-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migmix-2m-bold.ttf'; names = @(,'MigMix 2M')}
        ,@{ file = 'migmix-2m-regular.ttf'; names = @(,'MigMix 2M')}
     )
  }
  ,@{ name = 'Migu 1P'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63545/migu-1p-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migu-1p-bold.ttf'; names = @(,'Migu 1P')}
        ,@{ file = 'migu-1p-regular.ttf'; names = @(,'Migu 1P')}
     )
  }
  ,@{ name = 'Migu 1C'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63545/migu-1c-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migu-1c-bold.ttf'; names = @(,'Migu 1C')}
        ,@{ file = 'migu-1c-regular.ttf'; names = @(,'Migu 1C')}
     )
  }
  ,@{ name = 'Migu 1M'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63545/migu-1m-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migu-1m-bold.ttf'; names = @(,'Migu 1M')}
        ,@{ file = 'migu-1m-regular.ttf'; names = @(,'Migu 1M')}
     )
  }
  ,@{ name = 'Migu 2M'
     ;url = 'http://iij.dl.osdn.jp/mix-mplus-ipa/63545/migu-2m-20150712.zip'
     ;fonts = @(
        ,@{ file = 'migu-2m-bold.ttf'; names = @(,'Migu 2M')}
        ,@{ file = 'migu-2m-regular.ttf'; names = @(,'Migu 2M')}
     )
  }

  # 小瑠璃フォント
  ,@{ name = '小瑠璃フォント'
     ;url = 'http://iij.dl.osdn.jp/koruri/63935/Koruri-20151021.7z'
     ;fonts = @(
        ,@{ file = 'Koruri-Bold.ttf'; names = @(,'Koruri Bold')}
        ,@{ file = 'Koruri-Extrabold.ttf'; names = @(,'Koruri Extrabold')}
        ,@{ file = 'Koruri-Light.ttf'; names = @(,'Koruri Light')}
        ,@{ file = 'Koruri-Regular.ttf'; names = @(,'Koruri Regular')}
        ,@{ file = 'Koruri-Semibold.ttf'; names = @(,'Koruri Semibold')}
     )
  }

  # Myrica
  ,@{ name = 'Myrica'
     ;url = 'https://github.com/tomokuni/Myrica/raw/master/product/Myrica.7z'
     ;fonts = @(
        ,@{ file = 'Myrica.TTC'; names = @(,'Myrica M','Myrica N','Myrica P')}
     )
  }
  ,@{ name = 'MyricaM'
     ;url = 'https://github.com/tomokuni/Myrica/raw/master/product/MyricaM.7z'
     ;fonts = @(
        ,@{ file = 'MyricaM.TTC'; names = @(,'MyricaM M','MyricaM N','MyricaM P')}
     )
  }

  # Ricty Diminished
   @{ name = 'Ricty Diminished'
     ;url = 'https://github.com/yascentur/RictyDiminished/archive/4.0.1.zip'
     ;fonts = @(
        ,@{ file = 'RictyDiminished-Bold.ttf'; names = @(,'Ricty Diminished')}
        ,@{ file = 'RictyDiminished-BoldOblique.ttf'; names = @(,'Ricty Diminished')}
        ,@{ file = 'RictyDiminished-Oblique.ttf'; names = @(,'Ricty Diminished')}
        ,@{ file = 'RictyDiminished-Regular.ttf'; names = @(,'Ricty Diminished')}
        ,@{ file = 'RictyDiminishedDiscord-Bold.ttf'; names = @(,'Ricty Diminished Discord')}
        ,@{ file = 'RictyDiminishedDiscord-BoldOblique.ttf'; names = @(,'Ricty Diminished Discord')}
        ,@{ file = 'RictyDiminishedDiscord-Oblique.ttf'; names = @(,'Ricty Diminished Discord')}
        ,@{ file = 'RictyDiminishedDiscord-Regular.ttf'; names = @(,'Ricty Diminished Discord')}
     )
  }

<#
  # 刻シリーズ
  ,@{ name = '刻明朝フォント'
     ;url = 'http://freefonts.jp/dl_3qa5ju5a45/ki_kokumin.zip'
     ;fonts = @(
        ,@{ file = 'font_1_kokumr_1.00_rls.ttf'; names = @(,'刻明朝 Regular')}
     )
  }
  ,@{ name = '刻ゴシックフォント'
     ;url = 'http://freefonts.jp/dl_3qa5ju5a45/ki_kokugo.zip'
     ;fonts = @(
        ,@{ file = 'font_1_kokugl_1.15_rls.ttf'; names = @(,'刻ゴシック Light')}
     )
  }

  # ほのかフォント
  ,@{ name = 'ほのか丸ゴシック'
     ;url = 'http://font.gloomy.jp/dl-font-s5a4ik5w/honoka-marugo.zip'
     ;fonts = @(
        ,@{ file = 'font_1_honokamarugo_1.1.ttf'; names = @(,'ほのか丸ゴシック')}
     )
  }
  ,@{ name = 'ほのか明朝'
     ;url = 'http://font.gloomy.jp/dl-font-s5a4ik5w/honoka-min.zip'
     ;fonts = @(
        ,@{ file = 'font_1_honokamin.ttf'; names = @(,'ほのか明朝')}
     )
  }
  ,@{ name = 'ほのかアンティーク丸'
     ;url = 'http://font.gloomy.jp/dl-font-s5a4ik5w/antique-maru.zip'
     ;fonts = @(
        ,@{ file = 'font_1_ant-maru.ttf'; names = @(,'ほのかアンティーク丸')}
     )
  }
  ,@{ name = 'ほのかアンティーク角'
     ;url = 'http://font.gloomy.jp/dl-font-s5a4ik5w/antique-kaku.zip'
     ;fonts = @(
        ,@{ file = 'font_1_ant-kaku.ttf'; names = @(,'ほのかアンティーク角')}
     )
  }

  # あおぞら明朝
  ,@{ name = 'あおぞら明朝'
     ;url = 'http://blueskis.wktk.so/AozoraMincho/archive/v0.1/aozoramincho-readme-ttf.zip'
     ;fonts = @(
        ,@{ file = 'AozoraMincho-bold.ttf'; names = @(,'あおぞら明朝 Bold')}
        ,@{ file = 'AozoraMincho-thin.ttf'; names = @(,'あおぞら明朝 thin')}
        ,@{ file = 'AozoraMinchoBlack.ttf'; names = @(,'あおぞら明朝 Black')}
        ,@{ file = 'AozoraMinchoHeavy.ttf'; names = @(,'あおぞら明朝 Heavy')}
        ,@{ file = 'AozoraMinchoLight.ttf'; names = @(,'あおぞら明朝 Light')}
        ,@{ file = 'AozoraMinchoMedium.ttf'; names = @(,'あおぞら明朝 Medium')}
        ,@{ file = 'AozoraMinchoRegular.ttf'; names = @(,'あおぞら明朝 Regular')}
     )
  }
  
  # 新コミック体
  ,@{ name = '新コミック体'
     ;url = 'http://www.font910.jp/freefont_i6wiwk5/f910-shin-comic-2.01.zip'
     ;fonts = @(
        ,@{ file = 'f910-shin-comic-2.01.otf'; names = @(,'F910新コミック体')}
     )
  }
#>

  # 武蔵システム
  ,@{ name = '青柳疎石フォント'
     ;url = 'http://opentype.jp/bin/AoyagiSosekiFontOTF.zip'
     ;fonts = @(
        ,@{ file = 'AoyagiSosekiFont2.otf'; names = @(,'青柳疎石フォント2 OTF')}
     )
  }
  ,@{ name = '衡山毛筆フォント'
     ;url = 'http://opentype.jp/bin/KouzanMouhituFontOTF.zip'
     ;fonts = @(
        ,@{ file = 'KouzanMouhituFontOTF.otf'; names = @(,'衡山毛筆フォント OTF')}
     )
  }
  ,@{ name = '青柳衡山フォントT'
     ;url = 'http://opentype.jp/bin/AoyagiKouzanTOTF.zip'
     ;fonts = @(
        ,@{ file = 'AoyagiKouzanTOTF.otf'; names = @(,'青柳衡山フォントT OTF')}
     )
  }
  ,@{ name = '衡山毛筆フォント行書'
     ;url = 'http://opentype.jp/bin/KouzanGyoushoOTF.zip'
     ;fonts = @(
        ,@{ file = 'KouzanGyoushoOTF.otf'; names = @(,'衡山毛筆フォント行書 OTF')}
     )
  }
  ,@{ name = '衡山毛筆フォント草書'
     ;url = 'http://opentype.jp/bin/KouzanSoushoOTF.zip'
     ;fonts = @(
        ,@{ file = 'KouzanSoushoOTF.otf'; names = @(,'衡山毛筆フォント草書 OTF')}
     )
  }
<#
  ,@{ name = '半角フォント'
     ;url = 'http://opentype.jp/bin/halffont.zip'
     ;fonts = @(
        ,@{ file = 'TTEditHalfGothic.ttf'; names = @(,'TTEdit半角ゴシック')}
        ,@{ file = 'TTEditHalfMincho.ttf'; names = @(,'TTEdit半角明朝')}
     )
  }
  ,@{ name = '2/3角フォント'
     ;url = 'http://opentype.jp/bin/twobythree.zip'
     ;fonts = @(
        ,@{ file = 'TTEdit2by3Gothic.ttf'; names = @(,'TTEdit2/3ゴシック')}
        ,@{ file = 'TTEdit2by3Mincho.ttf'; names = @(,'TTEdit2/3明朝')}
     )
  }

  # ラノベPOP
  ,@{ name = 'ラノベPOP'
     ;url = 'http://bgmsound.sakura.ne.jp/fontna/LightNovelPOP_FONT.zip'
     ;fonts = @(
        ,@{ file = 'ラノベPOP.ttf'; names = @(,'07ラノベPOP')}
     )
  }

  # けいふぉんと
  ,@{ name = 'けいふぉんと'
     ;url = 'http://font.sumomo.ne.jp/fontdata-a2157415/k-font.zip'
     ;fonts = @(
        ,@{ file = 'keifont.ttf'; names = @(,'けいふぉんと')}
     )
  }

  # ニコモジ＋ / ニコ角＋
  ,@{ name = 'ニコモジ＋'
     ;url = 'http://nicofont.pupu.jp/nicomoji_s_2525/nicomoji-plus.zip'
     ;fonts = @(
        ,@{ file = 'nicomoji-plus_1.11.ttf'; names = @(,'ニコモジ＋')}
     )
  }
  ,@{ name = 'ニコ角＋'
     ;url = 'http://nicofont.pupu.jp/nicomoji_s_2525/nicokaku-plus.zip'
     ;fonts = @(
        ,@{ file = 'nicokaku_v1.ttf'; names = @(,'ニコ角')}
     )
  }
#>
)

$script:installed_font_names = @()
foreach ( $font_name in (New-Object System.Drawing.Text.InstalledFontCollection).Families.Name ) {
  $script:installed_font_names += $font_name
}

<# form functions #>

function disclaimer {
    $text = "このソフトウェアは、GNU General Public Licenseバージョン3 (GPLv3)のもと提供されています。`n" +
            "このソフトウェアは無保証であり、どのようなトラブルが発生しても著作権者は責任を負わないものとします。`n" +
            "このソフトウェアの著作権やライセンスについての詳細は、起動後に「About」タブを参照してください。" +
            "`n`n" +
            "このソフトウェアは、個人利用のWindows 10 PCを対象としています。組織の管理下にあるPCでは、想定通りに動作しない可能性があります。"
    $caption = "確認 - " + $software_name
    $buttonsType = "OKCancel"
    $iconType = "Question"
    $result = [System.Windows.Forms.MessageBox]::Show($text, $caption, $buttonsType, $iconType)
    if ( $result -ne 'OK' ) {
        exit
    }
}

function check_admin {
    if ( ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") -eq $false ) {
        $text = "標準ユーザーとして実行されています。管理者ユーザーとして実行する必要があります。"
        $caption = "確認 - " + $software_name
        $buttons = "OK"
        $icon = "Error"
        $default_button = "Button1"
        [System.Windows.Forms.MessageBox]::Show($text, $caption, $buttons, $icon, $default_button) | Out-Null
        exit
    }
}

function fontinst_form {
    $Form = New-Object System.Windows.Forms.Form    
    $Form.Size = New-Object System.Drawing.Size(1, 1) 
    $Form.AutoSize = $true 
    $Form.FormBorderStyle = "FixedSingle"
    $Form.MaximizeBox = $false
    $Form.text = $software_name

    $FormB = New-Object System.Windows.Forms.Form
    $FormB.Size = "410, 80"
    $Form.FormBorderStyle = "FixedSingle"
    $FormB.MaximizeBox = $false
    #$FormB.MinimizeBox = $false
    $FormB.Text = "処理中 -" + $software_name
    $FormB.Owner = $Form
    $LabelB = New-Object System.Windows.Forms.Label
    $LabelB.Location = '8, 16'
    $LabelB.Size = '412, 120'
    $LabelB.Text = "フォントのインストールを開始します…"
    $FormB.Controls.Add($LabelB)

    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Point(280, 470)
    $OKButton.Size = New-Object System.Drawing.Size(86, 24)
    $OKButton.Text = "OK"
    $OKButton.Add_Click(
        {
            $install_continue = $false
            foreach ( $checkbox in $checkboxes ) {
                if ( $checkbox.Checked -eq $true ) {
                    $text = "フォントのダウンロードとインストールを実行します。よろしいですか？"
                    $caption = "確認 - " + $software_name
                    $buttonsType = "OKCancel"
                    $iconType = "Question"
                    $result = [System.Windows.Forms.MessageBox]::Show($text, $caption, $buttonsType, $iconType)
                    if ( $result -eq 'OK' ) {
                        $install_continue = $true
                        break
                    } else {
                        return
                    }
                }
            }

            if ( $install_continue -eq $false ) {
                [System.Windows.Forms.MessageBox]::Show("フォントはインストールされませんでした。", "完了 - $software_name", "OK", "Info")
                $Form.Close()
                return
            }

            $download_path = (Join-Path $env:USERPROFILE "\Downloads")
            if ( !(Test-Path -Path $download_path -PathType Container ) ) {
                [System.Windows.Forms.MessageBox]::Show("$download_path フォルダが存在しません。", "確認 - " + $software_name, "OK", "Error") | Out-Null
                return
            }

            $font_download_path = (Join-Path $download_path $software_name)
            if ( !(Test-Path -Path $font_download_path ) ) {
                if((New-Item $font_download_path -itemType Directory)) {
                    Write-Debug "$font_download_path フォルダを作成しました。"
                } else {
                    [System.Windows.Forms.MessageBox]::Show("$font_download_path フォルダの作成に失敗しました。", "確認 - " + $software_name, "OK", "Error") | Out-Null
                    return
                }
            } else {
                Write-Debug "$font_download_path フォルダは既に存在します。"
            }

            if ( !(Test-Path -Path $font_download_path -PathType Container) ) {
                [System.Windows.Forms.MessageBox]::Show("$font_download_path はフォルダではありません。", "確認 - " + $software_name, "OK", "Error") | Out-Null
                return
            }

            $guid = [GUID]::NewGuid().ToString()
            $temp_font_path = (Join-Path $font_download_path $guid)
            if ( !(New-Item $temp_font_path -itemType Directory) ) {
                [System.Windows.Forms.MessageBox]::Show("一時フォルダの作成に失敗しました。", "確認 - " + $software_name, "OK", "Error") | Out-Null
                return
            }

            try {
                Import-Module BitsTransfer
                $FormB.Show()
                $7z_path = "$env:ProgramFiles\7-Zip\7z.exe"
                if (!(Test-Path $7z_path)) {
                    $7z_path = "$env:ProgramFiles(x86)\7-Zip\7z.exe"
                }
                if (!(Test-Path $7z_path)) {
                    $7z_archive_path = (Join-Path $font_download_path "7za920.zip")
                    if (!(Test-Path -Path $7z_archive_path)) {
                        $LabelB.Text = "7zipをダウンロードしています…"
                        $LabelB.Refresh()
                        Write-Debug "7zipをダウンロードします。"
                        $url="https://sourceforge.net/projects/sevenzip/files/7-Zip/9.20/7za920.zip"
                        Invoke-WebRequest -Uri $url -OutFile $7z_archive_path -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::InternetExplorer -ErrorAction Ignore
                        #Start-BitsTransfer -Source $url -Destination $7z_archive_path -ErrorAction Ignore
                        if (!(Test-Path $7z_archive_path)) {
                          [System.Windows.Forms.MessageBox]::Show("7zipのダウンロードに失敗しました。", "エラー - $software_name", "OK", "Error")
                          return
                        }
                    }
                    $folder = (Join-Path $font_download_path "7za920")
                    if (!(Test-Path -Path $folder -PathType Container)) {
                        if((New-Item $folder -itemType Directory)) {
                            Write-Debug "$folder フォルダを作成しました。"
                        } else {
                            [System.Windows.Forms.MessageBox]::Show("$folder フォルダの作成に失敗しました。", "エラー - $software_name", "OK", "Error")
                            return
                        }
                    }
                    ((New-Object -com Shell.Application).NameSpace($folder)).CopyHere(((New-Object -com Shell.Application).NameSpace($7z_archive_path)).Items(), 0x14)
                    $7z_path = (Join-Path $folder "7za.exe")
                    if (!(Test-Path -Path $7z_path)) {
                        [System.Windows.Forms.MessageBox]::Show("7zipのダウンロードに失敗しました。", "エラー - $software_name", "OK", "Error")
                    } else {
                        Write-Debug "7zipをダウンロードしました。"
                    }
                }
    
                $prepared = $false
                $LabelB.Text = "フォントをダウンロードしています…（時間がかかる場合があります）"
                $LabelB.Refresh()
                foreach ( $checkbox in $checkboxes ) {
                    if ( $checkbox.Checked -eq $true ) {
                        $i = $checkboxes.IndexOf($checkbox)
                        $file = (Join-Path $font_download_path ($font_infos[$i]['url']).Substring(($font_infos[$i]['url']).LastIndexOf('/') + 1))
                        if ((Test-Path -Path $file)) {
                            Write-Debug (($font_infos[$i]['url']) + "はウンロード済みです: $file")
                        } else {
                            Write-Debug (($font_infos[$i]['url']) + "をダウンロードします: $file")
                            $uri = $font_infos[$i]['url']
                            Start-Job { Invoke-WebRequest -Uri $using:uri -OutFile $using:file -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::InternetExplorer -ErrorAction Ignore }
                        }
                    }
                }
                Get-Job|Wait-Job

                foreach ( $checkbox in $checkboxes ) {
                    if ( $checkbox.Checked -eq $true ) {
                        $i = $checkboxes.IndexOf($checkbox)
                        $file = (Join-Path $font_download_path ($font_infos[$i]['url']).Substring(($font_infos[$i]['url']).LastIndexOf('/') + 1))
                        if ((Test-Path -Path $file)) {
                            if ( $file -match "\.tar\.xz$" ) {
                                Write-Debug "$file を展開"
                                $LabelB.Text = "「" + $font_infos[$i]['name'] + "」を展開しています…"
                                $LabelB.Refresh()
                                $arg = "-aoa -o`"$font_download_path`" x `"$file`""
                                Start-Process -FilePath $7z_path -ArgumentList $arg -Wait -WindowStyle Hidden
                            }
                            $file = $file -replace "\.xz$"
                            $folder = (Join-Path $font_download_path (Get-Item $file).BaseName)
                            if (!(Test-Path -Path $folder -PathType Container)) {
                                if((New-Item $folder -itemType Directory)) {
                                    Write-Debug "$folder フォルダを作成しました。"
                                } else {
                                    [System.Windows.Forms.MessageBox]::Show("$folder フォルダの作成に失敗しました。", "エラー - $software_name", "OK", "Error")
                                    continue
                                }
                            }
                            $extension = (Get-Item $file).Extension.ToLower()
                            if ( @('.zip', '.7z', '.xz', '.bz2', '.gz', '.tar') -contains $extension ) {
                                Write-Debug "$file を $folder に展開"
                                $LabelB.Text = "「" + $font_infos[$i]['name'] + "」を展開しています…"
                                $LabelB.Refresh()
                                $arg = "-aoa -o`"$folder`" x `"$file`""
                                Start-Process -FilePath $7z_path -ArgumentList $arg -Wait -WindowStyle Hidden
                            } else {
                                Write-Debug "$file を $folder に移動"
                                Move-Item -Force $file $folder
                            }
    
                            $font_files = Get-ChildItem -Path $folder -Include $font_infos[$i]['files'] -Recurse |
                                Where {$_.FullName -notlike "*\*_old\*"} | Where {$_.FullName -notlike "*\*サポート外\*"}
                            foreach ( $font_file in $font_files ) {
                                Move-Item $font_file.FullName $temp_font_path
                                Write-Debug ($font_file.FullName + "を $temp_font_path に移動")
                                $prepared = $true
                            }
                        } else {
                            [System.Windows.Forms.MessageBox]::Show("$file のダウンロードに失敗しました。", "エラー - $software_name", "OK", "Error")
                        }
                    }
                }
                if ( $prepared ) {
                    $LabelB.Text = "フォントをインストールしています…"
                    $LabelB.Refresh()
                    (New-Object -Com "Shell.Application").NameSpace($temp_font_path).Items().InvokeVerbEx("install")
                    [System.Windows.Forms.MessageBox]::Show("フォントのインストールが終了しました。`n$font_download_path に、ダウンロードしたファイルや展開したフォルダが残っています。`n各フォントのライセンスについては、そちらを参照してください。", "完了 - $software_name", "OK", "Info")
                } else {
                    [System.Windows.Forms.MessageBox]::Show("フォントはインストールされませんでした。", "完了 - $software_name", "OK", "Info")
                }
                $FormB.Close()
            } finally {
                Remove-Item $temp_font_path -Force -Recurse
            }
            $Form.Close()
        }
    )
    $Form.Controls.Add($OKButton)

    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Location = New-Object System.Drawing.Point(376, 470)
    $CancelButton.Size = New-Object System.Drawing.Size(86, 26)
    $CancelButton.Text = "キャンセル"
    $CancelButton.Add_Click(
        {
            $text = "インストールせずに終了してよろしいですか？"
            $caption = "確認 - " + $software_name
            $buttonsType = "OKCancel"
            $iconType = "Question"
            $result = [System.Windows.Forms.MessageBox]::Show($text, $caption, $buttonsType, $iconType)
            if ( $result -eq 'OK' ) {
                $Form.Close()
            }
        }
    )
    $Form.Controls.Add($CancelButton)

    $TabControl = New-object System.Windows.Forms.TabControl
    $TabControl.Multiline = $True
    $TabControl.Location = New-Object System.Drawing.Point(3, 3)
    $TabControl.Size = New-Object System.Drawing.Size(460, 464)
    $Form.Controls.Add($TabControl)

    $SelectionPage = New-Object System.Windows.Forms.TabPage
    $SelectionPage.UseVisualStyleBackColor = $True
    $SelectionPage.Text = "フォント選択"

    $AboutPage = New-Object System.Windows.Forms.TabPage
    $AboutPage.UseVisualStyleBackColor = $True
    $AboutPage.Text = "About"

    $TabControl.Controls.AddRange(@($SelectionPage,
                                    $AboutPage))

    $MessageLabel = New-Object System.Windows.Forms.Label
    $MessageLabel.Location = '8, 8'
    $MessageLabel.Size = '435, 30'
    $MessageLabel.Text = "インストールするフォントを選択し、OKをクリックしてください。`nインストール済みのフォントを選択した場合、再インストールされます。"
    $SelectionPage.Controls.Add($MessageLabel)

    $Panel = New-Object System.Windows.Forms.Panel
    $Panel.Location = '8, 38'
    $Panel.Size = '435, 340'
    $Panel.AutoScroll = $true
    $SelectionPage.Controls.Add($Panel)

    $checkboxes = New-Object System.Collections.Generic.List[System.Windows.Forms.Checkbox]
    $offset = 20
    foreach ( $font_info in $font_infos ) {
        $i = $font_infos.IndexOf($font_info)
        $font_info['files'] = @()
        $font_info['names'] = @()
        $installed_count = 0;
        $not_installed_count = 0;
        foreach ( $fonts in $font_info['fonts'] ) {
          foreach ( $font in $fonts ) {
            $font_info['files'] += $font['file']
            foreach ( $name in $font['names'] ) {
              if ( !($font_info['names'] -contains $name) ) {
                $font_info['names'] += $name
              }
              if ( $script:installed_font_names -contains $name ) {
                $installed_count++
              } else {
                $not_installed_count++
              }
            }
          }
        }

        $CheckBox = New-Object System.Windows.Forms.Checkbox
        $CheckBox.Location = New-Object System.Drawing.Point(8, $offset)
        $CheckBox.Size = New-Object System.Drawing.size(300, 16)
        $offset += 16
        if ( $not_installed_count -eq 0 ) {
            #$SelectionCheckedList.Items.Insert($i, ($font_info['name'] + '（インストール済）'))
            $CheckBox.Text = ($font_info['name'] + '（インストール済）')
            $CheckBox.ForeColor = 'Blue'
        } elseif ( $installed_count -gt 0 ) {
            $CheckBox.Text = ($font_info['name'] + '（一部インストール済）')
        } else {
            $CheckBox.Text = $font_info['name']
        }
        $Panel.Controls.Add($CheckBox)
        $checkboxes.Insert($i, $CheckBox)
    }
  
    $SelectionOpenPageButton = New-Object System.Windows.Forms.Button
    $SelectionOpenPageButton.Location = New-Object System.Drawing.Point(8, 384)
    $SelectionOpenPageButton.Size = New-Object System.Drawing.Size(435, 24)
    $SelectionOpenPageButton.Text = "フォントプレビューサイトを開く"
    $SelectionOpenPageButton.Add_Click(
        {
            start 'http://www.pseudo-hacks.com/fonts/'
        }
    )
    $SelectionPage.Controls.Add($SelectionOpenPageButton)

    $SelectionOpenPageButton = New-Object System.Windows.Forms.Button
    $SelectionOpenPageButton.Location = New-Object System.Drawing.Point(8, 411)
    $SelectionOpenPageButton.Size = New-Object System.Drawing.Size(435, 24)
    $SelectionOpenPageButton.Text = "コントロールパネルのフォントを開く"
    $SelectionOpenPageButton.Add_Click(
        {
            Show-ControlPanelItem -CanonicalName "Microsoft.Fonts"
        }
    )
    $SelectionPage.Controls.Add($SelectionOpenPageButton)

    <# About #>
    $AppNameLabel = New-Object System.Windows.Forms.Label
    $AppNameLabel.Location = '150, 20'
    $AppNameLabel.Size = '260, 24'
  	$AppNameLabel.Text = $software_name
    $AppNameLabel.Font = New-Object System.Drawing.Font("Courier New", 16, [System.Drawing.FontStyle]::Bold)
    $AboutPage.Controls.Add($AppNameLabel)

    $CopyrightLabel = New-Object System.Windows.Forms.Label
    $CopyrightLabel.Location = '70, 50'
    $CopyrightLabel.Size = '400, 24'
  	$CopyrightLabel.Text = 'Copyright © 2016 pseudo-hacks.com All Rights Reserved.'
    $AboutPage.Controls.Add($CopyrightLabel)

    $LinkLabel = New-Object System.Windows.Forms.LinkLabel
    $LinkLabel.Location = '100, 76'
    $LinkLabel.Size = '300, 24'
    $LinkLabel.LinkColor = "BLUE"
    $LinkLabel.ActiveLinkColor = "RED"
    $LinkLabel.Text = 'http://www.pseudo-hacks.com/w10fontinst/'
    $LinkLabel.add_Click({[system.Diagnostics.Process]::start('http://www.pseudo-hacks.com/w10fontinst/') }) 
    $AboutPage.Controls.Add($LinkLabel)

    $LicenseTextBox = New-Object System.Windows.Forms.TextBox
    $LicenseTextBox.Location = '8, 110'
    $LicenseTextBox.Size = '435, 180'
    $LicenseTextBox.Multiline = $True
    $LicenseTextBox.Text = "This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>."
    $LicenseTextBox.ReadOnly = $true
    $AboutPage.Controls.Add($LicenseTextBox)

    $CustomButton = New-Object System.Windows.Forms.Button
    $CustomButton.Location = New-Object System.Drawing.Point(8, 300)
    $CustomButton.Size = New-Object System.Drawing.Size(435, 26)
    $CustomButton.Text = "Windows 10プライバシー対策＆簡単設定アプリ「w10custom」を起動する"
    $CustomButton.Add_Click(
        {
          Start-Job { iex -Command ('$invoked_from = "w10fontinst";' + ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/pseudo-hacks/w10custom/master/w10custom.ps1'))) }
        }
    )
    $AboutPage.Controls.Add($CustomButton)
    if ( $invoked_from -eq 'w10custom' ) {
        $CustomButton.Enabled = $false
    }
 
    
    $Form.ShowDialog() | Out-Null
}

disclaimer
check_admin
fontinst_form

try {
    $mutexObject.ReleaseMutex()
    $mutexObject.Close()
} catch { }