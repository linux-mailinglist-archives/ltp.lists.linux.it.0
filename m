Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70C2B3EB5
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 09:33:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02C123C4F45
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 09:33:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 142B53C260E
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 09:33:46 +0100 (CET)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 17EB11A000BB
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 09:33:45 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C2ED2240008;
 Mon, 16 Nov 2020 08:33:44 +0000 (UTC)
Date: Mon, 16 Nov 2020 09:33:39 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201116093339.46687d76@kmaincent-XPS-13-7390>
In-Reply-To: <509d120d-35b5-d435-c052-4d34314dd438@oracle.com>
References: <20201113161739.37034d68@kmaincent-XPS-13-7390>
 <509d120d-35b5-d435-c052-4d34314dd438@oracle.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Need support on host01 test command.
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gQWxleGV5LAoKT24gRnJpLCAxMyBOb3YgMjAyMCAxOToyMjozOSArMDMwMApBbGV4ZXkg
S29kYW5ldiA8YWxleGV5LmtvZGFuZXZAb3JhY2xlLmNvbT4gd3JvdGU6Cgo+IE9uIDEzLjExLjIw
MjAgMTg6MTcsIEvDtnJ5IE1haW5jZW50IHdyb3RlOgo+ID4gSGVsbG8sCj4gPiAKPiA+IEkgYW0g
dHJ5aW5nIHRvIHVwZGF0ZSBob3N0MDEgdGVzdCB0byB0aGUgbmV3IEFQSSwgYnV0IEkgZ290IHNv
bWUgcHJvYmxlbQo+ID4gd2l0aCB0aGF0IHRhc2suCj4gPiAKPiA+IEkgYW0gbm90IGEgbmV0d29y
ayBleHBlcnQgYW5kIEkgYW0gd29uZGVyaW5nIHdoeSBJIGdvdCB0aGlzIGlzc3VlOgo+ID4gIyBo
b3N0ICQoaG9zdG5hbWUpCj4gPiA7OyBjb25uZWN0aW9uIHRpbWVkIG91dDsgbm8gc2VydmVycyBj
b3VsZCBiZSByZWFjaGVkCj4gPiAjIGhvc3QgbG9jYWxjaG9zdAo+ID4gOzsgY29ubmVjdGlvbiB0
aW1lZCBvdXQ7IG5vIHNlcnZlcnMgY291bGQgYmUgcmVhY2hlZAo+ID4gCj4gPiAKPiA+IEkgYW0g
d29ya2luZyBvbiBhbiBlbWJlZGRlZCBib2FyZCB3aXRoIGFuIE9wZW5FbWJlZGRlZCBiYXNlZCBk
aXN0cmlidXRpb24uCj4gPiBJIG1heSBtaXNzIHNvbWUgbmV0d29yayBwYWNrYWdlLCBjb3VsZCB5
b3UgZ2l2ZSBtZSBhIGhpbnQgdG8gZ28gZnVydGhlci4KPiA+ICAgCj4gCj4gSGkgS29yeSwKPiAK
PiBFaXRoZXIgeW91IGRvbid0IGhhdmUgL2V0Yy9yZXNvbHYuY29uZiBvciBpdCBpcyBlbXB0eS4K
Ck9rLCB0aGFuayB5b3UgZm9yIHBvaW50aW5nIG1lIG91dCB0aGUgY2F1c2UuCkluIGZhY3QsIHRo
ZSBmaWxlIGV4aXN0IGFuZCBpcyBsaW5rZWQgdG8gL3J1bi9zeXN0ZW1kL3Jlc29sdmUvcmVzb2x2
LmNvbmYgYnV0Cm15IGlzc3VlIHdhcyBpZiBub3RoaW5nIGlzIHBsdWdnZWQgb24gdGhlIGV0aGVy
bmV0IHBvcnQgaXQgaXMgbm90IHdvcmtpbmcuIAoKUmVnYXJkcywKCi0tIApLw7ZyeSBNYWluY2Vu
dCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
