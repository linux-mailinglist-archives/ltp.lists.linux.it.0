Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3849E1BA
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 13:59:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4057390065
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 13:59:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 72724294A89
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 13:59:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 87D87600A04
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 13:59:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 804A2AC9A;
 Mon, 29 Apr 2019 11:59:54 +0000 (UTC)
Date: Mon, 29 Apr 2019 13:59:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190429115952.GA6265@rei>
References: <20190418111812.GB3073@rei.lan> <20190426131258.GA18760@rei>
 <CAEemH2ezD-diAYeG0=pbgUgdMtSFxs+dWYo4CnDNdHQT=SOEaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ezD-diAYeG0=pbgUgdMtSFxs+dWYo4CnDNdHQT=SOEaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] LTP Release
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

SGkhCj4gPiA+IFNvIGFzIHVzdWFsbHkgcGxlYXNlIGdvIGFoZWFkIGFuZCBwb2ludCBvdXQgYW55
dGhpbmcgdGhhdCBzaG91bGQgZ28gaW4KPiA+ID4gYmVmb3JlIHRoZSByZWxlYXNlLgo+ID4KPiA+
IE9ubHkgUGV0ZXIgcmVwbGllZCBzbyBmYXIsIHNvIEkgc3VwcG9zZSB0aGF0IHdlIGFyZSByZWFk
eSB0byBmcmVlemUgZ2l0Cj4gPiBzdGFydGluZyBuZXh0IHdlZWsgYW5kIHN0YXJ0IHRoZSBwcmUt
cmVsZWFzZSB0ZXN0aW5nLgo+ID4KPiA+IE9yIGlzIHRoZXJlIGFueXRoaW5nIHRoYXQgaGFzIHRv
IGJlIGNvbnNpZGVyZWQgdG8gYmUgaW5jbHVkZWQgYmVmb3JlIHdlCj4gPiBkbyB0aGF0Pwo+ID4K
PiAKPiBIZXJlIGlzIGEgc2ltcGxlIGZpeCBmb3IgaHVnZXBhZ2UgdGVzdCBicm9rZW4gd2l0aCBt
ZW1vcnkgc2hvcnRhZ2UuCj4gQ29uc2lkZXIgbWVyZ2luZz8KPiBodHRwOi8vbGlzdHMubGludXgu
aXQvcGlwZXJtYWlsL2x0cC8yMDE5LUFwcmlsLzAxMTcxNC5odG1sCgpUaGUgYmFzaWMgaWRlYSBs
b29rcyBPSyBob3dldmVyOgoKKiB0aGUgZnVuY3Rpb24gbmFtZSAocmVzZXRfaHVnZXBhZ2VzKSBp
cyBhIGJpdCBjb25mdXNpbmcKICB3aGF0IGFib3V0ICJjYXBfaHVnZXBhZ2VzIiBvciAibGltaXRf
aHVnZXBhZ2VzIgoKKiBUaGUgTWVtRnJlZTogbWF5IGJlIGNsb3NlIHRvIHplcm8gb24gbG9uZyBy
dW5uaW5nIHN5c3RlbSBiZWNhdXNlIG9mCiAgY2FjaGVkIGZpbGVzLCBBRkFJSyBNZW1BdmFpbGFi
bGU6IHdvdWxkIGJlIGEgYmV0dGVyIGNob2ljZSwgc2VlOgoKICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9p
ZD0zNGU0MzFiMGFlMzk4ZmM1NGVhNjlmZjg1ZWM3MDA3MjJjOWRhNzczCgogIFVuZm9ydHVuYXRl
bHkgdGhhdCBvbmUgaXMgYXZhaWxhYmxlIHNpbmNlIDMuMTQga2VybmVsLCBpZiB3ZSB3YW50ZWQg
dG8KICBydW4gb24gb2xkZXIga2Vucm5lbHMgSSB3b3VsZCBwcm9wb3NlIHRvIGZhbGwgYmFjayB0
byBkcm9wcGluZyBjYWNoZXMKICBhbmQgdXNpbmcgTWVtRnJlZTogb24ga2VybmVsIHRoYXQgZG9l
cyBub3QgaGF2ZSBNZW1BdmFpbGFibGU6IGluCiAgbWVtaW5mby4KCi0tIApDeXJpbCBIcnViaXMK
Y2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
