Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEEF4287C2
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Oct 2021 09:38:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EF183C03B1
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Oct 2021 09:38:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C09C63C01FC
 for <ltp@lists.linux.it>; Mon, 11 Oct 2021 09:38:36 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4F3E600A09
 for <ltp@lists.linux.it>; Mon, 11 Oct 2021 09:38:35 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0C48D22034;
 Mon, 11 Oct 2021 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633937915;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dW7+2eJDZzMMtGdCNOgIHEUM067pLA4d6dFLRywGPD4=;
 b=WFTse2hZYIoIjFqfZjv5PAgWCWFgooCkIozWjsupLGm8SoHvXBWPHGWwh7HqUxmw80B8ka
 Bg5SDMGYYsqw468ebe5l8SDICoARIXFr63Cfek2bsTsW2LzPp68jDjW4PNbON5EXLjXKC/
 ze0L4ImmtO0CAQ56GSCSjyNUKghsQfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633937915;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dW7+2eJDZzMMtGdCNOgIHEUM067pLA4d6dFLRywGPD4=;
 b=61KZEbecF+I9JeDAnm9cLH1zoJ9jX5+xCpAI6DjZKezXCtQqoslXtMlRc6196AP2reGulR
 INHvCFmFFQo43eAQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0EA24A3B83;
 Mon, 11 Oct 2021 07:38:34 +0000 (UTC)
References: <20211008112714.601107695@linuxfoundation.org>
 <CA+G9fYvOK+5qPEU7RMfD1O5O3EwTfThoh3Le9Rx8GDhY3nY1Ww@mail.gmail.com>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 11 Oct 2021 08:28:31 +0100
In-reply-to: <CA+G9fYvOK+5qPEU7RMfD1O5O3EwTfThoh3Le9Rx8GDhY3nY1Ww@mail.gmail.com>
Message-ID: <875yu4au4n.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.19 00/12] 4.19.210-rc1 review
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
Reply-To: rpalethorpe@suse.de
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-stable <stable@vger.kernel.org>, Pavel Machek <pavel@denx.de>,
 mkoutny@suse.cz, Andrew Morton <akpm@linux-foundation.org>,
 Jon Hunter <jonathanh@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gTmFyZXNoLAoKTmFyZXNoIEthbWJvanUgPG5hcmVzaC5rYW1ib2p1QGxpbmFyby5vcmc+
