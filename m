Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E313A330AC
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 15:10:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B82BA2B0BB4
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 15:10:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6C3BE3EA686
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 15:10:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BF8A56009EB
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 15:10:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F376AB91;
 Mon,  3 Jun 2019 13:10:07 +0000 (UTC)
Date: Mon, 3 Jun 2019 15:10:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190603131009.GA7970@dell5510>
References: <20190221112201.18324-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190221112201.18324-1-chrubis@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/ustat: Move the syscall to lapi
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

SEkgQ3lyaWwsCgo+IFRoZSBkZXYgcGFyYW1ldGVyIG5lZWRzIHRvIGJlIGNhc3RlZCB0byB1bnNp
Z25lZCBpbiBzb21lIGNhc2VzLCBsZXQncwo+IG1vdmUgY2FsbCB0byB0c3Rfc3lzY2FsbCgpIGZy
b20gdGhlIHRlc3RzIHRvIGxhcGkgc28gdGhhdCB0aGUgdGVzdHMgZG9lcwo+IG5vdCBoYXZlIHRv
IHdvcnJ5IGFib3V0IHRoZSBsb3cgbGV2ZWwgZGV0YWlscy4KCj4gU2lnbmVkLW9mZi1ieTogQ3ly
aWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+Cj4gQ0M6IFN0ZXZlIE11Y2tsZSA8c211Y2tsZUBn
b29nbGUuY29tPgo+IENDOiBSaWNoYXJkIFBhbGV0aG9ycGUgPHJwYWxldGhvcnBlQHN1c2UuY29t
PgpJIGd1ZXNzIHlvdSBzZW5kIGEgdjIgd2l0aCB0ZXN0IHZhcmlhbnRzLCBzbyBjbG9zaW5nIHRo
aXMgaW4gcGF0Y2h3b3JrLgoKCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
