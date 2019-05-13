Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 693CA1B6D6
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 15:14:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 194703EA4EF
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 15:14:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 515603EA4E3
 for <ltp@lists.linux.it>; Mon, 13 May 2019 15:14:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0523E140162E
 for <ltp@lists.linux.it>; Mon, 13 May 2019 15:14:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F07A0AD6F;
 Mon, 13 May 2019 13:14:52 +0000 (UTC)
Date: Mon, 13 May 2019 15:14:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190513131451.GA22761@dell5510>
References: <1557732392-7049-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557732392-7049-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ltp-cap.m4: add libcap version detection && fix
 compiler error
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

SGkgWWFuZywKCgo+IEN1cnJlbnQgbHRwLWNhcC5tNCBkZWZpbmVzIGNhcF9saWJzIHdoZW4gbGli
Y2FwIGhhcwo+IGNhcF9jb21wYXJlIGZ1bmN0aW9uLiAgVGhpcyBmdW5jdGlvbiB3YXMgaW50cm9k
dWNlZCBieQo+IGxpYmNhcC0yLiBJdCBpcyBvbmx5IHVzZWQgZm9yIHRoZSB0d28gcGxhY2VzLCBh
bmQgYW5vdGhlcgo+IHBsYWNlcyB3b3JrIGZpbmVzIHdpdGggbGliY2FwLTEuIFNvIGFkZCBsaWJj
YXAgdmVyc2lvbgo+IGRldGVjdGlvbi4KCkNhbid0IHdlIGp1c3QgZml4IHRoZXNlIHBvc3NpYmxl
IGNvbXBpbGVyIGVycm9ycyBmb3Igb2xkIGRpc3Ryb3MgYW5kIHJlcXVpcmUKbGliY2FwIHYyPyAg
VENPTkYgZm9yIHZlcnkgb2xkIGRpc3Ryb3MgbG9va3MgT0sgZm9yIG1lLgpsaWJjYXAtMi4wMCB3
YXMgcmVsZWFzZWQgMTIgeWVhcnMgYWdvICgyMDA3KSwgdGhlc2UgZGlzdHJvcyBkb2VzIG5vdCBo
YXZlIGl0OgpTTEVTIDEwIFNQMyBbMV0sIFJIRUwtNC44IFsyXSwgRGViaWFuIDQuMCBbM10uIERv
IHdlIHJlYWxseSB3YW50IHRvIGNhcmUgYWJvdXQKdGhlc2Ugb2xkIGRpc3Ryb3MgKGl0IGxvb2tz
IGxpa2Ugb25seSBSSEVMIGlzIHN1cHBvcnRlZCk/CldlIGFsc28gZHJvcHBlZCBsaWJudW1hIHYx
IHN1cHBvcnQgKGluIDJjOThjYmJhZiksIHYyIHdhcyByZWxlYXNlZCBhdCBzaW1pbGFyCmRhdGUg
KDIwMDgpLgoKS2luZCByZWdhcmRzLApQZXRyCgpbMV0gaHR0cHM6Ly9kaXN0cm93YXRjaC5jb20v
dGFibGUucGhwP2Rpc3RyaWJ1dGlvbj1zbGUmcGtnbGlzdD10cnVlJnZlcnNpb249MTAtc3AzI3Br
Z2xpc3QKWzJdIGh0dHBzOi8vZGlzdHJvd2F0Y2guY29tL3RhYmxlLnBocD9kaXN0cmlidXRpb249
cmVkaGF0JnBrZ2xpc3Q9dHJ1ZSZ2ZXJzaW9uPXJoZWwtNC44I3BrZ2xpc3QKWzNdIGh0dHBzOi8v
ZGlzdHJvd2F0Y2guY29tL3RhYmxlLnBocD9kaXN0cmlidXRpb249ZGViaWFuJnBrZ2xpc3Q9dHJ1
ZSZ2ZXJzaW9uPTQuMCNwa2dsaXN0CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
