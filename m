Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B878D345BE
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 13:44:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91AB23EAB24
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 13:44:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DDABB3EAB02
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 13:44:37 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 083A5200B15
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 13:44:36 +0200 (CEST)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hY7rn-0007Y4-Lp
 for ltp@lists.linux.it; Tue, 04 Jun 2019 11:44:35 +0000
Received: by mail-wm1-f71.google.com with SMTP id b79so7454126wme.5
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 04:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Onqq2PoxG9MVNWHzG9eLz5geNbFRseZuh+iF9zNZLWE=;
 b=EkqrH3CJJosZUBrAPKZYfNpBCOHeFc44BefTsz5QeVxyyQL/fsKmL59vFtqNzQvmcd
 qNEK85y0Bs9+Vwxy5LjCOPyaqJfYBbHHBKnho6FNamhiPAv0J6yqA7CkSZRT3JwX10DH
 G/+TDfIq7BHX6ld0HrlowLx0jfQ0GJ1eDG4zk+crYXgvuivpPBfz+YJFdtFBx2BgB964
 B3kQafMP9DCuaFQ5wDa0YwytRFD2lBny3vVifFPvgThzL0RkQzwUllzloIN2Y1YOXNKA
 kYq6W4zto81cMw9zmfdodef7flxSdK/5HoOCSvdYM6GD3yJfKuMfXv09BF8SllA9AJHF
 Yz2w==
X-Gm-Message-State: APjAAAUcJ0jTDSyVFzrTWDYDz9IKyvTGYmKsqRqGQNEl2pMyjPoR/LqL
 yfy0lz7IZuHvwmeRLawS/hB9o7WB+GB8AT0H5UEHOP6EzX3yEGhsrDQ5DKVJU/SdQKub9OiVLD7
 hh7IPNct/UaOLlsyIqrgXPoTaOrI9iPVwQCiygemEROI=
X-Received: by 2002:a1c:c282:: with SMTP id s124mr6009882wmf.141.1559648675325; 
 Tue, 04 Jun 2019 04:44:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznGe8yG23SzpuxNNpOJwefcPTXSTNV3/G98ilFuV9MQzjrnL1e2JwFFnB80uOzfCeVp/+uFNXhuCHQM0LsVeY=
X-Received: by 2002:a1c:c282:: with SMTP id s124mr6009858wmf.141.1559648675062; 
 Tue, 04 Jun 2019 04:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMy_GT-kRs7_EZvrP-JdFc_wa8OMc3295N6FWUg7AxoY2O66fA@mail.gmail.com>
 <20190531083203.GA4224@rei.lan> <20190531094356.GC4224@rei.lan>
In-Reply-To: <20190531094356.GC4224@rei.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Tue, 4 Jun 2019 19:44:24 +0800
Message-ID: <CAMy_GT-80RtX=qkXJ0NYN-3eY_N+MiH5Xq5iPGm41y=d-n3CAA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] insmod01_sh test from commands test suite will make
 cve-2017-17053 test fail
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

SGVsbG8gQ3lyaWwsCgpZZXMgeW91J3JlIHJpZ2h0LCB0aGUgaW5zbW9kIHRlc3QgaXMgbm90IHRo
ZSBjYXVzZSBoZXJlLgoKSSBmb3VuZCBpdCdzIHRoZSBibG9ja19kZXYgdGVzdCBmcm9tIGtlcm5l
bF9taXNjLCB0aGUgbHRwX2Jsb2NrX2Rldgptb2R1bGUgaW5zZXJ0aW9uIHdpbGwgZmlyc3Qgc2V0
IHRoZSB0YWludCBmbGFnIHRvIDEyMjg4OgokIHN1ZG8gaW5zbW9kIGx0cF9ibG9ja19kZXYua28K
JCBjYXQgL3Byb2Mvc3lzL2tlcm5lbC90YWludGVkCjEyMjg4CgpCdXQgdGhlIHRlc3Qgd2lsbCBn
ZW5lcmF0ZSBrZXJuZWwgd2FybmluZ3MgYW5kIG1ha2UgaXQgMTI4MDAKJCBzdWRvIHJtbW9kIGx0
cF9ibG9ja19kZXYKJCBzdWRvIC4vYmxvY2tfZGV2CmJsb2NrX2RldiAgICAxICBUUEFTUyAgOiAg
VGVzdC1jYXNlICcxJwpibG9ja19kZXYgICAgMiAgVFBBU1MgIDogIFRlc3QtY2FzZSAnMicKYmxv
Y2tfZGV2ICAgIDMgIFRQQVNTICA6ICBUZXN0LWNhc2UgJzMnCmJsb2NrX2RldiAgICA0ICBUUEFT
UyAgOiAgVGVzdC1jYXNlICc0JwpibG9ja19kZXYgICAgNSAgVFBBU1MgIDogIFRlc3QtY2FzZSAn
NScKYmxvY2tfZGV2ICAgIDYgIFRQQVNTICA6ICBUZXN0LWNhc2UgJzYnCmJsb2NrX2RldiAgICA3
ICBUUEFTUyAgOiAgVGVzdC1jYXNlICc3JwokIGNhdCAvcHJvYy9zeXMva2VybmVsL3RhaW50ZWQK
MTI4MDAKCjEyODAwID0gMDAxMTAwMTAwMDAwMDAwMApUaGUgVyBmbGFnIGlzIGhlcmUuCgpUcmFj
ZXMgY291bGQgYmUgZm91bmQgaW4gZG1lc2c6Cmh0dHBzOi8vcGFzdGViaW4udWJ1bnR1LmNvbS9w
L2dwOVpESE5qNkovCgoKT24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgNTo0MyBQTSBDeXJpbCBIcnVi
aXMgPGNocnViaXNAc3VzZS5jej4gd3JvdGU6Cj4KPiBIaSEKPiA+ID4gQnVnTGluazogaHR0cHM6
Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xODMwMDExCj4gPgo+ID4gTG9va2luZyBhdCB0aGUg
YnVnIHRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIG1vZHVsZSBpcyBtaXNzaW5nIGxpY2Vuc2UuCj4g
Pgo+ID4gSSBndWVzcyB0aGF0IGFkZGluZyBNT0RVTEVfTElDRU5TRSgiR1BMIik7IHRvIHRoZSBk
dW1teSBtb2R1bGUKPiA+IHRlc3RjYXNlcy9jb21tYW5kcy9pbnNtb2QvbHRwX2luc21vZDAxLmMg
c2hvdWxkIGZpeCBpdC4KPgo+IEp1c3QgRllJLCB0aGUgbGljZW5jZSB0YWludCBmbGFnIGlzIG5v
dyBmaXhlZCBpbjoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRw
L2NvbW1pdC8zMDE1ZDU5MjMwMWVmMzdhZmUyZGVlMmRkYjAzYmUxMjZjZmZkNmY4Cj4KPiAtLQo+
IEN5cmlsIEhydWJpcwo+IGNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
