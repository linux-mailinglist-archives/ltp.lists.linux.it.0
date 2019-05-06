Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7CD1486D
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:39:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3A1C3EAE78
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:39:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0EEC93EA2F6
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:39:12 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 98E65601026
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:39:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98415AD7C;
 Mon,  6 May 2019 10:39:10 +0000 (UTC)
References: <20190403152245.GC26464@rei.lan>
 <20190411192534.30525-1-fedebonfi95@gmail.com>
 <20190412143318.GA29856@haruka.lan> <874l67x53e.fsf@rpws.prws.suse.cz>
User-agent: mu4e 1.0; emacs 26.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: rpalethorpe@suse.de
In-reply-to: <874l67x53e.fsf@rpws.prws.suse.cz>
Date: Mon, 06 May 2019 12:39:09 +0200
Message-ID: <8736lrx3xu.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Federico Bonfiglio <fedebonfi95@gmail.com>, ltp@lists.linux.it
Subject: Re: [LTP] NS_* ioctl commands fail in 32bit compat mode (-m32)
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
Reply-To: rpalethorpe@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ClJpY2hhcmQgUGFsZXRob3JwZSA8cnBhbGV0aG9ycGVAc3VzZS5kZT4gd3JpdGVzOgoKPiBIZWxs
byBGZWRlcmljbywKPgo+IEFsbCB0aGUgdGVzdHMgZmFpbCB3aXRoIHNvbWV0aGluZyBzaW1pbGFy
IHRvOgo+IGlvY3RsX25zMDEuYzo0NTogRkFJTDogdW5leHBlY3RlZCBpb2N0bCBlcnJvcjogRU5P
VFRZCj4KPiB3aGVuIGNvbXBpbGVkIHdpdGggdGhlIC1tMzIgZmxhZyBvbiBhdCBsZWFzdCBTVVNF
IGtlcm5lbCA0LjIwIGFuZAo+IDQuMTIuCj4KPiBEbyB5b3Uga25vdyBpZiB0aGlzIGZlYXR1cmUg
aXMgZXhwZWN0ZWQgdG8gd29yayBpbiAzMmJpdCBjb21wYXQgbW9kZT8KPiBNYXliZSB0aGUgc2l6
ZSBvZiB0aGUgYXJndW1lbnRzIHNob3VsZCBiZSBkaWZmZXJlbnQgd2hlbiB1c2luZyAzMmJpdCBt
b2RlPwoKRllJLCBpdCBzZWVtcyB0aGUgc2l6ZSBvZiB0aGUgYXJndW1lbnQgYW5kIHZhbHVlIGFy
ZSB0aGUgc2FtZSBvbiBib3RoIDMyYml0CmFuZCA2NGJpdCBtb2RlIGluIHVzZXIgc3BhY2UuCgot
LSAKVGhhbmsgeW91LApSaWNoYXJkLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
