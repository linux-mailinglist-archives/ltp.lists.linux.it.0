Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9D331E7
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:18:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A891C294AFA
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:18:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3752A294AC4
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:18:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6072E600934
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:18:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1105BADE6;
 Mon,  3 Jun 2019 14:18:51 +0000 (UTC)
Date: Mon, 3 Jun 2019 16:18:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190603141853.GA17414@dell5510>
References: <20190424085317.409-1-amir73il@gmail.com>
 <CAOQ4uxgSrpfo=uz29PQOO0LjZFdX+dY4PNQdb7rCWbP3T8MgAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgSrpfo=uz29PQOO0LjZFdX+dY4PNQdb7rCWbP3T8MgAA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] fanotify06: add a test case for overlayfs
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

SGkgQW1pciwKCi4uLgo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
ZmFub3RpZnkvZmFub3RpZnkwNi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlm
eS9mYW5vdGlmeTA2LmMKPiA+IGluZGV4IDZhMmUyNDk0Zi4uNjJkZWZiMjNjIDEwMDY0NAo+ID4g
LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTA2LmMKPiA+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNi5jCj4g
PiBAQCAtNTQsOCArNTQsMjMgQEAgc3RhdGljIGludCBmZF9ub3RpZnlbRkFOT1RJRllfUFJJT1JJ
VElFU11bR1JPVVBTX1BFUl9QUklPXTsKCj4gPiAgc3RhdGljIGNoYXIgZXZlbnRfYnVmW0VWRU5U
X0JVRl9MRU5dOwoKPiA+IC0jZGVmaW5lIE1PVU5UX05BTUUgIm1udHBvaW50Igo+ID4gKyNkZWZp
bmUgTU5UUE9JTlQgIm1udHBvaW50Igo+ID4gKyNkZWZpbmUgT1ZMX0xPV0VSICJvdmwtbG93ZXIi
Cj4gPiArI2RlZmluZSBPVkxfVVBQRVIgIm92bC11cHBlciIKPiA+ICsjZGVmaW5lIE9WTF9XT1JL
ICJvdmwtd29yayIKPiA+ICsjZGVmaW5lIE9WTF9NTlQgIm92bC1tbnQiCkkgZ3Vlc3MgeW91J3Jl
IGdvaW5nIHRvIHNlbmQgdjIgd2l0aCB7U0FGRSxUU1R9X01PVU5UX09WRVJMQVkoKSBvciAubmVl
ZHNfb3ZlcmxheSB1c2FnZSBmcm9tIGxpYnJhcnkuCi4uLgoKS2luZCByZWdhcmRzLApQZXRyCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
