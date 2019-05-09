Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E6718D58
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 17:50:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5BC63EABEF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 17:50:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BC5683EABCC
 for <ltp@lists.linux.it>; Thu,  9 May 2019 17:50:37 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E622D1A02414
 for <ltp@lists.linux.it>; Thu,  9 May 2019 17:50:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69CCCC057E3F;
 Thu,  9 May 2019 15:50:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F04360CC0;
 Thu,  9 May 2019 15:50:35 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5441A41F56;
 Thu,  9 May 2019 15:50:35 +0000 (UTC)
Date: Thu, 9 May 2019 11:50:32 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Balamuruhan S <bala24@linux.vnet.ibm.com>
Message-ID: <756800992.21902100.1557417032413.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190508084447.18191-2-liwang@redhat.com>
 <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.125, 10.4.195.4]
Thread-Topic: libltpnuma: remove restrictions on numa node-id
Thread-Index: ajTL1FOANUCw6qEog1CHf4lq9YA4Gg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 09 May 2019 15:50:35 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] libltpnuma: remove restrictions on numa
 node-id
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gV2VkLCBNYXkgMDgsIDIwMTkgYXQg
MDQ6NDQ6NDdQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToKPiA+IEZvciBzb21lIHBwYzY0bGUgc3lz
dGVtcywgaXQgaGFzIG5vbi1jb250aW51b3VzIG51bWEgbm9kZXMgaW4KPiA+IGhhcmR3YXJlIGNv
bmZpZ3VyYXRpb24uIFNvIHdlJ3JlIGhpdHRpbmcgdGhlIGJlbG93IHdhcm5pbmdzIHdoaWxlCj4g
PiBydW5uaW5nIHNldF9tZW1wb2xpY3kgdGVzdHMgb24gdGhhdC4gVG8gZml4IHRoaXMgaXNzdWUs
IGxldCdzIGp1c3QKPiA+IHJlbW92ZSByZXN0cmljdGlvbnMgb24gbnVtYSBub2RlLWlkIGluIGdl
dF9tZW1wb2xpY3koKS4KPiA+IAo+ID4gRXJyb3IgTG9nCj4gPiAtLS0tLS0tLS0KPiA+IHRzdF90
ZXN0LmM6MTA5NjogSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDUwbSAwMHMKPiA+IHRzdF9u
dW1hLmM6MTkwOiBJTkZPOiBGb3VuZCAyIE5VTUEgbWVtb3J5IG5vZGVzCj4gPiBzZXRfbWVtcG9s
aWN5MDEuYzo2MzogUEFTUzogc2V0X21lbXBvbGljeShNUE9MX0JJTkQpIG5vZGUgMAo+ID4gdHN0
X251bWEuYzoyNjogSU5GTzogTm9kZSAwIGFsbG9jYXRlZCAxNiBwYWdlcwo+ID4gdHN0X251bWEu
YzoyNjogSU5GTzogTm9kZSA4IGFsbG9jYXRlZCAwIHBhZ2VzCj4gPiBzZXRfbWVtcG9saWN5MDEu
Yzo4MjogUEFTUzogY2hpbGQ6IE5vZGUgMCBhbGxvY2F0ZWQgMTYKPiA+IHNldF9tZW1wb2xpY3kw
MS5jOjYzOiBQQVNTOiBzZXRfbWVtcG9saWN5KE1QT0xfQklORCkgbm9kZSA4Cj4gPiB0c3RfbnVt
YS5jOjkyOiBXQVJOOiBnZXRfbWVtcG9saWN5KC4uLikgcmV0dXJuZWQgaW52YWxpZCBub2RlIDgK
PiA+IHRzdF9udW1hLmM6OTI6IFdBUk46IGdldF9tZW1wb2xpY3koLi4uKSByZXR1cm5lZCBpbnZh
bGlkIG5vZGUgOAo+ID4gdHN0X251bWEuYzo5MjogV0FSTjogZ2V0X21lbXBvbGljeSguLi4pIHJl
dHVybmVkIGludmFsaWQgbm9kZSA4Cj4gPiAuLi4KPiA+IHRzdF9udW1hLmM6MjY6IElORk86IE5v
ZGUgMCBhbGxvY2F0ZWQgMCBwYWdlcwo+ID4gdHN0X251bWEuYzoyNjogSU5GTzogTm9kZSA4IGFs
bG9jYXRlZCAwIHBhZ2VzCj4gPiBzZXRfbWVtcG9saWN5MDEuYzo4NjogRkFJTDogY2hpbGQ6IE5v
ZGUgOCBhbGxvY2F0ZWQgMCwgZXhwZWN0ZWQgMTYKPiA+IAo+ID4gbHNjcHUKPiA+IC0tLS0tCj4g
PiBBcmNoaXRlY3R1cmU6ICAgICAgICBwcGM2NGxlCj4gPiAuLi4KPiA+IENQVShzKTogICAgICAg
ICAgICAgIDEyOAo+ID4gQ29yZShzKSBwZXIgc29ja2V0OiAgMTYKPiA+IFNvY2tldChzKTogICAg
ICAgICAgIDIKPiA+IE5VTUEgbm9kZShzKTogICAgICAgIDIKPiA+IE1vZGVsIG5hbWU6ICAgICAg
ICAgIFBPV0VSOSwgYWx0aXZlYyBzdXBwb3J0ZWQKPiA+IC4uLgo+ID4gTlVNQSBub2RlMCBDUFUo
cyk6ICAgMC02Mwo+ID4gTlVNQSBub2RlOCBDUFUocyk6ICAgNjQtMTI3Cj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+ID4gQ2M6IEN5cmlsIEhydWJp
cyA8Y2hydWJpc0BzdXNlLmN6Pgo+ID4gLS0tCj4gPiAgbGlicy9saWJsdHBudW1hL3RzdF9udW1h
LmMgfCA1ICsrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2xpYnMvbGlibHRwbnVtYS90c3RfbnVtYS5j
IGIvbGlicy9saWJsdHBudW1hL3RzdF9udW1hLmMKPiA+IGluZGV4IDBiYTZkYWYzOS4uNTZjODY0
MGZmIDEwMDY0NAo+ID4gLS0tIGEvbGlicy9saWJsdHBudW1hL3RzdF9udW1hLmMKPiA+ICsrKyBi
L2xpYnMvbGlibHRwbnVtYS90c3RfbnVtYS5jCj4gPiBAQCAtODgsOCArODgsOSBAQCB2b2lkIHRz
dF9ub2RlbWFwX2NvdW50X3BhZ2VzKHN0cnVjdCB0c3Rfbm9kZW1hcCAqbm9kZXMsCj4gPiAgCQlp
ZiAocmV0IDwgMCkKPiA+ICAJCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAiZ2V0X21lbXBvbGlj
eSgpIGZhaWxlZCIpOwo+ID4gIAo+ID4gLQkJaWYgKG5vZGUgPCAwIHx8ICh1bnNpZ25lZCBpbnQp
bm9kZSA+PSBub2Rlcy0+Y250KSB7Cj4gPiAtCQkJdHN0X3JlcyhUV0FSTiwgImdldF9tZW1wb2xp
Y3koLi4uKSByZXR1cm5lZCBpbnZhbGlkIG5vZGUgJWlcbiIsIG5vZGUpOwo+ID4gKwkJaWYgKG5v
ZGUgPCAwKSB7Cj4gCj4gSXQgaXMgYmV0dGVyIHRvIGhhdmUgY2hlY2sgZm9yIHBvd2VycGMgYW5k
IHJlbW92ZSByZXN0cmljdGlvbiBhcyBpdCB3aWxsCj4gc3RpbGwgaG9sZCBnb29kIGZvciBvdGhl
ciBhcmNoLgoKVW5sZXNzIG1lbW9yeSBnZXRzIG9mZmxpbmVkIG9yIHRlc3QgaGFybmVzcyByZXN0
cmljdHMgTFRQIHRvIHJ1biBvbmx5IG9uCnNvbWUgbm9kZXMgKHZpYSBudW1hY3RsKS4gSGVyZSdz
IGV4YW1wbGUgb2YgZm9ybWVyOgoKIyB1bmFtZSAtbQp4ODZfNjQKCiMgbnVtYWN0bCAtSAphdmFp
bGFibGU6IDggbm9kZXMgKDAtNykKbm9kZSAwIGNwdXM6IDAgNCA4IDEyCm5vZGUgMCBzaXplOiA0
MDYxIE1CCm5vZGUgMCBmcmVlOiAzNDM3IE1CCm5vZGUgMSBjcHVzOiAxNiAyMCAyNCAyOApub2Rl
IDEgc2l6ZTogMCBNQgpub2RlIDEgZnJlZTogMCBNQgpub2RlIDIgY3B1czogMSA1IDkgMTMKbm9k
ZSAyIHNpemU6IDQwOTYgTUIKbm9kZSAyIGZyZWU6IDM4NzEgTUIKbm9kZSAzIGNwdXM6IDE3IDIx
IDI1IDI5Cm5vZGUgMyBzaXplOiAwIE1CCm5vZGUgMyBmcmVlOiAwIE1CCm5vZGUgNCBjcHVzOiAy
IDYgMTAgMTQKbm9kZSA0IHNpemU6IDQwOTYgTUIKbm9kZSA0IGZyZWU6IDM1NjggTUIKbm9kZSA1
IGNwdXM6IDE4IDIyIDI2IDMwCm5vZGUgNSBzaXplOiAwIE1CCm5vZGUgNSBmcmVlOiAwIE1CCm5v
ZGUgNiBjcHVzOiAxOSAyMyAyNyAzMQpub2RlIDYgc2l6ZTogMCBNQgpub2RlIDYgZnJlZTogMCBN
Qgpub2RlIDcgY3B1czogMyA3IDExIDE1Cm5vZGUgNyBzaXplOiA0MDk1IE1CCm5vZGUgNyBmcmVl
OiAzODAyIE1CCgp0c3RfdGVzdC5jOjEwOTY6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAw
NW0gMDBzCnRzdF9udW1hLmM6MTkwOiBJTkZPOiBGb3VuZCA0IE5VTUEgbWVtb3J5IG5vZGVzCi4u
Lgp0c3RfbnVtYS5jOjkyOiBXQVJOOiBnZXRfbWVtcG9saWN5KC4uLikgcmV0dXJuZWQgaW52YWxp
ZCBub2RlIDQKdHN0X251bWEuYzo5MjogV0FSTjogZ2V0X21lbXBvbGljeSguLi4pIHJldHVybmVk
IGludmFsaWQgbm9kZSA3Cgo+IAo+IC0tIEJhbGEKPiAKPiA+ICsJCQl0c3RfcmVzKFRXQVJOLAo+
ID4gKwkJCQkiZ2V0X21lbXBvbGljeSguLi4pIHJldHVybmVkIGludmFsaWQgbm9kZSAlaVxuIiwg
bm9kZSk7Cj4gPiAgCQkJY29udGludWU7Cj4gPiAgCQl9Cj4gPiAgCj4gPiAtLQo+ID4gMi4yMC4x
Cj4gPiAKPiA+IAo+ID4gLS0KPiA+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo+IAo+IAo+IC0tCj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4gCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
