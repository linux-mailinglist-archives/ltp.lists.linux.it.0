Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB01B39BA
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 10:13:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 485D83C297D
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 10:13:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C5C033C295C
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:13:04 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 85D6D60086A
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:12:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,412,1580745600"; d="scan'208";a="89441729"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 16:12:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 211764BCC883;
 Wed, 22 Apr 2020 16:02:20 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 16:12:55 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Li Wang <liwang@redhat.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
 <CAEemH2dj8vdicU76ewAAECgrEmVaEGN5uMZ4EmnzUa1v+Ez9Ng@mail.gmail.com>
 <53bb4ba1-0e68-4abb-39fd-9e661ed38754@cn.fujitsu.com>
Message-ID: <1f29b873-b256-b475-87c5-83378017aa39@cn.fujitsu.com>
Date: Wed, 22 Apr 2020 16:12:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <53bb4ba1-0e68-4abb-39fd-9e661ed38754@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 211764BCC883.A9D41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

SGkgTGkKCgo+IEhpIExpCj4gCj4+IEhpIFh1LAo+Pgo+PiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5
QGNuLmZ1aml0c3UuY29tIAo+PiA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+
PiB3cm90ZToKPj4KPj4gwqDCoMKgIC4uLgo+PiDCoMKgwqDCoCA+Cj4+IMKgwqDCoMKgID4gIyAu
L3BpcGUyXzAzCj4+IMKgwqDCoMKgID4gdHN0X3Rlc3QuYzoxMjQ2OiBJTkZPOiBUaW1lb3V0IHBl
ciBydW4gaXMgMGggMDVtIDAwcwo+PiDCoMKgwqDCoCA+IHBpcGUyXzAzLmM6NDg6IFBBU1M6IEVh
Y2ggd3JpdGUoMikgdXNlcyBhIHNlcGFyYXRlIHBhY2tldAo+PiDCoMKgwqDCoCA+IHBpcGUyXzAz
LmM6NjE6IFBBU1M6IEVhY2ggcmVhZCgyKSByZWFkcyBhIHNlcGFyYXRlIHBhY2tldAo+PiDCoMKg
wqDCoCA+IHBpcGUyXzAzLmM6ODE6IFBBU1M6IHdyaXRlKGhpZ25lciB0aGFuIFBJUEVfQlVGKSBz
cGxpdCBpbnRvCj4+IMKgwqDCoCBtdWx0aXBsZSBwYWNrZXQKPj4gwqDCoMKgwqAgPiBwaXBlMl8w
My5jOjEwODogRkFJTDogdGhlIGV4Y2VzcyBieXRlcyBpbiB0aGUgcGFja2V0IGlzIAo+PiBkaXNj
YXJkZWQgYnkKPj4gwqDCoMKgwqAgPiByZWFkLCBleHBlY3QgMSBnb3QgMSVBCj4+IMKgwqDCoCBF
dmVuIEkgdXNlIG9uZSBmb3JrIGFuZCBleGl0KDApLCBJIGRvbid0IG1lZXQgdGhpcyBwcm9ibGVt
LiBPciwgSSAKPj4gbWlzcwo+PiDCoMKgwqAgc29tZXRoaW5nPwo+Pgo+Pgo+PiBJIHRoaW5rIEkg
Z290IHRoZSBwb2ludC4KPj4KPj4gSW4geW91ciB0ZXN0IGNvZGUgZm9yIHBpcGUyKCksIHlvdSBk
aWRuJ3QgdXNlIHBpcGUgaW4gdGhlIGNvcnJlY3Qgd2F5LiAKPj4gRXZlbiB0aGF0IHdlIGRlZmlu
ZSB0aGUgZmRzWzJdIGFzIGEgZ2xvYmFswqB2YXJpYWJsZSwgdGhlcmUgc3RpbGwgaGF2ZSAKPj4g
YSBuZXcgY29weSBmb3IgZmRzWzJdIGluIHRoZSBjaGlsZCBwcm9jZXNzLCB3ZSBzaG91bGQgY2xv
c2Ugb25lIG9mIHRoZSAKPj4gcGlwZXMgaW4gY2hpbGQgYW5kIHBhcmVudCB0byBtYWtlIHRoZSBj
b25uZWN0aW9uIGlzIGJ1aWx0IAo+PiBjb3JyZXNwb25kaW5nbHksIHRoZW4gdGhhdCB3aWxsIHdv
cmsgbm9ybWFsbHkgZm9yIHVzLgo+Pgo+PiBJIHN1Z2dlc3QgcmVkZXNpZ25pbmcgc29tZSBvZiB0
aGUgdGVzdCBzdHJ1Y3RzLiBXaGF0IGRvIHlvdSB0aGluaz8KPiBZZXMuCj4+Cj4+IEZ5aTogCj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL2Jsb2IvbWFzdGVyL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlwZS9waXBlMDIuYyAKQlRXLCBwaXBlMDIuYyBjYW4g
dXNlIFNBRkVfUElQRSBtYWNybyBhbmQgcmVtb3ZlICBVQ0xJTlVYIGlmZGVmLgo+Pgo+IEluIHBy
aW5jaXBsZSwgd2Ugc2hvdWxkIHVzZSB0aGUgZm9sbG93aW5nIGZvcm1hdAo+IHN0ZXAxwqDCoMKg
wqDCoCBwaXBlKGZkcyk7Cj4gc3RlcDLCoMKgwqDCoMKgIFNBRkVfRk9SSygpOwo+ICDCoMKgwqDC
oMKgIGNoaWxkIHByb2Nlc3MKPiBzdGVwM8KgwqDCoMKgwqDCoMKgwqAgY2xvc2Ugb25lIGZkIGFu
ZCBkbyBzb21ldGhpbmcKPiAgwqDCoMKgwqDCoCBwYXJlbnQgcHJvY2Vzcwo+IHN0ZXA0wqDCoMKg
wqDCoMKgwqDCoCBjbG9zZSBhbm90aGVyIGZkIGFuZCBkbyBzb21ldGhpbmcKPiAKPiBBbHNvLCB3
ZSBzaG91bGQgbm90IGRvIHdyaXRlIG9wZWFydGlvbiBpbiBzdGVwIDF+Miwgb3RoZXJ3aXNlIGNo
aWxkIAo+IHByb2Nlc3Mgd2lsbCBpbmhlcml0IGRhdGEuCj4+Cj4+IC0tIAo+PiBSZWdhcmRzLAo+
PiBMaSBXYW5nCj4gCj4gCj4gCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
