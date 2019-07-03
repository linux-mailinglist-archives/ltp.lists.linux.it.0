Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC15E490
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 14:53:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EBB03C1D81
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 14:53:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 17B233C1D54
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 14:53:12 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5A1C31A014D5
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 14:53:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6562930C1AE8;
 Wed,  3 Jul 2019 12:53:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE6B7BE6C;
 Wed,  3 Jul 2019 12:53:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 528AA206D1;
 Wed,  3 Jul 2019 12:53:10 +0000 (UTC)
Date: Wed, 3 Jul 2019 08:53:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Song Hongzhi <hongzhi.song@windriver.com>
Message-ID: <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
In-Reply-To: <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
 <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
 <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.22]
Thread-Topic: Bug Report: diotest4 fails on mips64
Thread-Index: bYTwtfmh1TZbP8B6/R+1N48yOBPIrg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 03 Jul 2019 12:53:10 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBUaGFua3MgZm9yIHlvdXIgd29yay4KPiAK
PiBJIHdpbGwgYmFja3BvcnQgdGhlIHBhdGNoIHRvIG15IHByb2plY3QgYWZ0ZXIgbWVyZ2VkLgoK
RG9lcyBpdCBtZWFuLCB0aGF0IHBhdGNoIEkgcG9zdGVkIGZpeGVzIHByb2JsZW0gZm9yIHlvdT8K
CkRvIHlvdSBoYXZlIGdvb2QvYmFkIGtlcm5lbCB2ZXJzaW9uPyBJIHdhcyBsb29raW5nIGF0IHJl
Y2VudAp1cHN0cmVhbSBjaGFuZ2VzLCBidXQgZGlkbid0IHNwb3QgYW55dGhpbmcgdGhhdCBjb3Vs
ZCBleHBsYWluCnRoYXQgRUlOVkFMLgoKPiAKPiAKPiAtLUhvbmd6aGkKPiAKPiAKPiAKPiBPbiA2
LzI4LzE5IDc6MDkgUE0sIEphbiBTdGFuY2VrIHdyb3RlOgo+ID4KPiA+IC0tLS0tIE9yaWdpbmFs
IE1lc3NhZ2UgLS0tLS0KPiA+PiAqTHRwOioKPiA+Pgo+ID4+IGxhdGVzdCBtYXN0ZXIKPiA+Pgo+
ID4+Cj4gPj4gKktlcm5lbDoqCj4gPj4KPiA+PiBBZnRlciB2NS4xIEFSQ0g9bWlwczY0Cj4gPj4K
PiA+Pgo+ID4+ICpFcnJvciBpbmZvOioKPiA+Pgo+ID4+IGRpb3Rlc3Q0IDEwIFRCUk9LIDogZGlv
dGVzdDQuYzozNjg6IGNhbid0IG1tYXAgZmlsZTogSW52YWxpZCBhcmd1bWVudAo+ID4+IGRpb3Rl
c3Q0IDExIFRCUk9LIDogZGlvdGVzdDQuYzozNjg6IFJlbWFpbmluZyBjYXNlcyBicm9rZW4KPiA+
Pgo+ID4+Cj4gPj4gSSB0aGluayB0aGUgZmlyc3QgYXJndW1lbnQgb2YgbW1hcCBpcyBpbnZhbGlk
Lgo+ID4+Cj4gPj4gICDCoMKgID5zaG1fYmFzZSA9IChjaGFyICopKCgobG9uZylzYnJrKDApICsg
KHNobXN6IC0gMSkpICYgfihzaG1zeiAtIDEpKTsKPiA+Pgo+ID4+ICAgwqDCoCA+c2htX2Jhc2Ug
PSBtbWFwKHNobV9iYXNlLCAweDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKPiA+IEkg
ZG9uJ3Qgc2VlIGFueSBub3RlIHdoeSB0aGF0IG1tYXAgbmVlZHMgdG8gYmUgTUFQX0ZJWEVELiBJ
J2QgZHJvcCBpdCwKPiA+IGxldCBrZXJuZWwgcGljayBhbiBhZGRyZXNzOgo+ID4KPiA+IGRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCj4gPiBiL3Rl
c3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0LmMKPiA+IGluZGV4IGU0NjE2ZTQw
MGFiZC4uYmYyMDBjZDQxYTI3IDEwMDY0NAo+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9pby9k
aXJlY3RfaW8vZGlvdGVzdDQuYwo+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3Rf
aW8vZGlvdGVzdDQuYwo+ID4gQEAgLTM1MiwxOCArMzUyLDE0IEBAIGludCBtYWluKGludCBhcmdj
LCBjaGFyICphcmd2W10pCj4gPiAgICAgICAgICB0b3RhbCsrOwo+ID4KPiA+ICAgICAgICAgIC8q
IFRlc3QtMTA6IHJlYWQsIHdyaXRlIHRvIGEgbW1hcGVkIGZpbGUgKi8KPiA+IC0gICAgICAgc2ht
X2Jhc2UgPSAoY2hhciAqKSgoKGxvbmcpc2JyaygwKSArIChzaG1zeiAtIDEpKSAmIH4oc2htc3og
LSAxKSk7Cj4gPiAtICAgICAgIGlmIChzaG1fYmFzZSA9PSBOVUxMKSB7Cj4gPiAtICAgICAgICAg
ICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJzYnJrIGZhaWxlZDogJXMiLAo+ID4gc3Ry
ZXJyb3IoZXJybm8pKTsKPiA+IC0gICAgICAgfQo+ID4gICAgICAgICAgb2Zmc2V0ID0gNDA5NjsK
PiA+ICAgICAgICAgIGNvdW50ID0gYnVmc2l6ZTsKPiA+ICAgICAgICAgIGlmICgoZmQgPSBvcGVu
KGZpbGVuYW1lLCBPX0RJUkVDVCB8IE9fUkRXUikpIDwgMCkgewo+ID4gICAgICAgICAgICAgICAg
ICB0c3RfYnJrbShUQlJPSywgY2xlYW51cCwgImNhbid0IG9wZW4gJXM6ICVzIiwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmlsZW5hbWUsIHN0cmVycm9yKGVycm5vKSk7Cj4gPiAgICAg
ICAgICB9Cj4gPiAtICAgICAgIHNobV9iYXNlID0gbW1hcChzaG1fYmFzZSwgMHgxMDAwMDAsIFBS
T1RfUkVBRCB8IFBST1RfV1JJVEUsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBNQVBfU0hB
UkVEIHwgTUFQX0ZJWEVELCBmZCwgMCk7Cj4gPiArICAgICAgIHNobV9iYXNlID0gbW1hcCgwLCAw
eDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIE1BUF9TSEFSRUQsIGZkLCAwKTsKPiA+ICAgICAgICAgIGlmIChzaG1fYmFzZSA9PSAoY2Fk
ZHJfdCkgLSAxKSB7Cj4gPiAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRCUk9LLCBjbGVhbnVw
LCAiY2FuJ3QgbW1hcCBmaWxlOiAlcyIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cmVycm9yKGVycm5vKSk7Cj4gPgo+IAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
