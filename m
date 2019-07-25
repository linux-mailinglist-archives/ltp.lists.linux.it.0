Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F306775687
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 20:04:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C7733C1CDE
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 20:04:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BE7603C134D
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 20:04:28 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 303F41400DE6
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 20:04:28 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id v15so45816822wml.0
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:savedfromemail:date:subject:in-reply-to:importance:from
 :to:cc:mime-version;
 bh=2a9pQfzbz5RDE1hFB7k3yS7Cw9DypPwllXHQBeh0ZlE=;
 b=Q/JYy5SXUViAmIhvdJxksnqgcWng/iuaq0I7hwirVPa9uRuahUAFU/eplH48QQVKOe
 i/JvwcWIEv8C/ps//P9zB2152MYU0PgMBw7bg4xBowkK1nPdPNxysMAvT7/6/R16avaf
 bTBdbQIimdareCD1CxrjXiGU7OVqjOFgXHYTSeV+8DB7wjQN2+kPbYfI8gGaIps+PEMf
 XKpJwjYoc53A6EaEM3+a58LMuJWBCWkFZdf2kNOJstYh/d/K0pi/0gappxAt/1kilYb7
 fCLXWq/qMZcM+3mubHhu7mip7wnfELLerUdChriOPQNlVZ92GpuX4GqXZNfGDnB1aPZz
 cyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:savedfromemail:date:subject
 :in-reply-to:importance:from:to:cc:mime-version;
 bh=2a9pQfzbz5RDE1hFB7k3yS7Cw9DypPwllXHQBeh0ZlE=;
 b=cGzVGN4MpNRQ7uXUPJgnHVmLUwZt3IaEP4/myfLrpk7YbgVQVzHa+vI7GK7JwvFu7X
 I3Hc+Ps+9iCsKofSC4lTtW1yDTAso0KahWKCU9URLcGd6JzSI5khQRTjMDqIQcC2Qn8q
 CQKXc5/cFs49FB9GFrXXxpIogwBPpmJSKD4ulFdCpcfOVpyFCilsHrxb6SCu7JEq9ThX
 BTM8c0vV2AHH1s/G5hvzp2u66w3UaukPfOpKsK8fAUOYxCt7KRrzcxiqBXj4/+pk846h
 Nrs1cono+lvWythpCoc1KkOKsQNlVlMMZ7c6eVr32Xleyol+SEPrHZo/jy+nzdl0H4Ea
 0urQ==
X-Gm-Message-State: APjAAAVGrg8Qj0cZgC+/WSGgKwH2YweF7+F/Uga63WZ2wuwQEs35xYyL
 CnYkgNgdNngD4JPEx5/5drf/VPWnYcY=
X-Google-Smtp-Source: APXvYqzExMHP6g1Q2DHKMo24nCP7m+F9VYLh/wlv9vIs9jHJMCtdpVGVT7OET5ah7nbIYheFdkn6fQ==
X-Received: by 2002:a1c:9813:: with SMTP id a19mr78607834wme.11.1564077867710; 
 Thu, 25 Jul 2019 11:04:27 -0700 (PDT)
Received: from [192.168.100.243] (static-46-238-236-215.awacom.net.
 [46.238.236.215])
 by smtp.gmail.com with ESMTPSA id i18sm66643062wrp.91.2019.07.25.11.04.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 11:04:27 -0700 (PDT)
Message-ID: <5d39ef2b.1c69fb81.d3010.b8ef@mx.google.com>
SavedFromEmail: piotr.krzysztof.gawel@gmail.com
Date: Thu, 25 Jul 2019 20:04:24 +0200
In-Reply-To: <20190725144450.GB24513@rei.lan>
Importance: normal
From: "piotr.krzysztof.gawel" <piotr.krzysztof.gawel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_timer: fix verification of execution time
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1132649175=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1132649175==
Content-Type: multipart/alternative; boundary="--_com.samsung.android.email_2842454042735160"

