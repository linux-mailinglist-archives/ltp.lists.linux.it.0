Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152547A62
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 09:03:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFEEE3EB0D4
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 09:03:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D560B3EB058
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 09:03:55 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4042714016D1
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 09:03:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B4EAC30001E2
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 07:03:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5607DDF9
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 07:03:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1258206D1;
 Mon, 17 Jun 2019 07:03:53 +0000 (UTC)
Date: Mon, 17 Jun 2019 03:03:50 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwan@redhat.com>
Message-ID: <807012526.28418206.1560755030501.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dAr_6q8cfkBhRamUJNcP5=W=PcOp1UTEttBsXkhgNABA@mail.gmail.com>
References: <a15d4137b63e4202751bea4e726658aa14be7351.1560678643.git.jstancek@redhat.com>
 <CAEemH2dAr_6q8cfkBhRamUJNcP5=W=PcOp1UTEttBsXkhgNABA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.242, 10.4.195.14]
Thread-Topic: syscalls/tgkill03: wait for defunct tid to get detached
Thread-Index: uPkSBFZcAPJ9I6LIRi3RjCyqyialtQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 17 Jun 2019 07:03:53 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: fhrbata@redhat.com, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/tgkill03: wait for defunct tid to get
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gU3VuLCBKdW4gMTYsIDIwMTkgYXQg
NTo1MiBQTSBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBD
YXNlIHdoZXJlIGRlZnVuY3QgdGlkIGlzIHVzZWQgaGFzIGJlZW4gb2JzZXJ2ZWQgdG8gc3BvcmFk
aWNhbGx5IGZhaWw6Cj4gPiAgIHRna2lsbDAzLmM6OTY6IEZBSUw6IERlZnVuY3QgdGlkIHNob3Vs
ZCBoYXZlIGZhaWxlZCB3aXRoIEVTUkNIOiBTVUNDRVNTCj4gPgo+ID4gZ2xpYmMgX19wdGhyZWFk
X3RpbWVkam9pbl9leCgpIHdhaXRzIGZvciBDTE9ORV9DSElMRF9DTEVBUlRJRCB0byBjbGVhciB0
aWQsCj4gPiBhbmQgdGhlbiByZXN1bWVzLiBLZXJuZWwgY2xlYXJzIGl0IChnbGliYyBwZC0+dGlk
KSBhdDoKPiA+ICAgZG9fZXhpdAo+ID4gICAgIGV4aXRfbW0KPiA+ICAgICAgIG1tX3JlbGVhc2UK
PiA+ICAgICAgICAgcHV0X3VzZXIoMCwgdHNrLT5jbGVhcl9jaGlsZF90aWQpOwo+ID4KPiA+IGJ1
dCBrZXJuZWwgdGlkIGlzIHN0aWxsIHZhbGlkLCBwcmVzdW1hYmx5IHVudGlsOgo+ID4gICByZWxl
YXNlX3Rhc2sKPiA+ICAgICBfX2V4aXRfc2lnbmFsCj4gPiAgICAgICBfX3VuaGFzaF9wcm9jZXNz
Cj4gPiAgICAgICAgIGRldGFjaF9waWQKPiA+Cj4gPiBUbyBhdm9pZCByYWNlIHdhaXQgdW50aWwg
L3Byb2MvPHBpZD4vdGFzay88dGlkPiBkaXNhcHBlYXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy90Z2tpbGwvdGdraWxsMDMuYyB8IDYgKysrKystCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Rna2lsbC90Z2tpbGwwMy5jCj4gPiBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdGdraWxsL3Rna2lsbDAzLmMKPiA+IGluZGV4IGY1YmJk
YzVhOGQ0ZS4uNWFjMWQyNjUxZjdhIDEwMDY0NAo+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy90Z2tpbGwvdGdraWxsMDMuYwo+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy90Z2tpbGwvdGdraWxsMDMuYwo+ID4gQEAgLTcsNiArNyw3IEBACj4gPgo+ID4gICNpbmNs
dWRlIDxwdGhyZWFkLmg+Cj4gPiAgI2luY2x1ZGUgPHB3ZC5oPgo+ID4gKyNpbmNsdWRlIDxzdGRp
by5oPgo+ID4gICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KPiA+Cj4gPiAgI2luY2x1ZGUgInRzdF9z
YWZlX3B0aHJlYWQuaCIKPiA+IEBAIC00Miw2ICs0Myw3IEBAIHN0YXRpYyB2b2lkIHNldHVwKHZv
aWQpCj4gPiAgewo+ID4gICAgICAgICBzaWdzZXRfdCBzaWd1c3IxOwo+ID4gICAgICAgICBwdGhy
ZWFkX3QgZGVmdW5jdF90aHJlYWQ7Cj4gPiArICAgICAgIGNoYXIgZGVmdW5jdF90aWRfcGF0aFtQ
QVRIX01BWF07Cj4gPgo+ID4gICAgICAgICBzaWdlbXB0eXNldCgmc2lndXNyMSk7Cj4gPiAgICAg
ICAgIHNpZ2FkZHNldCgmc2lndXNyMSwgU0lHVVNSMSk7Cj4gPiBAQCAtNTUsOCArNTcsMTAgQEAg
c3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPiA+ICAgICAgICAgVFNUX0NIRUNLUE9JTlRfV0FJVCgw
KTsKPiA+Cj4gPiAgICAgICAgIFNBRkVfUFRIUkVBRF9DUkVBVEUoJmRlZnVuY3RfdGhyZWFkLCBO
VUxMLCBkZWZ1bmN0X3RocmVhZF9mdW5jLAo+ID4gTlVMTCk7Cj4gPiAtCj4gPiAgICAgICAgIFNB
RkVfUFRIUkVBRF9KT0lOKGRlZnVuY3RfdGhyZWFkLCBOVUxMKTsKPiA+ICsgICAgICAgc3ByaW50
ZihkZWZ1bmN0X3RpZF9wYXRoLCAiL3Byb2MvJWQvdGFzay8lZCIsIGdldHBpZCgpLAo+ID4gZGVm
dW5jdF90aWQpOwo+ID4gKyAgICAgICB3aGlsZSAoYWNjZXNzKGRlZnVuY3RfdGlkX3BhdGgsIFJf
T0spID09IDApCj4gPiArICAgICAgICAgICAgICAgdXNsZWVwKDEwMDAwKTsKPiA+Cj4gCj4gVG8g
YmUgb24gdGhlIHNhZmUgc2lkZSwgSSB0aGluayBtYXliZSBUU1RfUkVUUllfRlVOQyBpcyBhIGJl
dHRlciBjaG9pY2UKPiBoZXJlLgoKR2l2ZW4gaGlnaCBzdGVhbCB0aW1lIG9uIHMzOTAsIEkgcmF0
aGVyIG5vdCBwdXQgMXMgY2FwIG9uIHNsZWVwIGhlcmUuClRoaXMgaXMgbmV3bGliIHRlc3QsIHNv
IHRoZXJlJ3MgYWxyZWFkeSBhIHRpbWVvdXQsIEknZCBwcmVmZXIgdG8gbG93ZXIKdHN0X3Rlc3Qu
dGltZW91dCwgc2F5IDMwIHNlY29uZHM/Cgo+IAo+ICAgICBUU1RfUkVUUllfRlVOQyhhY2Nlc3Mo
ZGVmdW5jdF90aWRfcGF0aCwgUl9PSyksIC0xKTsKPiAKPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9p
ZCBjbGVhbnVwKHZvaWQpCj4gPiAtLQo+ID4gMS44LjMuMQo+ID4KPiA+Cj4gCj4gLS0KPiBSZWdh
cmRzLAo+IExpIFdhbmcKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
