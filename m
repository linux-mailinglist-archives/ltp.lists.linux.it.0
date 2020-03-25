Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2941419205A
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:13:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69D2A3C4D6E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:13:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E33C73C4D2F
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:13:39 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 99811200D20
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:13:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="87225126"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 13:13:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 605A750A9995
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 13:03:20 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 13:13:28 +0800
To: <ltp@lists.linux.it>
References: <1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <724523fd-9671-bea7-03e0-3b0d3399c3eb@cn.fujitsu.com>
Date: Wed, 25 Mar 2020 13:13:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 605A750A9995.AB83F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: fix a null pointer
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkKCkRvZXMgc29tZW9uZSBub3RpY2UgdGhpcyhJIGd1ZXNzIHRoaXMgaXMgYSBzaW1wbGUgZml4
KT8KCkJlc3QgUmVnYXJkcwpZYW5nIFh1Cj4gU2luY2UgY29tbWl0IDNkZDI4NmJkYmVlICgibHRw
X3RwY2kuYzogVXBkYXRlIGxlZ2FjeSBjb2RlIiksCj4gaXQgaW50cm9kdWNlZCBhIHdhcm5pbmcg
YXMgYmVsb3c6Cj4gLi4vbHRwX3RwY2kuYzogSW4gZnVuY3Rpb24g4oCYcHJvYmVfcGNpX2RlduKA
mToKPiAuLi9sdHBfdHBjaS5jOjEwNzo4OiB3YXJuaW5nOiDigJhkZXbigJkgaXMgdXNlZCB1bmlu
aXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XdW5pbml0aWFsaXplZF0KPiAgICBzdHJ1Y3Qg
cGNpX2RldiAqZGV2Owo+ICAgIGRldiA9IHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdChwY2lf
ZG9tYWluX25yKGRldi0+YnVzKSwgYnVzLCBzbG90KQo+IAo+IFRoaXMgd2lsbCBsZWFkIHRvIHN5
c3RlbSBjcmFzaCB3aGVuIHdlIHJ1biB0aGlzIGNhc2UgYmVjYXVzZSBpdCB0cmlnZ2VycyBhIG51
bGwgcG9pbnRlci4KPiBVc2UgMCBkb21haW4gaW50ZWFkIG9mIHBjaV9kb21haW5fbnIuCj4gCj4g
cHM6IEkgd2FudCB0byB1c2UgYSBkeW1haWMgZG9tYWluIHRvIGZpeCBpdCBidXQgZmFpbGVkLiBJ
ZiBzb21lb25lIGtub3csCj4gcGxlYXNlIHRlbGwgbWUuIEFsc28sIHRoaXMgY2FzZSBmYWlsZWQg
d2hlbiBtZXJnaW5nIHRoaXMgcGF0Y2ggYmVjYXVzZQo+IHRlc3QgMTMgKHRlc3RfYXNzaWduX3Jl
c291cmNlcykgcmVwb3J0IG5vIHNwYWNlIGVycm9yIGFzIGJlbG93Ogo+IFs3NTQ5MzAuNzU3NTg1
XSBsdHBfdHBjaTogdGVzdC1jYXNlIDEzCj4gWzc1NDkzMC43NTc1ODVdIGx0cF90cGNpOiBhc3Np
Z24gcmVzb3VyY2VzCj4gWzc1NDkzMC43NTc1ODVdIGx0cF90cGNpOiBhc3NpZ24gcmVzb3VyY2Ug
IzAKPiBbNzU0OTMwLjc1NzU4Nl0gbHRwX3RwY2k6IG5hbWUgPSAwMDAwOjAwOjA4LjAsIGZsYWdz
ID0gMjYyNDAxLCBzdGFydCAweGMxNDAsIGVuZCAweGMxN2YKPiBbNzU0OTMwLjc1NzU4Nl0gbHRw
X3RwY2k6IGFzc2lnbiByZXNvdXJjZSAjMQo+IFs3NTQ5MzAuNzU3NTg3XSBsdHBfdHBjaTogbmFt
ZSA9IDAwMDA6MDA6MDguMCwgZmxhZ3MgPSAyNjI2NTYsIHN0YXJ0IDB4ZmViZDcwMDAsIGVuZCAw
eGZlYmQ3ZmZmCj4gWzc1NDkzMC43NTc1ODddIGx0cF90cGNpOiBhc3NpZ24gcmVzb3VyY2UgIzIK
PiBbNzU0OTMwLjc1NzU4N10gbHRwX3RwY2k6IG5hbWUgPSAwMDAwOjAwOjA4LjAsIGZsYWdzID0g
MCwgc3RhcnQgMHgwLCBlbmQgMHgwCj4gWzc1NDkzMC43NTc1ODhdIGx0cF90cGNpOiBhc3NpZ24g
cmVzb3VyY2UgIzMKPiBbNzU0OTMwLjc1NzU4OF0gbHRwX3RwY2k6IG5hbWUgPSAwMDAwOjAwOjA4
LjAsIGZsYWdzID0gMCwgc3RhcnQgMHgwLCBlbmQgMHgwCj4gWzc1NDkzMC43NTc1ODhdIGx0cF90
cGNpOiBhc3NpZ24gcmVzb3VyY2UgIzQKPiBbNzU0OTMwLjc1NzU4OV0gbHRwX3RwY2k6IG5hbWUg
PSAwMDAwOjAwOjA4LjAsIGZsYWdzID0gNTM4MTkwMzQ4LCBzdGFydCAweGZlODBjMDAwLCBlbmQg
MHhmZTgwZmZmZgo+IFs3NTQ5MzAuNzU3NTkzXSB2aXJ0aW8tcGNpIDAwMDA6MDA6MDguMDogQkFS
IDQ6IG5vIHNwYWNlIGZvciBbbWVtIHNpemUgMHgwMDAwNDAwMCA2NGJpdCBwcmVmXQo+IFs3NTQ5
MzAuNzU3NTk0XSB2aXJ0aW8tcGNpIDAwMDA6MDA6MDguMDogQkFSIDQ6IGZhaWxlZCB0byBhc3Np
Z24gW21lbSBzaXplIDB4MDAwMDQwMDAgNjRiaXQgcHJlZgo+IAo+IEZpeGVzOiAzZGQyODZiICgi
bHRwX3RwY2kuYzogVXBkYXRlIGxlZ2FjeSBjb2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1
IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+IC0tLQo+ICAgdGVzdGNhc2VzL2tlcm5l
bC9kZXZpY2UtZHJpdmVycy9wY2kvdHBjaV9rZXJuZWwvbHRwX3RwY2kuYyB8IDIgKy0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3BjaS90cGNpX2tlcm5lbC9sdHBf
dHBjaS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9wY2kvdHBjaV9rZXJuZWwv
bHRwX3RwY2kuYwo+IGluZGV4IDdjYmFiZmFhNS4uYTU3OTUzZGI2IDEwMDY0NAo+IC0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvcGNpL3RwY2lfa2VybmVsL2x0cF90cGNpLmMK
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3BjaS90cGNpX2tlcm5lbC9s
dHBfdHBjaS5jCj4gQEAgLTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgaW50IHByb2JlX3BjaV9kZXYo
dW5zaWduZWQgaW50IGJ1cywgdW5zaWduZWQgaW50IHNsb3QpCj4gICAJCWx0cF9wY2kuZGV2ID0g
TlVMTDsKPiAgIAl9Cj4gICAKPiAtCWRldiA9IHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdChw
Y2lfZG9tYWluX25yKGRldi0+YnVzKSwgYnVzLCBzbG90KTsKPiArCWRldiA9IHBjaV9nZXRfZG9t
YWluX2J1c19hbmRfc2xvdCgwLCBidXMsIHNsb3QpOwo+ICAgCWlmICghZGV2IHx8ICFkZXYtPmRy
aXZlcikKPiAgIAkJcmV0dXJuIC1FTk9ERVY7Cj4gICAKPiAKCgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
