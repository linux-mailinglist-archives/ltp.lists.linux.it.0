Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C036AC94
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 09:00:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DE693C674A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 09:00:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CCECA3C1DA6
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 09:00:52 +0200 (CEST)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 476141A00818
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 09:00:47 +0200 (CEST)
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 8E43BE47
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:00:42 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.4.23.88] (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P2750T140649017890560S1619420426596725_; 
 Mon, 26 Apr 2021 15:00:42 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <14dd9d2a50c88e416390736ef3158608>
X-RL-SENDER: sujiaxun@uniontech.com
X-SENDER: sujiaxun@uniontech.com
X-LOGIN-NAME: sujiaxun@uniontech.com
X-FST-TO: viresh.kumar@linaro.org
X-RCPT-COUNT: 3
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
To: Petr Vorel <pvorel@suse.cz>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik> <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
 <YIZa4Ph81LmkEkLZ@pevik> <20210426062357.i72js3urkoofvzcj@vireshk-i7>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <f06db611-5024-78d6-07e9-36115889b7a7@uniontech.com>
Date: Mon, 26 Apr 2021 15:00:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210426062357.i72js3urkoofvzcj@vireshk-i7>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAyMDIxLzQvMjYg5LiL5Y2IMjoyMywgVmlyZXNoIEt1bWFyIHdyb3RlOgo+IE9uIDI2LTA0
LTIxLCAwODoxNywgUGV0ciBWb3JlbCB3cm90ZToKPj4gSGkgVmlyZXNoLAo+Pgo+PiAuLi4KPj4+
Pj4gLSNpZiBkZWZpbmVkKF9fYXJjaDY0X18pCj4+Pj4+ICsjaWYgZGVmaW5lZChfX21pcHM2NCkK
Pj4+PiBTbyBfX2FyY2g2NF9fIGlzIG5vdCBkZWZpbmVkIGZvciBtaXBzIDY0IGJpdD8gKGFzIGl0
J3MgZGVmaW5lZCBmb3Igc3BhcmMgNjRiaXQ/KQo+Pj4+IF9fbWlwczY0IGlzIG9idmlvdXNseSBj
b3JyZWN0IGFuZCBiZXR0ZXIgcmVhZGFibGUsIGJ1dCBpcyBpdCByZWFsbHkgcmVxdWlyZWQ/Cj4+
Cj4+PiBJIGFtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW50IGJ5ICJpcyBpdCByZWFsbHkgcmVxdWly
ZWQ/IiBUaGUgI2lmZGVmIGhhY2tlcnkgaGVyZQo+Pj4gPyBJdCBpcyBhcyBjYW4gYmUgc2VlbiBp
biBpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvc2htYnVmLmggaW4gTGludXggc291cmNlLgo+PiBJ
IG1lYW4gaWYgI2lmIGRlZmluZWQoX19taXBzX18pICYmIGRlZmluZWQoX19hcmNoNjRfXykgZGV0
ZWN0IDY0Yml0IG1pcHMKPj4gdGhlIHBhdGNoIHdvdWxkIG5vdCBiZSBuZWVkZWQgKGFsdGhvdWdo
IElNSE8gX19taXBzNjQgaXMgbW9yZSBkZXNjcmlwdGl2ZSB0aGFuCj4+IF9fYXJjaDY0X18sIGZv
ciB3aGljaCB5b3UgbmVlZCB0byBzZWFyY2ggZm9yIHdoaWNoIGFyY2hpdGVjdHVyZSBpdCB3YXMg
ZGVmaW5lZCkuCj4gCj4gQWhoLCByaWdodC4KPiAKPiBBY3R1YWxseSB0aGUga2VybmVsIGhhcyB0
aGlzIGluc3RlYWQ6Cj4gCj4gI2lmIF9fQklUU19QRVJfTE9ORyA9PSA2NAo+IAo+PiBCdXQgSSdt
IG5vdCBzdXJlIG15c2VsZiBpZiBfX2FyY2g2NF9fIGlzIGRlZmluZWQgZm9yIG1pcHMgNjRiaXQu
Cj4gCj4gTmVpdGhlciBkbyBJLgo+IAp1b3NAdW9zLVBDOn4kIGVjaG8gfGdjYyAtZE0gLUUgLSB8
IGdyZXAgLWkgYXJjaAojZGVmaW5lIF9NSVBTX0FSQ0ggIm1pcHM2NHIyIgojZGVmaW5lIF9NSVBT
X0FSQ0hfTUlQUzY0UjIgMQp1b3NAdW9zLVBDOn4kIGVjaG8gfGdjYyAtZE0gLUUgLSB8IGdyZXAg
LWkgbWlwczY0CiNkZWZpbmUgX01JUFNfSVNBIF9NSVBTX0lTQV9NSVBTNjQKI2RlZmluZSBfTUlQ
U19UVU5FICJtaXBzNjRyMiIKI2RlZmluZSBfTUlQU19UVU5FX01JUFM2NFIyIDEKI2RlZmluZSBf
TUlQU19BUkNIICJtaXBzNjRyMiIKI2RlZmluZSBfTUlQU19BUkNIX01JUFM2NFIyIDEKI2RlZmlu
ZSBfX21pcHM2NCAxCnVvc0B1b3MtUEM6fiQgdW5hbWUgIC1tCm1pcHM2NAoKVGhlIG1pcHMgYXJj
aGl0ZWN0dXJlIGdjYyBoYXMgbm8gYnVpbHQtaW4gX19hcmNoNjRfXywgb25seSBfX21pcHM2NCAK
ZGVmaW5pdGlvbnMuIE9mIGNvdXJzZSwgIl9fQklUU19QRVJfTE9ORyA9PSA2NCIgY2FuIGFsc28g
YmUgdXNlZCwgYnV0IEkgCnRoaW5rIGl0IGlzIGJldHRlciB0byB1c2UgX19taXBzNjQgaW4gdGhl
IG1pcHMgYXJjaGl0ZWN0dXJlLgoKCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
