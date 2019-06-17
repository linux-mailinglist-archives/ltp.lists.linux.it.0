Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8A480D5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 13:34:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E2DD3EB05C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 13:34:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id BC9343EA41C
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 13:34:44 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9EC4E6017E9
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 13:34:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 563327FDCC;
 Mon, 17 Jun 2019 11:34:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CA145C1B5;
 Mon, 17 Jun 2019 11:34:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A39E206D1;
 Mon, 17 Jun 2019 11:34:36 +0000 (UTC)
Date: Mon, 17 Jun 2019 07:34:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: LTP List <ltp@lists.linux.it>
Message-ID: <20052285.28635197.1560771276145.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dRpyPDJ2m0soKLumhY50RFypRHnihfzqUyc-GA-pfBgg@mail.gmail.com>
References: <ae6204b13cf5d2a8e2ebefd4ff448c33deeb26fd.1560756614.git.jstancek@redhat.com>
 <CAEemH2dRpyPDJ2m0soKLumhY50RFypRHnihfzqUyc-GA-pfBgg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.242, 10.4.195.25]
Thread-Topic: syscalls/tgkill03: wait for defunct tid to get detached
Thread-Index: ZQGx2JgabdNFyKR1ynoSpEDsMj+i0w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 17 Jun 2019 11:34:36 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>
Subject: Re: [LTP] [PATCH v2] syscalls/tgkill03: wait for defunct tid to get
 detached
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAz
OjM0IFBNIEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+IENh
c2Ugd2hlcmUgZGVmdW5jdCB0aWQgaXMgdXNlZCBoYXMgYmVlbiBvYnNlcnZlZCB0byBzcG9yYWRp
Y2FsbHkgZmFpbDoKPiA+ICAgdGdraWxsMDMuYzo5NjogRkFJTDogRGVmdW5jdCB0aWQgc2hvdWxk
IGhhdmUgZmFpbGVkIHdpdGggRVNSQ0g6IFNVQ0NFU1MKPiA+Cj4gPiBnbGliYyBfX3B0aHJlYWRf
dGltZWRqb2luX2V4KCkgd2FpdHMgZm9yIENMT05FX0NISUxEX0NMRUFSVElEIHRvIGNsZWFyIHRp
ZCwKPiA+IGFuZCB0aGVuIHJlc3VtZXMuIEtlcm5lbCBjbGVhcnMgaXQgKGdsaWJjIHBkLT50aWQp
IGF0Ogo+ID4gICBkb19leGl0Cj4gPiAgICAgZXhpdF9tbQo+ID4gICAgICAgbW1fcmVsZWFzZQo+
ID4gICAgICAgICBwdXRfdXNlcigwLCB0c2stPmNsZWFyX2NoaWxkX3RpZCk7Cj4gPgo+ID4gYnV0
IGtlcm5lbCB0aWQgaXMgc3RpbGwgdmFsaWQsIHByZXN1bWFibHkgdW50aWw6Cj4gPiAgIHJlbGVh
c2VfdGFzawo+ID4gICAgIF9fZXhpdF9zaWduYWwKPiA+ICAgICAgIF9fdW5oYXNoX3Byb2Nlc3MK
PiA+ICAgICAgICAgZGV0YWNoX3BpZAo+ID4KPiA+IFRvIGF2b2lkIHJhY2Ugd2FpdCB1bnRpbCAv
cHJvYy88cGlkPi90YXNrLzx0aWQ+IGRpc2FwcGVhcnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
SmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3Rna2lsbC90Z2tpbGwwMy5jIHwgNiArKysrKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gQ2hhbmdlcyBp
biB2MjoKPiA+ICAgLSB1c2UgaGVscGVyIGZ1bmMgc3VnZ2VzdGVkIGJ5IExpICh3aXRoIGhpZ2hl
ciB0aW1lb3V0KQo+ID4gICAtIG5vdCB0ZXN0ZWQsIHRyeWluZyB0byBnZXQgczM5MHggdG8gY29u
ZmlybQo+ID4KPiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Rna2ls
bC90Z2tpbGwwMy5jCj4gPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdGdraWxsL3Rna2ls
bDAzLmMKPiA+IGluZGV4IGY1YmJkYzVhOGQ0ZS4uY2UwNDZmNTc2YjVmIDEwMDY0NAo+ID4gLS0t
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy90Z2tpbGwvdGdraWxsMDMuYwo+ID4gKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy90Z2tpbGwvdGdraWxsMDMuYwo+ID4gQEAgLTcsNiAr
Nyw3IEBACj4gPgo+ID4gICNpbmNsdWRlIDxwdGhyZWFkLmg+Cj4gPiAgI2luY2x1ZGUgPHB3ZC5o
Pgo+ID4gKyNpbmNsdWRlIDxzdGRpby5oPgo+ID4gICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KPiA+
Cj4gPiAgI2luY2x1ZGUgInRzdF9zYWZlX3B0aHJlYWQuaCIKPiA+IEBAIC00Miw2ICs0Myw3IEBA
IHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gPiAgewo+ID4gICAgICAgICBzaWdzZXRfdCBzaWd1
c3IxOwo+ID4gICAgICAgICBwdGhyZWFkX3QgZGVmdW5jdF90aHJlYWQ7Cj4gPiArICAgICAgIGNo
YXIgZGVmdW5jdF90aWRfcGF0aFtQQVRIX01BWF07Cj4gPgo+ID4gICAgICAgICBzaWdlbXB0eXNl
dCgmc2lndXNyMSk7Cj4gPiAgICAgICAgIHNpZ2FkZHNldCgmc2lndXNyMSwgU0lHVVNSMSk7Cj4g
PiBAQCAtNTUsOCArNTcsOSBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ID4gICAgICAgICBU
U1RfQ0hFQ0tQT0lOVF9XQUlUKDApOwo+ID4KPiA+ICAgICAgICAgU0FGRV9QVEhSRUFEX0NSRUFU
RSgmZGVmdW5jdF90aHJlYWQsIE5VTEwsIGRlZnVuY3RfdGhyZWFkX2Z1bmMsCj4gPiBOVUxMKTsK
PiA+IC0KPiA+ICAgICAgICAgU0FGRV9QVEhSRUFEX0pPSU4oZGVmdW5jdF90aHJlYWQsIE5VTEwp
Owo+ID4gKyAgICAgICBzcHJpbnRmKGRlZnVuY3RfdGlkX3BhdGgsICIvcHJvYy8lZC90YXNrLyVk
IiwgZ2V0cGlkKCksCj4gPiBkZWZ1bmN0X3RpZCk7Cj4gPiArICAgICAgIFRTVF9SRVRSWV9GTl9F
WFBfQkFDS09GRihhY2Nlc3MoZGVmdW5jdF90aWRfcGF0aCwgUl9PSyksIC0xLCAxNSk7Cj4gPiAg
fQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCj4gPiBAQCAtMTA4LDQgKzExMSw1
IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiA+ICAgICAgICAgLnNldHVwID0g
c2V0dXAsCj4gPiAgICAgICAgIC5jbGVhbnVwID0gY2xlYW51cCwKPiA+ICAgICAgICAgLnRlc3Qg
PSBydW4sCj4gPiArICAgICAgIC50aW1lb3V0ID0gMTUsCj4gPgo+IAo+IEknZCBsaWtlIHRvIGdp
dmUgYSBsaXR0bGUgYml0IG1vcmUgdGltZSBoZXJlIHdoaWNoIGxhcmdlciB0aGFuIHRoZQo+IGV4
cG9uZW50aWFsIGJhY2tvZmYgbWFjcm8gdGltZS4KCkkgYnVtcGVkIGl0IHRvIDIwIGFuZCBwdXNo
ZWQuCgpUaGFua3MsCkphbgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
