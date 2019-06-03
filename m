Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63101331AD
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:04:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38235294AE1
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:04:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1F7A73EA630
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:04:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6D4E9600B13
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:04:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4FBC3AC32
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 14:04:43 +0000 (UTC)
Date: Mon, 3 Jun 2019 16:04:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190603140445.GB13662@dell5510>
References: <20190228153425.10286-1-chrubis@suse.cz>
 <20190228153425.10286-3-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190228153425.10286-3-chrubis@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/mbind0{2, 3,
	4}: Add basic mbind tests
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

SGkgQ3lyaWwsCgo+IFRoaXMgdGVzdCBpcyBzaW1pbGFyIHRvIHRoZSBzZXRfbWVtcG9saWN5KCkg
dGVzdHMsIGJ1dCB3aXRoIG1iaW5kIHdlIGFyZQo+IGFjdHVhbGx5IGJpbmRpbmcgbWVtb3J5IHRv
IG5vZGVzIGFmdGVyIGl0IHdhcyBtYXBwZWQuCgo+IG1iaW5kMDI6IFdlIGFyZSB0cnlpbmcgdG8g
Z2V0IEVJTyB3aXRoIE1QT0xfTUZfU1RSSUNUIGFuZCBwYWdlIHRoYXQgd2FzIGFscmVhZHkKPiAg
ICAgICAgICBmYXVsdGVkIG9uIHdyb25nIG5vZGUuCgo+IG1iaW5kMDM6IFdlIGFyZSBtb3Zpbmcg
cGFnZXMgd2l0aCBNUE9MX01GX01PVkUgYW5kIE1QT0xfTUZfTU9WRV9BTEwgYW5kCj4gICAgICAg
ICAgY2hlY2tpbmcgdGhlIHJlc3VsdC4KCj4gbWJpbmQwNDogV2UgYXJlIGFwcGx5aW5nIG1lbW9y
eSBwb2xpY3kgYmVmb3JlIHdlIGZhdWx0IHRoZSBwYWdlcyBhbmQgY2hlY2sKPiAgICAgICAgICB0
aGF0IHRoZSBwYWdlcyB3ZXJlIGZhdWx0ZWQgYWNjb3JkaW5nbHkuCgpHZW5lcmFsbHkgTEdUTSwg
anVzdCBNYWtlZmlsZSBuZWVkcyB1cGRhdGluZyBhZnRlciBhZGRpbmcgbGlibHRwbnVtYToKTERG
TEFHUyArPSAtTCQodG9wX2J1aWxkZGlyKS9saWJzL2xpYmx0cG51bWEKTERMSUJTICArPSAkKE5V
TUFfTElCUykgLWxsdHBudW1hCihtYmluZDAxIGRvZXMgbm90IG5lZWQgdGhhdCwgSSdkIGlnbm9y
ZSB0aGF0KS4KCi4uLgo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbWJpbmQvbWJp
bmQuaAouLi4KPiArc3RhdGljIGlubGluZSBjb25zdCBjaGFyICptYmluZF9mbGFnX25hbWUodW5z
aWduZWQgZmxhZykKPiArewo+ICsJc3dpdGNoIChmbGFnKSB7Cj4gKwljYXNlIDA6Cj4gKwkJcmV0
dXJuICIwIjsKPiArCWNhc2UgTVBPTF9NRl9TVFJJQ1Q6Cj4gKwkJcmV0dXJuICJNUE9MX01GX1NU
UklDVCI7Cj4gKwljYXNlIE1QT0xfTUZfTU9WRToKPiArCQlyZXR1cm4gIk1QT0xfTUZfTU9WRSI7
Cj4gKwljYXNlIE1QT0xfTUZfTU9WRV9BTEw6Cj4gKwkJcmV0dXJuICJNUE9MX01GX01PVkVfQUxM
IjsKPiArCWRlZmF1bHQ6Cj4gKwkJcmV0dXJuICI/Pz8iOwpJIGd1ZXNzICI/Pz8iIGlzIGltcG9y
dGFudCBmb3IgdXMuIE90aGVyd2lzZSBJJ2QgdXNlIG1hY3JvOgojZGVmaW5lIE1CSU5EX0ZMQUdf
TkFNRSh4KSAjeAoKLi4KPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21iaW5kL21i
aW5kMDIuYwouLi4KPiArc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPiArewo+ICsJcGFnZV9zaXpl
ID0gZ2V0cGFnZXNpemUoKTsKPiArCj4gKwlub2RlcyA9IHRzdF9nZXRfbm9kZW1hcChUU1RfTlVN
QV9NRU0sIDIgKiBwYWdlX3NpemUgLyAxMDI0KTsKPiArCWlmIChub2Rlcy0+Y250IDw9IDEpCj4g
KwkJdHN0X2JyayhUQ09ORiwgIlRlc3QgcmVxdWlyZXMgYXQgbGVhc3QgdHdvIE5VTUEgbWVtb3J5
IG5vZGVzIik7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKPiArewo+ICsJ
dHN0X25vZGVtYXBfZnJlZShub2Rlcyk7Cj4gK30KTWF5YmUgc2V0dXAgYW5kIGNsZWFudXAgY2Fu
IGJlIHB1dCBhcyBzdGF0aWMgaW5saW5lIGludG8gbWJpbmQuaD8gQXMgaXQncwpyZXBlYXRlZC4g
UEFHRVNfQUxMT0NBVEVEIHdvdWxkIGhhdmUgdG8gYmUgZGVmaW5lZCBmb3IgYWxsLgoKLi4uCj4g
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYmluZC9tYmluZDAzLmMKPiBAQCAtMCww
ICsxLDEyMyBAQAo+ICsvKgo+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
ci1sYXRlcgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgQ3lyaWwgSHJ1YmlzIDxjaHJ1
YmlzQHN1c2UuY3o+Cj4gKyAqLwo+ICsKPiArLyoKPiArICogV2UgYXJlIHRlc3RpbmcgbWJpbmQo
KSBFSU8gZXJyb3IuCj4gKyAqCj4gKyAqIFdlIGZpcnN0IGZhdWx0IGEgYWxsb2NhdGVkIHBhZ2Us
IHRoZW4gYXR0ZW1wdCB0byBtYmluZCBpdCB0byBhIGRpZmZlcmVudCBub2RlLgpIZXJlIGlzIGEg
Y29weSBwYXN0ZSBlcnJvci4gQnV0IGNvbW1pdCBtZXNzYWdlIGlzIGNvcnJlY3Q6CiAgICBtYmlu
ZDAzOiBXZSBhcmUgbW92aW5nIHBhZ2VzIHdpdGggTVBPTF9NRl9NT1ZFIGFuZCBNUE9MX01GX01P
VkVfQUxMIGFuZAogICAgICAgICAgICAgY2hlY2tpbmcgdGhlIHJlc3VsdC4KCktpbmQgcmVnYXJk
cywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
