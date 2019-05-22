Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A202665F
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 16:56:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97ADE3EA37C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 16:56:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E102A3EA2E6
 for <ltp@lists.linux.it>; Wed, 22 May 2019 16:56:12 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 56C381A017CE
 for <ltp@lists.linux.it>; Wed, 22 May 2019 16:56:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B51AAFE4;
 Wed, 22 May 2019 14:56:09 +0000 (UTC)
Date: Wed, 22 May 2019 16:56:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190522145607.GA25727@rei.lan>
References: <20190519003808.47425-5-sspatil@android.com>
 <20190519233327.249118-1-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519233327.249118-1-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/bdflush01: delete bdflush test
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

SGkhCj4gVGhlIG1hbnVhbCBzYXlzIHRoZSBzeXN0ZW0gY2FsbCBpcyBkZXByZWNhdGVkIHNpbmNl
IExpbnV4IDIuNgo+IGFuZCBkb2VzIG5vdGhpbmcuIFNvLCByZW1vdmUgdGhlIHRlc3QuCgpBcHBs
aWVkLCB0aGFua3MuCgpBbmQgYWN0dWFsbHkgbG9va2luZyBpbnRvIHRoZSBrZXJuZWwgc291cmNl
cyB0aGUgc3lzY2FsbCBzdHViIGlzIHN0aWxsCnRoZXJlIG9uIGEgc3Vic2V0IG9mIGFyY2hpdGVj
dHVyZXMsIGkuZS4gdGhlc2UgdGhhdCBMaW51eCB3YXMgcG9ydGVkIHRvCmJlZm9yZSAyLjYgd2l0
aCBhIGNvbW1lbnQgdGhhdCBpdCB3aWxsIGJlIHJlbW92ZWQgc2VlIGZzL2J1ZmZlci5jLiBNYXli
ZQppdCdzIGEgdGltZSB0byByZW1vdmUgdGhhdCBzdHViIGFzIHdlbGwuLi4KCi0tIApDeXJpbCBI
cnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
