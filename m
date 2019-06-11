Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94D3C712
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 11:14:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A2483EB0BC
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 11:14:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 108153EAA06
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 11:14:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C84201401173
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 11:14:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0D036ACC5
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:14:12 +0000 (UTC)
Date: Tue, 11 Jun 2019 11:14:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190611091409.GA5644@dell5510>
References: <20170623122211.29575-1-rpalethorpe@suse.com>
 <20170623122211.29575-4-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170623122211.29575-4-rpalethorpe@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3 3/9] Test for CVE-2016-4997 on setsockopt
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUmljaGFyZCwgQ3lyaWwsCgpsb29raW5nIGF0IHRoaXMgTFRQIHRlc3QgKDNiZTBkMzkxZiBy
ZW5hbWVkIGl0IGludG8KdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRzb2Nrb3B0L3NldHNv
Y2tvcHQwMy5jKS4KCgo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUGFsZXRob3JwZSA8cnBhbGV0
aG9ycGVAc3VzZS5jb20+Cj4gLS0tCj4gIHRlc3RjYXNlcy9jdmUvY3ZlLTIwMTYtNDk5Ny5jIHwg
OTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwoKLi4uCj4gK3N0
YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gK3sKPiArCWlmICh0c3Rfa2VybmVsX2JpdHMoKSA9PSAz
MiB8fCBzaXplb2YobG9uZykgPiA0KQo+ICsJCXRzdF9yZXMoVENPTkYsCj4gKwkJCSJUaGUgdnVs
bmVyYWJpbGl0eSB3YXMgb25seSBwcmVzZW50IGluIDMyLWJpdCBjb21wYXQgbW9kZSIpOwpXYXMg
aXQgaW50ZW50aW9uYWwgdG8gcnVuIGl0IG9uIG5vcm1hbCA2NGJpdD8KU2hvdWxkbid0IGl0IGJl
IHRzdF9icmsoVENPTkYsIC4uLikgdXNlZD8KCktpbmQgcmVnYXJkcywKUGV0cgoKPiArfQo+ICsK
PiArc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gK3sKPiArCWludCByZXQsIHNvY2tfZmQ7Cj4gKwlz
dHJ1Y3QgcGF5bG9hZCBwID0geyAwIH07Cj4gKwo+ICsJc29ja19mZCA9IFNBRkVfU09DS0VUKEFG
X0lORVQsIFNPQ0tfREdSQU0sIDApOwo+ICsKPiArCXN0cm5jcHkocC5tYXRjaC51LnVzZXIubmFt
ZSwgImljbXAiLCBzaXplb2YocC5tYXRjaC51LnVzZXIubmFtZSkpOwo+ICsJcC5tYXRjaC51Lm1h
dGNoX3NpemUgPSBPRkZTRVRfT1ZFUldSSVRFOwo+ICsKPiArCXAuZW50Lm5leHRfb2Zmc2V0ID0g
TkVYVF9PRkZTRVQ7Cj4gKwlwLmVudC50YXJnZXRfb2Zmc2V0ID0gVE9PX1NNQUxMX09GRlNFVDsK
PiArCj4gKwlwLnJlcGwubnVtX2VudHJpZXMgPSAyOwo+ICsJcC5yZXBsLm51bV9jb3VudGVycyA9
IDE7Cj4gKwlwLnJlcGwuc2l6ZSA9IHNpemVvZihzdHJ1Y3QgcGF5bG9hZCk7Cj4gKwlwLnJlcGwu
dmFsaWRfaG9va3MgPSAwOwo+ICsKPiArCXJldCA9IHNldHNvY2tvcHQoc29ja19mZCwgU09MX0lQ
LCBJUFRfU09fU0VUX1JFUExBQ0UsCj4gKwkJCSAmcCwgc2l6ZW9mKHN0cnVjdCBwYXlsb2FkKSk7
Cj4gKwl0c3RfcmVzKFRQQVNTIHwgVEVSUk5PLCAiV2UgZGlkbid0IGNhdXNlIGEgY3Jhc2gsIHNl
dHNvY2tvcHQgcmV0dXJuZWQgJWQiLCByZXQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHRz
dF90ZXN0IHRlc3QgPSB7Cj4gKwkubWluX2t2ZXIgPSAiMi42LjMyIiwKPiArCS5zZXR1cCA9IHNl
dHVwLAo+ICsJLnRlc3RfYWxsID0gcnVuLAo+ICsJLm5lZWRzX3Jvb3QgPSAxLAo+ICt9OwoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
