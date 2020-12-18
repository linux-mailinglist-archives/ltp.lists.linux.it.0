Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF572DE198
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 11:58:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1ECE23C6185
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 11:58:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 681F83C2A45
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 11:58:21 +0100 (CET)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D164A1401261
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 11:58:20 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id ED6B0E0005
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 10:58:19 +0000 (UTC)
Date: Fri, 18 Dec 2020 11:58:18 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Message-ID: <20201218115818.43f63eff@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] sctp/func_tests need driver sctp.
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

SGVsbG8sCgpJIGhhdmUgbm90aWNlZCBhbGwgdGhlIHRlc3RzIG9mIHNjdHAvZnVuY190ZXN0cyBu
ZWVkIHRoZSBkcml2ZXIgc2N0cC4KRG8gSSBhZGQgdGhpcyB0byBhbGwgdGhlc2UgdGVzdHMgdG8g
aGF2ZSB0aGUgcmlnaHQgVENPTkYgbWVzc2FnZToKCmlmICh0c3RfY2hlY2tfZHJpdmVyKCJzY3Rw
IikpCgl0c3RfYnJrbShUQ09ORiwgdHN0X2V4aXQsICJzY3RwIGRyaXZlciBub3QgYXZhaWxhYmxl
Iik7CgpPciBkbyB5b3UgaGF2ZSBhIGJldHRlciBpZGVhPwpJIHN1cHBvc2UgdGhlIGJlc3Qgc2hv
dWxkIGJlIHRvIHVwZGF0ZSB0aGVtIHRvIHRoZSBuZXcgQVBJLgoKUmVnYXJkcywKCkvDtnJ5Cgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
