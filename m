Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC428E248
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 16:35:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A54FD3C5808
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 16:35:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 995353C268D
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 16:35:44 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C1E70100135A
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 16:35:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,374,1596470400"; d="scan'208";a="100160936"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 22:35:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2620048990FB;
 Wed, 14 Oct 2020 22:35:35 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 22:35:34 +0800
Message-ID: <5F870CAC.4050404@cn.fujitsu.com>
Date: Wed, 14 Oct 2020 22:35:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Martin Doucha <mdoucha@suse.cz>
References: <20200828151747.21445-1-mdoucha@suse.cz>
 <20200903155030.GA23664@dell5510> <5F84042B.9000505@cn.fujitsu.com>
 <bdafce94-0c61-bee5-d8cb-5f6fe638bd89@suse.cz>
In-Reply-To: <bdafce94-0c61-bee5-d8cb-5f6fe638bd89@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2620048990FB.A940E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for send(MSG_MORE)
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

SGkgTWFydGluCj4gT24gMTIuIDEwLiAyMCA5OjIyLCBZYW5nIFh1IHdyb3RlOgo+PiBJIHRlc3Qg
dGhpcyBjYXNlIG9uIGNlbnRvczguMiwgaXQgZmFpbGVkLCBidXQgaXQgcGFzc2VkIG9uIGNlbnRv
czcuOCBhbmQKPj4gZmVkb3JhMzEuIE9uIHVwc3RyZWFtIGtlcm5lbCAoNS45LXJjNyssY29tbWl0
IDZmMmY0ODZkNTdjNCx1c2luZyBrdm0sNEcKPj4gbWVtb3J5LDIgY3B1cyksIGl0IGFsc28gZmFp
bGVkLiBJIGRvbid0IGtub3cgd2hldGhlciBpdCBoYXMgc29tZSBrZXJuZWwKPj4gcGFyYW1ldGVy
cyBvciBrY29uZmlnIHRvIGFmZmVjdCB0aGlzLiBJdCBzZWVtcyBub3QgYSBrZXJuZWwgYnVnIGFu
ZCBsaWtlCj4+IGEgZW52aXJvbm1lbnQgYnVnKEkgZ3Vlc3MpLgo+Pgo+PiB0c3RfdGVzdC5jOjEy
NTA6IFRJTkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDVtIDAwcwo+PiBzZW5kMDIuYzo4Njog
VEZBSUw6IHJlY3YoKSBlcnJvcjogRUFHQUlOL0VXT1VMREJMT0NLICgxMSkKPj4gc2VuZDAyLmM6
ODY6IFRGQUlMOiByZWN2KCkgZXJyb3I6IEVBR0FJTi9FV09VTERCTE9DSyAoMTEpCj4+IHNlbmQw
Mi5jOjg2OiBURkFJTDogcmVjdigpIGVycm9yOiBFQUdBSU4vRVdPVUxEQkxPQ0sgKDExKQo+PiBz
ZW5kMDIuYzo4NjogVEZBSUw6IHJlY3YoKSBlcnJvcjogRUFHQUlOL0VXT1VMREJMT0NLICgxMSkK
PiBXZSBoYXZlIHNvbWUgc2ltaWxhciBmYWlsdXJlcyBvbiBvbGQgczM5MCBrZXJuZWxzICh2NC40
KS4gSSBjYW4ndAo+IHJlcHJvZHVjZSBhbnkgZmFpbHVyZXMgYXQgYWxsIG9uIG91ciA0LjEyIGFu
ZCA1LjMga2VybmVscy4KSSB0cnkgNS43LDUuOCBhbmQgbGFzdGVzdCB1cHN0cmVhbSwgaXQgYWxs
IGZhaWxlZC4gSSBkaWRuJ3QgZmlndXJlIG91dCAKdGhlIHJlYXNvbi4KPiBDYW4geW91IGFkZCBz
b21lIGRlYnVnIHByaW50cyBhbmQgY2hlY2sgd2hldGhlciBpdCBmYWlscyBvbiB0aGUgZmlyc3QK
PiBpdGVyYXRpb24gb3IgYWZ0ZXIgYSBmZXcgc3VjY2Vzc2Z1bCBsb29wcz8KSXQgZmFpbHMgYWZ0
ZXIgYSBmZXcgc3VjY2Vzc2Z1bCBsb29wcyBpbiBpbnRlcm5hbChub3QgdXNpbmcgLWkgCnBhcmFt
ZXRlcnMpLCBhbmQgd2hlbiBJIGxvd2VyCnRoZSBsb29wcyBpbnRvIDEwMCwgdGNwIGFuZCB1ZHAg
KHVzaW5nIHNlbmQpIG1heSBzdWNjZWVkCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
c2VuZC9zZW5kMDIuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3NlbmQvc2VuZDAy
LmMKQEAgLTEyOSw3ICsxMjksNyBAQCBzdGF0aWMgdm9pZCBydW4odW5zaWduZWQgaW50IG4pCiAg
ICAgICAgIGlmICh0Yy0+bmVlZHNfYWNjZXB0KQogICAgICAgICAgICAgICAgIFNBRkVfTElTVEVO
KGxpc3Rlbl9zb2NrLCAxKTsKCi0gICAgICAgZm9yIChpID0gMDsgaSA8IDEwMDA7IGkrKykgewor
ICAgICAgIGZvciAoaSA9IDA7IGkgPCAxMDA7IGkrKykgewoKLi9zZW5kMDIKdHN0X3Rlc3QuYzox
MjUwOiBUSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHMKc2VuZDAyLmM6MTY2OiBU
UEFTUzogVENQIHNlbmQoTVNHX01PUkUpIHdvcmtzIGNvcnJlY3RseQpzZW5kMDIuYzoxNjY6IFRQ
QVNTOiBVRFAgc2VuZChNU0dfTU9SRSkgd29ya3MgY29ycmVjdGx5CnNlbmQwMi5jOjg2OiBURkFJ
TDogcmVjdigpIGVycm9yOiBFQUdBSU4vRVdPVUxEQkxPQ0sgKDExKQpzZW5kMDIuYzo4NjogVEZB
SUw6IHJlY3YoKSBlcnJvcjogRUFHQUlOL0VXT1VMREJMT0NLICgxMSkKCgo+ICAgQWxzbywgZG8g
eW91IGhhdmUgYW55IHRlc3QKPiBydW5zIHdoZXJlIHRoZSBUQ1AgdGVzdCBjYXNlIHN1Y2NlZWRl
ZD8KPgpZZXMsIHRjcCB0ZXN0IHNvbWV0aW1lcyBzdWNjZWVkZWQuCgpwczogSSB0aGluayB3ZSBj
YW4gc2VuZCBhIHBhdGNoIHRvICBwcmludCBtb3JlIG91dHB1dCBpbiB0aGlzIGNhc2UsIHNvIAp3
ZSBrbm93IHdoaWNoIGNhc2UgZmFpbHModGNwLHVkcCwgc2VuZO+8jG9yIHNlbmR0bywgc2VuZG1z
ZwopLgoKQmVzdCBSZWdhcmRzCllhbmcgWHUKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
