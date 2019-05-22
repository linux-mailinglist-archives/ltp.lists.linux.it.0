Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B559126A71
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 21:03:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A3EC3EA37C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 21:03:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 38BB13EA2E2
 for <ltp@lists.linux.it>; Wed, 22 May 2019 21:03:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ACC68602214
 for <ltp@lists.linux.it>; Wed, 22 May 2019 21:03:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C45BEAE8D;
 Wed, 22 May 2019 19:03:18 +0000 (UTC)
Date: Wed, 22 May 2019 21:03:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190522190316.GA6781@dell5510>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
 <20190520144645.GD28976@rei.lan> <20190520152400.GA11845@dell5510>
 <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
 <20190521114040.GB13910@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521114040.GB13910@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
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

SGksCgo+ID4gPiA+ID4gMikgR2xpYmMgYWRkcyBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBvZiBj
b3B5X2ZpbGVfcmFuZ2UoKSwgdXNlZCBhcyBmYWxsYmFjawo+ID4gPiA+ID4gd2hlbiBrZXJuZWwg
PCA0LjUgKHdoaWNoIGJyb3VnaHQgY29weV9maWxlX3JhbmdlKCkpIFsxXS4gSSBndWVzcyB0aGVy
ZSBpcyBubyB3YXkKPiA+ID4gPiA+IHRvIHVzZSBpdCBleHBsaWNpdGx5IDooLgoKPiA+ID4gPiBX
ZWxsIHdlIGNhbiBhbHdheXMgdXNlIGZpbGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRo
ZSBvcGVyYXRpb24sCj4gPiA+ID4gc28gcnVubmluZyB0aGUgdGVzdCBmb3IgYWxsIGZpbGVzeXN0
ZW1zIHNob3VsZCBnZXQgdGhlIGVtdWxhdGlvbiBjb3ZlcmVkCj4gPiA+ID4gZm9yIHN1cmUuLi4K
PiA+ID4gT2gsIHRoYXQncyB0aGUgd2F5IDopLgoKPiA+IEFjdHVhbGx5LCB0aGVyZSBpcyBubyBz
dWNoIHRoaW5nIGFzIGZpbGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0Cj4gPiBjb3B5X2Zp
bGVfcmFuZ2UoKSBiZWNhdXNlIHRoZSBrZXJuZWwgcHJvdmlkZXMgYSBmYWxsYmFjayBkZWZhdWx0
IGltcGxlbWVudGF0aW9uCj4gPiAoaW4ta2VybmVsIGNvcHkpLgoKPiBTbyB0aGUgZ2xpYmMgZmFs
bGJhY2sgY29kZSBpcyBwcm9iYWJseSBzb21ldGhpbmcgdGhhdCB3aWxsIGVuZCB1cCBiZWluZwo+
IHVzZWQgaWYgc29tZW9uZSB3YW50cyB0byBydW4gYXBwbGljYXRpb24gdGhhdCB1c2VzIHRoaXMg
c3lzY2FsbCBvbiBCU0QKPiBvciBvdGhlciBjb3JuZXIgY2FzZXMuIEkgZ3Vlc3MgdGhhdCB3ZSBk
byBub3QgY2FyZSB0aGF0IG11Y2ggYWJvdXQKPiB0ZXN0aW5nIHRoZSBnbGliYyBmYWxsYmFjayBj
b2RlIHRoZW4uCk9LLCB3ZSBzaG91bGQgcmVtb3ZlIHRlc3QgdmFyaWFudHMgdGhlbi4KCktpbmQg
cmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