IHdyaXRlczoKCj4gT24gRnJpLCA4IE9jdCAyMDIxIGF0IDE3OjAwLCBHcmVnIEtyb2FoLUhhcnRt
YW4KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Pgo+PiBUaGlzIGlzIHRo
ZSBzdGFydCBvZiB0aGUgc3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDQuMTkuMjEwIHJlbGVh
c2UuCj4+IFRoZXJlIGFyZSAxMiBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCBhbGwgd2lsbCBiZSBw
b3N0ZWQgYXMgYSByZXNwb25zZQo+PiB0byB0aGlzIG9uZS4gIElmIGFueW9uZSBoYXMgYW55IGlz
c3VlcyB3aXRoIHRoZXNlIGJlaW5nIGFwcGxpZWQsIHBsZWFzZQo+PiBsZXQgbWUga25vdy4KPj4K
Pj4gUmVzcG9uc2VzIHNob3VsZCBiZSBtYWRlIGJ5IFN1biwgMTAgT2N0IDIwMjEgMTE6Mjc6MDcg
KzAwMDAuCj4+IEFueXRoaW5nIHJlY2VpdmVkIGFmdGVyIHRoYXQgdGltZSBtaWdodCBiZSB0b28g
bGF0ZS4KPj4KPj4gVGhlIHdob2xlIHBhdGNoIHNlcmllcyBjYW4gYmUgZm91bmQgaW4gb25lIHBh
dGNoIGF0Ogo+PiAgICAgICAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5l
bC92NC54L3N0YWJsZS1yZXZpZXcvcGF0Y2gtNC4xOS4yMTAtcmMxLmd6Cj4+IG9yIGluIHRoZSBn
aXQgdHJlZSBhbmQgYnJhbmNoIGF0Ogo+PiAgICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdCBsaW51eC00
LjE5LnkKPj4gYW5kIHRoZSBkaWZmc3RhdCBjYW4gYmUgZm91bmQgYmVsb3cuCj4+Cj4+IHRoYW5r
cywKPj4KPj4gZ3JlZyBrLWgKPgo+IFJlc3VsdHMgZnJvbSBMaW5hcm/igJlzIHRlc3QgZmFybS4K
PiBObyByZWdyZXNzaW9ucyBvbiBhcm02NCwgYXJtLCB4ODZfNjQsIGFuZCBpMzg2Lgo+Cj4gVGVz
dGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+
Cj4KPiBOT1RFOgo+IExUUCB2ZXJzaW9uIHVwZ3JhZGUgdG8gTFRQIDIwMjEwOTI3Lgo+IFRoZSBu
ZXcgY2FzZSAiY2ZzX2JhbmR3aWR0aDAxIiBmb3VuZCB0aGUgZm9sbG93aW5nIHdhcm5pbmcuCj4g
U2luY2UgaXQgaXMgYSBuZXcgdGVzdCBjYXNlIHRoYXQgZm91bmQgdGhpcyB3YXJuaW5nIGNhbiBu
b3QgYmUgY29uc2lkZXJlZCBhcwo+IHJlZ3Jlc3Npb24uCj4gVGhpcyB3YXJuaW5nIGlzIG9ubHkg
c2VlbiBvbiBzdGFibGUgcmMgNC4xOQo+IGJ1dCBub3QgZm91bmQgb24gNC4xNCwgNS40LCA1LjEw
IGFuZCA1LjE0Lgo+Cj4gVGVzdCBvdXRwdXQgbG9nOgo+IC0tLS0tLS0tLS0tLS0tLS0KPiBjZnNf
YmFuZHdpZHRoMDEuYzo1NzogVElORk86IFNldCAnd29ya2VyMS9jcHUubWF4JyA9ICczMDAwIDEw
MDAwJwo+IGNmc19iYW5kd2lkdGgwMS5jOjU3OiBUSU5GTzogU2V0ICd3b3JrZXIyL2NwdS5tYXgn
ID0gJzIwMDAgMTAwMDAnCj4gY2ZzX2JhbmR3aWR0aDAxLmM6NTc6IFRJTkZPOiBTZXQgJ3dvcmtl
cjMvY3B1Lm1heCcgPSAnMzAwMCAxMDAwMCcKPiBjZnNfYmFuZHdpZHRoMDEuYzoxMTg6IFRQQVNT
OiBTY2hlZHVsZWQgYmFuZHdpZHRoIGNvbnN0cmFpbmVkIHdvcmtlcnMKPiBjZnNfYmFuZHdpZHRo
MDEuYzo1NzogVElORk86IFNldCAnbGV2ZWwyL2NwdS5tYXgnID0gJzUwMDAgMTAwMDAnCj4gY2Zz
X2JhbmR3aWR0aDAxLmM6MTMwOiBUUEFTUzogV29ya2VycyBleGl0ZWQKPiBjZnNfYmFuZHdpZHRo
MDEuYzoxMTg6IFRQQVNTOiBTY2hlZHVsZWQgYmFuZHdpZHRoIGNvbnN0cmFpbmVkIHdvcmtlcnMK
PiBjZnNfYmFuZHdpZHRoMDEuYzo1NzogVElORk86IFNldCAnbGV2ZWwyL2NwdS5tYXgnID0gJzUw
MDAgMTAwMDAnCj4gY2ZzX2JhbmR3aWR0aDAxLmM6MTMwOiBUUEFTUzogV29ya2VycyBleGl0ZWQK
PiBjZnNfYmFuZHdpZHRoMDEuYzoxMTg6IFRQQVNTOiBTY2hlZHVsZWQgYmFuZHdpZHRoIGNvbnN0
cmFpbmVkIHdvcmtbCj4gNTYuNjI0MjEzXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0t
LS0tLS0KPiBbICAgNTYuNjI5NDIxXSBycS0+dG1wX2Fsb25lX2JyYW5jaCAhPSAmcnEtPmxlYWZf
Y2ZzX3JxX2xpc3QKCkZXSVcgdGhpcyBhcHBlYXJzIHRvIGJlIHRoZSBidWcgdGhlIHRlc3QgaXMg
aW50ZW5kZWQgdG8KcmVwcm9kdWNlLiBPcmlnaW5hbGx5IHNlZW4gb24gYSBTVVNFIGVudGVycHJp
c2UgNC4xMiBrZXJuZWwuCgotLSAKVGhhbmsgeW91LApSaWNoYXJkLgoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
