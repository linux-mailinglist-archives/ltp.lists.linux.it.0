Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E62522FF67
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:27:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B14E73EA656
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:27:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B732B3EA04A
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:27:40 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0EBC41401837
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:27:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4807DAC5C;
 Thu, 30 May 2019 15:27:39 +0000 (UTC)
Date: Thu, 30 May 2019 17:27:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190530152736.GB25602@rei>
References: <20190530102336.10898-1-xzhou@redhat.com>
 <20190530102336.10898-2-xzhou@redhat.com>
 <20190530111030.GC31468@rei.lan>
 <20190530150500.j2wkehkf5fopt2nw@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530150500.j2wkehkf5fopt2nw@XZHOUW.usersys.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

SGkhCj4gPiBJIGd1ZXNzIHRoYXQgd2UgY2FuIGVuYWJsZSB0aGUgdGhpcyB0ZXN0IGZvciBhbGwg
ZmlsZXN5c3RlbXMsIHRoZXJlIGlzCj4gPiBpbi1rZXJuZWwgZmFsbGJhY2sgZm9yIGZpbGVzeXN0
ZW1zIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCB0aGUgc3lzY2FsbCBzbwo+ID4gaXQgc2hvdWxkIHdv
cmsgb24gYWxsIGZpbGVzeXN0ZW1zIGFuZCB0aGUgZmFsbGJhY2sgY29kZSBzaG91bGQgYmUgdGVz
dGVkCj4gPiBhcyB3ZWxsLgo+ID4gCj4gPiA+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dl
dHhhdHRyL2dldHhhdHRyMDQuYyAgICAgICAgICAgfCA3ICsrKysrLS0KPiA+IAo+ID4gV2VsbCBJ
IHdvdWxkIGJlIHNsaWdodGx5IGluIGZhdm9yIG9mIGVuYWJsaW5nIHRoaXMgdGVzdCBmb3IgYWxs
Cj4gPiBmaWxlc3lzdGVtcyBhcyB3ZWxsLgo+ID4gCj4gPiBJZiB3ZSBldmVyIHdhbnQgdG8gbWFp
bnRhaW4gbGlzdCBvZiBmaWxlc3lzdGVtcyB0aGF0IHN1cHBvcnQgZXh0ZW5kZWQKPiA+IGF0dHJp
YnV0ZXMgdGhlcmUgc2hvdWxkIGJlIG9ubHkgb25lIHNvbWV3aGVyZSBpbiB0aGUgdGVzdCBsaWJy
YXJ5IHNvCj4gPiB0aGF0IHdlIGRvbid0IGhhdmUgdG8gY2hhbmdlIHRob3VzYW5kIHRlc3RjYXNl
cyBsYXRlciBvbi4KPiAKPiBIbW0uLiBTbyB3ZSBhY3R1YWxseSBkb24ndCBuZWVkIHRoaXMgYXJy
YXkuIEp1c3QgZW5hYmxlIHNvbWUgcHJvcGVyCj4gdGVzdHMgZm9yIGFsbCBmaWxlc3lzdGVtcy4K
Ckxvb2tzIGxpa2UgdGhhdCwgSSd2ZSBjaGVja2VkIHRoZSBmZ2V0eGF0dHIwMS5jIHRlc3QgYW5k
IHdlIG9ubHkgc2tpcApmYXQgYW5kIHZmYXQgd2hlbiB0aGUgdGVzdCBpcyBleGVjdXRlZCwgYWxs
IHRoZSBvdGhlciBmaWxlc3lzdGVtcyBkbwpzdXBwb3J0IGV4dGVuZGVkIGF0dHJpYnV0ZXMuIERp
c2FibGluZyBmYXQgYW5kIHZmYXQgZG9lcyBub3Qgc2VlbSB0bwpzcGVlZCB1cCB0aGUgdGVzdCBh
dCBhbGwsIEkgZ3Vlc3MgdGhhdCB0aGUgbWtmcyArIG1vdW50IGlzIGZhc3QgZW5vdWdoCnNvIHRo
YXQgdGhlIGRpZmZlcmVuY2UgaXMgbm90IG1lYXN1cmVhYmxlLgoKLS0gCkN5cmlsIEhydWJpcwpj
aHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
