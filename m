Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E571C440F7
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:11:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BED92294AF9
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:11:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 33F1A294AA9
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:11:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E14211001991
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:11:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E373AF19;
 Thu, 13 Jun 2019 16:11:22 +0000 (UTC)
Date: Thu, 13 Jun 2019 18:11:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190613161117.GA14232@rei.lan>
References: <20190610002610.2187-1-sspatil@android.com>
 <20190610002610.2187-3-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610002610.2187-3-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/3] syscalls/asyncio02: convert to new library.
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

SGkhCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3RhdC9zdGF0MDIu
YyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3RhdC9zdGF0MDIuYwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwLi44ZGJhYzcyMzYKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zdGF0L3N0YXQwMi5jCj4gQEAgLTAsMCAr
MSw5MyBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAoKQ2hhbmdlZCB0
aGlzIHRvIEdQTC0yLjAtb3ItbGF0ZXIgdG8gbWF0Y2ggdGhlIG9yaWdpbmFsIGhlcmUgYXMgd2Vs
bCBhbmQKcHVzaGVkLCB0aGFua3MuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
