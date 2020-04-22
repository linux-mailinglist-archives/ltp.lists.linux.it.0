Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 747CC1B3B5F
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 11:31:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 406123C6233
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 11:31:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id AED2E3C00C0
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 11:31:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 685E91000B4E
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 11:31:27 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,413,1580745600"; d="scan'208";a="89457350"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 17:31:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 9B72F46B5FA5;
 Wed, 22 Apr 2020 17:20:44 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 17:31:18 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Li Wang <liwang@redhat.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
 <CAEemH2dj8vdicU76ewAAECgrEmVaEGN5uMZ4EmnzUa1v+Ez9Ng@mail.gmail.com>
 <53bb4ba1-0e68-4abb-39fd-9e661ed38754@cn.fujitsu.com>
 <1f29b873-b256-b475-87c5-83378017aa39@cn.fujitsu.com>
Message-ID: <20f5e406-f430-79ba-f911-015247e73d0d@cn.fujitsu.com>
Date: Wed, 22 Apr 2020 17:31:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1f29b873-b256-b475-87c5-83378017aa39@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9B72F46B5FA5.AEF93
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

SGkgTGkKCgo+IEhpIExpCj4gCj4gCj4+IEhpIExpCj4+Cj4+PiBIaSBYdSwKPj4+Cj4+PiBZYW5n
IFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tIAo+Pj4gPG1haWx0bzp4dXlhbmcyMDE4
Lmp5QGNuLmZ1aml0c3UuY29tPj4gd3JvdGU6Cj4+Pgo+Pj4gwqDCoMKgIC4uLgo+Pj4gwqDCoMKg
wqAgPgo+Pj4gwqDCoMKgwqAgPiAjIC4vcGlwZTJfMDMKPj4+IMKgwqDCoMKgID4gdHN0X3Rlc3Qu
YzoxMjQ2OiBJTkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDVtIDAwcwo+Pj4gwqDCoMKgwqAg
PiBwaXBlMl8wMy5jOjQ4OiBQQVNTOiBFYWNoIHdyaXRlKDIpIHVzZXMgYSBzZXBhcmF0ZSBwYWNr
ZXQKPj4+IMKgwqDCoMKgID4gcGlwZTJfMDMuYzo2MTogUEFTUzogRWFjaCByZWFkKDIpIHJlYWRz
IGEgc2VwYXJhdGUgcGFja2V0Cj4+PiDCoMKgwqDCoCA+IHBpcGUyXzAzLmM6ODE6IFBBU1M6IHdy
aXRlKGhpZ25lciB0aGFuIFBJUEVfQlVGKSBzcGxpdCBpbnRvCj4+PiDCoMKgwqAgbXVsdGlwbGUg
cGFja2V0Cj4+PiDCoMKgwqDCoCA+IHBpcGUyXzAzLmM6MTA4OiBGQUlMOiB0aGUgZXhjZXNzIGJ5
dGVzIGluIHRoZSBwYWNrZXQgaXMgCj4+PiBkaXNjYXJkZWQgYnkKPj4+IMKgwqDCoMKgID4gcmVh
ZCwgZXhwZWN0IDEgZ290IDElQQo+Pj4gwqDCoMKgIEV2ZW4gSSB1c2Ugb25lIGZvcmsgYW5kIGV4
aXQoMCksIEkgZG9uJ3QgbWVldCB0aGlzIHByb2JsZW0uIE9yLCBJIAo+Pj4gbWlzcwo+Pj4gwqDC
oMKgIHNvbWV0aGluZz8KPj4+Cj4+Pgo+Pj4gSSB0aGluayBJIGdvdCB0aGUgcG9pbnQuCj4+Pgo+
Pj4gSW4geW91ciB0ZXN0IGNvZGUgZm9yIHBpcGUyKCksIHlvdSBkaWRuJ3QgdXNlIHBpcGUgaW4g
dGhlIGNvcnJlY3QgCj4+PiB3YXkuIEV2ZW4gdGhhdCB3ZSBkZWZpbmUgdGhlIGZkc1syXSBhcyBh
IGdsb2JhbMKgdmFyaWFibGUsIHRoZXJlIHN0aWxsIAo+Pj4gaGF2ZSBhIG5ldyBjb3B5IGZvciBm
ZHNbMl0gaW4gdGhlIGNoaWxkIHByb2Nlc3MsIHdlIHNob3VsZCBjbG9zZSBvbmUgCj4+PiBvZiB0
aGUgcGlwZXMgaW4gY2hpbGQgYW5kIHBhcmVudCB0byBtYWtlIHRoZSBjb25uZWN0aW9uIGlzIGJ1
aWx0IAo+Pj4gY29ycmVzcG9uZGluZ2x5LCB0aGVuIHRoYXQgd2lsbCB3b3JrIG5vcm1hbGx5IGZv
ciB1cy4KPj4+Cj4+PiBJIHN1Z2dlc3QgcmVkZXNpZ25pbmcgc29tZSBvZiB0aGUgdGVzdCBzdHJ1
Y3RzLiBXaGF0IGRvIHlvdSB0aGluaz8KPj4gWWVzLgo+Pj4KPj4+IEZ5aTogCj4+PiBodHRwczov
L2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3BpcGUvcGlwZTAyLmMgCj4gCj4gQlRXLCBwaXBlMDIuYyBjYW4gdXNl
IFNBRkVfUElQRSBtYWNybyBhbmQgcmVtb3ZlwqAgVUNMSU5VWCBpZmRlZi4KPj4+Cj4+IEluIHBy
aW5jaXBsZSwgd2Ugc2hvdWxkIHVzZSB0aGUgZm9sbG93aW5nIGZvcm1hdAo+PiBzdGVwMcKgwqDC
oMKgwqAgcGlwZShmZHMpOwo+PiBzdGVwMsKgwqDCoMKgwqAgU0FGRV9GT1JLKCk7Cj4+IMKgwqDC
oMKgwqDCoCBjaGlsZCBwcm9jZXNzCj4+IHN0ZXAzwqDCoMKgwqDCoMKgwqDCoCBjbG9zZSBvbmUg
ZmQgYW5kIGRvIHNvbWV0aGluZwo+PiDCoMKgwqDCoMKgwqAgcGFyZW50IHByb2Nlc3MKPj4gc3Rl
cDTCoMKgwqDCoMKgwqDCoMKgIGNsb3NlIGFub3RoZXIgZmQgYW5kIGRvIHNvbWV0aGluZwo+Pgo+
PiBBbHNvLCB3ZSBzaG91bGQgbm90IGRvIHdyaXRlIG9wZWFydGlvbiBpbiBzdGVwIDF+Miwgb3Ro
ZXJ3aXNlIGNoaWxkIAo+PiBwcm9jZXNzIHdpbGwgaW5oZXJpdCBkYXRhLgptb2RpZnkgdGhpcyBj
YXNlICx1cmwgYXMgYmVsb3c6Cmh0dHBzOi8vZ2l0aHViLmNvbS94dXlhbmcwNDEwL2x0cC9jb21t
aXQvNmU3MDE4MDNiMzkxMjNiNWFiZjc0YmQyOTJjMzZmZWU3M2I1NDA2NQoKSG93IGFib3V0IGl0
77yfCgpwczogSSBtZWV0IGEgcHJvYmxlbSB0aGF0IHN0cmluZyB3aXRob3V0IHRoZSB0cmFpbGlu
ZyBzdHJpbmcgemVybyAKdGVybWluYXRvciwgc28gSSB3YW50IHRvIHVzZSBtZW1jbXAgb3Igc3Ry
bmNtcC4KPj4+Cj4+PiAtLSAKPj4+IFJlZ2FyZHMsCj4+PiBMaSBXYW5nCj4+Cj4+Cj4+CgoKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
