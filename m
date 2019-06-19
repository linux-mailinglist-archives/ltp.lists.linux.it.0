Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 297484B2F6
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 09:19:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDFB62987B0
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 09:19:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A42723EA1EF
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 09:19:09 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 180A91401222
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 09:19:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8661FC04B2F6
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 07:19:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7849C19724
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 07:19:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A52624B25;
 Wed, 19 Jun 2019 07:19:07 +0000 (UTC)
Date: Wed, 19 Jun 2019 03:19:03 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1510222953.29055172.1560928743851.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190619071401.18509-1-liwang@redhat.com>
References: <20190619071401.18509-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.127, 10.4.195.21]
Thread-Topic: add include config.h in cloner.c
Thread-Index: SqcLExLG5vekL565YCQct4RtuNlz0w==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 19 Jun 2019 07:19:07 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Ping Fang <pifang@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] lib: add include config.h in cloner.c
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gVGhpcyBpcyBhIGZvbGxvdyBmaXggZm9y
IGNvbW1pdCBmNjE2NGZmYzI4MDRiMmE2ODIxOCwgb3RoZXJ3aXNlIGNsb25lMDgKPiBmYWlsZWQg
d2l0aCBFTk9TWVMgZXJyb3I6Cj4gCj4gICAgIGNsb25lMDguYzo4MTogSU5GTzogcnVubmluZyBD
TE9ORV9QQVJFTlQKPiAgICAgY2xvbmUwOC5jOjEwNDogQlJPSzogQ0xPTkVfUEFSRU5UIGNsb25l
KCkgZmFpbGVkOiBFTk9TWVMKPiAgICAgdHN0X3Rlc3QuYzozNTc6IEJST0s6IFJlcG9ydGVkIGJ5
IGNoaWxkICgyNzg1KQo+IAo+IFRoYXQgYmVjdWFzZSBDTE9ORV9TVVBQT1JUU183X0FSR1MgbWFj
cm8gaXMgaW5jbHVkZWQgaW4gY29uZmlnLmgsIHdpdGhvdXQKPiB0aGlzIGhlYWRlciBmaWxlLCB0
aGUgbHRwX2Nsb25lNygpIHdpbGwgZmFsbCBpbnRvIEVOT1NZUyBicmFuY2guCj4gCj4gUmVwb3J0
ZWQtYnk6IFBpbmcgRmFuZyA8cGlmYW5nQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGkg
V2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+CgpTb3JyeSBhYm91dCB0aGF0LCB0aGF0IGluY2x1ZGUg
c2hvdWxkIGhhdmUgc3RheWVkIGluLgpQdXNoZWQuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
