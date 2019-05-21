Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66330254B5
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 18:02:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DD8A3EA699
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 18:02:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3F31D3EA5B4
 for <ltp@lists.linux.it>; Tue, 21 May 2019 18:02:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 249B01401B67
 for <ltp@lists.linux.it>; Tue, 21 May 2019 18:02:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 55A8F59474;
 Tue, 21 May 2019 16:02:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3424178395;
 Tue, 21 May 2019 16:02:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22A335B424;
 Tue, 21 May 2019 16:02:06 +0000 (UTC)
Date: Tue, 21 May 2019 12:02:02 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <14124676.23875097.1558454522944.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190521141030.GA6655@dell5510>
References: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
 <20190521095833.GA12205@rei>
 <224303782.23845756.1558446563195.JavaMail.zimbra@redhat.com>
 <20190521141030.GA6655@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.20]
Thread-Topic: shmctl01: don't use hardcoded index == 0 for SHM_STAT test
Thread-Index: 2BpCs+81pMmjc/MEPZ0IVw/upGa0xA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 21 May 2019 16:02:06 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] shmctl01: don't use hardcoded index == 0 for
 SHM_STAT test
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSGkgSmFuLCBDeXJpbCwKPiAKPiA+IC0t
LS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+ID4gSGkhCj4gPiA+ID4gK3N0YXRpYyB2b2lk
IGZ1bmNfc3N0YXRfc2V0dXAodm9pZCkKPiA+ID4gPiArewo+ID4gPiA+ICsJc3RydWN0IHNobV9p
bmZvIHRtcDsKPiA+ID4gPiArCWludCByZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJcmV0ID0gc2ht
Y3RsKHNobV9pZF8xLCBTSE1fSU5GTywgKHZvaWQgKikmdG1wKTsKPiA+ID4gPiArCWlmIChyZXQg
PCAwKQo+ID4gPiA+ICsJCXRzdF9yZXNtKFRGQUlMfFRFUlJOTywgInNobWN0bChTSE1fSU5GTyki
KTsKPiAKPiA+ID4gSSB3b25kZXIgaWYgaXQgbWFrZXMgc2Vuc2UgdG8gY29udGludWUgaGVyZSBp
ZiBzaG1jdGwoKSBoYXMgZmFpbGVkLAo+ID4gPiBtYXliZSB3ZSBzaG91bGQgZG8gdHN0X2Jya20o
VEJST0sgLi4uKSBpbnN0ZWFkLgo+IAo+ID4gSXQgaXMgJ3NldHVwIHBoYXNlJywgYnV0IGl0IGFs
c28gaXMga2luZC1vZiB0ZXN0IGZvciBzaG1jdGwoKSBhcyB3ZWxsLgo+ID4gV2UgZG9uJ3Qgcmlz
ayBtdWNoIGlmIHdlIGNvbnRpbnVlLCB3b3JzdCBjYXNlIGlzIHdlIGdldCBvbmUgbW9yZSBmYWls
Lgo+IAo+ID4gQFBldHI6IERvIHlvdSBoYXZlIGFueSBwcmVmZXJlbmNlPwo+IEN5cmlsJ3MgcG9p
bnQgbWFrZXMgc2Vuc2UsIGJ1dCBJIHByZWZlciBKYW4ncyB3YXkuCgpJIHB1c2hlZCBURkFJTCB2
ZXJzaW9uLgoKVGhhbmtzIGZvciByZXZpZXcsCkphbgoKPiAKPiAKPiBLaW5kIHJlZ2FyZHMsCj4g
UGV0cgo+IAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
