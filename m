Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6141B308
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:40:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B642F294AC7
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:40:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 41B833EA4CA
 for <ltp@lists.linux.it>; Mon, 13 May 2019 11:40:11 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D6DDC1000C38
 for <ltp@lists.linux.it>; Mon, 13 May 2019 11:40:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05953ACD8;
 Mon, 13 May 2019 09:40:10 +0000 (UTC)
Date: Mon, 13 May 2019 11:40:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190513094008.GA19326@dell5510>
References: <20190412114632.GD28648@haruka.lan>
 <1555481102-4158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1555481102-4158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190513082708.GA9928@dell5510> <20190513085520.GA12685@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513085520.GA12685@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/getcpu:Add libc sched_getcpu()
 detection &&fix compiler errors
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

SGksCgo+ID4gQE1ldGFuOiBJJ2QgYmUgZm9yIHB1c2hpbmcgdGhpcyBiZWZvcmUgbmV3IHJlbGVh
c2UuCgo+IEFja2VkLCBwbGVhc2UgZ28gYWhlYWQuCk1lcmdlZC4KCi4uLgo+ID4gQlRXOiB3aGVu
IHJld3JpdGluZyBpbnRvIG5ldyBDIEFQSSAod2hlbmV2ZXIgaXQgaGFwcGVucykgaXQnZCBiZSBu
aWNlIHRvIHRlc3QKPiA+IGJvdGggc3lzY2FsbCBhbmQgbGliYyBzY2hlZF9nZXRjcHUoKSAoaWYg
YXZhaWxhYmxlKSB2aWEgcmVjZW50bHkgYWRkZWQgdGVzdF92YXJpYW50cyBbMV0uCj4gPiBbMV0g
aHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvd2lraS9UZXN0LVdyaXRp
bmctR3VpZGVsaW5lcyMyMjI5LXRlc3Rpbmctc2ltaWxhci1zeXNjYWxscy1pbi1vbmUtdGVzdAoK
PiBTdXJlLCBidXQgbGV0J3MgYWltIGZvciB0aGF0IGFmdGVyIHRoZSByZWxlYXNlIGhhcyBiZWVu
IGZpbmlzaGVkLgpTdXJlLCBub3RoaW5nIHNob3VsZCBibG9jayByZWxlYXNlIDopLgoKCktpbmQg
cmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
