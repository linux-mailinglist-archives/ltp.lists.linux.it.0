Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD318783D
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 04:38:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 365AD3C569E
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 04:38:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9E5F13C07CF
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 04:38:19 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 827FE600D79
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 04:38:11 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86442723"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 11:38:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 47D9C50A9986;
 Tue, 17 Mar 2020 11:28:03 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 11:38:04 +0800
To: Enji Cooper <yaneurabeya@gmail.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
 <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
 <7017e8bc-616b-0958-b82e-852604c06a3b@cn.fujitsu.com>
 <F8D00AA0-47E2-4636-9A07-77B474C47003@gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <3cb1b045-415c-ba13-a209-5c84ba739f19@cn.fujitsu.com>
Date: Tue, 17 Mar 2020 11:38:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <F8D00AA0-47E2-4636-9A07-77B474C47003@gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 47D9C50A9986.AE82C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pthread_cond_init/s-c.c: Add the lose ifndef line
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
Cc: Zou Wei <zou_wei@huawei.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgRW5qaQoKCj4gSGkgWWFuZywKPiAJSeKAmWxsIGhhdmUgdG8gbG9vayBiYWNrLCBidXQgdGhp
cyBtaWdodCBoYXZlIGJlZW4gdGhlIG9yaWdpbmFsIHNldCBvZiBpdGVtcyB3aGljaCBuZXZlciBj
b21waWxlZC9idWlsdCBjbGVhbmx5LgpJIGd1ZXNzIGNvbW1pdCBiZWM4MGQ4OTFhICgiRml4IG92
ZXJzaWdodCB3aXRoIGB0ZXN0IHRvb2xzJyIpIGNoYW5nZWQgCnRoaXMsIGFzIGJlbG93OgoKLS0t
IGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvbG9jYXRlLXRlc3QKKysr
IGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvbG9jYXRlLXRlc3QKLi4u
Ci0gICAgICAgZmluZCAiJFdIRVJFIiAtdHlwZSBmIC1uYW1lICcqLmMnIC1vIC1uYW1lICdbMC05
XSotWzAtOV0qLnNoJyB8IApncmVwIC12IGJ1aWxkb25seSB8IGdyZXAgLXYgJ14uL3Rvb2xzJyB8
IGdyZXAgLXYgdGVzdGZybXcgfCBncmVwIC12IAonX3NjZW5hcmlpJworICAgICAgIGZpbmQgIiRX
SEVSRSIgLXR5cGUgZiAtbmFtZSAnKlswLTldLmMnIC1vIC1uYW1lIAonWzAtOV0qLVswLTldKi5z
aCcgfCBncmVwIC12IGJ1aWxkb25seSB8IGdyZXAgLXYgJ14uL3Rvb2xzJwoKPiAJSSB0aGluayBp
dOKAmXMgdGltZSB0byBnbyBiYWNrIHRvIGEgbW9yZSBzYW5lIGdtYWtlLWJhc2VkIGJ1aWxkIGZy
YW1ld29yay4gTXkgZ29hbCBpbiBtYWtpbmcgdGhpbmdzIHdvcmsgd2l0aCBQT1NJWCBtYWtlIHdh
cyBub2JsZSBmb3IgdGhlIHRpbWUgYnV0IGl0IHNlZW1zIGluY3JlZGlibHkgdW5uZWNlc3Nhcnkg
bm93IGFuZCBJIHRoaW5rIGl04oCZcyBvdmVyY29tcGxpY2F0aW5nIHRoaW5ncy4KWWVzLiBXZSBz
aG91bGQgcmVmYWN0b3IgdGhpcyB3aXRoIHVzaW5nIGdtYWtlLCBhdCBsZWFzZSB3ZSBzaG91bGQg
CmNvbXBpbGUgdGhlbSBhdXRvbWF0aWNhbGx5LgoKQmVzdCBSZWdhcmRzCllhbmcgWHUKPiBUaGFu
a3MhCj4gLUVuamkKPiAKPj4gT24gTWFyIDE2LCAyMDIwLCBhdCAxMjo1MyBBTSwgWWFuZyBYdSA8
eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIEN5cmlsCj4+Cj4+
IE9uIG15IGVudmlyb25tZW50LCB3aGVuIEkgdGVzdCBvcGVucG9zaXgsIHRoaXMgY2FzZSBtaXNz
ZWQgcnVuIGFuZCBjb21wbGllIGJlY2F1c2UgbG9jYXRlLXRlc3QgaGFzIGZpbHRlciBydWxlcyBj
YWxsZWQgYnkgb3Blbl9wb3NpeF90ZXN0c3VpdGUvc2NyaXB0cy9nZW5lcmF0ZS1tYWtlZmlsZXMu
c2guICBmaWx0ZXIgcnVsZXMgYXMgYmVsb3c6Cj4+Cj4+IHJ1bm5hYmxlKQo+PiAgICAgICAgIGZp
bmQgIiRXSEVSRS9jb25mb3JtYW5jZSIgIiRXSEVSRS9zdHJlc3MiIC10eXBlIGYgLW5hbWUgJypb
MC05XS5jJyAtbyAtbmFtZSAnWzAtOV0qLVswLTldKi5zaCcgfCBncmVwIC12IGJ1aWxkb25seSB8
IGdyZXAgLXYgJ14uL3Rvb2xzJwo+PiAgICAgICAgIGZpbmQgIiRXSEVSRS9mdW5jdGlvbmFsIiAt
dHlwZSBmIC1uYW1lICcqLmMnCj4+Cj4+IEkgaGF2ZSBhIHF1ZXN0aW9uIHdoeSB3ZSBsZWF2ZSBp
dCBoZXJlIGlmIHRoZXkgYXJlIG5vIG1lYW5pbmdmdWwuIElmCj4+IGl0IHdhcyBtZWFuaW5nZnVs
LCB3aHkgd2UgZmlsdGVyIHRoaXMgY2FzZT8gSSBzZWUgdGhlIGhpc3RvcnksIGJ1dCBmb3VuZCBu
byB0aGluZy4KPj4KPj4gQEVuamksIHlvdSBvZnRlbiBjaGFuZ2Ugb3BlbnBvc2l4IGNvZGUsIGNh
biB5b3UgZ2l2ZSBtZSBzb21lIGFkdmlzZT8KPj4KPj4gQmVzdCBSZWdhcmRzCj4+IFlhbmcgWHUK
Pj4KPj4+IEhpIFpvdQo+Pj4gSXQgd2FzIGludHJvZHVjZWQgYnkgY29tbWl0IDMxMGM5ZWI2ZTYo
IlJlbW92ZSBleHBsaWNpdCAjZGVmaW5lJ3MgZm9yIGBfUE9TSVhfQ19TT1VSQ0VgIGFuZCBgX1hP
UEVOX1NPVVJDRWAiKS4KPj4+IElNTywgd2UgY2FuIHJlbW92ZSB0aGlzIFdJVEhPVVRfWE9QRU4g
bWFjcm8gZGlyZWN0bHkgYmVjYXVzZSB3ZSBoYXZlIHNldHRlZCAtRF9QT1NJWF9DX1NPVVJDRT0y
MDA4MDlMIC1EX1hPUEVOX1NPVVJDRT03MDAgaW4gbHRwL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rl
c3RzdWl0ZS9DRkxBR1MuCj4+PiBCZXN0IFJlZ2FyZHMKPj4+IFlhbmcgWHUKPj4+PiBwdGhyZWFk
X2NvbmRfaW5pdC9zLWMuYyB0ZXN0Y2FzZSBsb3NlIGEgI2lmbmRlZiBsaW5lLCBmaXggaXQKPj4+
Pgo+Pj4+IFJlcG9ydGVkLWJ5OiBab3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogWm91IFdlaSA8em91X3dlaUBodWF3ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+ICAg
dGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJlYWRfY29u
ZF9pbml0L3MtYy5jIHwgMSArCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0
cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3MtYy5jIGIvdGVzdGNhc2VzL29wZW5fcG9z
aXhfdGVzdHN1aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3MtYy5jCj4+Pj4g
aW5kZXggNmE1YzcwYS4uOGQxODQ4NCAxMDA2NDQKPj4+PiAtLS0gYS90ZXN0Y2FzZXMvb3Blbl9w
b3NpeF90ZXN0c3VpdGUvc3RyZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1jLmMKPj4+
PiArKysgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc3RyZXNzL3RocmVhZHMvcHRo
cmVhZF9jb25kX2luaXQvcy1jLmMKPj4+PiBAQCAtODAsNiArODAsNyBAQAo+Pj4+ICAgIC8qKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiAgICBUZXN0IGNhc2UgICAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KPj4+PiAgIC8qKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKi8KPj4+PiArI2lmbmRlZiBXSVRIT1VUX1hPUEVOCj4+Pj4gICAg
dHlwZWRlZiBzdHJ1Y3QgX3Rlc3RzdHJ1Y3Qgewo+Pj4+ICAgICAgICBwdGhyZWFkX2NvbmRfdCBj
bmRbMTAgKiBTQ0FMQUJJTElUWV9GQUNUT1JdOwo+Pj4+ICAgICAgICBwdGhyZWFkX2NvbmRhdHRy
X3QgY2FbNF07Cj4+Pj4gLS0gCj4+Pj4gMi42LjIKPj4+Pgo+Pj4+Cj4+Cj4+Cj4gCj4gCj4gCgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
