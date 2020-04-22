Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18E1B373E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 08:14:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D80C73C2976
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 08:14:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4324B3C296B
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:14:53 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 76C93100093D
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:14:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,412,1580745600"; d="scan'208";a="89424771"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 14:14:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 69DED50A9999;
 Wed, 22 Apr 2020 14:04:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 14:14:40 +0800
To: Li Wang <liwang@redhat.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
 <CAEemH2diTUc226+Lr7ksyTw9BPMg2M5awZvrYo-j7oMT=pTPQQ@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0b5964c4-3c4a-be1c-7ac4-5d6803aecb64@cn.fujitsu.com>
Date: Wed, 22 Apr 2020 14:14:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2diTUc226+Lr7ksyTw9BPMg2M5awZvrYo-j7oMT=pTPQQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 69DED50A9999.AEEEF
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

SGkgTGkKCgo+IFh1LAo+IAo+IE9uIFR1ZSwgQXByIDIxLCAyMDIwIGF0IDY6MjQgUE0gWWFuZyBY
dSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbSAKPiA8bWFpbHRvOnh1eWFuZzIwMTguanlA
Y24uZnVqaXRzdS5jb20+PiB3cm90ZToKPiAKPiAgICAgLi4uCj4gICAgICA+Cj4gICAgICA+wqAg
wqAgwqArwqAgwqAgwqAgwqBpZiAocGlkID09IDApIHsKPiAgICAgID7CoCDCoCDCoCvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCgqdGVzdF9mdW5jW25dKSgpOwo+ICAgICAgPgo+ICAgICAgPsKgIMKg
IMKgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHN0X3JlYXBfY2hpbGRyZW4oKTsKPiAgICAgID7C
oCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNBRkVfQ0xPU0UoZmRzWzBdKTsKPiAgICAg
ID7CoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNBRkVfQ0xPU0UoZmRzWzFdKTsKPiAg
ICAgID4KPiAgICAgID4KPiAgICAgID4gSSB0ZW5kIHRvIG1vdmUgdGhlIGNsb2VzZShmZCkgdG8g
dGhlIHRlc3QgcHJvY2VzcyB0byBuZWFyYnnCoHBpcGUyKCkuCj4gICAgICA+IE90aGVyd2lzZSwg
aXQgY2F1c2VzIGFuIHVuY2xlYXIgZXJyb3IgbGlrZToKPiAgICAgID4KPiAgICAgID4gIyAuL3Bp
cGUyXzAzCj4gICAgICA+IHRzdF90ZXN0LmM6MTI0NjogSU5GTzogVGltZW91dCBwZXIgcnVuIGlz
IDBoIDA1bSAwMHMKPiAgICAgID4gcGlwZTJfMDMuYzo0ODogUEFTUzogRWFjaCB3cml0ZSgyKSB1
c2VzIGEgc2VwYXJhdGUgcGFja2V0Cj4gICAgICA+IHBpcGUyXzAzLmM6NjE6IFBBU1M6IEVhY2gg
cmVhZCgyKSByZWFkcyBhIHNlcGFyYXRlIHBhY2tldAo+ICAgICAgPiBwaXBlMl8wMy5jOjgxOiBQ
QVNTOiB3cml0ZShoaWduZXIgdGhhbiBQSVBFX0JVRikgc3BsaXQgaW50bwo+ICAgICBtdWx0aXBs
ZSBwYWNrZXQKPiAgICAgID4gcGlwZTJfMDMuYzoxMDg6IEZBSUw6IHRoZSBleGNlc3MgYnl0ZXMg
aW4gdGhlIHBhY2tldCBpcyBkaXNjYXJkZWQgYnkKPiAgICAgID4gcmVhZCwgZXhwZWN0IDEgZ290
IDElQQo+ICAgICBFdmVuIEkgdXNlIG9uZSBmb3JrIGFuZCBleGl0KDApLCBJIGRvbid0IG1lZXQg
dGhpcyBwcm9ibGVtLiBPciwgSSBtaXNzCj4gICAgIHNvbWV0aGluZz8KPiAKPiAKPiBNeSB0ZXN0
IGVudiBpcyBrZXJuZWwtNS43LjAtcmMxKyB4ODZfNjQsIEkgaGF2ZW4ndCBmaWd1cmVkIG91dCB3
aHkgdGhlIAo+IHJlYWQoKSBnZXQgbW9yZSB3b3JkcyBmcm9tIHRoZSBwaXBlLCBidXQgdGhlIGVy
cm9yIGhhcyBnb25lIG9uZSBJIG1vdmUgCj4gdGhlIHNhZmVfY2xvc2UoZmQpIHBhcnQgdG8gdGhl
IHRlc3QgbWFpbiBwcm9jZXNzLgo+IApPSy4KPiAKPiAgICAgLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9waXBlMi9waXBlMl8wMy5jCj4gICAgICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvcGlwZTIvcGlwZTJfMDMuYwo+ICAgICBAQCAtNTksNiArNTksNyBAQCBzdGF0aWMg
dm9pZCBjaGVja19wZWVyX3J3KHZvaWQpCj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCJFYWNoIHJlYWQoMikgZG9lc24n
dCByZWFkIGEKPiAgICAgc2VwYXJhdGUgcGFja2V0LCByZXR1cm4gJWxkIiwgVFNUX1JFVCk7Cj4g
ICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0KPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdHN0X3JlcyhUUEFTUywgIkVhY2ggcmVhZCgyKSByZWFkcyBhIHNlcGFyYXRlCj4g
ICAgIHBhY2tldCIpOwo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgX2V4aXQoMCk7Cj4g
ICAgICDCoCDCoCDCoCDCoCDCoH0KPiAgICAgIMKgIH0KPiAKPiAgICAgQEAgLTc5LDYgKzgwLDcg
QEAgc3RhdGljIHZvaWQgY2hlY2tfc3BsaXQodm9pZCkKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIndyaXRlKGhpZ25l
ciB0aGFuIFBJUEVfQlVGKQo+ICAgICBzcGxpdCBpbnRvIG11bHRpcGxlIHBhY2tldCwgcmV0dXJu
ICVsZCIsIFRTVF9SRVQpOwo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Cj4gICAg
ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9yZXMoVFBBU1MsICJ3cml0ZShoaWduZXIg
dGhhbiBQSVBFX0JVRikgc3BsaXQKPiAgICAgaW50bwo+ICAgICBtdWx0aXBsZSBwYWNrZXQiKTsK
PiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIF9leGl0KDApOwo+ICAgICAgwqAgwqAgwqAg
wqAgwqB9Cj4gICAgICDCoCB9Cj4gCj4gICAgIEBAIC0xMDcsMjEgKzEwOSwxNyBAQCBzdGF0aWMg
dm9pZCBjaGVja19kaXNjYXJkKHZvaWQpCj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9yZXMoVEZBSUwsCj4gICAgICDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCJ0aGUg
ZXhjZXNzIGJ5dGVzIGluIHRoZQo+ICAgICBwYWNrZXQKPiAgICAgaXMgZGlzY2FyZGVkIGJ5IHJl
YWQsIGV4cGVjdCAxIGdvdCAlcyIsIHRtcF9zZWNvbmRidWYpOwo+ICAgICAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBfZXhpdCgwKTsK
PiAgICAgIMKgIMKgIMKgIMKgIMKgfQo+ICAgICAgwqAgfQo+IAo+ICAgICAgwqAgc3RhdGljIHZv
aWQgdmVyaWZ5X3BpcGUyKHVuc2lnbmVkIGludCBuKQo+ICAgICAgwqAgewo+ICAgICAtwqAgwqAg
wqAgwqBpbnQgcGlkOwo+ICAgICAtCj4gICAgIC3CoCDCoCDCoCDCoHBpZCA9IFNBRkVfRk9SSygp
Owo+ICAgICAtwqAgwqAgwqAgwqBpZiAocGlkID09IDApIHsKPiAgICAgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgKCp0ZXN0X2Z1bmNbbl0pKCk7Cj4gICAgIC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHRzdF9yZWFwX2NoaWxkcmVuKCk7Cj4gICAgIC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNBRkVf
Q0xPU0UoZmRzWzBdKTsKPiAgICAgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU0FGRV9DTE9TRShm
ZHNbMV0pOwo+ICAgICAtwqAgwqAgwqAgwqB9Cj4gICAgICsgwqAoKnRlc3RfZnVuY1tuXSkoKTsK
PiAgICAgK8KgIMKgIMKgIMKgU0FGRV9DTE9TRShmZHNbMF0pOwo+ICAgICArwqAgwqAgwqAgwqBT
QUZFX0NMT1NFKGZkc1sxXSk7Cj4gICAgICDCoCDCoCDCoCDCoCDCoHRzdF9yZWFwX2NoaWxkcmVu
KCk7Cj4gCj4gCj4gSW4gbXkgb3BpbmlvbiwgaXQgaXMgbm90IGEgZ29vZCBoYWJpdCB0byB3YWl0
IGZvciBjaGlsZHJlbidzIHN0YXR1cyAKPiBhZnRlciB0aGUgdGVzdCBmdW5jdGlvbiwgd2UnZCBi
ZXR0ZXIgZG8gdGhhdCBhdCB0aGUgYmVoaW5kIG9mIGZvcmsoKSBpbiAKPiB0aGUgdGVzdCBtYWlu
IHByb2Nlc3MuIEknZCBvbmx5IGtlZXAgdGhlIMKgKCp0ZXN0X2Z1bmNbbl0pKCk7IGluIHRoaXMg
Cj4gdmVyaWZ5X3BpcGUyKCkgYnV0IG5vIG1vcmUgZWxzZS4KWWVzLgo+IC0tIAo+IFJlZ2FyZHMs
Cj4gTGkgV2FuZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
