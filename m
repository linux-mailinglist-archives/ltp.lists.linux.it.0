Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5542B1E6B
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 16:17:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 812453C5FBE
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 16:17:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1E9A43C4FCB
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 16:17:43 +0100 (CET)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9B77614016D7
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 16:17:42 +0100 (CET)
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8B31F240013
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 15:17:41 +0000 (UTC)
Date: Fri, 13 Nov 2020 16:17:39 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Message-ID: <20201113161739.37034d68@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] Need support on host01 test command.
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

SGVsbG8sCgpJIGFtIHRyeWluZyB0byB1cGRhdGUgaG9zdDAxIHRlc3QgdG8gdGhlIG5ldyBBUEks
IGJ1dCBJIGdvdCBzb21lIHByb2JsZW0gd2l0aAp0aGF0IHRhc2suCgpJIGFtIG5vdCBhIG5ldHdv
cmsgZXhwZXJ0IGFuZCBJIGFtIHdvbmRlcmluZyB3aHkgSSBnb3QgdGhpcyBpc3N1ZToKIyBob3N0
ICQoaG9zdG5hbWUpCjs7IGNvbm5lY3Rpb24gdGltZWQgb3V0OyBubyBzZXJ2ZXJzIGNvdWxkIGJl
IHJlYWNoZWQKIyBob3N0IGxvY2FsY2hvc3QKOzsgY29ubmVjdGlvbiB0aW1lZCBvdXQ7IG5vIHNl
cnZlcnMgY291bGQgYmUgcmVhY2hlZAoKCkkgYW0gd29ya2luZyBvbiBhbiBlbWJlZGRlZCBib2Fy
ZCB3aXRoIGFuIE9wZW5FbWJlZGRlZCBiYXNlZCBkaXN0cmlidXRpb24uCkkgbWF5IG1pc3Mgc29t
ZSBuZXR3b3JrIHBhY2thZ2UsIGNvdWxkIHlvdSBnaXZlIG1lIGEgaGludCB0byBnbyBmdXJ0aGVy
LgoKUmVnYXJkcywKCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
