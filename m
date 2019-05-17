Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9A213E0
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 08:51:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 907DD3EA4BC
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 08:51:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8FAE43EA471
 for <ltp@lists.linux.it>; Fri, 17 May 2019 08:51:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1EC6B1003A5E
 for <ltp@lists.linux.it>; Fri, 17 May 2019 08:51:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7DE8AD78;
 Fri, 17 May 2019 06:51:17 +0000 (UTC)
Date: Fri, 17 May 2019 08:51:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20190517065116.GA8170@dell5510>
References: <1558041162.3971.2.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558041162.3971.2.camel@linux.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: linux-integrity <linux-integrity@vger.kernel.org>, ltp@lists.linux.it
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

SGkgTWltaSwKCj4gVFBNIDEuMiBleHBvcnRlZCB0aGUgUENScy4gIFJlYWRpbmcgdGhlIFRQTSAy
LjAgUENScyByZXF1aXJlcyBhCj4gdXNlcnNwYWNlIGFwcGxpY2F0aW9uLiAgRm9yIG5vdywgc2tp
cCB0aGlzIHRlc3QuCgo+IFNpZ25lZC1vZmYtYnk6IE1pbWkgWm9oYXIgPHpvaGFyQGxpbnV4Lmli
bS5jb20+CkFja2VkLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiAtLS0KPiAgdGVz
dGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV90cG0uc2ggfCA4
ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCj4gZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdHBt
LnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV90
cG0uc2gKPiBpbmRleCAwZmZjM2MwMjI0N2QuLmViZTRiNGMzNjBlNCAxMDA3NTUKPiAtLS0gYS90
ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3RwbS5zaAo+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFf
dHBtLnNoCj4gQEAgLTg4LDYgKzg4LDE0IEBAIHRlc3QyKCkKPiAgCXRzdF9yZXMgVElORk8gInZl
cmlmeSBQQ1IgdmFsdWVzIgo+ICAJdHN0X2NoZWNrX2NtZHMgZXZtY3RsCgo+ICsJbG9jYWwgdHBt
X2Rlc2NyaXB0aW9uPSIvc3lzL2NsYXNzL3RwbS90cG0wL2RldmljZS9kZXNjcmlwdGlvbiIKPiAr
CWlmIFsgLWYgIiR0cG1fZGVzY3JpcHRpb24iIF07IHRoZW4KPiArCQlpZiBncmVwIC1xICJeXFRQ
TSAyLjAiICR0cG1fZGVzY3JpcHRpb247IHRoZW4KSSBndWVzcyB0aGUgYmFja3NsYXNoIGluICJe
XFRQTSAyLjAiIGlzIGEgdHlwby4KSWYgeWVzLCBubyBuZWVkIHRvIHJlcG9zdCwgSSdsbCBmaXgg
aXQgd2hlbiBhcHBseWluZyB5b3VyIHBhdGNoLgorIEknZCBwcmVmZXIgam9pbiAyIGlmcyBpbnRv
IHNpbmdsZSBvbmUsIGJ1dCB0aGF0J3MganVzdCBtYXR0ZXIgb2YgcHJlZmVyZW5jZSwKbm90IGlt
cG9ydGFudC4KCj4gKwkJCXRzdF9yZXMgVENPTkYgIlRQTSAyLjAgZW5hYmxlZCwgYnV0IG5vdCBz
dXBwb3J0ZWQiCj4gKwkJCXJldHVybiAwCj4gKwkJZmkKPiArCWZpCj4gKwo+ICAJdHN0X3JlcyBU
SU5GTyAiZXZtY3RsIHZlcnNpb246ICQoZXZtY3RsIC0tdmVyc2lvbikiCgo+ICAJbG9jYWwgcGNy
c19wYXRoPSIvc3lzL2NsYXNzL3RwbS90cG0wL2RldmljZS9wY3JzIgoKVGhhbmtzIGZvciB5b3Vy
IGZpeC4KCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
