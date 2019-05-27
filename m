Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C782B6AB
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 15:41:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB3CE294AC0
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 15:41:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F404C294A8D
 for <ltp@lists.linux.it>; Mon, 27 May 2019 15:41:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D95282001DE
 for <ltp@lists.linux.it>; Mon, 27 May 2019 15:41:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 006C3AE78;
 Mon, 27 May 2019 13:41:26 +0000 (UTC)
Date: Mon, 27 May 2019 15:41:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190527134125.GA23658@rei>
References: <7113d89a-3eb8-5671-bb6a-26cc4cbb69bf@163.com>
 <1558945171-2252-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558945171-2252-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/prctl05.c: New test for prctl() with
 PR_{SET, GET}_NAME
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

SGkhClB1c2hlZCB3aXRoIG1pbm9yIGNoYW5nZSwgdGhhbmtzLgoKLi4uCgo+ICsJaWYgKHN0cmNt
cCh0Yy0+ZXhwbmFtZSwgYnVmKSkgewo+ICsJCXRzdF9yZXMoVEZBSUwsCj4gKwkJCSJwcmN0bChQ
Ul9HRVRfTkFNRSkgZmFpbGVkLCBleHBlY3RlZCAlcywgZ290ICVzIiwgdGMtPmV4cG5hbWUsIGJ1
Zik7Cj4gKwkJcmV0dXJuOwo+ICsJfQoKSSd2ZSBjaGFuZ2VkIHRoaXMgc3RyY21wKCkgdG8gc3Ry
bmNtcCgpIHRvIGF2b2lkIHVuZGVmaW5lZCBiZWhhdmlvciBpbgp1bmxpa2VseSBjYXNlIHRoYXQg
a2VybmVsIGZhaWxlZCB0byB0ZXJtaW5hdGVkIHRoZSBidWZmZXIuCgotLSAKQ3lyaWwgSHJ1Ymlz
CmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
