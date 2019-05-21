Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A828D25192
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 16:10:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 651C73EA691
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 16:10:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A7B6F3EA365
 for <ltp@lists.linux.it>; Tue, 21 May 2019 16:10:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 631AB1A01522
 for <ltp@lists.linux.it>; Tue, 21 May 2019 16:10:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 79702AFB1;
 Tue, 21 May 2019 14:10:32 +0000 (UTC)
Date: Tue, 21 May 2019 16:10:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190521141030.GA6655@dell5510>
References: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
 <20190521095833.GA12205@rei>
 <224303782.23845756.1558446563195.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <224303782.23845756.1558446563195.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgSmFuLCBDeXJpbCwKCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gSGkhCj4g
PiA+ICtzdGF0aWMgdm9pZCBmdW5jX3NzdGF0X3NldHVwKHZvaWQpCj4gPiA+ICt7Cj4gPiA+ICsJ
c3RydWN0IHNobV9pbmZvIHRtcDsKPiA+ID4gKwlpbnQgcmV0Owo+ID4gPiArCj4gPiA+ICsJcmV0
ID0gc2htY3RsKHNobV9pZF8xLCBTSE1fSU5GTywgKHZvaWQgKikmdG1wKTsKPiA+ID4gKwlpZiAo
cmV0IDwgMCkKPiA+ID4gKwkJdHN0X3Jlc20oVEZBSUx8VEVSUk5PLCAic2htY3RsKFNITV9JTkZP
KSIpOwoKPiA+IEkgd29uZGVyIGlmIGl0IG1ha2VzIHNlbnNlIHRvIGNvbnRpbnVlIGhlcmUgaWYg
c2htY3RsKCkgaGFzIGZhaWxlZCwKPiA+IG1heWJlIHdlIHNob3VsZCBkbyB0c3RfYnJrbShUQlJP
SyAuLi4pIGluc3RlYWQuCgo+IEl0IGlzICdzZXR1cCBwaGFzZScsIGJ1dCBpdCBhbHNvIGlzIGtp
bmQtb2YgdGVzdCBmb3Igc2htY3RsKCkgYXMgd2VsbC4KPiBXZSBkb24ndCByaXNrIG11Y2ggaWYg
d2UgY29udGludWUsIHdvcnN0IGNhc2UgaXMgd2UgZ2V0IG9uZSBtb3JlIGZhaWwuCgo+IEBQZXRy
OiBEbyB5b3UgaGF2ZSBhbnkgcHJlZmVyZW5jZT8KQ3lyaWwncyBwb2ludCBtYWtlcyBzZW5zZSwg
YnV0IEkgcHJlZmVyIEphbidzIHdheS4KCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
