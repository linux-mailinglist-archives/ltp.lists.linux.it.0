Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1065929680
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 13:03:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6E773EA6A6
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 13:03:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5EDBF3EA378
 for <ltp@lists.linux.it>; Fri, 24 May 2019 13:03:43 +0200 (CEST)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7ABCE200FF3
 for <ltp@lists.linux.it>; Fri, 24 May 2019 13:03:42 +0200 (CEST)
Received: by mail-yw1-xc43.google.com with SMTP id e68so3478966ywf.3
 for <ltp@lists.linux.it>; Fri, 24 May 2019 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CLTgj+oJJMQrR7FqN4Msv/qfsxP4CDwWBV4suZN4yVU=;
 b=QNQipI1CNnxYU2mm0CUU54/BgcDx2tBAQaJG9BT//jPcEwCaEdV4TWd9ssxXC9wQTf
 jniZOMMqzaQ4ugqAEZg8EH0R4vW7eLmL+yAHF3f+SZq1XRlWWIk+NfdzEL3xIre+w48c
 9QRPRCLZCMkskxzLUILnAvzmtEy713cL6YQPZtR146XyNAxAz+Jk43Wj9ktq+HBUckGx
 3FVLnDoGQteXE+EoO6mj9ULLiAhzWL7gIPNvDqf42dPAK/thVILuWv1zOfl8aVnq7apt
 sD8I1MbouunuLJAVjkQynljjhTWMas4v7CgwlvRCievpu71s0r2yPHJe2nUsqUPgMBDg
 rXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CLTgj+oJJMQrR7FqN4Msv/qfsxP4CDwWBV4suZN4yVU=;
 b=Dz/R38zFkmobQ/103Sah7nkjLbN1EN6gVW9PEubC1shdsUqFreZ5F6b4QMpbBM+aE+
 f2vxO8iIpa4HQlINLztwcA1kQJNCSiqidYQp+ZKcRPw+1ukc6smx4JE6zJUmQmpKlAEc
 NMIsdcXggaIJzd3OWrcT0fpUe3qGfn3oXNR1Zhui0Kl8cfKediz4lM7wBLCivI/3EDas
 Q4oHv0xuGvFZAdoYml7Ow//fJ2y2ARmjysQB7KHyhpAgEhmklTXl605xPgHvyb+ZgqSn
 eW5GOIpwwFUxSdtXoUSQKVs6wA1rftC7BfiJ7QbUc/uzzyxIkGR9aeLXnlwCAkmM93gH
 EoNQ==
X-Gm-Message-State: APjAAAWm572M3JO/OBdFA09M7mtFVuv9zN747n6ot1FhIxK/btgTn6Xi
 TWR47iWlrYbaPIOejnlT10fHq+bIkiSgEXOjEyY=
X-Google-Smtp-Source: APXvYqxTURix+nIP+PUOK55KnWNxBaHkAbA0X088QxUq9OtQQOwtFIwHaaLXkTYxezTIIglL+g8SW+tGNdZsFPsmUvY=
X-Received: by 2002:a81:9ac7:: with SMTP id
 r190mr34574631ywg.183.1558695821275; 
 Fri, 24 May 2019 04:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190523134549.23103-1-chrubis@suse.cz>
 <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
 <20190524085947.GA11508@rei.lan>
In-Reply-To: <20190524085947.GA11508@rei.lan>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 24 May 2019 14:03:29 +0300
Message-ID: <CAOQ4uxj3X2Eh+RmzunW1Sb8PWrHWsS1_h-xEH2Bofcr+-S-tiA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, ltp@lists.linux.it,
 Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [LTP] [PATCH] [COMMITTED] syscalls/fcntl33: Fix typo overlapfs
	-> overlayfs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTE6NTkgQU0gQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1
