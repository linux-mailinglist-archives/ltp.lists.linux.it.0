Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ACE2DD305
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 15:30:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 666363C57C3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 15:30:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E9C6E3C334D
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 15:30:00 +0100 (CET)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 41406600F22
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 15:29:59 +0100 (CET)
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A022324000A;
 Thu, 17 Dec 2020 14:29:58 +0000 (UTC)
Date: Thu, 17 Dec 2020 15:29:57 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201217152957.685200a9@kmaincent-XPS-13-7390>
In-Reply-To: <X9tcZzYQUkkw6abP@pevik>
References: <20201217085852.26032-1-kory.maincent@bootlin.com>
 <X9tcZzYQUkkw6abP@pevik>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fastopen: add require to sch_netem driver
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

SGkgUGV0ciwKCk9uIFRodSwgMTcgRGVjIDIwMjAgMTQ6MjU6NTkgKzAxMDAKUGV0ciBWb3JlbCA8
cHZvcmVsQHN1c2UuY3o+IHdyb3RlOgoKPiBIaSBLb3J5LAo+IAo+ID4gK1RTVF9ORUVEU19EUklW
RVJTPSJzY2hfbmV0ZW0iICAKPiBPbiBteSBzeXN0ZW0gYWxzbyB2ZXRoLCB4ZnJtX2FsZ28gYW5k
IHhmcm1fdXNlciBhcmUgbG9hZGVkLgo+IAo+IHZldGggaXMgYWRkZWQgYmVjYXVzZSBJIHVzZSBu
ZXR3b3JrIG5hbWVzcGFjZXMgYmFzZWQgdGVzdGluZyAoSSdsbCBhZGQgaXQgb24KPiBzZXBhcmF0
ZSBwYXRjaCkgYW5kIHhmcm1fYWxnbyBpcyB1c2VkIHhmcm1fdXNlci4KClRoZSB4ZnJtX3VzZXIg
ZHJpdmVyIHNlZW1zIG5vdCB0byBiZSBuZWVkZWQgZm9yIHRoZSBmYXN0b3BlbiB0ZXN0LgoKUmVn
YXJkcywKCkvDtnJ5IAoKPiAKPiBUaHVzIG1heWJlIGFkZCBhbHNvIHhmcm1fdXNlcj8KPiBUU1Rf
TkVFRFNfRFJJVkVSUz0ic2NoX25ldGVtIHhmcm1fdXNlciIKPiAKPiBLaW5kIHJlZ2FyZHMsCj4g
UGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
