Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B51B3C91
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:07:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC62C3C297B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:07:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8785C3C2963
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:06:59 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 291A41000BDD
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:06:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,413,1580745600"; d="scan'208";a="89467303"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 18:06:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0598D46B5FA0;
 Wed, 22 Apr 2020 17:56:13 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 18:06:48 +0800
To: Li Wang <liwang@redhat.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
 <CAEemH2dj8vdicU76ewAAECgrEmVaEGN5uMZ4EmnzUa1v+Ez9Ng@mail.gmail.com>
 <53bb4ba1-0e68-4abb-39fd-9e661ed38754@cn.fujitsu.com>
 <1f29b873-b256-b475-87c5-83378017aa39@cn.fujitsu.com>
 <20f5e406-f430-79ba-f911-015247e73d0d@cn.fujitsu.com>
 <CAEemH2d6ObRfR12xvfpmE9KtTakobzvt6_md=Xrmd_rbKB7oAA@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1b0c1082-37a2-0e9c-5175-cdee950cdc47@cn.fujitsu.com>
Date: Wed, 22 Apr 2020 18:06:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2d6ObRfR12xvfpmE9KtTakobzvt6_md=Xrmd_rbKB7oAA@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0598D46B5FA0.A0222
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

SGkgTGkKCuWcqCAyMDIwLzA0LzIyIDE4OjA1LCBMaSBXYW5nIOWGmemBkzoKPiAKPiAKPiBPbiBX
ZWQsIEFwciAyMiwgMjAyMCBhdCA1OjMxIFBNIFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVq
aXRzdS5jb20gCj4gPG1haWx0bzp4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPj4gd3JvdGU6
Cj4gCj4gICAgIC4uLgo+ICAgICAgPj4+IEkgdGhpbmsgSSBnb3QgdGhlIHBvaW50Lgo+ICAgICAg
Pj4+Cj4gICAgICA+Pj4gSW4geW91ciB0ZXN0IGNvZGUgZm9yIHBpcGUyKCksIHlvdSBkaWRuJ3Qg
dXNlIHBpcGUgaW4gdGhlIGNvcnJlY3QKPiAgICAgID4+PiB3YXkuIEV2ZW4gdGhhdCB3ZSBkZWZp
bmUgdGhlIGZkc1syXSBhcyBhIGdsb2JhbMKgdmFyaWFibGUsIHRoZXJlCj4gICAgIHN0aWxsCj4g
ICAgICA+Pj4gaGF2ZSBhIG5ldyBjb3B5IGZvciBmZHNbMl0gaW4gdGhlIGNoaWxkIHByb2Nlc3Ms
IHdlIHNob3VsZAo+ICAgICBjbG9zZSBvbmUKPiAgICAgID4+PiBvZiB0aGUgcGlwZXMgaW4gY2hp
bGQgYW5kIHBhcmVudCB0byBtYWtlIHRoZSBjb25uZWN0aW9uIGlzIGJ1aWx0Cj4gICAgICA+Pj4g
Y29ycmVzcG9uZGluZ2x5LCB0aGVuIHRoYXQgd2lsbCB3b3JrIG5vcm1hbGx5IGZvciB1cy4KPiAg
ICAgID4+Pgo+ICAgICAgPj4+IEkgc3VnZ2VzdCByZWRlc2lnbmluZyBzb21lIG9mIHRoZSB0ZXN0
IHN0cnVjdHMuIFdoYXQgZG8geW91IHRoaW5rPwo+ICAgICAgPj4gWWVzLgo+ICAgICAgPj4+Cj4g
ICAgICA+Pj4gRnlpOgo+ICAgICAgPj4+Cj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10
ZXN0LXByb2plY3QvbHRwL2Jsb2IvbWFzdGVyL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlw
ZS9waXBlMDIuYwo+IAo+ICAgICAgPgo+ICAgICAgPiBCVFcsIHBpcGUwMi5jIGNhbiB1c2UgU0FG
RV9QSVBFIG1hY3JvIGFuZCByZW1vdmXCoCBVQ0xJTlVYIGlmZGVmLgo+ICAgICAgPj4+Cj4gICAg
ICA+PiBJbiBwcmluY2lwbGUsIHdlIHNob3VsZCB1c2UgdGhlIGZvbGxvd2luZyBmb3JtYXQKPiAg
ICAgID4+IHN0ZXAxwqDCoMKgwqDCoCBwaXBlKGZkcyk7Cj4gICAgICA+PiBzdGVwMsKgwqDCoMKg
wqAgU0FGRV9GT1JLKCk7Cj4gICAgICA+PiDCoMKgwqDCoMKgwqAgY2hpbGQgcHJvY2Vzcwo+ICAg
ICAgPj4gc3RlcDPCoMKgwqDCoMKgwqDCoMKgIGNsb3NlIG9uZSBmZCBhbmQgZG8gc29tZXRoaW5n
Cj4gICAgICA+PiDCoMKgwqDCoMKgwqAgcGFyZW50IHByb2Nlc3MKPiAgICAgID4+IHN0ZXA0wqDC
oMKgwqDCoMKgwqDCoCBjbG9zZSBhbm90aGVyIGZkIGFuZCBkbyBzb21ldGhpbmcKPiAgICAgID4+
Cj4gICAgICA+PiBBbHNvLCB3ZSBzaG91bGQgbm90IGRvIHdyaXRlIG9wZWFydGlvbiBpbiBzdGVw
IDF+Miwgb3RoZXJ3aXNlIGNoaWxkCj4gICAgICA+PiBwcm9jZXNzIHdpbGwgaW5oZXJpdCBkYXRh
Lgo+ICAgICBtb2RpZnkgdGhpcyBjYXNlICx1cmwgYXMgYmVsb3c6Cj4gICAgIGh0dHBzOi8vZ2l0
aHViLmNvbS94dXlhbmcwNDEwL2x0cC9jb21taXQvNmU3MDE4MDNiMzkxMjNiNWFiZjc0YmQyOTJj
MzZmZWU3M2I1NDA2NQo+IAo+ICAgICBIb3cgYWJvdXQgaXTvvJ8KPiAKPiAKPiBJIGxlYXZlIGNv
bW1lbnTCoGluIHlvdXIgcGF0Y2ggaW7CoGdpdGh1Yi4gVGhhbmtzIGZvciB0aGUgcXVpY2sgZml4
LCB0aGUgCj4gcmVzdCBMR1RNLgo+IAo+IENhbiB5b3UgcmViYXNlIHRoZSBjb2RlIG9uIHRoZSBs
YXRlc3QgbWFzdGVyIGFuZCBmb3JtYXQgVjQgcGF0Y2ggdG8gTUw/Ck9LLiBJIHdpbGwgc2VuZCBh
IHY0IGFib3V0IHRoaXMgcGF0Y2hzZXQuCj4gCj4gLS0gCj4gUmVnYXJkcywKPiBMaSBXYW5nCgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
