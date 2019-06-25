Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE155275C
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 11:01:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BECFE3C1424
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 11:01:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3C0EB3C12A1
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 11:01:08 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 818401401215
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 11:01:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C50C581DEE
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 09:01:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9DEE608C2
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 09:01:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB2F81806B16;
 Tue, 25 Jun 2019 09:01:05 +0000 (UTC)
Date: Tue, 25 Jun 2019 05:01:02 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <123680949.29869386.1561453262485.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190625070737.30408-3-liwang@redhat.com>
References: <20190625070737.30408-1-liwang@redhat.com>
 <20190625070737.30408-2-liwang@redhat.com>
 <20190625070737.30408-3-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.21]
Thread-Topic: pkey: add test for memory protection keys
Thread-Index: aCCcpUP2qZjWynEhf1DGg/vxZNDihA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 25 Jun 2019 09:01:05 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] pkey: add test for memory protection keys
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiArCj4gKyNpZm5kZWYgUEtFWVNfSAo+ICsj
ZGVmaW5lIFBLRVlTX0gKPiArCj4gKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+ICsjaW5jbHVkZSAi
bGFwaS9zeXNjYWxscy5oIgo+ICsKPiArI2lmbmRlZiBQS0VZX0RJU0FCTEVfQUNDRVNTCj4gKyMg
ZGVmaW5lIFBLRVlfRElTQUJMRV9BQ0NFU1MgMHgxCj4gKyMgZGVmaW5lIFBLRVlfRElTQUJMRV9X
UklURSAgMHgyCj4gKyNlbmRpZgo+ICsKPiArI2lmbmRlZiBIQVZFX1BLRVlfTVBST1RFQ1QKPiAr
c3RhdGljIGlubGluZSBpbnQgcGtleV9tcHJvdGVjdCh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBp
bnQgcHJvdCwgaW50IHBrZXkpCj4gK3sKPiArCXJldHVybiB0c3Rfc3lzY2FsbChTWVNfcGtleV9t
cHJvdGVjdCwgYWRkciwgbGVuLCBwcm90LCBwa2V5KTsKCkhpLAoKVGhpcyBzaG91bGQgYmUgX19O
Ul8qOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHBrZXkwMS5jOjMyOgpwa2V5Lmg6IEluIGZ1bmN0
aW9uIOKAmHBrZXlfbXByb3RlY3TigJk6CnBrZXkuaDoyMDogZXJyb3I6IOKAmFNZU19wa2V5X21w
cm90ZWN04oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQpwa2V5Lmg6
MjA6IGVycm9yOiAoRWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBv
bmNlCnBrZXkuaDoyMDogZXJyb3I6IGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4uKQpw
a2V5Lmg6IEluIGZ1bmN0aW9uIOKAmHBrZXlfYWxsb2PigJk6CnBrZXkuaDoyNTogZXJyb3I6IOKA
mFNZU19wa2V5X2FsbG9j4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9u
KQpwa2V5Lmg6IEluIGZ1bmN0aW9uIOKAmHBrZXlfZnJlZeKAmToKcGtleS5oOjMwOiBlcnJvcjog
4oCYU1lTX3BrZXlfZnJlZeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlv
bikKCj4gK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gK3sKPiArCWludCBpLCBmZDsKPiArCj4g
KwlpZiAoYWNjZXNzKCIvcHJvYy9zeXMvdm0vbnJfaHVnZXBhZ2VzIiwgRl9PSykpIHsKPiArCQl0
c3RfcmVzKFRJTkZPLCAiSHVnZSBwYWdlIGlzIG5vdCBzdXBwb3J0ZWQiKTsKPiArCQlzaXplID0g
Z2V0cGFnZXNpemUoKTsKPiArCQlub19odWdlcGFnZSA9IDE7Cj4gKwl9IGVsc2Ugewo+ICsJCVNB
RkVfRklMRV9QUklOVEYoIi9wcm9jL3N5cy92bS9ucl9odWdlcGFnZXMiLCAiJWQiLCAxKTsKClRo
ZXJlIGFyZSAyIHByb2JsZW1zIGhlcmUsIGJvdGggcmVsYXRlZCB0byBmYWN0IHRoYXQgdGhpcyBm
aWxlIGV4aXN0cywKYnV0IG1heSByZXR1cm4gRU9QTk9UU1VQUCBvbiByZWFkL3dyaXRlLgoKMS4g
c2F2ZV9yZXN0b3JlIHNob3VsZCBpZ25vcmUgYWxzbyByZWFkL29wZW4gZXJyb3JzIGlmIHBhdGgg
aXMgcHJlZml4ZWQgd2l0aCAnPycKICAgSSdsbCBzZW5kIHRoaXMgc2VwYXJhdGVseS4KCjIuIFNB
RkVfRklMRV9QUklOVEYgaW4gcGtleTAxLmMgc2hvdWxkbid0IGJlIHNhZmUsIGJlY2F1c2Ugd2Ug
bmVlZCB0byBzb21laG93CiAgIGRldGVjdCB0aGF0IHdyaXRlIHdvcmtlZAoKIyBscyAtbGEgL3By
b2Mvc3lzL3ZtL25yX2h1Z2VwYWdlcwotcnctci0tci0tLiAxIHJvb3Qgcm9vdCAwIEp1biAyNSAw
NDoxMiAvcHJvYy9zeXMvdm0vbnJfaHVnZXBhZ2VzCgojIGNhdCAvcHJvYy9zeXMvdm0vbnJfaHVn
ZXBhZ2VzCmNhdDogL3Byb2Mvc3lzL3ZtL25yX2h1Z2VwYWdlczogT3BlcmF0aW9uIG5vdCBzdXBw
b3J0ZWQKCj4gK3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiArCS50Y250ID0gQVJS
QVlfU0laRSh0Y2FzZXMpLAo+ICsJLmZvcmtzX2NoaWxkID0gMSwKPiArCS50ZXN0ID0gdmVyaWZ5
X3BrZXksCj4gKwkuc2V0dXAgPSBzZXR1cCwKPiArCS5jbGVhbnVwID0gY2xlYW51cCwKPiArCS5z
YXZlX3Jlc3RvcmUgPSBzYXZlX3Jlc3RvcmUsCgoubmVlZHNfcm9vdCA9IDEgYXMgd2VsbCwgc2lu
Y2Ugd2Ugd3JpdGUgdG8gL3Byb2MgYW5kIG1vdW50IHRtcGZzCgpSZXN0IGxvb2tzIGdvb2QgdG8g
bWUsIGJ1dCBJIGhhdmVuJ3QgZm91bmQgeWV0IHN5c3RlbSB0aGF0IGNvdWxkIHJ1biB0aGUgdGVz
dC4KClJlZ2FyZHMsCkphbgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
