Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6F25106
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:48:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 023DC3EA70A
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:48:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CF7D43EA687
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:47:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 852D8100118B
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:47:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10A35AEE1;
 Tue, 21 May 2019 13:47:54 +0000 (UTC)
Date: Tue, 21 May 2019 15:47:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190521134752.GB19326@rei.lan>
References: <20190520144145.GC28976@rei.lan>
 <1558432300-2269-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558432300-2269-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/move_page12: Add new regression test
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

SGkhCj4gKwkJaWYgKHRjYXNlc1tuXS5vZmZsaW5lKSB7Cj4gKwkJCWlmIChkb19zb2Z0X29mZmxp
bmUodGNhc2VzW25dLnRwYWdlcykgPT0gRUlOVkFMKSB7Cj4gKwkJCQlTQUZFX0tJTEwoY3BpZCwg
U0lHS0lMTCk7Cj4gKwkJCQlTQUZFX1dBSVRQSUQoY3BpZCwgJnN0YXR1cywgMCk7Cj4gKwkJCQlT
QUZFX01VTk1BUChhZGRyLCB0Y2FzZXNbbl0udHBhZ2VzICogaHBzeik7Cj4gKwkJCQl0c3RfcmVz
KFRGQUlMLAoJCQkJCV4KCQkJCQlTaG91bGRuJ3QgdGhpcyBiZSBUQ09ORiBpbnN0ZWFkPwoKPiAr
CQkJCQkibWFkdmlzZSgpIGRpZG4ndCBzdXBwb3J0ICIKPiArCQkJCQkiTUFEVl9TT0ZUX09GRkxJ
TkUiKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoJCQkJ
CSBMS01MIGNvZGluZyBzdHlsZSBwcmVmZXJzIG5vdAoJCQkJCSB0byBicmVhayB1cCB1c2VyIHZp
c2libGUKCQkJCQkgc3RyaW5ncywgc28gdGhpcyBzdHJpbmcgc2hvdWxkCgkJCQkJIGJlIG9uIG9u
ZSBsaW5lIGV2ZW4gaWYgdGhlIGxpbmUKCQkJCQkgaXMgbG9uZ2VyIHRoYW4gODAgY2hhcnMuCgo+
ICsJCQkJcmV0dXJuOwo+ICsJCQl9Cj4gKwkJfQoKT3RoZXIgdGhhbiB0aGF0IGl0IGxvb2tzIGdv
b2QuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