----_com.samsung.android.email_2842454042735160
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksT29wcy4gSSBtaXNzZWQgdGhhdC4gUGxlYXNlIHJlamVjdCB0aGlzIHBhdGNoLkJSLCBQaW90
cld5c8WCYW5vIHogbW9qZWdvIHNtYXJ0Zm9uYSBTYW1zdW5nIEdhbGF4eS4KLS0tLS0tLS0gT3J5
Z2luYWxuYSB3aWFkb21vxZvEhyAtLS0tLS0tLU9kOiBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gRGF0YTogMjUuMDcuMjAxOSAgMTY6NDUgIChHTVQrMDE6MDApIERvOiBQaW90ciBHYXdl
bCA8cGlvdHIua3J6eXN6dG9mLmdhd2VsQGdtYWlsLmNvbT4gRFc6IGx0cEBsaXN0cy5saW51eC5p
dCBUZW1hdDogUmU6IFtMVFBdIFtQQVRDSF0gdHN0X3RpbWVyOiBmaXggdmVyaWZpY2F0aW9uIG9m
IGV4ZWN1dGlvbiB0aW1lIEhpIT4gRWFjaCBzYW1wbGUgbmVlZHMgdG8gYmUgaW4gcmFuZ2U6PsKg
wqDCoMKgIHQgPCBzW2ldIDwgdCArIHRocmVzaG9sZD4gVGh1cyBmb3IgaSBmcm9tIHRoZSBpbnRl
cnZhbCBbZC4uLm5dOj7CoMKgwqDCoCAobi1kKSp0IDwgc3VtKHNbZC4uLm5dKSA8IChuLWQpKih0
ICsgdGhyZXNob2xkKT4gVGhpcyBwYXRjaCBmaXhlcyB0aGF0IGNoZWNrLkFzIGZhciBhcyBJIGNh
biB0ZWxsIHRoZSBmdW5jdGlvbiBjb21wdXRlX3RyZXNob2xkKCkgbXVsdGlwbGllcyB0aGV0aHJl
c2hvbGQgcGVyIGNhbGwgYnkga2VlcF9zYW1wbGVzIGFscmVhZHksIHNvIGl0J3MgYSB0aHJlYXNo
b2xkIHBlciBydW5ub3QgYSB0cmVzaG9sZCBwZXIgY2FsbCwgb3IgZG8gSSBtaXNzIHNvbWV0aGlu
Zz8+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIEdhd2VsIDxwaW90ci5rcnp5c3p0b2YuZ2F3ZWxAZ21h
aWwuY29tPj4gLS0tPsKgIGxpYi90c3RfdGltZXJfdGVzdC5jIHwgMiArLT7CoCAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSk+ID4gZGlmZiAtLWdpdCBhL2xpYi90
c3RfdGltZXJfdGVzdC5jIGIvbGliL3RzdF90aW1lcl90ZXN0LmM+IGluZGV4IGY2NDU5ZTUuLjQ1
MDhlMjkgMTAwNjQ0PiAtLS0gYS9saWIvdHN0X3RpbWVyX3Rlc3QuYz4gKysrIGIvbGliL3RzdF90
aW1lcl90ZXN0LmM+IEBAIC0zMDYsNyArMzA2LDcgQEAgdm9pZCBkb190aW1lcl90ZXN0KGxvbmcg
bG9uZyB1c2VjLCB1bnNpZ25lZCBpbnQgbnNhbXBsZXMpPsKgIAkJc2FtcGxlc1tuc2FtcGxlcy0x
XSwgc2FtcGxlc1swXSwgbWVkaWFuLD7CoCAJCTEuMDAgKiB0cnVuY19tZWFuIC8ga2VlcF9zYW1w
bGVzLCBkaXNjYXJkKTs+wqAgPiAtCWlmICh0cnVuY19tZWFuID4gKG5zYW1wbGVzIC0gZGlzY2Fy
ZCkgKiB1c2VjICsgdGhyZXNob2xkKSB7PiArCWlmICh0cnVuY19tZWFuID4ga2VlcF9zYW1wbGVz
ICogKHVzZWMgKyB0aHJlc2hvbGQpKSB7PsKgIAkJdHN0X3JlcyhURkFJTCwgIiVzIHNsZXB0IGZv
ciB0b28gbG9uZyIsIHNjYWxsKTs+wqAgCQlpZiAoIXByaW50X2ZyZXF1ZW5jeV9wbG90KT4gLS0g
PiAyLjcuND4gPiA+IC0tID4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwLS0gQ3lyaWwgSHJ1YmlzY2hydWJpc0BzdXNlLmN6

