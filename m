Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9A2B0B95
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 18:48:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 474963C659A
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 18:48:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6C3A13C5FE2
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 18:48:51 +0100 (CET)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AD7C36005CE
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 18:48:50 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 82C8920007;
 Thu, 12 Nov 2020 17:48:49 +0000 (UTC)
Date: Thu, 12 Nov 2020 18:48:47 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201112184847.6ec3fa93@kmaincent-XPS-13-7390>
In-Reply-To: <20201112174134.GA29575@pevik>
References: <20201112145636.31091-1-kory.maincent@bootlin.com>
 <20201112174134.GA29575@pevik>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/traceroute01: make it compatible with
 Busybox
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

SGkgUGV0ciwKCk9uIFRodSwgMTIgTm92IDIwMjAgMTg6NDE6MzQgKzAxMDAKUGV0ciBWb3JlbCA8
cHZvcmVsQHN1c2UuY3o+IHdyb3RlOgoKPiBIaSBLb3J5LAo+IAo+ID4gQnVzeWJveCBoYXMgbm90
ICItVCIgcGFyYW1ldGVyLCByZXR1cm4gVENPTkYgaW4gdGhhdCBjYXNlLiAgCj4gVGhhbmtzLCBt
ZXJnZWQgd2l0aCBzbGlnaHRseSB1cGRhdGVkIG1lc3NhZ2UuCj4gKyBmb2xsb3d1cCBwYXRjaDoK
PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL3BhdGNoLzIwMjAxMTEy
MTczNjA5LjQxMjMtMS1wZXRyLnZvcmVsQHN1c2UuY29tLwoKT2sgdGhhbmtzLgoKUmVnYXJkcywK
Cj4gCj4gS2luZCByZWdhcmRzLAo+IFBldHIKCgoKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNv
bQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
