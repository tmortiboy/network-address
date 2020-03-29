{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Data.PunycodeSpec (spec) where

import           Data.ByteString (ByteString)
import           Data.Text (Text)
import           Test.Hspec (Spec, context, parallel, shouldBe)
import           Test.Hspec.QuickCheck (prop)
import           Test.QuickCheck (Arbitrary(..), elements)

import           Data.Punycode (decodePunycode, encodePunycode)

spec :: Spec
spec = parallel $ do

  context "encodePunycode" $

    prop "Should encode Unicode to Punycode" $ \UnicodePunycode{..} ->
      encodePunycode _upUnicode `shouldBe` _upPunycode

  context "decodePunycode" $

      prop "Should decode Punycode to Unicode" $ \UnicodePunycode{..} ->
        decodePunycode _upPunycode `shouldBe` Right _upUnicode

data UnicodePunycode = UnicodePunycode
  { _upUnicode  :: Text
  , _upPunycode :: ByteString }
  deriving (Eq, Show)

instance Arbitrary UnicodePunycode where
  arbitrary = uncurry UnicodePunycode <$> elements
    [ ("👪🇬🇧", "f77hja72q")
    , ("💩", "ls8h")
    , ("lets🎉", "lets-tp53c")
    , ("कॉम", "11b4c3d")
    , ("セール", "1ck2e1b")
    , ("佛山", "1qqw23a")
    , ("ಭಾರತ", "2scrj9c")
    , ("慈善", "30rr7y")
    , ("集团", "3bst00m")
    , ("在线", "3ds443g")
    , ("한국", "3e0b707e")
    , ("ଭାରତ", "3hcrj9c")
    , ("大众汽车", "3oq18vl8pn36a")
    , ("点看", "3pxu8k")
    , ("คอม", "42c2d9a")
    , ("ভাৰত", "45br5cyl")
    , ("ভারত", "45brj9c")
    , ("八卦", "45q11c")
    , ("موقع", "4gbrim")
    , ("বাংলা", "54b7fta0cc")
    , ("公益", "55qw42g")
    , ("公司", "55qx5d")
    , ("香格里拉", "5su34j936bgsg")
    , ("网站", "5tzm5g")
    , ("移动", "6frz82g")
    , ("我爱你", "6qq986b3xl")
    , ("москва", "80adxhks")
    , ("қаз", "80ao21a")
    , ("католик", "80aqecdr1a")
    , ("онлайн", "80asehdb")
    , ("сайт", "80aswg")
    , ("联通", "8y0a063a")
    , ("срб", "90a3ac")
    , ("бг", "90ae")
    , ("бел", "90ais")
    , ("קום", "9dbq2a")
    , ("时尚", "9et52u")
    , ("微博", "9krt00a")
    , ("淡马锡", "b4w605ferd")
    , ("ファッション", "bck1b9a5dre4c")
    , ("орг", "c1avg")
    , ("नेट", "c2br7g")
    , ("ストア", "cck2b3b")
    , ("삼성", "cg4bki")
    , ("சிங்கப்பூர்", "clchc0ea0b2g2a9gcd")
    , ("商标", "czr694b")
    , ("商店", "czrs0t")
    , ("商城", "czru2d")
    , ("дети", "d1acj3b")
    , ("мкд", "d1alf")
    , ("ею", "e1a4c")
    , ("ポイント", "eckvdtc9d")
    , ("新闻", "efvy88h")
    , ("工行", "estv75g")
    , ("家電", "fct429k")
    , ("كوم", "fhbei")
    , ("中文网", "fiq228c5hs")
    , ("中信", "fiq64b")
    , ("中国", "fiqs8s")
    , ("中國", "fiqz9s")
    , ("娱乐", "fjq720a")
    , ("谷歌", "flw351e")
    , ("భారత్", "fpcrj9c3d")
    , ("ලංකා", "fzc2c9e2c")
    , ("電訊盈科", "fzys8d69uvgm")
    , ("购物", "g2xx48c")
    , ("クラウド", "gckr3f0f")
    , ("ભારત", "gecrj9c")
    , ("通販", "gk3at1e")
    , ("भारतम्", "h2breg3eve")
    , ("भारत", "h2brj9c")
    , ("भारोत", "h2brj9c8c")
    , ("网店", "hxt814e")
    , ("संगठन", "i1b6b1a6a2e")
    , ("餐厅", "imr513n")
    , ("网络", "io0a7i")
    , ("ком", "j1aef")
    , ("укр", "j1amh")
    , ("香港", "j6w193g")
    , ("诺基亚", "jlq61u9w7b")
    , ("食品", "jvr189m")
    , ("飞利浦", "kcrx77d1x4a")
    , ("台湾", "kprw13d")
    , ("台灣", "kpry57d")
    , ("手表", "kpu716f")
    , ("手机", "kput3i")
    , ("мон", "l1acc")
    , ("الجزائر", "lgbbat1ad8j")
    , ("عمان", "mgb9awbf")
    , ("ارامكو", "mgba3a3ejt")
    , ("ایران", "mgba3a4f16a")
    , ("العليان", "mgba7c0bbn0a")
    , ("اتصالات", "mgbaakc7dvf")
    , ("امارات", "mgbaam7a8h")
    , ("بازار", "mgbab2bd")
    , ("موريتانيا", "mgbah1a3hjkrd")
    , ("پاکستان", "mgbai9azgqp6j")
    , ("الاردن", "mgbayh7gpa")
    , ("موبايلي", "mgbb9fbpob")
    , ("بارت", "mgbbh1a")
    , ("بھارت", "mgbbh1a71e")
    , ("المغرب", "mgbc0a9azcg")
    , ("ابوظبي", "mgbca7dzdo")
    , ("السعودية", "mgberp4a5d4ar")
    , ("ڀارت", "mgbgu82a")
    , ("كاثوليك", "mgbi4ecexp")
    , ("سودان", "mgbpl2fh")
    , ("همراه", "mgbt3dhd")
    , ("عراق", "mgbtx2b")
    , ("مليسيا", "mgbx4cd0ab")
    , ("澳門", "mix891f")
    , ("닷컴", "mk1bu44c")
    , ("政府", "mxtq1m")
    , ("شبكة", "ngbc5azd")
    , ("بيتك", "ngbe9e0a")
    , ("عرب", "ngbrx")
    , ("გე", "node")
    , ("机构", "nqv7f")
    , ("组织机构", "nqv7fs00ema")
    , ("健康", "nyqy26a")
    , ("ไทย", "o3cw4h")
    , ("سورية", "ogbpf8fl")
    , ("招聘", "otu796d")
    , ("рус", "p1acf")
    , ("рф", "p1ai")
    , ("珠宝", "pbt977c")
    , ("تونس", "pgbs0dh")
    , ("大拿", "pssy2u")
    , ("みんな", "q9jyb4c")
    , ("グーグル", "qcka1pmc")
    , ("ελ", "qxam")
    , ("世界", "rhqv96g")
    , ("書籍", "rovu88b")
    , ("ഭാരതം", "rvc1e0am3e")
    , ("ਭਾਰਤ", "s9brj9c")
    , ("网址", "ses554g")
    , ("닷넷", "t60b56a")
    , ("コム", "tckwe")
    , ("天主教", "tiq49xqyj")
    , ("游戏", "unup4y")
    , ("vermögensberater", "vermgensberater-ctb")
    , ("vermögensberatung", "vermgensberatung-pwb")
    , ("企业", "vhquv")
    , ("信息", "vuq861b")
    , ("嘉里大酒店", "w4r85el8fhu5dnra")
    , ("嘉里", "w4rs40l")
    , ("مصر", "wgbh1c")
    , ("قطر", "wgbl6a")
    , ("广东", "xhq521b")
    , ("இலங்கை", "xkc2al3hye2a")
    , ("இந்தியா", "xkc2dl3a5ee0h")
    , ("հայ", "y9a3aq")
    , ("新加坡", "yfro4i67o")
    , ("فلسطين", "ygbi2ammx")
    , ("政务", "zfr164b")
    ]