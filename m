Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D122FED1
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:05:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EB1A3EA656
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:05:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B02EC3EA133
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:05:04 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4875D200CE9
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:05:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A88FD307D849;
 Thu, 30 May 2019 15:05:02 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F2A37E5BD;
 Thu, 30 May 2019 15:05:01 +0000 (UTC)
Date: Thu, 30 May 2019 23:05:00 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190530150500.j2wkehkf5fopt2nw@XZHOUW.usersys.redhat.com>
References: <20190530102336.10898-1-xzhou@redhat.com>
 <20190530102336.10898-2-xzhou@redhat.com>
 <20190530111030.GC31468@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530111030.GC31468@rei.lan>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 30 May 2019 15:05:02 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] syscalls: update tcases using dev_fs_type to
 use some_filesystems
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

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDE6MTA6MzBQTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+ID4gU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5j
b20+Cj4gPiAtLS0KPiA+ICAuLi4va2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5
X2ZpbGVfcmFuZ2UwMi5jICAgfCA4ICsrKysrKy0tCj4gCj4gSSBndWVzcyB0aGF0IHdlIGNhbiBl
bmFibGUgdGhlIHRoaXMgdGVzdCBmb3IgYWxsIGZpbGVzeXN0ZW1zLCB0aGVyZSBpcwo+IGluLWtl
cm5lbCBmYWxsYmFjayBmb3IgZmlsZXN5c3RlbXMgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBz
eXNjYWxsIHNvCj4gaXQgc2hvdWxkIHdvcmsgb24gYWxsIGZpbGVzeXN0ZW1zIGFuZCB0aGUgZmFs
bGJhY2sgY29kZSBzaG91bGQgYmUgdGVzdGVkCj4gYXMgd2VsbC4KPiAKPiA+ICB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dldHhhdHRyMDQuYyAgICAgICAgICAgfCA3ICsrKysr
LS0KPiAKPiBXZWxsIEkgd291bGQgYmUgc2xpZ2h0bHkgaW4gZmF2b3Igb2YgZW5hYmxpbmcgdGhp
cyB0ZXN0IGZvciBhbGwKPiBmaWxlc3lzdGVtcyBhcyB3ZWxsLgo+IAo+IElmIHdlIGV2ZXIgd2Fu
dCB0byBtYWludGFpbiBsaXN0IG9mIGZpbGVzeXN0ZW1zIHRoYXQgc3VwcG9ydCBleHRlbmRlZAo+
IGF0dHJpYnV0ZXMgdGhlcmUgc2hvdWxkIGJlIG9ubHkgb25lIHNvbWV3aGVyZSBpbiB0aGUgdGVz
dCBsaWJyYXJ5IHNvCj4gdGhhdCB3ZSBkb24ndCBoYXZlIHRvIGNoYW5nZSB0aG91c2FuZCB0ZXN0
Y2FzZXMgbGF0ZXIgb24uCgpIbW0uLiBTbyB3ZSBhY3R1YWxseSBkb24ndCBuZWVkIHRoaXMgYXJy
YXkuIEp1c3QgZW5hYmxlIHNvbWUgcHJvcGVyCnRlc3RzIGZvciBhbGwgZmlsZXN5c3RlbXMuCgo+
IAo+IC0tIAo+IEN5cmlsIEhydWJpcwo+IGNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
