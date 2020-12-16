Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 267A72DC211
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 15:23:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E03243C57F8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 15:23:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F11773C2ADB
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 15:23:31 +0100 (CET)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6ADA51A0034D
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 15:23:31 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4EF3B60003;
 Wed, 16 Dec 2020 14:23:30 +0000 (UTC)
Date: Wed, 16 Dec 2020 15:23:29 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201216152329.2b35525d@kmaincent-XPS-13-7390>
In-Reply-To: <adc0cd36-8b6b-7323-7d08-d997f2f146e2@oracle.com>
References: <20201216094037.5886-1-kory.maincent@bootlin.com>
 <6abb1c7a-47d7-97dd-96c2-665c1030a554@oracle.com>
 <20201216115558.2964253d@kmaincent-XPS-13-7390>
 <adc0cd36-8b6b-7323-7d08-d997f2f146e2@oracle.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ipsec_lib.sh: test xfrm_user driver locally
 before rhost
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxleGV5LAoKT24gV2VkLCAxNiBEZWMgMjAyMCAxNDoxMDozNCArMDMwMApBbGV4ZXkgS29k
YW5ldiA8YWxleGV5LmtvZGFuZXZAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiB0c3RfbmV0
X3J1bigpIGNoZWNrcyB0aGUgZHJpdmVyIGxvY2FsbHkgZmlyc3QsIHNvIEkgZG9uJ3QKPiA+PiBx
dWl0ZSB1bmRlcnN0YW5kIHdoeSBkbyBleGFjdGx5IHRoZSBzYW1lIHdoYXQgdHN0X25ldF9ydW4o
KQo+ID4+IHN1cHBvc2VkIHRvIGRvPyAgCj4gPiAKPiA+IEluZGVlZCBidXQgaXQgcmV0dXJucyBh
IFRXQVJOIGJlY2F1c2UgdGhlIGNvbW1hbmQgInRzdF9jaGVja19kcml2ZXJzCj4gPiB4ZnJtX3Vz
ZXIiIG5vdCBlbmQgcHJvcGVybHksIGJ1dCBpbiBmYWN0IGl0IHNob3VsZCByZXR1cm4gYSBUQ09O
RiBkdWUgdG8KPiA+IHRoZSBtaXNzaW5nIHhmcm1fZHJpdmVycy4KPiA+IEluIHRoZSBmaW5hbCBy
ZXN1bHQgZmlsZSB3ZSBnb3QgYSBGQUlMIGVycm9yIHdpdGggdGhlIHZhbHVlIDM2IGluIHBsYWNl
IG9mIGEKPiA+IENPTkYgd2l0aCB2YWx1ZSAzMiB3aGljaCBzaG91bGQgYmUgdGhlIHJpZ2h0IG1l
c3NhZ2UuCj4gPiAgIAo+IAo+IFBlcmhhcHMgaXQgbmVlZHMgLXEgb3B0aW9uIGhlcmU6Cj4gCj4g
dHN0X25ldF9ydW4gLXEgInRzdF9jaGVja19kcml2ZXJzIHhmcm1fdXNlciIgLi4uIHNvIGl0IHNr
aXBzIFRXQVJOPwo+IAoKQWggeWVzLCBJIGZlZWwgc3R1cGlkISA7KQpUZXN0ZWQgaXQsIGl0IHdv
cmtzIGFzIGV4cGVjdGVkLgpEbyB5b3Ugd2FudCBtZSB0byBzZW5kIGEgdjIgcGF0Y2g/CgpSZWdh
cmRzLAoKS8O2cnkKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
