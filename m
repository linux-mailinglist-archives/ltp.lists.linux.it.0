Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AC24DA86
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 18:21:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E56B3C2F7B
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 18:21:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3FEAD3C136A
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 18:21:36 +0200 (CEST)
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE4856000F6
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 18:21:35 +0200 (CEST)
Received: by mail-vk1-xa43.google.com with SMTP id s81so540813vkb.3
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iGVeXcDNIvRh8qe1/2584zUekwk8kU52P/kL+vHcf2k=;
 b=ji/pjQgi0VxnFeZYwxWaAiU3Vrdf06GkDeZC3JB6loVzhqamPN5JMsYieQFYBj+3Hs
 RRMOMqC+TMGPyGgOCEATA58h94MWiPeiQ9FnjYMnyoQUWXUYZPf695EN+xYx3AByv4VK
 FbbkbmdO6zYhfUZA/5SYL+2bQZsgrKE4dMatvE5VFheBFxOflx+OiHVhpv+3/vD9FM5d
 lz6M9HKQF2YAr5n36Fpm8ms16IEdEad2ElYT/2l9s1tqeLOLwdRl92zVYYaRl+nuXuSV
 nneuRiGvNTnJeyahLdH3sk2yW+WvyrX/bwp/cV6cPZPjf4cqujMn2b3IYW44kLPCnFsl
 61uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iGVeXcDNIvRh8qe1/2584zUekwk8kU52P/kL+vHcf2k=;
 b=bwsMh8k3P5lU2lnLxe/zPnBzrSseccqiBabVZU9OdLp7vNTtZ0pKTX/pTu8Jaq4aZq
 RfvPqsh7Filj7YbSwXpdo5lyr0rPLetDkPgjTuVQV/uFJfhbxQkbUzDIyUCXsMIK4Vbc
 VaU9iRjU4c37No21JBY1MB+6v9UJOOX/Q0uz0QTykXR1xLBGBz2ySDViAsw9/Xd9QcKG
 OE8fQ1hvLhfb5oaWbzcCgyjcBHKibD2ofUiDYeChtPE57BPct4x2aAjvFccDFOYZjHso
 jppnVMvQJpX+WcH3nSLS1kXVHHPfEkGmC3X6xiFao5gLenQslj00+1knu5a/ZB1cMFWe
 sduA==
X-Gm-Message-State: AOAM531YHunNnUeqktyjqu0zJ93L5jtFEDN/emupilJW54VLBz7Jgrpw
 9RdnZs5Ozmyv02HyjFXSpRpSbj3Ft0yrxKxM18ZEJw==
X-Google-Smtp-Source: ABdhPJxiNdxtxxUKYT6rb+L9FRF6H2nEkJ4ZpJqNK6OBdBlc8q4YCCspNRYmFOTVAEB0DjVNW5ZROnJK1ZJOdt8kd9k=
X-Received: by 2002:a1f:2fc1:: with SMTP id v184mr2425414vkv.42.1598026893599; 
 Fri, 21 Aug 2020 09:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200820091612.692383444@linuxfoundation.org>
 <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
 <20200821111535.GC2222852@kroah.com>
In-Reply-To: <20200821111535.GC2222852@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 21 Aug 2020 21:51:22 +0530
Message-ID: <CA+G9fYvc2tqXf7ownJ=HMsVz+uuigqZJXJmjMSWCzO_-ODk1fQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.8 000/232] 5.8.3-rc1 review
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, patches@kernelci.org,
 Eric Biggers <ebiggers@kernel.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCAyMSBBdWcgMjAyMCBhdCAxNjo0NSwgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyMCwgMjAyMCBhdCAw
