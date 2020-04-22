Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 538911B461A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 15:18:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF8023C2975
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 15:18:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 510783C0271
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 15:18:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C961C1000C52
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 15:18:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E617AD07;
 Wed, 22 Apr 2020 13:18:03 +0000 (UTC)
Date: Wed, 22 Apr 2020 15:18:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200422131801.GA9146@dell5510>
References: <cover.1587033556.git.viresh.kumar@linaro.org>
 <08a307591b531593bbaa5b1e8a4c841e80493937.1587033556.git.viresh.kumar@linaro.org>
 <20200421154006.GA14036@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421154006.GA14036@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 1/2] tst_timer: Add support for kernel's 64 bit
 timespec
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IEkndmUgY2xlYW5lZCB1cCBhbmQgc2ltcGxpZmllZCB0aGVzZSBjaGFuZ2VzICsgd3Jv
dGUgYSBzaW1wbGUgdGVzdCBhbmQKPiBwdXNoZWQgdGhlIHJlc3VsdCwgdGhhbmtzIGEgbG90IGZv
ciB5b3VyIGVmZm9ycy4KCj4gQ2FuIHlvdSBwbGVhc2UgcmViYXNlIHRoZSB0ZXN0IGNoYW5nZXMg
b24gdGhlIHRvcCBvZiB0aGVzZSBjaGFuZ2VzPyBJdAo+IHNob3VsZCBiZSBtZXJlbHkgY29zbWV0
aWNhbCwgZnVuY3Rpb24gbmFtZXMgaGF2ZSBjaGFuZ2VzIGV0Yy4KCmluY2x1ZGUvdHN0X3RpbWVy
LmggaXMgYnJva2VuIG9uIGdjYyA0LCB3aGljaCB3ZSBoYXZlIGluIFRyYXZpcyAoQ2VudE9TIDYp
LgpJIGRvbid0IGtub3cgaG93IHRvIGZpeCB0aGlzLCBidXQgbWF5YmUgZml4IGlzIHRyaXZpYWwu
Ck9yIGlzIGl0IHRpbWUgdG8gZmluYWxseSBkcm9wIHRoaXMgb2xkZXN0IGRpc3Rybz8gSWYgaXQn
cyBlYXN5IHRvIGZpeCwgSSdkCnBvc3Rwb25lIGRyb3BwaW5nIENlbnRPUyA2IGFmdGVyIHJlbGVh
c2UgKHNvbWUgZW1iZWRkZWQgZGlzdHJvcy9wcm9qZWN0cyBtaWdodApzdGlsbCB1c2Ugb2xkIGNv
bXBpbGVycykuCgpnY2MgLWcgLU8yIC1nIC1PMiAtZm5vLXN0cmljdC1hbGlhc2luZyAtcGlwZSAt
V2FsbCAtVyAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XIC1XYWxsIC1EX0ZPUlRJRllfU09VUkNF
PTIgLUkuLi8uLi9pbmNsdWRlIC1JLi4vLi4vaW5jbHVkZSAtSS4uLy4uL2luY2x1ZGUvb2xkLyAg
IC1MLi4vLi4vbGliICB0ZXN0X3RpbWVyLmMgICAtbGx0cCAtbyB0ZXN0X3RpbWVyCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSB0ZXN0X3RpbWVyLmM6MTE6Ci4uLy4uL2luY2x1ZGUvdHN0X3RpbWVyLmg6
IEluIGZ1bmN0aW9uIOKAmHRzdF90c19mcm9tX3RpbWVzcGVj4oCZOgouLi8uLi9pbmNsdWRlL3Rz
dF90aW1lci5oOjIxNDogZXJyb3I6IHVua25vd24gZmllbGQg4oCYbGliY190c+KAmSBzcGVjaWZp
ZWQgaW4gaW5pdGlhbGl6ZXIKLi4vLi4vaW5jbHVkZS90c3RfdGltZXIuaDoyMTQ6IHdhcm5pbmc6
IG1pc3NpbmcgYnJhY2VzIGFyb3VuZCBpbml0aWFsaXplcgouLi8uLi9pbmNsdWRlL3RzdF90aW1l
ci5oOjIxNDogd2FybmluZzogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmHQuPGFub255bW91
cz7igJkpCi4uLy4uL2luY2x1ZGUvdHN0X3RpbWVyLmg6MjE1OiB3YXJuaW5nOiBtaXNzaW5nIGlu
aXRpYWxpemVyCi4uLy4uL2luY2x1ZGUvdHN0X3RpbWVyLmg6MjE1OiB3YXJuaW5nOiAobmVhciBp
bml0aWFsaXphdGlvbiBmb3Ig4oCYdC48YW5vbnltb3VzPi5saWJjX3RzLnR2X25zZWPigJkpCi4u
Ly4uL2luY2x1ZGUvdHN0X3RpbWVyLmg6MjE1OiBlcnJvcjogdW5rbm93biBmaWVsZCDigJhsaWJj
X3Rz4oCZIHNwZWNpZmllZCBpbiBpbml0aWFsaXplcgouLi8uLi9pbmNsdWRlL3RzdF90aW1lci5o
OjIxNTogd2FybmluZzogZXhjZXNzIGVsZW1lbnRzIGluIHN0cnVjdCBpbml0aWFsaXplcgouLi8u
Li9pbmNsdWRlL3RzdF90aW1lci5oOjIxNTogd2FybmluZzogKG5lYXIgaW5pdGlhbGl6YXRpb24g
Zm9yIOKAmHTigJkpCm1ha2U6ICoqKiBbdGVzdF90aW1lcl0gRXJyb3IgMQoKJCBnY2MgLS12ZXJz
aW9uCmdjYyAoR0NDKSA0LjQuNyAyMDEyMDMxMyAoUmVkIEhhdCA0LjQuNy0xOCkKCktpbmQgcmVn
YXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
