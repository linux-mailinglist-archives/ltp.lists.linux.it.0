Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E6229F47
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:32:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FED63C7F5C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:32:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 153743C1D5C
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:32:06 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1B078600F22
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:30:48 +0200 (CEST)
Received: from localhost.localdomain
 (pool-96-246-152-186.nycmny.fios.verizon.net [96.246.152.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0612420714;
 Wed, 22 Jul 2020 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595442723;
 bh=Ej7eb6WRvQeFRdUgnRjsIBu5uXweOW5ytKzwLo5Afbk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CbACEJnAveYL+vdtshYbCbyv7U5XmiAol7J6Hp0j1zM33YkK3mSGFLrxW7PUW1SRT
 41DSm1zZIiTx2468OO5N9pd9VpeddV4FMHxsBms9j7NwnKH/oCDWyVgumVYLVPSKxR
 XgiB4TVt9h/FlmvNvqhBpwElXs6b0oglyRbUseHg=
Message-ID: <1595442721.5211.7.camel@kernel.org>
From: Mimi Zohar <zohar@kernel.org>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, pvorel@suse.cz, 
 ltp@lists.linux.it
Date: Wed, 22 Jul 2020 14:32:01 -0400
In-Reply-To: <1595441389.5211.1.camel@linux.ibm.com>
References: <20200722164040.23109-1-t-josne@linux.microsoft.com>
 <1595441389.5211.1.camel@linux.ibm.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] IMA: Add test for kexec cmdline measurement
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCAyMDIwLTA3LTIyIGF0IDE0OjA5IC0wNDAwLCBNaW1pIFpvaGFyIHdyb3RlOgo+IE9u
IFdlZCwgMjAyMC0wNy0yMiBhdCAxMjo0MCAtMDQwMCwgTGFjaGxhbiBTbmVmZiB3cm90ZToKPiA+
IElNQSBwb2xpY3kgY2FuIGJlIHNldCB0byBtZWFzdXJlIHRoZSBjb21tYW5kIGxpbmUgcGFzc2Vk
IGluIHRoZSBrZXhlYyBzeXN0ZW0gY2FsbC4KPiA+IFRoZXJlIG5lZWRzIHRvIGJlIGEgdGVzdCB0
byB2YWxpZGF0ZSB0aGlzIGtleGVjIGNvbW1hbmQgbGluZSBtZWFzdXJlbWVudC4KPiA+IAo+ID4g
QWRkIGEgdGVzdGNhc2UgdGhhdCB2ZXJpZmllcyB0aGF0IHRoZSBJTUEgc3Vic3lzdGVtIGhhcyBj
b3JyZWN0bHkKPiA+IG1lYXN1cmVkIHRoZSBjbWRsaW5lIHNwZWNpZmllZCBkdXJpbmcgYSBrZXhl
Yy4KPiA+IAo+ID4gTm90ZSB0aGF0IHRoaXMgdGVzdCBkb2VzIG5vdCBhY3R1YWxseSByZWJvb3Qu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IExhY2hsYW4gU25lZmYgPHQtam9zbmVAbGludXgubWlj
cm9zb2Z0LmNvbT4KPiAKPiBPdGhlciB0aGFuIHRoZSBwYXRjaCBub3QgYXBwbHlpbmcgY2xlYW5s
eSBhbmQgbGVhZGluZyBibGFua3MswqAKPiAKPiBSZXZpZXdlZC1ieTogTWltaSBab2hhciA8em9o
YXJAbGludXguaWJtLmNvbT4KCk9vcHMsIHRoZSBrZXhlYyBsb2FkIGlzIHVzaW5nIHRoZSAnLXMn
IG9wdGlvbiwgc2ltaWxhcmx5IHRoZSB1bmxvYWQKc2hvdWxkIHVzZSBpdCB0b28uIMKgUGxlYXNl
IGNoYW5nZSBhbGwgdGhlICJrZXhlYyAtdSIgb2NjdXJlbmNlcyB0bwoia2V4ZWMgLXN1Ii4KCisg
ICAgaWYgISBrZXhlYyAtc2wgJElNQUdFIC0tcmV1c2UtY21kbGluZTsgdGhlbgo+ICsgICAgICAg
IHRzdF9yZXMgVENPTkYgImtleGVjIGZhaWxlZDogJD8iCj4gKyAgICAgICAgCj4gKyAgICAgICAg
bG9jYWwgc2Jfc3RhdHVzPSIkKGJvb3RjdGwgc3RhdHVzIDI+L2Rldi9udWxsIHwgZ3JlcCAnU2Vj
dXJlIEJvb3QnIFwKPiArICAgICAgICAgICAgfCB0ciAtZCAnICcgfCBzZWQgJ3MvU2VjdXJlQm9v
dDoqLy8nKSIKPiArICAgICAgICAKPiArICAgICAgICBpZiBbICIkc2Jfc3RhdHVzIiA9ICJlbmFi
bGVkIiBdOyB0aGVuCj4gKyAgICAgICAgICAgIHRzdF9yZXMgVElORk8gInNlY3VyZSBib290IGlz
IGVuYWJsZWQsIHRoZSBzcGVjaWZpZWQga2VybmVsIGltYWdlIG1heSBub3QgYmUgc2lnbmVkIgo+
ICsgICAgICAgIGZpCj4gKwo+ICsgICAgICAgIHJldHVybgo+ICsgICAgZmkKPiArCj4gKyAgICBr
ZXhlYyAtdQo+ICsKPiArICAgIGlmICEgbWVhc3VyZSAiJGNtZGxpbmUiOyB0aGVuCj4gKyAgICAg
ICAgdHN0X3JlcyBURkFJTCAidW5hYmxlIHRvIGZpbmQgYSBjb3JyZWN0IGVudHJ5IGluIHRoZSBJ
TUEgbG9nIgo+ICsgICAgICAgIAo+ICsgICAgICAgIGlmIFsgISAtciAkSU1BX1BPTElDWSBdOyB0
aGVuCj4gKyAgICAgICAgICAgIHRzdF9icmsgVENPTkYgImNhbm5vdCByZWFkIElNQSBwb2xpY3kg
KENPTkZJR19JTUFfUkVBRF9QT0xJQ1k9eSByZXF1aXJlZCkgdG8gZ2l2ZSBjb250ZXh0dWFsIGlu
Zm9ybWF0aW9uIgo+ICsgICAgICAgIGZpCj4gKwo+ICsgICAgICAgIGlmICEgZ3JlcCAibWVhc3Vy
ZSBmdW5jPUtFWEVDX0NNRExJTkUiICRJTUFfUE9MSUNZID4vZGV2L251bGw7IHRoZW4KPiArICAg
ICAgICAgICAgdHN0X2JyayBUQ09ORiAiVGhlIElNQSBwb2xpY3kgZG9lcyBub3Qgc3BlY2lmeSAn
bWVhc3VyZSBmdW5jPUtFWEVDX0NNRExJTkUnLCBzZWUgSU1BIHRlc3QgUkVBRE1FIgo+ICsgICAg
ICAgIGZpCj4gKwo+ICsgICAgICAgIHJldHVybgo+ICsgICAgZmkKPiArCj4gKyAgICBjbWRsaW5l
PSJmb28iY21sZGluZQo+ICsgICAgaWYgISBrZXhlYyAtc2wgJElNQUdFIC0tYXBwZW5kPSRjbWRs
aW5lOyB0aGVuCj4gKyAgICAgICAgdHN0X2JyayBUQ09ORiAia2V4ZWMgZmFpbGVkOiAkPyIKPiAr
ICAgIGZpCj4gKwo+ICsgICAga2V4ZWMgLXUKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
