Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C98FD03B
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 22:20:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99DB53C1CAB
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 22:20:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 52F8F3C038C
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 22:20:15 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0274B602716
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 22:20:13 +0100 (CET)
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MsrV2-1hcAY037FY-00tAKg for <ltp@lists.linux.it>; Thu, 14 Nov 2019
 22:20:12 +0100
Received: by mail-qk1-f182.google.com with SMTP id h15so6317684qka.13
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 13:20:12 -0800 (PST)
X-Gm-Message-State: APjAAAUF0v7uC5bpsOpjnI7UdP03o0hyEPPlp0QK/mXEoLqB7ePdAX1K
 oPtMNjsm2vLYCYnt4WCMrWErJkSxbgTKS+6MByo=
X-Google-Smtp-Source: APXvYqwvbGGKgaEN2tVT8M3pORFRK5eVYAq7cO7ucFJgWS2Va7T/mC1UOJ5BKzS9tiqZXRDKKHfpMIlCIiEZKkBvWEc=
X-Received: by 2002:a37:44d:: with SMTP id 74mr9203611qke.3.1573766411510;
 Thu, 14 Nov 2019 13:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20191114193132.5de921a7@canb.auug.org.au>
 <CA+G9fYtpOaYDoUEzQuYxmKJLFH2GDvK3ipWienn-zHDB+nOMbg@mail.gmail.com>
 <247236994.12271471.1573762264445.JavaMail.zimbra@redhat.com>
