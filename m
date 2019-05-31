Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6512630BE5
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:44:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D93A2B0305
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:44:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 457653EA04A
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:43:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BF6A81A014E9
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:43:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 163C1AFE4;
 Fri, 31 May 2019 09:43:57 +0000 (UTC)
Date: Fri, 31 May 2019 11:43:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190531094356.GC4224@rei.lan>
References: <CAMy_GT-kRs7_EZvrP-JdFc_wa8OMc3295N6FWUg7AxoY2O66fA@mail.gmail.com>
 <20190531083203.GA4224@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531083203.GA4224@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] insmod01_sh test from commands test suite will make
 cve-2017-17053 test fail
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

SGkhCj4gPiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4MzAwMTEK
PiAKPiBMb29raW5nIGF0IHRoZSBidWcgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgbW9kdWxlIGlz
IG1pc3NpbmcgbGljZW5zZS4KPiAKPiBJIGd1ZXNzIHRoYXQgYWRkaW5nIE1PRFVMRV9MSUNFTlNF
KCJHUEwiKTsgdG8gdGhlIGR1bW15IG1vZHVsZQo+IHRlc3RjYXNlcy9jb21tYW5kcy9pbnNtb2Qv
bHRwX2luc21vZDAxLmMgc2hvdWxkIGZpeCBpdC4KCkp1c3QgRllJLCB0aGUgbGljZW5jZSB0YWlu
dCBmbGFnIGlzIG5vdyBmaXhlZCBpbjoKCmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXBy
b2plY3QvbHRwL2NvbW1pdC8zMDE1ZDU5MjMwMWVmMzdhZmUyZGVlMmRkYjAzYmUxMjZjZmZkNmY4
CgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
