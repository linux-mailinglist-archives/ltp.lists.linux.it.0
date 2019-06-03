Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33F33228
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:31:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F88F294AE6
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:31:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 39250294AC4
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:31:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E31031400530
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:31:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B5C7AED0;
 Mon,  3 Jun 2019 14:31:35 +0000 (UTC)
Date: Mon, 3 Jun 2019 16:31:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Sandeep Patil <sspatil@android.com>
Message-ID: <20190603143137.GA18922@dell5510>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-4-sspatil@android.com>
 <20190529112529.GC26685@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529112529.GC26685@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 3/5] syscalls/asyncio02: convert to new library.
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IFRoZSBjbGVhbnVwIGxvb2tzIGdvb2QsIGJ1dCB3ZSBzaG91bGQgYWxzbyBkZWNpZGUg
d2hhdCB0byBkbyB3aXRoIHRoZQo+IHRlc3QgYXMgaXQgaXMgaW4gYSB3cm9uZyBwbGFjZS4gVGhl
cmUgaXMgbm8gYXN5bmNpbyBzeXNjYWxsIGluIExpbnV4IGFuZAo+IHRoZSB0ZXN0IGFjdHVhbGx5
IGxvb2tzIHZlcnkgc2ltaWxhciB0byB0aGUgc3RhdDAxLmMgdGVzdCwgc28gbWF5YmUgaXQKPiB3
b3VsZCBiZSBiZXN0IHRvIHJlbmFtZSB0aGUgdGVzdCB0byBzdGF0MDIuYyBhZnRlciB0aGUgY2xl
YW51cC4gV2hhdCBkbwo+IHlvdSB0aGluaz8KSSdkIGFsc28gbW92ZSBpdCBpbnRvIHN0YXQvc3Rh
dDAyLmMuCgo+IEN5cmlsIEhydWJpcwoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
