Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879C4E028
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 07:58:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D31983EB001
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 07:58:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 55E493EAEB0
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 07:58:38 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 92933140051E
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 07:58:35 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,398,1557158400"; d="scan'208";a="68373305"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jun 2019 13:58:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 4A37B4CDD98D;
 Fri, 21 Jun 2019 13:58:30 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 21 Jun 2019 13:58:35 +0800
Message-ID: <5D0C7204.9020704@cn.fujitsu.com>
Date: Fri, 21 Jun 2019 13:58:28 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190610032754.GA7114@hori.linux.bs1.fc.nec.co.jp>
In-Reply-To: <20190610032754.GA7114@hori.linux.bs1.fc.nec.co.jp>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 4A37B4CDD98D.AF1E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cj4gSGkgTGkgV2FuZywKPgo+IFRoYW5rIHlvdSBmb3IgbWFpbnRhaW5pbmcgdGhlIHRlc3RjYXNl
Lgo+Cj4gUmVjZW50bHkgKHNpbmNlIDQuMTkpIHdlIGhhdmUgYSBzZW1hbnRpY3MgY2hhbmdlIG9u
IHRoZSByZXR1cm4gdmFsdWUgb2YKPiBtYWR2aXNlKE1BRFZfU09GVF9PRkZMSU5FKSwgYW5kIHdl
IHNlZSAtRUJVU1kgd2hlbiBodWdlcGFnZSBtaWdyYXRpb24KPiBzdWNjZWVkZWQgYW5kIGVycm9y
IGNvbnRhaW5tZW50IGZhaWxlZDoKPgo+ICAgY29tbWl0IDZiYzliNTY0MzNiNzZlNDBkMTEwOTkz
MzhkMjdmYmM1Y2QyOTM1Y2EKPiAgIEF1dGhvcjogTmFveWEgSG9yaWd1Y2hpIDxuLWhvcmlndWNo
aUBhaC5qcC5uZWMuY29tPgo+ICAgRGF0ZTogICBUaHUgQXVnIDIzIDE3OjAwOjM4IDIwMTggLTA3
MDAKPiAgIAo+ICAgICAgIG1tOiBmaXggcmFjZSBvbiBzb2Z0LW9mZmxpbmluZyBmcmVlIGh1Z2Ug
cGFnZXMKPgo+ICwgc28gd2UgZG9uJ3QgaGF2ZSB0byBjb25zaWRlciB0aGlzIEVCVVNZIGFzIGVy
cm9yLCBidXQgYSBnb29kIHJlcG9ydAo+IGZvciBhcHBsaWNhdGlvbi4gWW91ciBjaGFuZ2UgbWVl
dHMgdGhlIGNoYW5nZS4KPgo+IEZlZWwgZnJlZSB0byBhZGQgbXkgYWNrOgo+Cj4gQWNrZWQtYnk6
IE5hb3lhIEhvcmlndWNoaSA8bi1ob3JpZ3VjaGlAYWguanAubmVjLmNvbT4KPgo+IFRoYW5rcywK
PiAtIE5hb3lhCj4KPiBPbiBGcmksIEp1biAwNywgMjAxOSBhdCAwNTo1MjoxM1BNICswODAwLCBM
aSBXYW5nIHdyb3RlOgo+PiBUaGUgdGVzdCMyIGlzIGdvaW5nIHRvIHNpbXVsYXRlIHRoZSByYWNl
IGNvbmRpdGlvbiwgd2hlcmUgbW92ZV9wYWdlcygpCj4+IGFuZCBzb2Z0IG9mZmxpbmUgYXJlIGNh
bGxlZCBvbiBhIHNpbmdsZSBodWdldGxiIHBhZ2UgY29uY3VycmVudGx5LiBCdXQsCj4+IGl0IHJl
dHVybiBFQlVTWSBhbmQgcmVwb3J0IEZBSUwgaW4gc29mdC1vZmZsaW5lIGEgbW92aW5nIGh1Z2Vw
YWdlIGFzIGEKPj4gcmVzdWx0IHNvbWV0aW1lcy4KPj4KPj4gVGhlIHJvb3QgY2F1c2Ugc2VlbXMg
YSBjYWxsIHRvIHBhZ2VfaHVnZV9hY3RpdmUgcmV0dXJuIGZhbHNlLCB0aGVuIHRoZQo+PiBzb2Z0
IG9mZmxpbmUgYWN0aW9uIHdpbGwgZmFpbGVkIHRvIGlzb2xhdGUgaHVnZXBhZ2Ugd2l0aCBFQlVT
WSByZXR1cm4gYXMKPj4gYmVsb3cgY2FsbCB0cmFjZToKPj4KPj4gSW4gUGFyZW50Ogo+PiAgIG1h
ZHZpc2UoLi4uLCBNQURWX1NPRlRfT0ZGTElORSkKPj4gICAuLi4KPj4gICAgIHNvZnRfb2ZmbGlu
ZV9wYWdlCj4+ICAgICAgIHNvZnRfb2ZmbGluZV9pbl91c2VfcGFnZQo+PiAgICAgICAgIHNvZnRf
b2ZmbGluZV9odWdlX3BhZ2UKPj4gICAgICAgICAgIGlzb2xhdGVfaHVnZV9wYWdlCj4+ICAgICAg
ICAgICAgIHBhZ2VfaHVnZV9hY3RpdmUgIC0tPiByZXR1cm4gZmFsc2UgYXQgaGVyZQo+Pgo+PiBJ
biBDaGlsZDoKPj4gICBtb3ZlX3BhZ2VzKCkKPj4gICAuLi4KPj4gICAgIGRvX21vdmVfcGFnZXMK
Pj4gICAgICAgZG9fbW92ZV9wYWdlc190b19ub2RlCj4+ICAgICAgICAgYWRkX3BhZ2VfZm9yX21p
Z3JhdGlvbgo+PiAgICAgICAgICAgaXNvbGF0ZV9odWdlX3BhZ2UgICAtLT4gaXQgaGFzIGFscmVh
ZHkgaXNvbGF0ZWQgdGhlIGh1Z2VwYWdlCj4+Cj4+IEluIHRoaXMgcGF0Y2gsIEkgc2ltcGx5IHJl
Z2FyZCB0aGUgcmV0dXJuZWQgRUJVU1kgYXMgYSBub3JtYWwgc2l0dWF0aW9uIGFuZAo+PiBtYXNr
IGl0IGluIGVycm9yIGhhbmRsZXIuIEJlY2F1c2UgbW92ZV9wYWdlcyBpcyBjYWxsaW5nIGFkZF9w
YWdlX2Zvcl9taWdyYXRpb24KPj4gdG8gaXNvbGF0ZSBodWdlcGFnZSBiZWZvcmUgZG8gbWlncmF0
aW9uLCBzbyB0aGF0J3MgdmVyeSBwb3NzaWJsZSB0byBoaXQgdGhlCj4+IGNvbGxpc2lvbiBhbmQg
cmV0dXJuIEVCVVNZIG9uIHRoZSBzYW1lIHBhZ2UuCj4+Cj4+IEVycm9yIGxvZzoKPj4gLS0tLS0t
LS0tLQo+PiBtb3ZlX3BhZ2VzMTIuYzoyMzU6IElORk86IEZyZWUgUkFNIDgzODYyNTYga0IKPj4g
bW92ZV9wYWdlczEyLmM6MjUzOiBJTkZPOiBJbmNyZWFzaW5nIDIwNDhrQiBodWdlcGFnZXMgcG9v
bCBvbiBub2RlIDAgdG8gNAo+PiBtb3ZlX3BhZ2VzMTIuYzoyNjM6IElORk86IEluY3JlYXNpbmcg
MjA0OGtCIGh1Z2VwYWdlcyBwb29sIG9uIG5vZGUgMSB0byA2Cj4+IG1vdmVfcGFnZXMxMi5jOjE3
OTogSU5GTzogQWxsb2NhdGluZyBhbmQgZnJlZWluZyA0IGh1Z2VwYWdlcyBvbiBub2RlIDAKPj4g
bW92ZV9wYWdlczEyLmM6MTc5OiBJTkZPOiBBbGxvY2F0aW5nIGFuZCBmcmVlaW5nIDQgaHVnZXBh
Z2VzIG9uIG5vZGUgMQo+PiBtb3ZlX3BhZ2VzMTIuYzoxNjk6IFBBU1M6IEJ1ZyBub3QgcmVwcm9k
dWNlZAo+PiBtb3ZlX3BhZ2VzMTIuYzo4MTogRkFJTDogbWFkdmlzZSBmYWlsZWQ6IFNVQ0NFU1MK
Pj4gbW92ZV9wYWdlczEyLmM6ODE6IEZBSUw6IG1hZHZpc2UgZmFpbGVkOiBTVUNDRVNTCj4+IG1v
dmVfcGFnZXMxMi5jOjE0MzogQlJPSzogbW1hcCgobmlsKSw0MTk0MzA0LDMsMjYyMTc4LC0xLDAp
IGZhaWxlZDogRU5PTUVNCj4+IG1vdmVfcGFnZXMxMi5jOjExNDogRkFJTDogbW92ZV9wYWdlcyBm
YWlsZWQ6IEVJTlZBTAo+Pgo+PiBEbWVzZzoKPj4gLS0tLS0tCj4+IFsxNjU0MzUuNDkyMTcwXSBz
b2Z0IG9mZmxpbmU6IDB4NjFjMDAgaHVnZXBhZ2UgZmFpbGVkIHRvIGlzb2xhdGUKPj4gWzE2NTQz
NS41OTAyNTJdIHNvZnQgb2ZmbGluZTogMHg2MWMwMCBodWdlcGFnZSBmYWlsZWQgdG8gaXNvbGF0
ZQo+PiBbMTY1NDM1LjcyNTQ5M10gc29mdCBvZmZsaW5lOiAweDYxNDAwIGh1Z2VwYWdlIGZhaWxl
ZCB0byBpc29sYXRlCj4+Cj4+IE90aGVyIHR3byBmaXhlcyBpbiB0aGlzIHBhdGNoOgo+PiAgKiB1
c2UgVEVSUk5PKGJ1dCBub3QgVFRFUlJOTykgdG8gY2F0Y2ggbWFkdmlzZSguLi4sIE1BRFZfU09G
VF9PRkZMSU5FKSBlcnJubwo+PiAgKiBnbyBvdXQgdGVzdCB3aGVuIGh1Z2VwYWdlIGFsbG9jYXRp
bmcgZmFpbGVkIHdpdGggRU5PTUVNCkhpIExpCgpZb3VyIHBhdGNoIGNhbiBoYW5kbGUgRUJVU1kg
ZXJybm8gY29ycmVjdGx5IGZvciBzb2Z0IG9mZmxpbmUuIApCdXQgbW92ZSBwYWdlICBtYXkgYmUg
a2lsbGVkIGJ5IFNJR0JVUyBiZWNhdXNlIG9mICBNQ0UgIHdoZW4gd2Ugc29mdCBvZmZsaW5lIGNv
bmN1cnJlbnRseS4gIApUaGF0IGxlYWRzIHRvIG1vdmVfcGFnZSBmYWlsZWQgd2l0aCBFU1JDSC4g
ICBBbHNvLCBtb3ZlIHBhZ2UgbWF5IGZhaWxzIHdpdGggRU5PTUVNIC4KRG8geW91IG5vdGljZSBp
dCA/CgpJIHRoaW5rIEVTUkNIIGVycm9yIGNhbiByZXByZXNlbnQgdGhlIHNvZnQgb2ZmbGluZSBi
dWcgbm90IHJlcHJvZHVjZSBiZWNhdXNlIGl0IGRvbid0IHRyaWdnZXIgYSBjcmFzaC4KV2hhdCBk
byB5b3UgdGhpbmsgYWJvdXQgaXQ/CgplcnJfbG9nOgp0c3RfdGVzdC5jOjEwOTY6IElORk86IFRp
bWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCm1vdmVfcGFnZXMxMi5jOjIzNjogSU5GTzogRnJl
ZSBSQU0gMTE5NTY4IGtCCm1vdmVfcGFnZXMxMi5jOjI1NDogSU5GTzogSW5jcmVhc2luZyAyMDQ4
a0IgaHVnZXBhZ2VzIHBvb2wgb24gbm9kZSAwIHRvIDgzCm1vdmVfcGFnZXMxMi5jOjI2NDogSU5G
TzogSW5jcmVhc2luZyAyMDQ4a0IgaHVnZXBhZ2VzIHBvb2wgb24gbm9kZSAxIHRvIDk0Cm1vdmVf
cGFnZXMxMi5jOjE4MDogSU5GTzogQWxsb2NhdGluZyBhbmQgZnJlZWluZyA0IGh1Z2VwYWdlcyBv
biBub2RlIDAKbW92ZV9wYWdlczEyLmM6MTgwOiBJTkZPOiBBbGxvY2F0aW5nIGFuZCBmcmVlaW5n
IDQgaHVnZXBhZ2VzIG9uIG5vZGUgMQptb3ZlX3BhZ2VzMTIuYzoxNzA6IFBBU1M6IEJ1ZyBub3Qg
cmVwcm9kdWNlZAp0c3RfdGVzdC5jOjExNDE6IEJST0s6IFRlc3Qga2lsbGVkIGJ5IFNJR0JVUyEK
ClN1bW1hcnk6CnBhc3NlZCAgIDEKZmFpbGVkICAgMApza2lwcGVkICAwCndhcm5pbmdzIDAKCm1v
dmVfcGFnZXMxMi5jOjExNDogRkFJTDogbW92ZV9wYWdlcyBmYWlsZWQ6IEVTUkNICgpkbWVzZwpb
IDk4NjguMTgwNjY5XSBNQ0U6IEtpbGxpbmcgbW92ZV9wYWdlczEyOjI5NjE2IGR1ZSB0byBoYXJk
d2FyZSBtZW1vcnkgY29ycnVwdGlvbiBmYXVsdCBhdCAyYWFhYWFjMDAwMTgKWyA5OTkwLjA0OTg3
NV0gU29mdCBvZmZsaW5pbmcgcGFnZSA1MGUwMCBhdCAyYWFhYWFjMDAwMDAKWyA5OTkwLjA1MjIx
OF0gU29mdCBvZmZsaW5pbmcgcGFnZSA1MGMwMCBhdCAyYWFhYWFlMDAwMDAKWyA5OTkwLjA2MDM5
NV0gU29mdCBvZmZsaW5pbmcgcGFnZSA1MTAwMCBhdCAyYWFhYWFjMDAwMDAKCktpbmQgUmVnYXJk
cywKWWFuZyBYdQoKPj4gU2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+
Cj4+IENjOiBOYW95YSBIb3JpZ3VjaGkgPG4taG9yaWd1Y2hpQGFoLmpwLm5lYy5jb20+Cj4+IENj
OiBYaWFvIFlhbmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgo+PiBDYzogWWFuZyBYdSA8eHV5
YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KPj4gLS0tCj4+ICAuLi4va2VybmVsL3N5c2NhbGxz
L21vdmVfcGFnZXMvbW92ZV9wYWdlczEyLmMgfCAzMyArKysrKysrKysrKysrKy0tLS0tCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbW92ZV9wYWdlcy9tb3ZlX3BhZ2Vz
MTIuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbW92ZV9wYWdlcy9tb3ZlX3BhZ2VzMTIu
Ywo+PiBpbmRleCA5NjRiNzEyZmIuLmM0NDYzOTZkYyAxMDA2NDQKPj4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9tb3ZlX3BhZ2VzL21vdmVfcGFnZXMxMi5jCj4+ICsrKyBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvbW92ZV9wYWdlcy9tb3ZlX3BhZ2VzMTIuYwo+PiBAQCAtNzcs
OCArNzcsOCBAQCBzdGF0aWMgdm9pZCAqYWRkcjsKPj4gIHN0YXRpYyBpbnQgZG9fc29mdF9vZmZs
aW5lKGludCB0cGdzKQo+PiAgewo+PiAgCWlmIChtYWR2aXNlKGFkZHIsIHRwZ3MgKiBocHN6LCBN
QURWX1NPRlRfT0ZGTElORSkgPT0gLTEpIHsKPj4gLQkJaWYgKGVycm5vICE9IEVJTlZBTCkKPj4g
LQkJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAibWFkdmlzZSBmYWlsZWQiKTsKPj4gKwkJaWYg
KGVycm5vICE9IEVJTlZBTCAmJiBlcnJubyAhPSBFQlVTWSkKPj4gKwkJCXRzdF9yZXMoVEZBSUwg
fCBURVJSTk8sICJtYWR2aXNlIGZhaWxlZCIpOwo+PiAgCQlyZXR1cm4gZXJybm87Cj4+ICAJfQo+
PiAgCXJldHVybiAwOwo+PiBAQCAtMTIxLDcgKzEyMSw4IEBAIHN0YXRpYyB2b2lkIGRvX2NoaWxk
KGludCB0cGdzKQo+PiAgCj4+ICBzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2lnbmVkIGludCBuKQo+
PiAgewo+PiAtCWludCBpOwo+PiArCWludCBpLCByZXQ7Cj4+ICsJdm9pZCAqcHRyOwo+PiAgCXBp
ZF90IGNwaWQgPSAtMTsKPj4gIAlpbnQgc3RhdHVzOwo+PiAgCXVuc2lnbmVkIGludCB0d2VudHlf
cGVyY2VudCA9ICh0c3RfdGltZW91dF9yZW1haW5pbmcoKSAvIDUpOwo+PiBAQCAtMTM2LDI0ICsx
MzcsMzcgQEAgc3RhdGljIHZvaWQgZG9fdGVzdCh1bnNpZ25lZCBpbnQgbikKPj4gIAkJZG9fY2hp
bGQodGNhc2VzW25dLnRwYWdlcyk7Cj4+ICAKPj4gIAlmb3IgKGkgPSAwOyBpIDwgTE9PUFM7IGkr
Kykgewo+PiAtCQl2b2lkICpwdHI7Cj4+ICsJCXB0ciA9IG1tYXAoTlVMTCwgdGNhc2VzW25dLnRw
YWdlcyAqIGhwc3osCj4+ICsJCQkJUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKPj4gKwkJCQlNQVBf
UFJJVkFURSB8IE1BUF9BTk9OWU1PVVMgfCBNQVBfSFVHRVRMQiwgLTEsIDApOwo+PiArCQlpZiAo
cHRyID09IE1BUF9GQUlMRUQpIHsKPj4gKwkJCWlmIChlcnJubyA9PSBFTk9NRU0pIHsKPj4gKwkJ
CQl0c3RfcmVzKFRDT05GLAo+PiArCQkJCQkiQ2Fubm90IGFsbG9jYXRlIGh1Z2VwYWdlLCBtZW1v
cnkgdG9vIGZyYWdtZW50ZWQ/Iik7Cj4+ICsJCQkJZ290byBvdXQ7Cj4+ICsJCQl9Cj4+ICsKPj4g
KwkJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJDYW5ub3QgYWxsb2NhdGUgaHVnZXBhZ2UiKTsK
Pj4gKwkJfQo+PiAgCj4+IC0JCXB0ciA9IFNBRkVfTU1BUChOVUxMLCB0Y2FzZXNbbl0udHBhZ2Vz
ICogaHBzeiwKPj4gLQkJCVBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4+IC0JCQlNQVBfUFJJVkFU
RSB8IE1BUF9BTk9OWU1PVVMgfCBNQVBfSFVHRVRMQiwgLTEsIDApOwo+PiAgCQlpZiAocHRyICE9
IGFkZHIpCj4+ICAJCQl0c3RfYnJrKFRCUk9LLCAiRmFpbGVkIHRvIG1tYXAgYXQgZGVzaXJlZCBh
ZGRyIik7Cj4+ICAKPj4gIAkJbWVtc2V0KGFkZHIsIDAsIHRjYXNlc1tuXS50cGFnZXMgKiBocHN6
KTsKPj4gIAo+PiAgCQlpZiAodGNhc2VzW25dLm9mZmxpbmUpIHsKPj4gLQkJCWlmIChkb19zb2Z0
X29mZmxpbmUodGNhc2VzW25dLnRwYWdlcykgPT0gRUlOVkFMKSB7Cj4+ICsJCQlyZXQgPSBkb19z
b2Z0X29mZmxpbmUodGNhc2VzW25dLnRwYWdlcyk7Cj4+ICsKPj4gKwkJCWlmIChyZXQgPT0gRUlO
VkFMKSB7Cj4+ICAJCQkJU0FGRV9LSUxMKGNwaWQsIFNJR0tJTEwpOwo+PiAgCQkJCVNBRkVfV0FJ
VFBJRChjcGlkLCAmc3RhdHVzLCAwKTsKPj4gIAkJCQlTQUZFX01VTk1BUChhZGRyLCB0Y2FzZXNb
bl0udHBhZ2VzICogaHBzeik7Cj4+ICAJCQkJdHN0X3JlcyhUQ09ORiwKPj4gIAkJCQkJIm1hZHZp
c2UoKSBkaWRuJ3Qgc3VwcG9ydCBNQURWX1NPRlRfT0ZGTElORSIpOwo+PiAgCQkJCXJldHVybjsK
Pj4gKwkJCX0gZWxzZSBpZiAocmV0ID09IEVCVVNZKSB7Cj4+ICsJCQkJU0FGRV9NVU5NQVAoYWRk
ciwgdGNhc2VzW25dLnRwYWdlcyAqIGhwc3opOwo+PiArCQkJCWdvdG8gb3V0Owo+PiAgCQkJfQo+
PiAgCQl9Cj4+ICAKPj4gQEAgLTE2Myw5ICsxNzcsMTAgQEAgc3RhdGljIHZvaWQgZG9fdGVzdCh1
bnNpZ25lZCBpbnQgbikKPj4gIAkJCWJyZWFrOwo+PiAgCX0KPj4gIAo+PiArb3V0Ogo+PiAgCVNB
RkVfS0lMTChjcGlkLCBTSUdLSUxMKTsKPj4gIAlTQUZFX1dBSVRQSUQoY3BpZCwgJnN0YXR1cywg
MCk7Cj4+IC0JaWYgKCFXSUZFWElURUQoc3RhdHVzKSkKPj4gKwlpZiAoIVdJRkVYSVRFRChzdGF0
dXMpICYmIHB0ciAhPSBNQVBfRkFJTEVEKQo+PiAgCQl0c3RfcmVzKFRQQVNTLCAiQnVnIG5vdCBy
ZXByb2R1Y2VkIik7Cj4+ICB9Cj4+ICAKPj4gLS0gCj4+IDIuMjAuMQo+Pgo+Pgo+Cj4gLgo+CgoK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