ODo1Nzo1N1BNICswNTMwLCBOYXJlc2ggS2FtYm9qdSB3cm90ZToKPiA+IE9uIFRodSwgMjAgQXVn
IDIwMjAgYXQgMTQ6NTUsIEdyZWcgS3JvYWgtSGFydG1hbgo+ID4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBpcyB0aGUgc3RhcnQgb2YgdGhlIHN0
YWJsZSByZXZpZXcgY3ljbGUgZm9yIHRoZSA1LjguMyByZWxlYXNlLgo+ID4gPiBUaGVyZSBhcmUg
MjMyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBvc3RlZCBhcyBhIHJlc3Bv
bnNlCj4gPiA+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhhcyBhbnkgaXNzdWVzIHdpdGggdGhl
c2UgYmVpbmcgYXBwbGllZCwgcGxlYXNlCj4gPiA+IGxldCBtZSBrbm93Lgo+ID4gPgo+ID4gPiBS
ZXNwb25zZXMgc2hvdWxkIGJlIG1hZGUgYnkgU2F0LCAyMiBBdWcgMjAyMCAwOToxNTowOSArMDAw
MC4KPiA+ID4gQW55dGhpbmcgcmVjZWl2ZWQgYWZ0ZXIgdGhhdCB0aW1lIG1pZ2h0IGJlIHRvbyBs
YXRlLgo+ID4gPgo+ID4gPiBUaGUgd2hvbGUgcGF0Y2ggc2VyaWVzIGNhbiBiZSBmb3VuZCBpbiBv
bmUgcGF0Y2ggYXQ6Cj4gPiA+ICAgICAgICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGlu
dXgva2VybmVsL3Y1Lngvc3RhYmxlLXJldmlldy9wYXRjaC01LjguMy1yYzEuZ3oKPiA+ID4gb3Ig
aW4gdGhlIGdpdCB0cmVlIGFuZCBicmFuY2ggYXQ6Cj4gPiA+ICAgICAgICAgZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMu
Z2l0IGxpbnV4LTUuOC55Cj4gPiA+IGFuZCB0aGUgZGlmZnN0YXQgY2FuIGJlIGZvdW5kIGJlbG93
Lgo+ID4gPgo+ID4gPiB0aGFua3MsCj4gPiA+Cj4gPiA+IGdyZWcgay1oCj4gPgo+ID4gPiBIZXJi
ZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+Cj4gPiA+ICAgICBjcnlwdG86IGFm
X2FsZyAtIEZpeCByZWdyZXNzaW9uIG9uIGVtcHR5IHJlcXVlc3RzCj4gPgo+ID4gUmVzdWx0cyBm
cm9tIExpbmFyb+KAmXMgdGVzdCBmYXJtLgo+ID4gUmVncmVzc2lvbnMgZGV0ZWN0ZWQuCj4gPgo+
ID4gICBsdHAtY3J5cHRvLXRlc3RzOgo+ID4gICAgICogYWZfYWxnMDIKPiA+ICAgbHRwLWN2ZS10
ZXN0czoKPiA+ICAgICAqIGN2ZS0yMDE3LTE3ODA1Cj4gPgo+ID4gYWZfYWxnMDIuYzo1MjogQlJP
SzogVGltZWQgb3V0IHdoaWxlIHJlYWRpbmcgZnJvbSByZXF1ZXN0IHNvY2tldC4KPiA+IFdlIGFy
ZSBydW5uaW5nIHRoZSBMVFAgMjAyMDA1MTUgdGFnIHJlbGVhc2VkIHRlc3Qgc3VpdGUuCj4gPiAg
aHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0ZXIvdGVz
dGNhc2VzL2tlcm5lbC9jcnlwdG8vYWZfYWxnMDIuYwo+Cj4gTG9va3MgbGlrZSB0aGUgY3J5cHRv
IHRlc3RzIGFyZSBub3cgZml4ZWQgOikKPgo+IEFueXdheSwgdGhhbmtzIGZvciB0ZXN0aW5nIGFs
bCBvZiB0aGVzZSBhbmQgbGV0dGluZyBtZSBrbm93LgoKQXBhcnQgZnJvbSB0aGUgcmVwb3J0ZWQg
TFRQIGNyeXB0byB0ZXN0IGNhc2UgcHJvYmxlbSBhbGwgb3RoZXIgcmVzdWx0cwpsb29rIGdvb2Qg
dG8gbWUuCgpSZXN1bHRzIGZyb20gTGluYXJv4oCZcyB0ZXN0IGZhcm0uCk5vIHJlZ3Jlc3Npb25z
IG9uIGFybTY0LCBhcm0sIHg4Nl82NCwgYW5kIGkzODYuCgpTdW1tYXJ5Ci0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQoKa2VybmVsOiA1LjguMwpnaXQgcmVwbzogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKZ2l0IGJyYW5jaDog
bGludXgtNS44LnkKZ2l0IGNvbW1pdDogYTExMDFlOTQ3NjdlMmQ1ZGE1YmNiZWUxMjU3M2Q5NmEx
YzhiZTViYgpnaXQgZGVzY3JpYmU6IHY1LjguMwpUZXN0IGRldGFpbHM6IGh0dHBzOi8vcWEtcmVw
b3J0cy5saW5hcm8ub3JnL2xrZnQvbGludXgtc3RhYmxlLXJjLTUuOC1vZS9idWlsZC92NS44LjMK
Ck5vIHJlZ3Jlc3Npb25zIChjb21wYXJlZCB0byBidWlsZCB2NS44LjIpCgpObyBmaXhlcyAoY29t
cGFyZWQgdG8gYnVpbGQgdjUuOC4yKQoKUmFuIDMwMjU2IHRvdGFsIHRlc3RzIGluIHRoZSBmb2xs
b3dpbmcgZW52aXJvbm1lbnRzIGFuZCB0ZXN0IHN1aXRlcy4KCkVudmlyb25tZW50cwotLS0tLS0t
LS0tLS0tLQotIGRyYWdvbmJvYXJkLTQxMGMKLSBoaTYyMjAtaGlrZXkKLSBpMzg2Ci0ganVuby1y
MgotIGp1bm8tcjItY29tcGF0Ci0ganVuby1yMi1rYXNhbgotIG54cC1sczIwODgKLSBxZW11X2Fy
bQotIHFlbXVfYXJtNjQKLSBxZW11X2kzODYKLSBxZW11X3g4Nl82NAotIHgxNQotIHg4NgotIHg4
Ni1rYXNhbgoKVGVzdCBTdWl0ZXMKLS0tLS0tLS0tLS0KKiBidWlsZAoqIGxpbnV4LWxvZy1wYXJz
ZXIKKiBsdHAtY29tbWFuZHMtdGVzdHMKKiBsdHAtY29udGFpbmVycy10ZXN0cwoqIGx0cC1kaW8t
dGVzdHMKKiBsdHAtZnMtdGVzdHMKKiBsdHAtaW8tdGVzdHMKKiBsdHAtbWF0aC10ZXN0cwoqIGx0
cC10cmFjaW5nLXRlc3RzCiogbHRwLWN2ZS10ZXN0cwoqIGx0cC1mY250bC1sb2NrdGVzdHMtdGVz
dHMKKiBsdHAtZmlsZWNhcHMtdGVzdHMKKiBsdHAtZnNfYmluZC10ZXN0cwoqIGx0cC1mc19wZXJt
c19zaW1wbGUtdGVzdHMKKiBsdHAtZnN4LXRlc3RzCiogbHRwLW5wdGwtdGVzdHMKKiBsdHAtcHR5
LXRlc3RzCiogbHRwLXNlY3VyZWJpdHMtdGVzdHMKKiBsdHAtc3lzY2FsbHMtdGVzdHMKKiB2NGwy
LWNvbXBsaWFuY2UKKiBsaWJodWdldGxiZnMKKiBsdHAtY2FwX2JvdW5kcy10ZXN0cwoqIGx0cC1j
b250cm9sbGVycy10ZXN0cwoqIGx0cC1jcHVob3RwbHVnLXRlc3RzCiogbHRwLWNyeXB0by10ZXN0
cwoqIGx0cC1odWdldGxiLXRlc3RzCiogbHRwLWlwYy10ZXN0cwoqIGx0cC1tbS10ZXN0cwoqIGx0
cC1vcGVuLXBvc2l4LXRlc3RzCiogbHRwLXNjaGVkLXRlc3RzCiogbmV0d29yay1iYXNpYy10ZXN0
cwoqIGlndC1ncHUtdG9vbHMKCi0tIApMaW5hcm8gTEtGVApodHRwczovL2xrZnQubGluYXJvLm9y
ZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
