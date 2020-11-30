Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9FC2C8E19
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 20:33:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EBBD3C63A0
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 20:33:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 098253C24FD
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 20:33:27 +0100 (CET)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03EF41A0037B
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 20:33:26 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E2A3F1BF204
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 19:33:25 +0000 (UTC)
Date: Mon, 30 Nov 2020 20:33:24 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Message-ID: <20201130203324.613c1b08@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] Make FTP test compatible with Busybox and Dropbear.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpJIGFtIHdvcmtpbmcgd2l0aCBMVFAgb24gYW4gZW1iZWRkZWQgYm9hcmQuCkkgd291
bGQgbGlrZSB0byBub3RpY2UgdGhlIHJob3N0X3J1biBjb21tYW5kIGRvZXMgbm90IHdvcmsgd2l0
aCBEcm9wYmVhciBzc2gKY2xpZW50LiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIGhvdyB0c3Rf
bmV0IHdvcmsgYnV0IEkgYW0gYSBiaXQgc3RydWdnbGluZwp3aXRoIGl0LiBXaGF0IGlzIHRoZSB1
c2FnZSBvZiBUU1RfVVNFX05FVE5TLCBhbmQgdGhlIHB1cnBvc2Ugb2YgbmV0c3BhY2UgKGl0CnNl
ZW1zIHRvIGJlIHVzZWQgdG8gY29uZmlndXJlIGEgdmlydHVhbCBpbnRlcmZhY2UpPwpNeSBhaW0g
d2FzIHRvIG1ha2UgRlRQIHRlc3Qgd29yayB3aXRoIERyb3BiZWFyIGFuZCBCdXN5Ym94LiBJZiBz
b21lb25lIGNvdWxkCnBvaW50IG1lIG91dCBob3cgdG8gZG8gaXQuCgpSZWdhcmRzLAoKS8O2cnkK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
