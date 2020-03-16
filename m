Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE91865FA
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 08:54:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AAA73C5694
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 08:54:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9ED1A3C5689
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 08:54:01 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id DB2CC1000A7B
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 08:53:58 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,559,1574092800"; d="scan'208";a="86384324"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Mar 2020 15:53:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id B5EB550A9967;
 Mon, 16 Mar 2020 15:43:46 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Mar 2020 15:53:51 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Zou Wei <zou_wei@huawei.com>, Cyril Hrubis <chrubis@suse.cz>,
 <yaneurabeya@gmail.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
 <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
Message-ID: <7017e8bc-616b-0958-b82e-852604c06a3b@cn.fujitsu.com>
Date: Mon, 16 Mar 2020 15:53:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B5EB550A9967.AD559
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwKCk9uIG15IGVudmlyb25tZW50LCB3aGVuIEkgdGVzdCBvcGVucG9zaXgsIHRoaXMg
Y2FzZSBtaXNzZWQgcnVuIGFuZCAKY29tcGxpZSBiZWNhdXNlIGxvY2F0ZS10ZXN0IGhhcyBmaWx0
ZXIgcnVsZXMgY2FsbGVkIGJ5IApvcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zY3JpcHRzL2dlbmVyYXRl
LW1ha2VmaWxlcy5zaC4gIGZpbHRlciBydWxlcyBhcyBiZWxvdzoKCnJ1bm5hYmxlKQogICAgICAg
ICBmaW5kICIkV0hFUkUvY29uZm9ybWFuY2UiICIkV0hFUkUvc3RyZXNzIiAtdHlwZSBmIC1uYW1l
IAonKlswLTldLmMnIC1vIC1uYW1lICdbMC05XSotWzAtOV0qLnNoJyB8IGdyZXAgLXYgYnVpbGRv
bmx5IHwgZ3JlcCAtdiAKJ14uL3Rvb2xzJwogICAgICAgICBmaW5kICIkV0hFUkUvZnVuY3Rpb25h
bCIgLXR5cGUgZiAtbmFtZSAnKi5jJwoKSSBoYXZlIGEgcXVlc3Rpb24gd2h5IHdlIGxlYXZlIGl0
IGhlcmUgaWYgdGhleSBhcmUgbm8gbWVhbmluZ2Z1bC4gSWYKaXQgd2FzIG1lYW5pbmdmdWwsIHdo
eSB3ZSBmaWx0ZXIgdGhpcyBjYXNlPyBJIHNlZSB0aGUgaGlzdG9yeSwgYnV0IGZvdW5kIApubyB0
aGluZy4KCkBFbmppLCB5b3Ugb2Z0ZW4gY2hhbmdlIG9wZW5wb3NpeCBjb2RlLCBjYW4geW91IGdp
dmUgbWUgc29tZSBhZHZpc2U/CgpCZXN0IFJlZ2FyZHMKWWFuZyBYdQoKPiBIaSBab3UKPiAKPiBJ
dCB3YXMgaW50cm9kdWNlZCBieSBjb21taXQgMzEwYzllYjZlNigiUmVtb3ZlIGV4cGxpY2l0ICNk
ZWZpbmUncyBmb3IgCj4gYF9QT1NJWF9DX1NPVVJDRWAgYW5kIGBfWE9QRU5fU09VUkNFYCIpLgo+
IAo+IElNTywgd2UgY2FuIHJlbW92ZSB0aGlzIFdJVEhPVVRfWE9QRU4gbWFjcm8gZGlyZWN0bHkg
YmVjYXVzZSB3ZSBoYXZlIAo+IHNldHRlZCAtRF9QT1NJWF9DX1NPVVJDRT0yMDA4MDlMIC1EX1hP
UEVOX1NPVVJDRT03MDAgaW4gCj4gbHRwL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9D
RkxBR1MuCj4gCj4gQmVzdCBSZWdhcmRzCj4gWWFuZyBYdQo+PiBwdGhyZWFkX2NvbmRfaW5pdC9z
LWMuYyB0ZXN0Y2FzZSBsb3NlIGEgI2lmbmRlZiBsaW5lLCBmaXggaXQKPj4KPj4gUmVwb3J0ZWQt
Ynk6IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWm91IFdl
aSA8em91X3dlaUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gICAKPj4gdGVzdGNhc2VzL29wZW5fcG9z
aXhfdGVzdHN1aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3MtYy5jIAo+PiB8
IDEgKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdp
dCAKPj4gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc3RyZXNzL3RocmVhZHMvcHRo
cmVhZF9jb25kX2luaXQvcy1jLmMgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc3Ry
ZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1jLmMgCj4+Cj4+IGluZGV4IDZhNWM3MGEu
LjhkMTg0ODQgMTAwNjQ0Cj4+IC0tLSAKPj4gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3Vp
dGUvc3RyZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1jLmMKPj4gKysrIAo+PiBiL3Rl
c3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRf
aW5pdC9zLWMuYwo+PiBAQCAtODAsNiArODAsNyBAQAo+PiDCoCAvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKirCoMKgwqAgVGVzdCBjYXNlICAgCj4+ICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqLwo+PiAgIAo+PiAvKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKiovIAo+Pgo+PiArI2lmbmRlZiBXSVRIT1VUX1hPUEVOCj4+IMKgIHR5cGVk
ZWYgc3RydWN0IF90ZXN0c3RydWN0IHsKPj4gwqDCoMKgwqDCoCBwdGhyZWFkX2NvbmRfdCBjbmRb
MTAgKiBTQ0FMQUJJTElUWV9GQUNUT1JdOwo+PiDCoMKgwqDCoMKgIHB0aHJlYWRfY29uZGF0dHJf
dCBjYVs0XTsKPj4gLS0gCj4+IDIuNi4yCj4+Cj4+Cj4gCj4gCj4gCgoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
