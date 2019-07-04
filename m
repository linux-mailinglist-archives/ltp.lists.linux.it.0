Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9845EFE5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 02:02:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C44293C1DA2
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 02:02:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6DAEB3C1D35
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 02:02:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 020EB1001597
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 02:02:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C12DC18B2D9;
 Thu,  4 Jul 2019 00:02:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89F276013C;
 Thu,  4 Jul 2019 00:02:15 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D7474EBC3;
 Thu,  4 Jul 2019 00:02:15 +0000 (UTC)
Date: Wed, 3 Jul 2019 20:02:12 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Song Hongzhi <hongzhi.song@windriver.com>
Message-ID: <286312662.31605904.1562198532095.JavaMail.zimbra@redhat.com>
In-Reply-To: <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
 <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
 <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
 <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.22]
Thread-Topic: Bug Report: diotest4 fails on mips64
Thread-Index: bYTwtfmh1TZbP8B6/R+1N48yOBPIrsr5JGIu
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 04 Jul 2019 00:02:21 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: diotest4 fails on mips64
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2Fn
ZSAtLS0tLQo+ID4gVGhhbmtzIGZvciB5b3VyIHdvcmsuCj4gPiAKPiA+IEkgd2lsbCBiYWNrcG9y
dCB0aGUgcGF0Y2ggdG8gbXkgcHJvamVjdCBhZnRlciBtZXJnZWQuCj4gCj4gRG9lcyBpdCBtZWFu
LCB0aGF0IHBhdGNoIEkgcG9zdGVkIGZpeGVzIHByb2JsZW0gZm9yIHlvdT8KPiAKPiBEbyB5b3Ug
aGF2ZSBnb29kL2JhZCBrZXJuZWwgdmVyc2lvbj8gSSB3YXMgbG9va2luZyBhdCByZWNlbnQKPiB1
cHN0cmVhbSBjaGFuZ2VzLCBidXQgZGlkbid0IHNwb3QgYW55dGhpbmcgdGhhdCBjb3VsZCBleHBs
YWluCj4gdGhhdCBFSU5WQUwuCgpQcm9ibGVtIGFwcGVhcnMgdG8gYmUgdGhhdCAibW1hcC5oIiBk
b2Vzbid0IGluY2x1ZGUgImNvbmZpZy5oIiwKc28gTU1BUF9HUkFOVUxBUklUWSBlbmRzIHVwIGJl
aW5nIGp1c3Qgc2luZ2xlIHBhZ2UuCgpGb2xsb3dpbmcgZml4ZXMgaXQgZm9yIG1lIG9uIHFlbXUg
ZW11bGF0ZWQgNWtjLW1hbHRhLCBydW5uaW5nIDUuMi4wLXJjNzoKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xhcGkvbW1hcC5oIGIvaW5jbHVkZS9sYXBpL21tYXAuaAppbmRleCAxODU0N2MwZDQuLjk4
YjZhZGUxZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9sYXBpL21tYXAuaAorKysgYi9pbmNsdWRlL2xh
cGkvbW1hcC5oCkBAIC0xOSw2ICsxOSw4IEBACiAjaWZuZGVmIExBUElfTU1BUF9IX18KICNkZWZp
bmUgTEFQSV9NTUFQX0hfXwoKKyNpbmNsdWRlICJjb25maWcuaCIKKwogI2lmbmRlZiBNQVBfSFVH
RVRMQgogIyBkZWZpbmUgTUFQX0hVR0VUTEIgMHg0MDAwMAogI2VuZGlmCgpidXQgc3RpbGwsIHBl
cmhhcHMgd2Ugc2hvdWxkIGFsc28gZHJvcCB0aGF0IE1BUF9GSVhFRC4KCj4gCj4gPiAKPiA+IAo+
ID4gLS1Ib25nemhpCj4gPiAKPiA+IAo+ID4gCj4gPiBPbiA2LzI4LzE5IDc6MDkgUE0sIEphbiBT
dGFuY2VrIHdyb3RlOgo+ID4gPgo+ID4gPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4g
PiA+PiAqTHRwOioKPiA+ID4+Cj4gPiA+PiBsYXRlc3QgbWFzdGVyCj4gPiA+Pgo+ID4gPj4KPiA+
ID4+ICpLZXJuZWw6Kgo+ID4gPj4KPiA+ID4+IEFmdGVyIHY1LjEgQVJDSD1taXBzNjQKPiA+ID4+
Cj4gPiA+Pgo+ID4gPj4gKkVycm9yIGluZm86Kgo+ID4gPj4KPiA+ID4+IGRpb3Rlc3Q0IDEwIFRC
Uk9LIDogZGlvdGVzdDQuYzozNjg6IGNhbid0IG1tYXAgZmlsZTogSW52YWxpZCBhcmd1bWVudAo+
ID4gPj4gZGlvdGVzdDQgMTEgVEJST0sgOiBkaW90ZXN0NC5jOjM2ODogUmVtYWluaW5nIGNhc2Vz
IGJyb2tlbgo+ID4gPj4KPiA+ID4+Cj4gPiA+PiBJIHRoaW5rIHRoZSBmaXJzdCBhcmd1bWVudCBv
ZiBtbWFwIGlzIGludmFsaWQuCj4gPiA+Pgo+ID4gPj4gICDCoMKgID5zaG1fYmFzZSA9IChjaGFy
ICopKCgobG9uZylzYnJrKDApICsgKHNobXN6IC0gMSkpICYgfihzaG1zeiAtIDEpKTsKPiA+ID4+
Cj4gPiA+PiAgIMKgwqAgPnNobV9iYXNlID0gbW1hcChzaG1fYmFzZSwgMHgxMDAwMDAsIFBST1Rf
UkVBRCB8IFBST1RfV1JJVEUsCj4gPiA+IEkgZG9uJ3Qgc2VlIGFueSBub3RlIHdoeSB0aGF0IG1t
YXAgbmVlZHMgdG8gYmUgTUFQX0ZJWEVELiBJJ2QgZHJvcCBpdCwKPiA+ID4gbGV0IGtlcm5lbCBw
aWNrIGFuIGFkZHJlc3M6Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCj4gPiA+IGIvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJl
Y3RfaW8vZGlvdGVzdDQuYwo+ID4gPiBpbmRleCBlNDYxNmU0MDBhYmQuLmJmMjAwY2Q0MWEyNyAx
MDA2NDQKPiA+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVzdDQu
Ywo+ID4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCj4g
PiA+IEBAIC0zNTIsMTggKzM1MiwxNCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltd
KQo+ID4gPiAgICAgICAgICB0b3RhbCsrOwo+ID4gPgo+ID4gPiAgICAgICAgICAvKiBUZXN0LTEw
OiByZWFkLCB3cml0ZSB0byBhIG1tYXBlZCBmaWxlICovCj4gPiA+IC0gICAgICAgc2htX2Jhc2Ug
PSAoY2hhciAqKSgoKGxvbmcpc2JyaygwKSArIChzaG1zeiAtIDEpKSAmIH4oc2htc3ogLQo+ID4g
PiAxKSk7Cj4gPiA+IC0gICAgICAgaWYgKHNobV9iYXNlID09IE5VTEwpIHsKPiA+ID4gLSAgICAg
ICAgICAgICAgIHRzdF9icmttKFRCUk9LLCBjbGVhbnVwLCAic2JyayBmYWlsZWQ6ICVzIiwKPiA+
ID4gc3RyZXJyb3IoZXJybm8pKTsKPiA+ID4gLSAgICAgICB9Cj4gPiA+ICAgICAgICAgIG9mZnNl
dCA9IDQwOTY7Cj4gPiA+ICAgICAgICAgIGNvdW50ID0gYnVmc2l6ZTsKPiA+ID4gICAgICAgICAg
aWYgKChmZCA9IG9wZW4oZmlsZW5hbWUsIE9fRElSRUNUIHwgT19SRFdSKSkgPCAwKSB7Cj4gPiA+
ICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJjYW4ndCBvcGVuICVz
OiAlcyIsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZW5hbWUsIHN0cmVycm9y
KGVycm5vKSk7Cj4gPiA+ICAgICAgICAgIH0KPiA+ID4gLSAgICAgICBzaG1fYmFzZSA9IG1tYXAo
c2htX2Jhc2UsIDB4MTAwMDAwLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICBNQVBfU0hBUkVEIHwgTUFQX0ZJWEVELCBmZCwgMCk7Cj4gPiA+ICsg
ICAgICAgc2htX2Jhc2UgPSBtbWFwKDAsIDB4MTAwMDAwLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRF
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBNQVBfU0hBUkVELCBmZCwgMCk7Cj4gPiA+
ICAgICAgICAgIGlmIChzaG1fYmFzZSA9PSAoY2FkZHJfdCkgLSAxKSB7Cj4gPiA+ICAgICAgICAg
ICAgICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJjYW4ndCBtbWFwIGZpbGU6ICVzIiwK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJlcnJvcihlcnJubykpOwo+ID4gPgo+
ID4gCj4gCj4gLS0KPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
