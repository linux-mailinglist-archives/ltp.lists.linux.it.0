Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A436AFBC
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:28:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EA4D3C6749
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:28:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E21453C1DA6
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:28:45 +0200 (CEST)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A9D64200B9C
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:28:43 +0200 (CEST)
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 2B6EEE4B
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 16:28:41 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.4.23.88] (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P31919T139683971446528S1619425721400005_; 
 Mon, 26 Apr 2021 16:28:41 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a25d9757ad42ef949eaa48495284bbce>
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
 <827cdde8-18df-75b0-743c-7876704c2039@uniontech.com>
 <20210426081219.tvaoqd67vj26bfr3@vireshk-i7>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <8aaa1c0e-e481-3c3e-c281-53aaf1bd499e@uniontech.com>
Date: Mon, 26 Apr 2021 16:28:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210426081219.tvaoqd67vj26bfr3@vireshk-i7>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

CgrlnKggMjAyMS80LzI2IOS4i+WNiDQ6MTIsIFZpcmVzaCBLdW1hciDlhpnpgZM6Cj4gT24gMjYt
MDQtMjEsIDE1OjUzLCBzdWppYXh1biB3cm90ZToKPj4KPj4KPj4gT24gMjAyMS80LzI2IOS4i+WN
iDM6MDMsIFZpcmVzaCBLdW1hciB3cm90ZToKPj4+IE9uIDI2LTA0LTIxLCAxNTowMCwgc3VqaWF4
dW4gd3JvdGU6Cj4+Pj4gdW9zQHVvcy1QQzp+JCBlY2hvIHxnY2MgLWRNIC1FIC0gfCBncmVwIC1p
IGFyY2gKPj4+PiAjZGVmaW5lIF9NSVBTX0FSQ0ggIm1pcHM2NHIyIgo+Pj4+ICNkZWZpbmUgX01J
UFNfQVJDSF9NSVBTNjRSMiAxCj4+Pj4gdW9zQHVvcy1QQzp+JCBlY2hvIHxnY2MgLWRNIC1FIC0g
fCBncmVwIC1pIG1pcHM2NAo+Pj4+ICNkZWZpbmUgX01JUFNfSVNBIF9NSVBTX0lTQV9NSVBTNjQK
Pj4+PiAjZGVmaW5lIF9NSVBTX1RVTkUgIm1pcHM2NHIyIgo+Pj4+ICNkZWZpbmUgX01JUFNfVFVO
RV9NSVBTNjRSMiAxCj4+Pj4gI2RlZmluZSBfTUlQU19BUkNIICJtaXBzNjRyMiIKPj4+PiAjZGVm
aW5lIF9NSVBTX0FSQ0hfTUlQUzY0UjIgMQo+Pj4+ICNkZWZpbmUgX19taXBzNjQgMQo+Pj4+IHVv
c0B1b3MtUEM6fiQgdW5hbWUgIC1tCj4+Pj4gbWlwczY0Cj4+Pj4KPj4+PiBUaGUgbWlwcyBhcmNo
aXRlY3R1cmUgZ2NjIGhhcyBubyBidWlsdC1pbiBfX2FyY2g2NF9fLCBvbmx5IF9fbWlwczY0Cj4+
Pj4gZGVmaW5pdGlvbnMuIE9mIGNvdXJzZSwgIl9fQklUU19QRVJfTE9ORyA9PSA2NCIgY2FuIGFs
c28gYmUgdXNlZCwgYnV0IEkKPj4+PiB0aGluayBpdCBpcyBiZXR0ZXIgdG8gdXNlIF9fbWlwczY0
IGluIHRoZSBtaXBzIGFyY2hpdGVjdHVyZS4KPj4+Cj4+PiBIbW0sIEkgd2lsbCByYXRoZXIgdHJ5
IHRvIGRvIHdoYXQgdGhlIGtlcm5lbCBzb3VyY2UgY29kZSBkb2VzLCBpLmUuCj4+PiB1c2UgX19C
SVRTX1BFUl9MT05HIGhlcmUgaW5zdGVhZC4KPj4+Cj4+IEkgcmVzdWJtaXR0ZWQgYSBwYXRjaCBh
bmQgY2hhbmdlZCAiX19hcmNoNjRfXyIgdG8gIiNpZiBfX0JJVFNfUEVSX0xPTkcgPT0KPj4gNjQi
LCB0aGUgbGluayBpczogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2x0cC9w
YXRjaC8yMDIxMDQyNjA3NDgxMi4yNzc5OC0xLXN1amlheHVuQHVuaW9udGVjaC5jb20KPiAKPiBZ
b3Ugc2hvdWxkIGhhdmUgY2MnZCBtZSBkaXJlY3RseSA6KAo+IAo+IEkgZG9uJ3QgaGF2ZSB0aGF0
IHBhdGNoIGluIG15IGluYm94Li4KPiAKPiBUaG91Z2ggdGhlIHBhdGNoIGxvb2tzIGZpbmUuCj4g
ClNvcnJ5LCB3aGF0IHNob3VsZCBJIGRvIG5vdz8KCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
