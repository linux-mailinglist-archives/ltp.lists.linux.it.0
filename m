Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A210C2F9D8
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:48:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D4713EA608
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:48:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F18513EA1AB
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:48:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2A7E760076A
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:48:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F846AF11;
 Thu, 30 May 2019 09:48:13 +0000 (UTC)
Date: Thu, 30 May 2019 11:48:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190530094812.GA31468@rei.lan>
References: <20190530085834.21432-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530085834.21432-1-xzhou@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] lib/tst_test: print INFO msg for test variants
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

SGkhCj4gTWFrZSB0aGUgdGVzdCBvdXRwdXQgY2xlYXJlciBhYm91dCB3aGF0J3MgZ29pbmcgb24g
d2hlbiB3ZQo+IHJ1biBtdWx0aXBsZSB2YXJpYW50cy4KCkFjdHVhbGx5IHRoZSB0ZXN0IGl0c2Vs
ZiBpcyBzdXBwb3NlZCB0byBwcmludCB3aGljaCB2YXJpYW50IGl0J3MgYWJvdXQKdGhlIHRlc3Qu
IFByaW50aW5nIHRoZSB2YXJpYW50IG51bWJlciBkb2VzIG5vdCBoZWxwIG11Y2guCgotLSAKQ3ly
aWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
