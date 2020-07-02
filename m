Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD1212304
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 14:15:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4F8E3C2A5D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 14:15:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CEFF63C074B
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 14:15:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 46F09601CBD
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 14:15:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B831B327E;
 Thu,  2 Jul 2020 12:15:22 +0000 (UTC)
To: Li Wang <liwang@redhat.com>
References: <20200701151456.851-1-mdoucha@suse.cz>
 <20200701151456.851-2-mdoucha@suse.cz>
 <CAEemH2f2D9xBYxeQ33w0thxZFpkSHK3gn1bBQWMZSA=X5y-AWQ@mail.gmail.com>
From: Martin Doucha <mdoucha@suse.cz>
Autocrypt: addr=mdoucha@suse.cz; keydata=
 mQINBF1D6M0BEAC5BHC0NuN/v+UBXDYuwuYeAJA4leuKz0H76YBevziJKUtnzMsBA+GT9vdH
 bs60wdsTbBJ1XqmQ/HWDPBV0OIGox195GSZQFblKOY1YoFXV6cv9Kyw4LyYeqozRhGx8NuE8
 +qC62nuV97k7GgiDE8onWfPd7wsLBdavZO7qgxRTqbjnf/hReHCPqcts3QEYaLaL5eCfW9gY
 6m8wGuF3k7xg7z591dkI7Xfu5rB5IhFcZGLIc+Q1RNEYz+OBP+MnNUSrGPdbFOIgd2jyYRFR
 npj+OkrPFaZvteQvj8GCwPv/HIStRM9gW6RTGIVw2fTMGGCQb2Jp7Fq51GkKIECRnlhQVJ11
 CIndtWP8p2NoxcWA0GH1Y1jjWcV+YvbtflFTQAwsJ5wIiZYvaHhN8VQlS5o1wCjSjPSAzlId
 XaN3BqM0w2su/dH9EqVZsGee04U2ZqNfrRmGfUICW6XDZRP2ozlJEKHNO0ZZqRt5bjFaelAf
 X1MgkyDFUikAkstZ6MErt89DlegUNo6GQqAYtk5675HXUbIND0l9foKGvAjuPA+xf3is2Uqj
 XC5+DtswSOh3UV+3I8QEB1nTnq1qq9yswbT0vrnwiRw0F4jNCsbSXkTUeIb+kcJp10Ov4TeM
 4jzV1tNtinI3U9eB4sMj165EAFO4B25/6e7c0jFDHVvwcOZKZQARAQABtB9NYXJ0aW4gRG91
 Y2hhIDxtZG91Y2hhQHN1c2UuY3o+iQJUBBMBCAA+FiEEFQyxgp89HCoFzxM584srZkRBd9kF
 Al1D6M0CGyMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ84srZkRBd9lXJw//
 d/9S4ZYfjqAlZnVVsr6lKxkZ9bpK5HafnPITkNVmAsOTFndUAwyu2TEGCv5yedGfedFOcFy7
 JWdDhqNkPg2xLUhEf37T/rmoWxW7PrLKx+D1ewiSIyfFAQQBJD/6RjTLfRPUQQLCEyZ31Y50
 6xoGMx21YM2jq7RByKzYR01Bs5u96av5kGR5wNqb2jh/E0Fo1jiPvLSn7HKYY0UEjOEafkmj
 mfUnlBKwbHBbHOOegNlGPHMdil4RlaxRufL6OgSdKM0Dk81ctlUK3C2prmEAN9hPpwi/aDfP
 IcfJ6GN3EMaMPmfCr1YavuD3bGfyIU7bjUyPQfADbFFybPJ2BLVc0T9qAQqI7r2nkI99zqTC
 Cd7bZYXvNVgUTKtxhapsZ++1+UI7XJ6rwmS5kmE56bNugIXrB+84ROoqlWp4ZHZ2Bm5b96o8
 uiDcCKfoj+bh9PAdGPqaL3GCAKyP6ApbEIU5FQLawTdVBCeINNplLjePnZ6aY/LTny8fOZpp
 FJwP6+TuEOzXLOKgtfVDWW5mpyxQhSw+hES1o+IqTY8UN1vCSw6EwuFRA3fpMkC5L38sL0EE
 3gAh1+CT1krfE3pdL+pL3LAJc2DJXc14mF1DH2hdz0Dy8yucc76ypHqJAHPgPc+qidYq3b09
 EpWloNx1yZ1YH/UtEx+TtJBo0fvPhrABbG25Ag0EXUPozQEQAL81/TIX7o/+C+8SnyIHm71Z
 e0dDpXXREkQMmrrYbLE7DiFpXK+1JVm39mESmEIIZORyMVGLkG49wXsfTxVkFdk4IRjRNyXz
 wSkzo7CF1ORC4Jo0CtumNDyIU464uDHdK91AOWW2OwlTfcsUgA5PKM3w4HPbc4MBd/u6YX5Q
 8HSBWbLrxNE59BBbyUBFeLiLzr0afnyvPPYc2nMIw8TxcA1UfsQz1uBHq8XE2/XjoSUoThhB
 qGdQlWWRGBI/rElz7IJhwbRx+cw5Lgxc9JRG63gelMGLHHAgRiTrajalJXJQA9oDDUk/Qunc
 2wh2MkUafJfvOR4U1YM+dTCc78+xSuG57/aatdkI1iRuyJbkM1MfvSVnmWr69JytGc/ZlDCm
 CdwV8OCTX7zZL+1xfQXBSmuHkbe68j3Mk41ZWegi95RAu5mCvCeDjv2ki+Snez4p3USkY0R4
 lVDKNnmCy9ZZrR/YHXgj+sDi2hRB05VT27NayMWB8ywMuD1bxV93NhZKx3/JliQyCDg9fUBc
 5aLG51Has+y16AdcN8XYeFAOL8K/36PNeTAS4vlYZPPiIja4fD/VUswO8jns713ZxTWPou+v
 0pV/5jykprWwIy+jNv6Dbor/JKjcG0GxnHb8U0xMIFv4/DIqzOG1pkERR+Hmg7YvpIlVokfo
 Hkvu5qs5xOrzABEBAAGJAjwEGAEIACYWIQQVDLGCnz0cKgXPEznziytmREF32QUCXUPozQIb
 DAUJCWYBgAAKCRDziytmREF32XWvD/0fuW2SC3dOOk1XhHua2JOezT1HQpxyFpCNPESRoL8N
 J1PCMyDWO4l7NhsAGbqCfA6a7XpsYpD3VC8kIZk/P3JOFM11OSUszK/pSUdiKuaURy6TAxFZ
 3FO9OZ016uJuBQ8J9qdpvcGRtNnyL9gOmvSWkUV4mHokJeQ4CFWV5A38vg1EGpR49UOm6RhH
 LDyXxng1uJ58RuaXRAUvM/RG0vg7O2+4TP/IelhKGIYtNc4louyPZEAjaXJ3eNt4Selo5RFe
 uCl8/k6dNvUc3ZWUxd5CISdwn0GsVbCBnpYDhPgoCEbP30Sr+Jdo8asicZ3XUhQ0aPFLb7D0
 IMfRwEkXUK0LvwnBJ2hTtLZRxrqusibeRSj14j0xAuEsDZD3VbMD7fnlTDSyjdY0ghHygq/5
 YchPWWq+T2P32r/hxymkw0EiQptA13TElxj13Pbc2hP+e0SoEKFkHfyb63rik3dlPmxGk5eM
 Rz4zFhW8KQ9+zrae5rL/6vwz3d/MpEeOmDm9uutE6xyzXRl/RxeFZ8P7KlACXWm7VjSyc74E
 eCNL6GOOeqzE77fDcBf4HvNGn8w7IX/FvNzmu78wzT2MDwMi8ug8T4KEKzIYUIRibe7cl0LG
 2dSj02pOT7E5/x4gKQB/OZqnTTQxJ0OL8BJKNFeSYqaMzKFKiYaArwuFkGnCknwh5A==