In-Reply-To: <247236994.12271471.1573762264445.JavaMail.zimbra@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Nov 2019 22:19:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3tS+WAHj9SP7MhLq27-RTt0ExXjqiRA1uizhKsMe9hdg@mail.gmail.com>
Message-ID: <CAK8P3a3tS+WAHj9SP7MhLq27-RTt0ExXjqiRA1uizhKsMe9hdg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Provags-ID: V03:K1:h0e+P82CzfWVrj7q0jfUJRNch067TK49tm0YvwC3AvXUXRzz+F0
 Uh8gatwgyK7GuApiGkXwnOc6Ki7mn283z1zbiM0ozcK0Nf0LMKAddFvxBzx2mbWdYAnfAwc
 SwwsoeoMsL2urRjG3LuPM7mg0wiZu4N/7bZTXFiBGlo7aZ9ES3/dXm1kG3eTMW0kk93zAES
 M/j0VPQpnL706Gm8P4aPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4doJRbwZfyw=:Z00Q8DoXJu+OL54pLFJ7XJ
 lNFemTvO9Cov+1SCLoy5IoAi9C4Jrw9XvwKetx6VI9SWnP3/Fg8unzi/FnRhFYEl2RyakrY8v
 SKYIWpHXRUV5cPWJMU7ey40MsXi/UIFFh0aEHsdyfmFar0VdXv0i9zCYoRDPljfkSyU5k8MYf
 M4IiT271hMrbSMN5svKh1smITJLL3MFU2NQa7/VjknL/6Rd/s3hmYx1i3ArSoJemkUfqZIqm3
 +K/fGAfd+OGrYZU6LHQirFZYdv337oH4feGUSrngIBC9xaS1SSH/nrwUn/mriAY0DTIVncc1K
 vNX8uUmEpQcz2YMEyIl0pTiZLwd9gG5m42sMhibr3eaBQSxvZu12YWWjc4pV2DtAQuvHunwV5
 /bAeC0+fM5yo+6wwQqeOTbyKDThDMJ98iAtDa/oEDC6XtWDR+xWlKDZiXI+RBjExB/4sjpPak
 gQ0nY2NVL7b4bfmAikyvvjTzy2jOLsfGhFGImWAwK7b4IGOpvyT3XqmwKlb9GCo8FU1EClka0
 fCCBch6y0jLOaHplN/9axY9RTPcnC70N38gQG/pjkK4y460sTqX7f9COR16zct4/wHtxGC2Rn
 hNa4rqE8zKAIUPA9Ei+Enc8jwgY3F4ZPeg2tDwgcAxKQ4HRe1a/P8/C4xEsDyis8GqRvOHNrv
 98Ahnm6SBVF/aZ5z7HiiSLmb4iH7dn+N2Z1kRv/kUOBmHSru5zrWkB2ptrQlrywVibCBiMkCn
 Lg5ShHSTB7nw7oIOieoSI4DrYxX8IXUbjKNE3I6XE6oHxWr081HwgPNjrTYRtsl+z+gZpBTW7
 51CGiKarZ5oD5shSCr6s02kSmpjk7SloVfQxXcaCFkbaPkKmsTNJndAqIc9C0daPJ31G2sl2o
 3WhaUbyf5NyKQhFaty1w==
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] linux-next: Tree for Nov 14
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 John Stultz <john.stultz@linaro.org>, Mark Brown <broonie@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, linux-clk <linux-clk@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgOToxMSBQTSBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPgo+Cj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4g
T24gVGh1LCAxNCBOb3YgMjAxOSBhdCAxNDowMSwgU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIu
YXV1Zy5vcmcuYXU+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBhbGwsCj4gPiA+IENoYW5nZXMgc2lu
Y2UgMjAxOTExMTM6Cj4gPiA+IFRoZSB5MjAzOCB0cmVlIGdhaW5lZCBhIGJ1aWxkIGZhaWx1cmUg
Zm9yIHdoaWNoIEkgYXBwbGllZCBhIHBhdGNoLgo+ID4gPHRyaW0+Cj4gPiA+IFRoZSBha3BtLWN1
cnJlbnQgdHJlZSBnYWluZWQgYSBjb25mbGljdCBhZ2FpbnN0IHRoZSB5MjAzOCB0cmVlLgo+ID4g
Pgo+ID4gPiBOb24tbWVyZ2UgY29tbWl0cyAocmVsYXRpdmUgdG8gTGludXMnIHRyZWUpOiAxMDM4
OAo+ID4gPiAgOTIzOCBmaWxlcyBjaGFuZ2VkLCAzOTczNTcgaW5zZXJ0aW9ucygrKSwgMTc0MTcx
IGRlbGV0aW9ucygtKQo+ID4KPiA+IFJlc3VsdHMgZnJvbSBMaW5hcm/igJlzIHRlc3QgZmFybS4K
PiA+IFJlZ3Jlc3Npb25zIGRldGVjdGVkIG9uIHg4Nl82NCwgYW5kIGkzODYuCj4gPgo+ID4gTFRQ
IHN5c2NhbGxzIHNldHRpbWVvZmRheTAxLzAyIGZhaWxlZCBvbiB4ODZfNjQgYW5kIGkzODYgcnVu
bmluZwo+ID4gNS40LjAtcmM3LW5leHQtMjAxOTExMTQuCj4gPgo+ID4gRm9sbG93aW5nICBsdHAt
c3lzY2FsbHMtdGVzdHMgZmFpbGVkLgo+ID4gICAgICogc2V0dGltZW9mZGF5MDEKPiA+ICAgICAq
IHNldHRpbWVvZmRheTAyCj4gPiAgICAgKiBzdGltZTAxCj4gPiAgICAgKiBzdGltZTAyCj4KPiBM
b29rcyBsaWtlIHR5cG8gaW4KPiBhZGRlNzQzMDZhNGIgKCJ5MjAzODogdGltZTogYXZvaWQgdGlt
ZXNwZWMgdXNhZ2UgaW4gc2V0dGltZW9mZGF5KCkiKQo+Cj4gLSAgICAgICAgICAgICAgIGlmICgh
dGltZXZhbF92YWxpZCgmdXNlcl90dikpCj4gKyAgICAgICAgICAgICAgIGlmICh0di0+dHZfdXNl
YyA+IFVTRUNfUEVSX1NFQykKPgo+IHdhcyBsaWtlbHkgbWVhbnQgYXM6Cj4KPiAtICAgICAgICAg
ICAgICAgaWYgKCF0aW1ldmFsX3ZhbGlkKCZ1c2VyX3R2KSkKPiArICAgICAgICAgICAgICAgaWYg
KG5ld190cy50dl9uc2VjID4gVVNFQ19QRVJfU0VDKQo+Cj4gc2luY2UgdHYgaXMgdXNlciBwb2lu
dGVyLgo+CgpJIGhhdmUgdXBsb2FkZWQgYSBmaXhlZCB2ZXJzaW9uLCBzb3JyeSBmb3IgdGhlIGJy
ZWFrYWdlLiBUaGUgbmV3IHZlcnNpb24gYWxzbwphZGRyZXNzZXMgdGhlIGJ1aWxkIGZhaWx1cmUg
dGhhdCBTdGVwaGVuIHJlcG9ydGVkLgoKICAgICAgICBBcm5kCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
