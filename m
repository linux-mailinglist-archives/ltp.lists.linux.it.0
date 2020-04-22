Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A63C1B399B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 10:09:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA2943C2976
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 10:09:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C632A3C2965
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:09:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 65AAF1000A20
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:09:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,412,1580745600"; d="scan'208";a="89440664"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 16:08:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B7BDE46B5FA0;
 Wed, 22 Apr 2020 15:58:17 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 16:08:52 +0800
To: Li Wang <liwang@redhat.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
 <CAEemH2dj8vdicU76ewAAECgrEmVaEGN5uMZ4EmnzUa1v+Ez9Ng@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <53bb4ba1-0e68-4abb-39fd-9e661ed38754@cn.fujitsu.com>
Date: Wed, 22 Apr 2020 16:08:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dj8vdicU76ewAAECgrEmVaEGN5uMZ4EmnzUa1v+Ez9Ng@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B7BDE46B5FA0.AF9EA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGkKCj4gSGkgWHUsCj4gCj4gWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNv
bSAKPiA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+PiB3cm90ZToKPiAKPiAg
ICAgLi4uCj4gICAgICA+Cj4gICAgICA+ICMgLi9waXBlMl8wMwo+ICAgICAgPiB0c3RfdGVzdC5j
OjEyNDY6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCj4gICAgICA+IHBpcGUy
XzAzLmM6NDg6IFBBU1M6IEVhY2ggd3JpdGUoMikgdXNlcyBhIHNlcGFyYXRlIHBhY2tldAo+ICAg
ICAgPiBwaXBlMl8wMy5jOjYxOiBQQVNTOiBFYWNoIHJlYWQoMikgcmVhZHMgYSBzZXBhcmF0ZSBw
YWNrZXQKPiAgICAgID4gcGlwZTJfMDMuYzo4MTogUEFTUzogd3JpdGUoaGlnbmVyIHRoYW4gUElQ
RV9CVUYpIHNwbGl0IGludG8KPiAgICAgbXVsdGlwbGUgcGFja2V0Cj4gICAgICA+IHBpcGUyXzAz
LmM6MTA4OiBGQUlMOiB0aGUgZXhjZXNzIGJ5dGVzIGluIHRoZSBwYWNrZXQgaXMgZGlzY2FyZGVk
IGJ5Cj4gICAgICA+IHJlYWQsIGV4cGVjdCAxIGdvdCAxJUEKPiAgICAgRXZlbiBJIHVzZSBvbmUg
Zm9yayBhbmQgZXhpdCgwKSwgSSBkb24ndCBtZWV0IHRoaXMgcHJvYmxlbS4gT3IsIEkgbWlzcwo+
ICAgICBzb21ldGhpbmc/Cj4gCj4gCj4gSSB0aGluayBJIGdvdCB0aGUgcG9pbnQuCj4gCj4gSW4g
eW91ciB0ZXN0IGNvZGUgZm9yIHBpcGUyKCksIHlvdSBkaWRuJ3QgdXNlIHBpcGUgaW4gdGhlIGNv
cnJlY3Qgd2F5LiAKPiBFdmVuIHRoYXQgd2UgZGVmaW5lIHRoZSBmZHNbMl0gYXMgYSBnbG9iYWzC
oHZhcmlhYmxlLCB0aGVyZSBzdGlsbCBoYXZlIGEgCj4gbmV3IGNvcHkgZm9yIGZkc1syXSBpbiB0
aGUgY2hpbGQgcHJvY2Vzcywgd2Ugc2hvdWxkIGNsb3NlIG9uZSBvZiB0aGUgCj4gcGlwZXMgaW4g
Y2hpbGQgYW5kIHBhcmVudCB0byBtYWtlIHRoZSBjb25uZWN0aW9uIGlzIGJ1aWx0IAo+IGNvcnJl
c3BvbmRpbmdseSwgdGhlbiB0aGF0IHdpbGwgd29yayBub3JtYWxseSBmb3IgdXMuCj4gCj4gSSBz
dWdnZXN0IHJlZGVzaWduaW5nIHNvbWUgb2YgdGhlIHRlc3Qgc3RydWN0cy4gV2hhdCBkbyB5b3Ug
dGhpbms/Clllcy4KPiAKPiBGeWk6IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXBy
b2plY3QvbHRwL2Jsb2IvbWFzdGVyL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlwZS9waXBl
MDIuYwpJbiBwcmluY2lwbGUsIHdlIHNob3VsZCB1c2UgdGhlIGZvbGxvd2luZyBmb3JtYXQKc3Rl
cDEgICAgICBwaXBlKGZkcyk7CnN0ZXAyICAgICAgU0FGRV9GT1JLKCk7CiAgICAgICBjaGlsZCBw
cm9jZXNzCnN0ZXAzICAgICAgICAgY2xvc2Ugb25lIGZkIGFuZCBkbyBzb21ldGhpbmcKICAgICAg
IHBhcmVudCBwcm9jZXNzCnN0ZXA0ICAgICAgICAgY2xvc2UgYW5vdGhlciBmZCBhbmQgZG8gc29t
ZXRoaW5nCgpBbHNvLCB3ZSBzaG91bGQgbm90IGRvIHdyaXRlIG9wZWFydGlvbiBpbiBzdGVwIDF+
Miwgb3RoZXJ3aXNlIGNoaWxkIApwcm9jZXNzIHdpbGwgaW5oZXJpdCBkYXRhLgo+IAo+IC0tIAo+
IFJlZ2FyZHMsCj4gTGkgV2FuZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