Message-ID: <d0bd1421-500a-bc84-bd0a-7b5f25ade684@suse.cz>
Date: Thu, 2 Jul 2020 14:09:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2f2D9xBYxeQ33w0thxZFpkSHK3gn1bBQWMZSA=X5y-AWQ@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Add test for CVE 2017-1000405
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMDIuIDA3LiAyMCAxMTo0OCwgTGkgV2FuZyB3cm90ZToKPiAKPiBNYXJ0aW4gRG91Y2hhIDxt
ZG91Y2hhQHN1c2UuY3ogPG1haWx0bzptZG91Y2hhQHN1c2UuY3o+PiB3cm90ZToKPiAKPiAgICAg
Li4uCj4gICAgICtzdGF0aWMgdm9pZCAqYWxsb2NfemVyb19wYWdlKHZvaWQgKmJhc2VhZGRyKQo+
ICAgICArewo+ICAgICArwqAgwqAgwqAgwqBpbnQgaTsKPiAgICAgK8KgIMKgIMKgIMKgdm9pZCAq
cmV0Owo+ICAgICArCj4gICAgICvCoCDCoCDCoCDCoC8qIEZpbmQgYWxpZ25lZCBjaHVuayBvZiBh
ZGRyZXNzIHNwYWNlLiBNQVBfSFVHRVRMQiBkb2Vzbid0Cj4gICAgIHdvcmsuICovCj4gICAgICvC
oCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgPCAxNjsgaSsrLCBiYXNlYWRkciArPSB0aHBfc2l6ZSkg
ewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBtbWFwKGJhc2VhZGRyLCB0aHBf
c2l6ZSwgUFJPVF9SRUFELAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBNQVBfUFJJVkFURSB8IE1BUF9BTk9OWU1PVVMsIC0xLCAwKTsKPiAKPiAKPiBJJ20gd29uZGVy
aW5nIHdoeSBoZXJlIHJlcXVlc3QgdGhlIFJFQUQgT05MWSBtZW1vcnksIHNob3VsZG4ndCB3ZSB3
cml0ZQo+IHNvbWV0aGluZyBpbnRvIHRoZSB3cml0ZV90aHAgbG9vcGluZ2x5IHRoZW4/CgpXZSBk
byB3cml0ZSBpbnRvIGl0LiBFeGNlcHQgd2UgZG8gaXQgdGhyb3VnaCAvcHJvYy9zZWxmL21lbSBm
aWxlCmRlc2NyaXB0b3IuIEkgZGlkbid0IHRyeSB3aXRoIFBST1RfV1JJVEUgYnV0IHByZXN1bWUg
dGhhdCBtYXBwaW5nIHRoZQptZW1vcnkgYXMgcmVhZC1vbmx5IGlzIGltcG9ydGFudCBmb3IgY29u
ZnVzaW5nIHRoZSBrZXJuZWwgaW50byB0aGlua2luZwp0aGF0IHRoZSBhZGRyZXNzIHNwYWNlIGRv
ZXNuJ3QgbmVlZCB0byBiZSBjb3BpZWQgb24gd3JpdGUuCgpOZXZlcnRoZWxlc3MsIEkndmUgdGVz
dGVkIHRoZSByZXByb2R1Y2VyIG9uIGEgdnVsbmVyYWJsZSBrZXJuZWwgYW5kIGl0CndvcmtzIHJl
bGlhYmx5LgoKLS0gCk1hcnRpbiBEb3VjaGEgICBtZG91Y2hhQHN1c2UuY3oKUUEgRW5naW5lZXIg
Zm9yIFNvZnR3YXJlIE1haW50ZW5hbmNlClNVU0UgTElOVVgsIHMuci5vLgpDT1JTTyBJSWEKS3Jp
emlrb3ZhIDE0OC8zNAoxODYgMDAgUHJhZ3VlIDgKQ3plY2ggUmVwdWJsaWMKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
