Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F131D2FA50
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:31:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3E913EA620
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:31:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A2C003EA221
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:31:26 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AC4BE600B8A
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:31:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87AAA308212A
 for <ltp@lists.linux.it>; Thu, 30 May 2019 10:31:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C68919C4F
 for <ltp@lists.linux.it>; Thu, 30 May 2019 10:31:24 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7585F1806B0E;
 Thu, 30 May 2019 10:31:24 +0000 (UTC)
Date: Thu, 30 May 2019 06:31:21 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <1564717500.25330071.1559212281463.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190530102336.10898-1-xzhou@redhat.com>
References: <20190530102336.10898-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.20]
Thread-Topic: lib/tst_test: introduce tst_test->some_filesystems
Thread-Index: 2CNYbmiYnT63Sa7ZNL8mmqNs7F6Orw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 30 May 2019 10:31:24 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_test: introduce
 tst_test->some_filesystems
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBMaWtlIGFsbF9maWxlc3lzdGVtcywgc29t
ZV9maWxlc3lzdGVtcyBvcHRpb24gbGV0IHRjYXNlIHRvIHJ1biBvbgo+IHNwZWNpZmljIGZpbGVz
eXN0ZW1zLgo+IEluIG9yZGVyIHRvIGltcGxlbWVudCB0aGlzLCBjaGFuZ2UgcnVuX3RjYXNlc19w
ZXJfZnMgdG8gYWNjZXB0IGEKPiBwYXJhbWV0ZXIgaW5kaWNhdGluZyB3aGljaCBmaWxlc3lzdGVt
cyBuZWVkIHRvIHRlc3QuCj4gCj4gVG8gbGV0IHRjYXNlIHVzZSB0aGlzIG9wdGlvbiwgd2UgbmVl
ZCBzb21lIG90aGVyIGZsYWdzIHNldAo+IEVnOgo+IHN0YXRpYyBjaGFyICpzb21lX2ZpbGVzeXN0
ZW1zW10gPSB7ImV4dDQiLCAieGZzIiwgImJ0cmZzIn07CgpXaGF0IGhhcHBlbnMgaWYgb25lIG9m
IHRoZW0gaXMgbm90IHN1cHBvcnRlZC9hdmFpbGFibGU/CldpbGwgaXQgYmUgc2tpcHBlZC9UQ09O
Rj8KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
