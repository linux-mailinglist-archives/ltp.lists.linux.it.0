Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C83EF1B6F4
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 15:23:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B6593EA51B
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 15:23:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 691E73EA4EF
 for <ltp@lists.linux.it>; Mon, 13 May 2019 15:23:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 007FE1000D22
 for <ltp@lists.linux.it>; Mon, 13 May 2019 15:23:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1E9D8AF8F;
 Mon, 13 May 2019 13:23:28 +0000 (UTC)
Date: Mon, 13 May 2019 15:23:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Paul Lawrence <paullawrence@google.com>
Message-ID: <20190513132326.GA29817@dell5510>
References: <20190506153836.232148-1-paullawrence@google.com>
 <e9e6ad70-3f35-1c07-d7e7-db2d1fe0477e@google.com>
 <20190506200405.GA12134@dell5510> <20190513093927.GC12685@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513093927.GC12685@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+ID4gPiBSZXZpZXdlZC1ieTogU3RldmUgTXVja2xlIDxzbXVja2xlQGdvb2dsZS5jb20+
Cj4gPiBBY2tlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4gPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghCgo+ID4gSSBndWVzcyB0aGlzIGNvdWxkIGJlIG1lcmdlZCBiZWZvcmUgcmVs
ZWFzZSwgYnV0Cj4gPiBsZWF2ZSB0aGUgZGVjaXNpb24gZm9yIEN5cmlsLgoKPiBUaGlzIGlzIHBy
ZXR0eSBtdWNoIHNhZmUgYWNrIGZyb20gbWUgYXMgd2VsbCwgc28gcGxlYXNlIGdvIGFoZWFkIGFu
ZAo+IGFwcGx5IGl0LgpUaGFua3MgZm9yIGluZm8sIHB1c2hlZC4KCktpbmQgcmVnYXJkcywKUGV0
cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
