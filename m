Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC51A994F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:49:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E77E3C2B0B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:49:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4E9C93C2B01
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:49:34 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 85C45140134B
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:49:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1CDD9AC6E;
 Wed, 15 Apr 2020 09:49:33 +0000 (UTC)
Date: Wed, 15 Apr 2020 11:49:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200415094932.GA29975@dell5510>
References: <20200415092809.20240-1-pvorel@suse.cz>
 <20200415092809.20240-2-pvorel@suse.cz>
 <20200415093038.GA12705@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415093038.GA12705@rei.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/8] lib: Fix linking error multiple TCID
 definitions with -fno-common
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsCgo+ID4gK2V4dGVybiBjb25zdCBjaGFyICpUQ0lEOwoKPiBEbyB3ZSByZWFsbHkg
bmVlZCB0aGlzIGV4dGVybiBvciBjYW4gd2UgcmVtb3ZlIGl0PwpTb21lIGNvZGUgaXMgdXNpbmcg
VENJRCwgbm90IHN1cmUgaWYgaXQgY291bGQgYmUgcmVwbGFjZWQgYnkgc29tZXRoaW5nIGVsc2Ug
b3IKd2hldGhlciBpcyB3b3J0aCB0byBhZGQgQVBJIGZ1bmN0aW9uIHdoaWNoIHJldHVybnMgVENJ
RC4KCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBtZW1mZF9jcmVhdGUwMS5jOjE3OgptZW1mZF9jcmVh
dGUwMS5jOiBJbiBmdW5jdGlvbiDigJh2ZXJpZnlfbWVtZmRfY3JlYXRl4oCZOgptZW1mZF9jcmVh
dGUwMS5jOjI0NDoyMTogZXJyb3I6IOKAmFRDSUTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGlu
IHRoaXMgZnVuY3Rpb24pCiAgMjQ0IHwgIGZkID0gQ0hFQ0tfTUZEX05FVyhUQ0lELCBNRkRfREVG
X1NJWkUsIHRjLT5mbGFncyk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICBefn5+Ci0tLQoK
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIHRlc3RjYXNlcy9rZXJuZWwvbWVtL2luY2x1ZGUvbWVtLmg6
NCwKICAgICAgICAgICAgICAgICBmcm9tIG92ZXJjb21taXRfbWVtb3J5LmM6NzI6Cm92ZXJjb21t
aXRfbWVtb3J5LmM6IEluIGZ1bmN0aW9uIOKAmHNldHVw4oCZOgpvdmVyY29tbWl0X21lbW9yeS5j
OjEwNTozMzogZXJyb3I6IOKAmFRDSUTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMg
ZnVuY3Rpb24pCiAgMTA1IHwgICAgICJjYW4ndCBzdXBwb3J0IHRvIHRlc3QgJXMiLCBUQ0lEKTsK
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KLS0tCgpJbiBmaWxl
IGluY2x1ZGVkIGZyb20gaW1hX21tYXAuYzo5OgppbWFfbW1hcC5jOiBJbiBmdW5jdGlvbiDigJhy
dW7igJk6CmltYV9tbWFwLmM6MzY6NDM6IGVycm9yOiDigJhUQ0lE4oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICAzNiB8ICAgdHN0X2JyayhUQlJPSywgIlVzYWdl
OiAlcyAtZiBmaWxlbmFtZSIsIFRDSUQpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn4KCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