c2UuY3o+IHdyb3RlOgo+Cj4gSGkhCj4gPiA+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zj
bnRsL2ZjbnRsMzMuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9mY250bC9mY250bDMzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zj
bnRsL2ZjbnRsMzMuYwo+ID4gPiBpbmRleCA0M2RjNWEyYWYuLjYyNzgyM2M1YyAxMDA2NDQKPiA+
ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKPiA+ID4g
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKPiA+ID4gQEAg
LTExNyw3ICsxMTcsNyBAQCBzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2lnbmVkIGludCBpKQo+ID4g
PiAgICAgICAgIGlmIChUU1RfUkVUID09IC0xKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAo
dHlwZSA9PSBUU1RfT1ZFUkxBWUZTX01BR0lDICYmIFRTVF9FUlIgPT0gRUFHQUlOKSB7Cj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9yZXMoVElORk8gfCBUVEVSUk5PLAo+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmY250bChGX1NFVExFQVNFLCBGX1dSTENL
KSBmYWlsZWQgb24gb3ZlcmxhcGZzIGFzIGV4cGVjdGVkIik7Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgImZjbnRsKEZfU0VUTEVBU0UsIEZfV1JMQ0spIGZhaWxlZCBvbiBv
dmVybGF5ZnMgYXMgZXhwZWN0ZWQiKTsKPiA+Cj4gPiBZb3UgaGF2ZSAzIG1vcmUgb2YgdGhpcyB0
eXBvIGluIGZjbnRsIHRlc3RzLgo+Cj4gQWgsIHJpZ2h0LCBJIHNob3VsZCBoYXZlIGRvbmUgZ2l0
IGdyZXAgYmVmb3JlIGNvbW1pdGluZyB0aGlzLiBJIHdpbGwgZml4Cj4gdGhhdCByaWdodCBhd2F5
Lgo+Cj4gPiBJZiB5b3UgYXNrIG1lLCBzaWxlbmNpbmcgdGhpcyBlcnJvciBzZWVtcyB3cm9uZy4K
PiA+IFdoaWxlIHRoZSBlcnJvciBpcyAqZXhwZWN0ZWQqIGl0IGlzIHN0aWxsIGEgYnJva2VuIGlu
dGVyZmFjZS4KPiA+IEl0IG1heSBiZSBqdXN0IGEgbWF0dGVyIG9mIHRlcm1pbm9sb2d5LCBidXQg
SSBhbSByZWFkaW5nIHRoaXMgbWVzc2FnZSBhczoKPiA+Cj4gPiBURVNUIFBBU1NFRDogT3Zlcmxh
eWZzIGZhaWxlZCBhcyBleHBlY3RlZAo+ID4KPiA+IFdoaWxlIGl0IHJlYWxseSBzaG91bGQgYmUg
bW9yZSBhbG9uZyB0aGUgbGluZXMgb2Y6Cj4gPgo+ID4gVEVTVCBTS0lQUEVEOiBPdmVybGF5ZnMg
ZG9lc24ndCBzdXBwb3J0IHdyaXRlIGxlYXNlZAo+Cj4gQWdyZWVkLCBJJ20gYWx3YXlzIGFnYWlu
c3Qgd29ya2luZyBhcm91bmQga2VybmVsIGJ1Z3MvZGVmaWNpZW5jaWVzIGluCj4gdGVzdHMsIHVu
Zm9ydHVuYXRlbHkgdGhhdCB1c3VhbGx5IGNvbmZsaWN0cyB3aXRoIFFBIGRlcGFyZW5tZW50cyB0
aGF0Cj4gd2FudHMgdG8gc2tpcCBrbm93biBwcm9ibGVtcyBhbmQgaGF2ZSBldmVyeXRoaW5nIGdy
ZWVuLiBTbyB3ZSB1c3VhbGx5Cj4gZW5kIHVwIHNvbWV3aGVyZSBpbiBhIG1pZGRsZSBncm91bmQu
CgpCdXQgaXMgZXZlcnl0aGluZyBncmVlbiB0aG91Z2g/CkRvZXMgUUEgZGVwYXJ0bWVudCBrbm93
IHRoYXQgaWYgeW91IHJ1biBzYW1iYSBpbnNpZGUgYSBjb250YWluZXIKd2hvc2Ugc3RvcmFnZSBk
cml2ZXIgaXMgb3ZlcmxheWZzLCBpZiBzYW1iYSBpcyBjb25maWd1cmVkIHdpdGgKImtlcm5lbCBv
cGxvY2sgPSB5ZXMiClNhbWJhIGNsaWVudHMgd291bGQgbmV2ZXIgYmUgYWJsZSB0byBhY3F1aXJl
IGFuIG9wbG9jayBhbmQKd3JpdGUgcGVyZm9ybWFuY2Ugd291bGQgYmUgaG9ycmlibGU/CgpTdXJl
LCBub3QgZXZlcnlvbmUgY2FyZXMgYWJvdXQgdGhpcyBjYXNlLCBidXQgc2VlbXMgdG8gYmUgdGhh
dApzaWxlbmNpbmcgdGhlIGVycm9yIHNob3VsZCBiZSBpbiB0aGUgaGFuZHMgb2YgdGhlIHVzZXIg
YW5kIHRoYXQgTFRQCnByb2plY3Qgc2hvdWxkIGp1c3QgcmVwb3J0IHRoZSBwcm9ibGVtcyBhcyB0
aGV5IGFyZS4KCldvcnNlIGlzIHRoZSBmYWN0IHRoYXQgdGhpcyBlcnJvciB3aWxsIG9ubHkgdHJp
Z2dlciBmb3IgcGVvcGxlIHRoYXQKY29uZmlndXJlZCBMVFAgdG8gdGVzdCBvdmVybGF5ZnMgc3Bl
Y2lmaWNhbGx5LCBub3QgYWxsIExUUCB1c2Vycy4KVGhpcyBncm91cCBvZiB1c2VycyBpcyBldmVu
IG1vcmUgbGlrZWx5IHRvIGJlIGludGVyZXN0ZWQgaW4KYnVncy9kZWZpY2llbmNpZXMgb2Ygb3Zl
cmxheWZzLgoKPgo+IEFsc28gYXMgdXN1YWxsLCBkbyB5b3UgY2FyZSBlbm91Z2ggdG8gc2VuZCBh
IHBhdGNoPyA6LSkKCk5vLCBub3QgeWV0LgpHaXZlIG1lIGEgZmV3IGRheXMgdG8gY29vay4KV2hl
biBJIGdldCB0byBjYXJpbmcgZW5vdWdoIEkgd2lsbCBmaXggdGhlIGtlcm5lbCA7LSkKCj4KPiA+
IEJlc2lkZXMsIHRoaXMgcHJvYmxlbSBsb29rcyBxdWl0ZSBlYXN5IHRvIGZpeC4KPiA+IEkgdGhp
bmsgQnJ1Y2Ugd2FzIGFscmVhZHkgbG9va2luZyBhdCBjaGFuZ2luZyB0aGUgaW1wbGVtZW50YXRp
b24gb2YKPiA+IGNoZWNrX2NvbmZsaWN0aW5nX29wZW4oKSwgc28gaWYgdGhlIHRlc3QgaXMgbm90
IGZhaWxpbmcsIG5vYm9keSBpcyBnb2luZyB0bwo+ID4gbnVkZ2UgZm9yIGEgZml4Li4uCj4KPiBP
bmNlIGl0J3MgZml4ZWQgd2UgY2FuIGNoYW5nZSB0aGF0IHRvIGEgZmFpbHVyZSBmb3IgbmV3IGVu
b3VnaCBrZXJuZWxzLAo+IG9sZCBvbmVzIHNob3VsZCBwcm9iYWJseSBzdGF5IHdpdGggU0tJUFBF
RC9UQ09ORi4KPgoKVGhpcyB0b28gd291bGQgYmUgd3JvbmcgcHJhY3RpY2UgSU1PLgpJZiBzdGFi
bGUga2VybmVsIHVzZXJzIHNlZSB0aGF0IHRoZSB0ZXN0IHBhc3NlcyBvbiBtYWlubGluZSBhbmQg
ZmFpbHMKb24gb2xkIGtlcm5lbCwgc29tZWJvZHkgbWF5IGdldCB0aGUgaWRlYSB0byBiYWNrcG9y
dCB0aGUgZml4IHRvIHN0YWJsZSBrZXJuZWwKYW5kIGZpeCB0aGUgYnVnLgpJT1csIHNldHRpbmcg
bWluX2t2ZXIgaXMgYSB0b29sIHRoYXQgc2hvdWxkIGJlIHJlc2VydmVkIElNTyB0byBzaXR1YXRp
b25zCndoZXJlOgoxLiBUaGUgaW50ZXJmYWNlL2Z1bmN0aW9uYWxpdHkgZG9lcyBub3QgZXhpc3Qg
LU9SLQoyLiBUaGUgbWFpbnRhaW5lcnMgaGF2ZSBtYWRlIGl0IGNsZWFyIHRoYXQgdGhlIGZpeCB3
aWxsIG5vdCBiZSBiYWNrcG9ydGVkCgpBbnl3YXksIGp1c3QgbXkgUE9WLgpJIGZ1bGwgdW5kZXJz
dGFuZCB0aGUgcmVhc29ucyBmb3IgdGhlICJhbGwgZ3JlZW4iIG1ldGhvZG9sb2d5LgoKVGhhbmtz
LApBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
