Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E542510E
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:49:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEBBD294AEA
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:49:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4C46A294A36
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:49:30 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C7EBA1A01492
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:49:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53E1413AA9;
 Tue, 21 May 2019 13:49:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B81717967;
 Tue, 21 May 2019 13:49:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41AD95B424;
 Tue, 21 May 2019 13:49:23 +0000 (UTC)
Date: Tue, 21 May 2019 09:49:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Message-ID: <224303782.23845756.1558446563195.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190521095833.GA12205@rei>
References: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
 <20190521095833.GA12205@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.9]
Thread-Topic: shmctl01: don't use hardcoded index == 0 for SHM_STAT test
Thread-Index: jlKn2HJEqDIoAFdgGG7eQtcbJ5l7eA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 21 May 2019 13:49:23 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBIaSEKPiA+ICtzdGF0aWMgdm9pZCBmdW5j
X3NzdGF0X3NldHVwKHZvaWQpCj4gPiArewo+ID4gKwlzdHJ1Y3Qgc2htX2luZm8gdG1wOwo+ID4g
KwlpbnQgcmV0Owo+ID4gKwo+ID4gKwlyZXQgPSBzaG1jdGwoc2htX2lkXzEsIFNITV9JTkZPLCAo
dm9pZCAqKSZ0bXApOwo+ID4gKwlpZiAocmV0IDwgMCkKPiA+ICsJCXRzdF9yZXNtKFRGQUlMfFRF
UlJOTywgInNobWN0bChTSE1fSU5GTykiKTsKPiAKPiBJIHdvbmRlciBpZiBpdCBtYWtlcyBzZW5z
ZSB0byBjb250aW51ZSBoZXJlIGlmIHNobWN0bCgpIGhhcyBmYWlsZWQsCj4gbWF5YmUgd2Ugc2hv
dWxkIGRvIHRzdF9icmttKFRCUk9LIC4uLikgaW5zdGVhZC4KCkl0IGlzICdzZXR1cCBwaGFzZScs
IGJ1dCBpdCBhbHNvIGlzIGtpbmQtb2YgdGVzdCBmb3Igc2htY3RsKCkgYXMgd2VsbC4KV2UgZG9u
J3QgcmlzayBtdWNoIGlmIHdlIGNvbnRpbnVlLCB3b3JzdCBjYXNlIGlzIHdlIGdldCBvbmUgbW9y
ZSBmYWlsLgoKQFBldHI6IERvIHlvdSBoYXZlIGFueSBwcmVmZXJlbmNlPwoKPiAKPiBPdGhlcndp
c2UgaXQgbG9va3MgZ29vZCwgYWNrZWQuCj4gCj4gLS0KPiBDeXJpbCBIcnViaXMKPiBjaHJ1Ymlz
QHN1c2UuY3oKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
