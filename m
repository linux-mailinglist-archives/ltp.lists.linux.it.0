Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 587101B306
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:39:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25197294ADC
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:39:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E4F313EA4CA
 for <ltp@lists.linux.it>; Mon, 13 May 2019 11:39:30 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1922360083A
 for <ltp@lists.linux.it>; Mon, 13 May 2019 11:39:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A9EDACD8;
 Mon, 13 May 2019 09:39:28 +0000 (UTC)
Date: Mon, 13 May 2019 11:39:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190513093927.GC12685@rei.lan>
References: <20190506153836.232148-1-paullawrence@google.com>
 <e9e6ad70-3f35-1c07-d7e7-db2d1fe0477e@google.com>
 <20190506200405.GA12134@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506200405.GA12134@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ANDROID: Fix ioctl03 test for Android
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

SGkhCj4gPiBSZXZpZXdlZC1ieTogU3RldmUgTXVja2xlIDxzbXVja2xlQGdvb2dsZS5jb20+Cj4g
QWNrZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCEKPiAKPiBJIGd1ZXNzIHRoaXMgY291bGQgYmUgbWVyZ2VkIGJlZm9yZSByZWxlYXNlLCBi
dXQKPiBsZWF2ZSB0aGUgZGVjaXNpb24gZm9yIEN5cmlsLgoKVGhpcyBpcyBwcmV0dHkgbXVjaCBz
YWZlIGFjayBmcm9tIG1lIGFzIHdlbGwsIHNvIHBsZWFzZSBnbyBhaGVhZCBhbmQKYXBwbHkgaXQu
CgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
