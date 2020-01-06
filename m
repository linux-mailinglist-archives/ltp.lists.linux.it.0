Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16338130F39
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:10:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8460A3C24AB
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:10:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AFDDE3C2460
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:10:20 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 86CC22010F7
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:10:17 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; d="scan'208";a="81372785"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:10:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 757D1406AB15;
 Mon,  6 Jan 2020 17:01:11 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:10:10 +0800
To: Li Wang <liwang@redhat.com>
References: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eKbbXjonuiKMdHcRda98hJikmGW4=YtWft0-1QAj0oBQ@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <8a1a9b95-5c42-2176-857a-e3c36fa42b55@cn.fujitsu.com>
Date: Mon, 6 Jan 2020 17:10:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2eKbbXjonuiKMdHcRda98hJikmGW4=YtWft0-1QAj0oBQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 757D1406AB15.AAA3A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/userfaultfd01: add hint about
 unprivileged_userfaultfd
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

SGkgTGkKPiAKPiAKPiBPbiBXZWQsIERlYyAxOCwgMjAxOSBhdCAxMjowMiBQTSBZYW5nIFh1IDx4
dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tIAo+IDxtYWlsdG86eHV5YW5nMjAxOC5qeUBjbi5m
dWppdHN1LmNvbT4+IHdyb3RlOgo+IAo+ICAgICBTaW5jZSBjb21taXQgY2VmZGNhMGE4NmJlICgi
dXNlcmZhdWx0ZmQvc3lzY3RsOiBhZGQKPiAgICAgdm0udW5wcml2aWxlZ2VkX3VzZXJmYXVsdGZk
IikuCj4gICAgICwgaXQgYWRkcyBhIGdsb2JhbCBzeXNjdGwga25vYiAidm0udW5wcml2aWxlZ2Vk
X3VzZXJmYXVsdGZkIiB0bwo+ICAgICBjb250cm9sIHdoZXRoZXIKPiAgICAgdW5wcml2aWxlZ2Vk
IHVzZXJzIGNhbiB1c2UgdGhlIHVzZXJmYXVsdGZkIHN5c3RlbSBjYWxscy4gU2V0IHRoaXMgdG8K
PiAgICAgMSB0byBhbGxvdwo+ICAgICB1bnByaXZpbGVnZWQgdXNlcnMgdG8gdXNlIHRoZSB1c2Vy
ZmF1bHRmZCBzeXN0ZW0gY2FsbHMsIG9yIHNldCB0aGlzCj4gICAgIHRvIDAgdG8KPiAgICAgcmVz
dHJpY3QgdXNlcmZhdWx0ZmQgdG8gb25seSBwcml2aWxlZ2VkIHVzZXJzICh3aXRoIFNZU19DQVBf
UFRSQUNFCj4gICAgIGNhcGFiaWxpdHkpLiBUaGUKPiAgICAgZGVmYXVsdCB2YWx1ZSBpcyAxLiBB
ZGQgaGludCBhYm91dCBpdC4KPiAKPiAKPiBDYW4gd2UgZG8gdGhlICJ2bS51bnByaXZpbGVnZWRf
dXNlcmZhdWx0ZmQiIGNoZWNrIGluIHRoZSBzZXR1cCgpIGFuZCBkbyAKPiBzZXQgdG8gMSBpZiBp
dCBleGlzdHM/CkkgcmVtZW1iZXJlZCBKYW4gU3RhbmNlayBoYXMgYSBwYXRjaCBhYm91dCBicGYg
aGludCBhYm91dCAKdW5wcml2aWxlZ2VkX2JwZl9kaXNhYmxlZCwgSSBkbyBhcyBzYW1lIGFzIHRo
YXQgcGF0Y2ggZGlkLgoKQWxzbywgbW9udGggYWdvcyBhYm91dCBhY2N0MDIgZGlzY3Vzc2lvbiwg
Q3lyaWwgcG9pbnRzIGFib3V0IGFkanVzdGluZwp0aGUgdGhyZXNob2xkIHZhbHVlIG9mIHJlc3Vt
ZSBhbmQgc3VwcGVuZCB0byBtYWtlIGNhc2UgcGFzc2VzLgoKU28sIEkgaGF2ZSBhIHF1ZXN0aW9u
IHRoYXQgd2UgaGF2ZSB1bmlmaWVkIHN0YW5kYXJkcyBhYm91dCB0aGVzZSBjYXNlcwooYnBmLCBh
Y2N0MDIsIGFmZmVjdGVkIGJ5IHN5c2N0bCk/IFJlcG9ydCBUQ09ORiBvciBtb2RpZnkgYXJndW1l
bnQgdG8KbWFrZSBjYXNlIHBhc3Nlcz8KCkBDeXJpbCBhbmQgQEphbiBTdGFuY2VrIFdoYXQgZG8g
eW91IHRoaW5rIGFib3V0IGl0PwoKPiBBbmQgbWF5YmXCoHdlIG5lZWQgbW9yZSB0ZXN0cyBmb3Ig
dGhlIGdsb2JhbCBzeXNjdGwga25vYiAKPiAidm0udW5wcml2aWxlZ2VkX3VzZXJmYXVsdGZkIi5F
ZXZlbiB0aG91Z2ggd2UgZG9uJ3QgaGF2ZSBjYXNlIHRvIHRlc3QgdW5wcml2aWxlZ2VkX2JwZl9k
aXNhYmxlZC4gSSAKc3RpbGwgdGhpbmsgdGVzdGluZyB1bnByaXZpbGVnZWRfdXNlcmZhdWx0ZmQg
aXMgbWVhbmluZ2Z1bCBhbmQgd2UgY2FuIApiZWdpbiB3aXRoIGl0LgoKQmVzdCBSZWdhcmRzCllh
bmcgWHUKPiAKPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBj
bi5mdWppdHN1LmNvbQo+ICAgICA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+
Pgo+ICAgICAtLS0KPiAgICAgIMKgLi4uL3N5c2NhbGxzL3VzZXJmYXVsdGZkL3VzZXJmYXVsdGZk
MDEuY8KgIMKgIMKgIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQo+ICAgICAgwqAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiAgICAgZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdXNlcmZhdWx0ZmQvdXNlcmZhdWx0ZmQwMS5j
Cj4gICAgIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy91c2VyZmF1bHRmZC91c2VyZmF1bHRm
ZDAxLmMKPiAgICAgaW5kZXggYTVlMTQyMjA5Li40ZTE3OGI0ZjggMTAwNjQ0Cj4gICAgIC0tLSBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdXNlcmZhdWx0ZmQvdXNlcmZhdWx0ZmQwMS5jCj4g
ICAgICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdXNlcmZhdWx0ZmQvdXNlcmZhdWx0
ZmQwMS5jCj4gICAgIEBAIC04MiwxMiArODIsMTkgQEAgc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4g
Cj4gICAgICDCoCDCoCDCoCDCoCBzZXRfcGFnZXMoKTsKPiAKPiAgICAgLcKgIMKgIMKgIMKgdWZm
ZCA9IHN5c191c2VyZmF1bHRmZChPX0NMT0VYRUMgfCBPX05PTkJMT0NLKTsKPiAgICAgLQo+ICAg
ICAtwqAgwqAgwqAgwqBpZiAodWZmZCA9PSAtMSkKPiAgICAgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdHN0X2JyayhUQlJPSyB8IFRFUlJOTywKPiAgICAgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIkNvdWxkIG5vdCBjcmVhdGUgdXNlcmZhdWx0IGZpbGUgZGVzY3JpcHRvciIp
Owo+ICAgICAtCj4gICAgICvCoCDCoCDCoCDCoFRFU1Qoc3lzX3VzZXJmYXVsdGZkKE9fQ0xPRVhF
QyB8IE9fTk9OQkxPQ0spKTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAoVFNUX1JFVCA9
PSAtMSkgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoVFNUX0VSUiA9PSBFUEVS
TSkgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfcmVzKFRD
T05GLCAiSGludDogY2hlY2sKPiAgICAgL3Byb2Mvc3lzL3ZtL3VucHJpdmlsZWdlZF91c2VyZmF1
bHRmZCIpOwo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfYnJr
KFRDT05GIHwgVFRFUlJOTywKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgInVzZXJmYXVsdGZkKCkgcmVxdWlyZXMKPiAgICAgQ0FQX1NZU19QVFJB
Q0Ugb24gdGhpcyBzeXN0ZW0iKTsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfSBlbHNl
Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9icmsoVEJST0sg
fCBUVEVSUk5PLAo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAiQ291bGQgbm90IGNyZWF0ZSB1c2VyZmF1bHQgZmlsZQo+ICAgICBkZXNjcmlwdG9y
Iik7Cj4gICAgICvCoCDCoCDCoCDCoH0KPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqB1ZmZkID0g
VFNUX1JFVDsKPiAgICAgIMKgIMKgIMKgIMKgIHVmZmRpb19hcGkuYXBpID0gVUZGRF9BUEk7Cj4g
ICAgICDCoCDCoCDCoCDCoCB1ZmZkaW9fYXBpLmZlYXR1cmVzID0gMDsKPiAgICAgIMKgIMKgIMKg
IMKgIFNBRkVfSU9DVEwodWZmZCwgVUZGRElPX0FQSSwgJnVmZmRpb19hcGkpOwo+ICAgICAtLSAK
PiAgICAgMi4xOC4wCj4gCj4gCj4gCj4gCj4gICAgIC0tIAo+ICAgICBNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKPiAKPiAKPiAKPiAtLSAKPiBS
ZWdhcmRzLAo+IExpIFdhbmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