----_com.samsung.android.email_2842454042735160
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJh
dXRvIj5IaSw8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5P
b3BzLiBJIG1pc3NlZCB0aGF0LiBQbGVhc2UgcmVqZWN0IHRoaXMgcGF0Y2guPC9kaXY+PGRpdiBk
aXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+QlIsIFBpb3RyPC9kaXY+PGRpdiBk
aXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJh
dXRvIj48YnI+PC9kaXY+PGRpdiBpZD0iY29tcG9zZXJfc2lnbmF0dXJlIiBkaXI9ImF1dG8iPjxk
aXYgc3R5bGU9ImZvbnQtc2l6ZTo4NSU7Y29sb3I6IzU3NTc1NyIgZGlyPSJhdXRvIj5XeXPFgmFu
byB6IG1vamVnbyBzbWFydGZvbmEgU2Ftc3VuZyBHYWxheHkuPC9kaXY+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEwMCU7Y29sb3I6IzAwMDAwMCIgZGlyPSJhdXRv
Ij48IS0tIG9yaWdpbmFsTWVzc2FnZSAtLT48ZGl2Pi0tLS0tLS0tIE9yeWdpbmFsbmEgd2lhZG9t
b8WbxIcgLS0tLS0tLS08L2Rpdj48ZGl2Pk9kOiBDeXJpbCBIcnViaXMgJmx0O2NocnViaXNAc3Vz
ZS5jeiZndDsgPC9kaXY+PGRpdj5EYXRhOiAyNS4wNy4yMDE5ICAxNjo0NSAgKEdNVCswMTowMCkg
PC9kaXY+PGRpdj5EbzogUGlvdHIgR2F3ZWwgJmx0O3Bpb3RyLmtyenlzenRvZi5nYXdlbEBnbWFp
bC5jb20mZ3Q7IDwvZGl2PjxkaXY+RFc6IGx0cEBsaXN0cy5saW51eC5pdCA8L2Rpdj48ZGl2PlRl
bWF0OiBSZTogW0xUUF0gW1BBVENIXSB0c3RfdGltZXI6IGZpeCB2ZXJpZmljYXRpb24gb2YgZXhl
Y3V0aW9uIHRpbWUgPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+SGkhPGJyPiZndDsgRWFjaCBz
YW1wbGUgbmVlZHMgdG8gYmUgaW4gcmFuZ2U6PGJyPiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgdCAmbHQ7IHNbaV0gJmx0OyB0ICsgdGhyZXNob2xkPGJyPiZndDsgVGh1cyBmb3IgaSBmcm9t
IHRoZSBpbnRlcnZhbCBbZC4uLm5dOjxicj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IChu
LWQpKnQgJmx0OyBzdW0oc1tkLi4ubl0pICZsdDsgKG4tZCkqKHQgKyB0aHJlc2hvbGQpPGJyPiZn
dDsgVGhpcyBwYXRjaCBmaXhlcyB0aGF0IGNoZWNrLjxicj48YnI+QXMgZmFyIGFzIEkgY2FuIHRl
bGwgdGhlIGZ1bmN0aW9uIGNvbXB1dGVfdHJlc2hvbGQoKSBtdWx0aXBsaWVzIHRoZTxicj50aHJl
c2hvbGQgcGVyIGNhbGwgYnkga2VlcF9zYW1wbGVzIGFscmVhZHksIHNvIGl0J3MgYSB0aHJlYXNo
b2xkIHBlciBydW48YnI+bm90IGEgdHJlc2hvbGQgcGVyIGNhbGwsIG9yIGRvIEkgbWlzcyBzb21l
dGhpbmc/PGJyPjxicj4mZ3Q7IFNpZ25lZC1vZmYtYnk6IFBpb3RyIEdhd2VsICZsdDtwaW90ci5r
cnp5c3p0b2YuZ2F3ZWxAZ21haWwuY29tJmd0Ozxicj4mZ3Q7IC0tLTxicj4mZ3Q7Jm5ic3A7IGxp
Yi90c3RfdGltZXJfdGVzdC5jIHwgMiArLTxicj4mZ3Q7Jm5ic3A7IDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKTxicj4mZ3Q7IDxicj4mZ3Q7IGRpZmYgLS1naXQg
YS9saWIvdHN0X3RpbWVyX3Rlc3QuYyBiL2xpYi90c3RfdGltZXJfdGVzdC5jPGJyPiZndDsgaW5k
ZXggZjY0NTllNS4uNDUwOGUyOSAxMDA2NDQ8YnI+Jmd0OyAtLS0gYS9saWIvdHN0X3RpbWVyX3Rl
c3QuYzxicj4mZ3Q7ICsrKyBiL2xpYi90c3RfdGltZXJfdGVzdC5jPGJyPiZndDsgQEAgLTMwNiw3
ICszMDYsNyBAQCB2b2lkIGRvX3RpbWVyX3Rlc3QobG9uZyBsb25nIHVzZWMsIHVuc2lnbmVkIGlu
dCBuc2FtcGxlcyk8YnI+Jmd0OyZuYnNwOyAJCXNhbXBsZXNbbnNhbXBsZXMtMV0sIHNhbXBsZXNb
MF0sIG1lZGlhbiw8YnI+Jmd0OyZuYnNwOyAJCTEuMDAgKiB0cnVuY19tZWFuIC8ga2VlcF9zYW1w
bGVzLCBkaXNjYXJkKTs8YnI+Jmd0OyZuYnNwOyA8YnI+Jmd0OyAtCWlmICh0cnVuY19tZWFuICZn
dDsgKG5zYW1wbGVzIC0gZGlzY2FyZCkgKiB1c2VjICsgdGhyZXNob2xkKSB7PGJyPiZndDsgKwlp
ZiAodHJ1bmNfbWVhbiAmZ3Q7IGtlZXBfc2FtcGxlcyAqICh1c2VjICsgdGhyZXNob2xkKSkgezxi
cj4mZ3Q7Jm5ic3A7IAkJdHN0X3JlcyhURkFJTCwgIiVzIHNsZXB0IGZvciB0b28gbG9uZyIsIHNj
YWxsKTs8YnI+Jmd0OyZuYnNwOyAJCWlmICghcHJpbnRfZnJlcXVlbmN5X3Bsb3QpPGJyPiZndDsg
LS0gPGJyPiZndDsgMi43LjQ8YnI+Jmd0OyA8YnI+Jmd0OyA8YnI+Jmd0OyAtLSA8YnI+Jmd0OyBN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHA8YnI+
PGJyPi0tIDxicj5DeXJpbCBIcnViaXM8YnI+Y2hydWJpc0BzdXNlLmN6PGJyPjwvYm9keT48L2h0
bWw+

----_com.samsung.android.email_2842454042735160--


--===============1132649175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1132649175==--

