Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8E36AF18
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 09:53:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 062EB3C66D2
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 09:53:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 118253C27D7
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 09:53:48 +0200 (CEST)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.206])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AD687600A00
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 09:53:44 +0200 (CEST)
Received: from localhost (unknown [192.168.167.225])
 by regular1.263xmail.com (Postfix) with ESMTP id D29541B4C
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:53:41 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.4.23.88] (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P3565T140663476299520S1619423621719910_; 
 Mon, 26 Apr 2021 15:53:42 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <32012c50543705af0ae582f05176c28e>
X-RL-SENDER: sujiaxun@uniontech.com
X-SENDER: sujiaxun@uniontech.com
X-LOGIN-NAME: sujiaxun@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 3
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik> <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
 <YIZa4Ph81LmkEkLZ@pevik> <20210426062357.i72js3urkoofvzcj@vireshk-i7>
 <f06db611-5024-78d6-07e9-36115889b7a7@uniontech.com>
 <20210426070320.iow3avu2pq22qled@vireshk-i7>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <827cdde8-18df-75b0-743c-7876704c2039@uniontech.com>
Date: Mon, 26 Apr 2021 15:53:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210426070320.iow3avu2pq22qled@vireshk-i7>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAyMDIxLzQvMjYg5LiL5Y2IMzowMywgVmlyZXNoIEt1bWFyIHdyb3RlOgo+IE9uIDI2LTA0
LTIxLCAxNTowMCwgc3VqaWF4dW4gd3JvdGU6Cj4+IHVvc0B1b3MtUEM6fiQgZWNobyB8Z2NjIC1k
TSAtRSAtIHwgZ3JlcCAtaSBhcmNoCj4+ICNkZWZpbmUgX01JUFNfQVJDSCAibWlwczY0cjIiCj4+
ICNkZWZpbmUgX01JUFNfQVJDSF9NSVBTNjRSMiAxCj4+IHVvc0B1b3MtUEM6fiQgZWNobyB8Z2Nj
IC1kTSAtRSAtIHwgZ3JlcCAtaSBtaXBzNjQKPj4gI2RlZmluZSBfTUlQU19JU0EgX01JUFNfSVNB
X01JUFM2NAo+PiAjZGVmaW5lIF9NSVBTX1RVTkUgIm1pcHM2NHIyIgo+PiAjZGVmaW5lIF9NSVBT
X1RVTkVfTUlQUzY0UjIgMQo+PiAjZGVmaW5lIF9NSVBTX0FSQ0ggIm1pcHM2NHIyIgo+PiAjZGVm
aW5lIF9NSVBTX0FSQ0hfTUlQUzY0UjIgMQo+PiAjZGVmaW5lIF9fbWlwczY0IDEKPj4gdW9zQHVv
cy1QQzp+JCB1bmFtZSAgLW0KPj4gbWlwczY0Cj4+Cj4+IFRoZSBtaXBzIGFyY2hpdGVjdHVyZSBn
Y2MgaGFzIG5vIGJ1aWx0LWluIF9fYXJjaDY0X18sIG9ubHkgX19taXBzNjQKPj4gZGVmaW5pdGlv
bnMuIE9mIGNvdXJzZSwgIl9fQklUU19QRVJfTE9ORyA9PSA2NCIgY2FuIGFsc28gYmUgdXNlZCwg
YnV0IEkKPj4gdGhpbmsgaXQgaXMgYmV0dGVyIHRvIHVzZSBfX21pcHM2NCBpbiB0aGUgbWlwcyBh
cmNoaXRlY3R1cmUuCj4gCj4gSG1tLCBJIHdpbGwgcmF0aGVyIHRyeSB0byBkbyB3aGF0IHRoZSBr
ZXJuZWwgc291cmNlIGNvZGUgZG9lcywgaS5lLgo+IHVzZSBfX0JJVFNfUEVSX0xPTkcgaGVyZSBp
bnN0ZWFkLgo+IApJIHJlc3VibWl0dGVkIGEgcGF0Y2ggYW5kIGNoYW5nZWQgIl9fYXJjaDY0X18i
IHRvICIjaWYgX19CSVRTX1BFUl9MT05HIAo9PSA2NCIsIHRoZSBsaW5rIGlzOiAKaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2x0cC9wYXRjaC8yMDIxMDQyNjA3NDgxMi4yNzc5
OC0xLXN1amlheHVuQHVuaW9udGVjaC5jb20gCi8KCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
