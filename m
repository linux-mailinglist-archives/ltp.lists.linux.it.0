Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C301BB767
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 09:25:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BC533C2846
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 09:25:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AF4313C281C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 09:25:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1FE2F600C31
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 09:25:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEE6EAD88;
 Tue, 28 Apr 2020 07:25:17 +0000 (UTC)
Date: Tue, 28 Apr 2020 09:25:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200428072516.GA8764@dell5510>
References: <20200427145212.GA5678@dell5510>
 <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
 <20200428061424.fj4mq676aoosoqyw@vireshk-i7>
 <CAK8P3a0On9euT2mzx+LsXVe21cqwNMR4Hzj3eVDhbCS_KeGb4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0On9euT2mzx+LsXVe21cqwNMR4Hzj3eVDhbCS_KeGb4w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] common_timers: staticize all definitions
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgouLi4KPiA+ID4gLWNsb2NrX3QgY2xvY2tfbGlzdFtdID0gewo+ID4gPiArc3RhdGljIGNs
b2NrX3QgY2xvY2tfbGlzdFtdID0gewo+ID4gPiAgICAgICBDTE9DS19SRUFMVElNRSwKPiA+ID4g
ICAgICAgQ0xPQ0tfTU9OT1RPTklDLAo+ID4gPiAgICAgICBDTE9DS19QUk9DRVNTX0NQVVRJTUVf
SUQsCj4gPiA+IEBAIC0zNCw3ICszNCw3IEBAIGNsb2NrX3QgY2xvY2tfbGlzdFtdID0gewo+ID4g
PiAgICAgICBjYXNlIGRlZl9uYW1lOiAgICAgICAgICBcCj4gPiA+ICAgICAgICAgICAgICAgcmV0
dXJuICNkZWZfbmFtZTsKCj4gPiBVbmZvcnR1bmF0ZWx5IHRoaXMgc3RpbGwgZ2VuZXJhdGVzIHdh
cm5pbmc6Cgo+ID4gd2FybmluZzog4oCYY2xvY2tfbGlzdOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNl
ZAoKPiA+IEkgbWlzc2VkIHNlZWluZyB0aGlzIGVhcmxpZXIgaW4gdGhlIGZ1bGwgYnVpbGQgYW5k
IHNhdyBpdCBub3cgd2hpbGUKPiA+IGJ1aWxkaW5nIGEgc2luZ2xlIHRlc3QgY2FzZS4KSSBvdmVy
bG9va2VkIHRoYXQgdG9vLCBzb3JyeS4KCj4gPiBJIHRoaW5rIHdlIG5lZWQgdG8gbW92ZSB0aGlz
IHRvIHNvbWUgLmMgZmlsZSBhbmQgcmVtb3ZlIHRoZSAic3RhdGljIgo+ID4gcGFydC4gQnV0IEkg
YW0gbm90IHN1cmUgd2hpY2ggb25lIHRvLiBJZiB3ZSBkbyB0aGF0LCB0aGVuIHJlc3Qgb2YgdGhl
Cj4gPiBzZXJpZXMgd2lsbCBub3QgYmUgYWZmZWN0ZWQgYnkgaXQuCgo+IFRoYXQgaXMgcHJvYmFi
bHkgdGhlIGNsZWFuZXN0IHdheSwgeWVzClllcywgYnV0IGl0J3MgYSBiaXQgY29tcGxpY2F0ZWQs
IGxhcGkgaGVhZGVycyB3ZXJlIGV4cGVjdGVkIHRvIGJlIG5vdCBwYXJ0IG9mCnRoZSBsaWJyYXJ5
LiBBcyB5b3Ugd3JpdGUsIC1mbm8tY29tbW9uIG1ha2UgdXNlIHZhcmlhYmxlcyBpbiBoZWFkZXIg
ZmlsZXMgYSBiaXQKY29tcGxpY2F0ZWQuCgo+ID4gT3Igd2UgY2FuIHNpbXBseSBkcm9wIHRoZSAi
c3RhdGljIiBwYXJ0IGFuZCBtdWx0aXBsZSBjb3BpZXMgb2YgdGhpcwo+ID4gd2lsbCBiZSBwcmVz
ZW50IGluIGRpZmZlcmVudCAuYyBmaWxlcy4gV2hpY2ggSSBkb24ndCByZWFsbHkgbGlrZSB0byBi
ZQo+ID4gaG9uZXN0LgoKPiBUaGVyZSBpcyB1c3VhbGx5IG5vIHdhcm5pbmcgYWJvdXQgdmFyaWFi
bGVzIGluIGhlYWRlciBmaWxlcwo+IHRoYXQgYXJlIG1hcmtlZCAnc3RhdGljIGNvbnN0JyByYXRo
ZXIgdGhhbiBqdXN0ICdzdGF0aWMnLCBhcyB0aGF0Cj4gaXMgYSBjb21tb24gd2F5IHRvIGRvIHRo
aW5ncyBpbiBDKysuCkNvcnJlY3QsIHN0YXRpYyBjb25zdCBjbG9ja190IGNsb2NrX2xpc3RbXSB3
b3VsZCB3b3JrLgpJJ2QgYmUgZm9yIHRoaXMgc29sdXRpb24uCgo+ID4gT3Igd2UgY2FuIHNpbXBs
eSBkcm9wIHRoZSAic3RhdGljIiBwYXJ0IGFuZCBtdWx0aXBsZSBjb3BpZXMgb2YgdGhpcwo+ID4g
d2lsbCBiZSBwcmVzZW50IGluIGRpZmZlcmVudCAuYyBmaWxlcy4gV2hpY2ggSSBkb24ndCByZWFs
bHkgbGlrZSB0byBiZQo+ID4gaG9uZXN0LgoKPiBXaXRoIGdjYy0xMCBhbmQgY2xhbmctMTAgdGhp
cyB3aWxsIGNhdXNlIGEgbGluay10aW1lIGZhaWx1cmUsIGJlY2F1c2UKPiB0aGV5IG5vdyBib3Ro
IGRlZmF1bHQgdG8gIi1mbm8tY29tbW9uIiBiZWhhdmlvci4KVHJ1ZSwgd2UgYnVpbGQgaW4gdHJh
dmlzIHdpdGggLWZuby1jb21tb24gKGZpeGVkIHJlY2VudGx5KS4KCj4gICAgICAgIEFybmQKCktp
bmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
