Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CD217BF
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 13:28:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBE5A3EA62E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 13:28:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0DAC93EA5C1
 for <ltp@lists.linux.it>; Fri, 17 May 2019 13:28:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 00B822009E9
 for <ltp@lists.linux.it>; Fri, 17 May 2019 13:28:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CC28AD5D;
 Fri, 17 May 2019 11:28:50 +0000 (UTC)
Date: Fri, 17 May 2019 13:28:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20190517112848.GA27606@dell5510>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <20190517065116.GA8170@dell5510>
 <1558091974.4507.60.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558091974.4507.60.camel@linux.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Peter =?iso-8859-2?Q?H=FCwe?= <PeterHuewe@gmx.de>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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

SGkgTWltaSwKCj4gT24gRnJpLCAyMDE5LTA1LTE3IGF0IDA4OjUxICswMjAwLCBQZXRyIFZvcmVs
IHdyb3RlOgoKPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50
ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdHBtLnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9p
bnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV90cG0uc2gKPiA+ID4gaW5kZXggMGZmYzNjMDIyNDdkLi5l
YmU0YjRjMzYwZTQgMTAwNzU1Cj4gPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkv
aW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdHBtLnNoCj4gPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdHBtLnNoCj4gPiA+IEBAIC04OCw2
ICs4OCwxNCBAQCB0ZXN0MigpCj4gPiA+ICAJdHN0X3JlcyBUSU5GTyAidmVyaWZ5IFBDUiB2YWx1
ZXMiCj4gPiA+ICAJdHN0X2NoZWNrX2NtZHMgZXZtY3RsCgo+ID4gPiArCWxvY2FsIHRwbV9kZXNj
cmlwdGlvbj0iL3N5cy9jbGFzcy90cG0vdHBtMC9kZXZpY2UvZGVzY3JpcHRpb24iCj4gPiA+ICsJ
aWYgWyAtZiAiJHRwbV9kZXNjcmlwdGlvbiIgXTsgdGhlbgo+ID4gPiArCQlpZiBncmVwIC1xICJe
XFRQTSAyLjAiICR0cG1fZGVzY3JpcHRpb247IHRoZW4KCj4gPiBJIGd1ZXNzIHRoZSBiYWNrc2xh
c2ggaW4gIl5cVFBNIDIuMCIgaXMgYSB0eXBvLgo+ID4gSWYgeWVzLCBubyBuZWVkIHRvIHJlcG9z
dCwgSSdsbCBmaXggaXQgd2hlbiBhcHBseWluZyB5b3VyIHBhdGNoLgo+ID4gKyBJJ2QgcHJlZmVy
IGpvaW4gMiBpZnMgaW50byBzaW5nbGUgb25lLCBidXQgdGhhdCdzIGp1c3QgbWF0dGVyIG9mIHBy
ZWZlcmVuY2UsCj4gPiBub3QgaW1wb3J0YW50LgoKPiBUaGFuayB5b3UgZm9yIGZpeGluZyBpdC4g
wqBJJ2QganVzdCBsaWtlIHRvIGhlYXIgZnJvbSBvdGhlcnMgZmlyc3QsIGlmCj4gdGhpcyBpcyBj
b3JyZWN0IHdheSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gVFBNIDEuMiBhbmQgVFBNIDIuMC4K
T2gsIHllcywgbGV0J3Mgd2FpdCBmb3IgYSBmZWVkYmFjay4KCj4gTWltaQoKS2luZCByZWdhcmRz
LApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
