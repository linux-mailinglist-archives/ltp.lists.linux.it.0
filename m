Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7712D1A90AB
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 03:59:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 741853C2B6D
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 03:59:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C26453C088F
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 03:59:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7714760084D
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 03:59:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; d="scan'208";a="89044376"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:59:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4172650A996E;
 Wed, 15 Apr 2020 09:48:33 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:58:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Li Wang <liwang@redhat.com>
References: <67fdc846a8cd8616c9eb13cf89463b9d637e6849>
 <20200409211255.1357-1-laniel_francis@privacyrequired.com>
 <7c9e27de-aaff-98ea-4e00-2c242f7a0cc3@cn.fujitsu.com>
Message-ID: <f8f3aea3-5371-a8b5-09dd-1200d9dc6d72@cn.fujitsu.com>
Date: Wed, 15 Apr 2020 09:58:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <7c9e27de-aaff-98ea-4e00-2c242f7a0cc3@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4172650A996E.AB5CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Add new test for pipe2 with/without O_NONBLOCK mode
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

SGkgTGkKCj4gSGkgTGFuaWVsCj4gCj4gCj4+IEhpLgo+Pgo+Pgo+PiBJIGFkZGVkIGEgbmV3IHRl
c3QgZmlsZSAocGlwZTJfMDMuYykgdG8gdGVzdCBwaXBlMiBzeXN0ZW0gY2FsbCB3aXRoIAo+PiBh
bmQgd2l0aG91dAo+PiBPX05PTkJMT0NLIGVuYWJsZWQuCj4+IFRoaXMgdGVzdCB1c2VzIHRoZSBt
YWNybyBTQUZFX1BJUEUyIHRoYXQgSSBhZGRlZCwgdGhpcyBtYWNybyBpcyBqdXN0IHRoZQo+PiBl
cXVpdmFsZW50IG9mIFNBRkVfUElQRSBmb3IgcGlwZTIuCj4+Cj4+IEkgZG8gbm90IGtub3cgaWYg
aXQgaXMgY29ycmVjdCB0byBkbyB0aGF0IGJ1dCBhdCB0aGUgZW5kIG9mIHRoZSB0ZXN0IAo+PiBm
dW5jdGlvbiB3ZQo+PiBuZWVkIHRvIHNldCB0aGUgcGlwZSBpbiB0aGUgc2FtZSBzdGF0ZSBhcyBp
dCB3YXMgYXQgdGhlIGVuZCBvZiBzZXR1cCAKPj4gZnVuY3Rpb246Cj4+IDEuIFNldCB0aGUgT19O
T05CTE9DSyBmbGFnIHRvIHRoZSBwaXBlLgo+PiAyLiBSZWFkIHRoZSBwaXBlIHRvIGVtcHR5IGl0
Lgo+IEFzIG15IHByZXZpb3VzIG1haWwgc2FpZCwgZmlsbCB1cCB0aGUgcGlwZSBpbiBzZXR1cCwg
c28gd2UgZG9uJ3QgbmVlZCB0byAKPiByZWFkIHRoZSBwaXBlLiB3ZSBvbmx5IG5lZWQgdG8gc2V0
IHRoZSBub25fYmxvY2sgZmxhZyB3aGVuIHVzaW5nIC1pIAo+IHBhcmFtZXRlci4KPiAKPiBJIG1v
ZGlmeSB5b3VyIHBhdGNoIGFuZCBtZXJnZWQgaW50byBteSBsdHAgb3duIGZvcmsuCj4gc2VlIAo+
IGh0dHBzOi8vZ2l0aHViLmNvbS94dXlhbmcwNDEwL2x0cC9jb21taXRzL0xhbmllbF9mcmFuY2lz
X3BpcGUyXzAzX3YzLmZpeGVzCj4gCj4gcHM6IEkgd2lsbCBjb252ZXJ0IHBpcGUyXzAxLzAyLmMg
aW50byBuZXcgbGlicmF5IGFuZCB1c2UgU0FGRV9QSVBFMiBtYWNyby4KQ2FuIHlvdSBtZXJnZSB0
aGUgc2FmZV9waXBlMiBwYXRjaChkb24ndCBuZWVkIHRvIGFkZCB0aGlzIG1hY3JvIGludG8gb2xk
IApzYWZlX21hY3JvIGhlYWRlcikgaW50byBtYXN0ZXI/IHNvIHRoZW4gSSBjYW4gd3JpdGUgbmV3
IHRlc3QgY2FzZXMgCih1c2luZyB0aGlzIG1hY3JvKSB0byB0ZXN0IE9fRElSRUNUIGFuZCAgT19D
TE9FWEVDIGZsYWcgZnVuY3Rpb24uCgpBbHNvLCBmZWVsIGZyZWUgdG8gY29tbWVudCB0aGUgTGFu
aWVsX2ZyYW5jaXNfcGlwZTJfMDNfdjMuZml4ZXMgYnJhbmNoIAoobGFuaWVsIHdyaXRlIHRoaXMg
Y2FzZSB0byB0ZXN0IE9fTk9OQkxPQ0sgbW9kZSwgaXQgaXMgc2ltaWxhciB3aXRoIAp2bXNwbGlj
ZTA0LmMpLgoKQmVzdCBSZWdhcmRzCllhbmcgWHUKPiAKPiBCZXN0IFJlZ2FyZHMKPiBZYW5nIFh1
Cj4+IDMuIFdlIGRvIG5vdCBzZXQgaXRzIHNpemUgdG8gZGVmYXVsdCBiZWNhdXNlIHdlIGRvIG5v
dCBjYXJlIG9mIGl0Lgo+PiBJZiB3ZSBkbyBub3QgZG8gdGhhdCwgdGhlcmUgd2lsbCBiZSBwcm9i
bGVtIHdoZW4gdGhpcyB0ZXN0IGlzIHJ1biAKPj4gbXVsdGlwbGUgdGltZQo+PiAodGhpcyBwcm9i
bGVtIHdhcyBmb3VuZCB3aGVuIHJ1bm5pbmcgLi9waXBlMl8wMyAtaSAxMCkuCj4+Cj4+IFRoZSBk
aWZmIC0tc3RhdCBvdXRwdXQgaXMgdGhlIGZvbGxvd2luZzoKPj4gwqAgaW5jbHVkZS9vbGQvc2Fm
ZV9tYWNyb3MuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArKysK
Pj4gwqAgaW5jbHVkZS90c3Rfc2FmZV9tYWNyb3MuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgNiArKysrKysKPj4gwqAgbGliL3NhZmVfbWFjcm9zLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTUgKysrKysrKysr
KysrKysKPj4gwqAgcnVudGVzdC9zeXNjYWxsc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIHRlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvcGlwZTIvLmdpdGlnbm9yZSB8wqDCoCAxICsKPj4gwqAgdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9waXBlMi9waXBlMl8wMy5jIHwgMTM1IAo+PiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrIAo+Pgo+PiDCoCA2
IGZpbGVzIGNoYW5nZWQsIDE2MSBpbnNlcnRpb25zKCspCj4+Cj4+Cj4+IEJlc3QgcmVnYXJkcy4K
Pj4KPj4KPj4KCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
