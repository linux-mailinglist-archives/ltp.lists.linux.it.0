Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB771877B0
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 03:08:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FF343C56A1
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 03:08:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 73BDD3C14F2
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 03:08:17 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 19FDB60078D
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 03:08:14 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86437132"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 10:08:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 14297406AB15;
 Tue, 17 Mar 2020 09:58:03 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 10:08:02 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Zou Wei <zou_wei@huawei.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
 <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
Message-ID: <b9c6b8c9-987b-fc71-4a5c-0844ea63d7ff@cn.fujitsu.com>
Date: Tue, 17 Mar 2020 10:08:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 14297406AB15.ABA21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWm91CgpFdmVuIHRoaXMgY2FzZSBkb2VzJ3QgY29tcGlsZSBvciBydW4gb24gbHRwIGRlZmF1
bHQgZW52cmlvbm1lbnQsIEkgdGhpbmsgCml0IGlzIGEgZnJhbWV3b3JrIHByb2JsZW0gYWJvdXQg
bHRwIG9wZW5wb3NpeC4gVGhpcyBmaXggaXMgb2J2aW91c2x5IApjb3JyZWN0IGFuZCBzaW1wbGUu
CgpSZXZpZXdlZC1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KClNv
bWVvbmUgd2hvIG1lcmdpbmcgdGhpcyBwYXRjaCBjYW4gYWRkIGZpeGVzIHRhZy4KCiAgRml4ZXM6
IDMxMGM5ZWI2ZSAoIlJlbW92ZSBleHBsaWNpdCAjZGVmaW5lJ3MgZm9yIGBfUE9TSVhfQ19TT1VS
Q0VgIGFuZCAKYF9YT1BFTl9TT1VSQ0VgIikKCkJlc3QgUmVnYXJkcwpZYW5nIFh1Cgo+IEhpIFpv
dQo+IAo+IEl0IHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAzMTBjOWViNmU2KCJSZW1vdmUgZXhw
bGljaXQgI2RlZmluZSdzIGZvciAKPiBgX1BPU0lYX0NfU09VUkNFYCBhbmQgYF9YT1BFTl9TT1VS
Q0VgIikuCj4gCj4gSU1PLCB3ZSBjYW4gcmVtb3ZlIHRoaXMgV0lUSE9VVF9YT1BFTiBtYWNybyBk
aXJlY3RseSBiZWNhdXNlIHdlIGhhdmUgCj4gc2V0dGVkIC1EX1BPU0lYX0NfU09VUkNFPTIwMDgw
OUwgLURfWE9QRU5fU09VUkNFPTcwMCBpbiAKPiBsdHAvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVz
dHN1aXRlL0NGTEFHUy4KPiAKPiBCZXN0IFJlZ2FyZHMKPiBZYW5nIFh1Cj4+IHB0aHJlYWRfY29u
ZF9pbml0L3MtYy5jIHRlc3RjYXNlIGxvc2UgYSAjaWZuZGVmIGxpbmUsIGZpeCBpdAo+Pgo+PiBS
ZXBvcnRlZC1ieTogWm91IFdlaSA8em91X3dlaUBodWF3ZWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBab3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIAo+PiB0ZXN0Y2FzZXMv
b3Blbl9wb3NpeF90ZXN0c3VpdGUvc3RyZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1j
LmMgCj4+IHwgMSArCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBk
aWZmIC0tZ2l0IAo+PiBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhy
ZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMuYyBiL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3Rz
dWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMuYyAKPj4KPj4gaW5kZXgg
NmE1YzcwYS4uOGQxODQ4NCAxMDA2NDQKPj4gLS0tIAo+PiBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4
X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMuYwo+PiArKysg
Cj4+IGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJl
YWRfY29uZF9pbml0L3MtYy5jCj4+IEBAIC04MCw2ICs4MCw3IEBACj4+IMKgIC8qKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKsKgwqDCoCBUZXN0IGNhc2UgICAKPj4gKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCj4+ICAgCj4+IC8qKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKi8gCj4+Cj4+ICsjaWZuZGVmIFdJVEhPVVRfWE9QRU4KPj4g
wqAgdHlwZWRlZiBzdHJ1Y3QgX3Rlc3RzdHJ1Y3Qgewo+PiDCoMKgwqDCoMKgIHB0aHJlYWRfY29u
ZF90IGNuZFsxMCAqIFNDQUxBQklMSVRZX0ZBQ1RPUl07Cj4+IMKgwqDCoMKgwqAgcHRocmVhZF9j
b25kYXR0cl90IGNhWzRdOwo+PiAtLSAKPj4gMi42LjIKPj4KPj4KPiAKPiAKPiAKCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
