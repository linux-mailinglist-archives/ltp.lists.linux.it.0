Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 798AD17425
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 10:44:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D3B0294AAC
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 10:44:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A5FF8294A89
 for <ltp@lists.linux.it>; Wed,  8 May 2019 10:44:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DBACF14044D9
 for <ltp@lists.linux.it>; Wed,  8 May 2019 10:44:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A04D610C94;
 Wed,  8 May 2019 08:44:54 +0000 (UTC)
Received: from dhcp-12-157.nay.redhat.com (dhcp-12-157.nay.redhat.com
 [10.66.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95BEF5D9D6;
 Wed,  8 May 2019 08:44:53 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  8 May 2019 16:44:47 +0800
Message-Id: <20190508084447.18191-2-liwang@redhat.com>
In-Reply-To: <20190508084447.18191-1-liwang@redhat.com>
References: <20190508084447.18191-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 08 May 2019 08:44:54 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] libltpnuma: remove restrictions on numa node-id
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

Rm9yIHNvbWUgcHBjNjRsZSBzeXN0ZW1zLCBpdCBoYXMgbm9uLWNvbnRpbnVvdXMgbnVtYSBub2Rl
cyBpbgpoYXJkd2FyZSBjb25maWd1cmF0aW9uLiBTbyB3ZSdyZSBoaXR0aW5nIHRoZSBiZWxvdyB3
YXJuaW5ncyB3aGlsZQpydW5uaW5nIHNldF9tZW1wb2xpY3kgdGVzdHMgb24gdGhhdC4gVG8gZml4
IHRoaXMgaXNzdWUsIGxldCdzIGp1c3QKcmVtb3ZlIHJlc3RyaWN0aW9ucyBvbiBudW1hIG5vZGUt
aWQgaW4gZ2V0X21lbXBvbGljeSgpLgoKRXJyb3IgTG9nCi0tLS0tLS0tLQp0c3RfdGVzdC5jOjEw
OTY6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCA1MG0gMDBzCnRzdF9udW1hLmM6MTkwOiBJ
TkZPOiBGb3VuZCAyIE5VTUEgbWVtb3J5IG5vZGVzCnNldF9tZW1wb2xpY3kwMS5jOjYzOiBQQVNT
OiBzZXRfbWVtcG9saWN5KE1QT0xfQklORCkgbm9kZSAwCnRzdF9udW1hLmM6MjY6IElORk86IE5v
ZGUgMCBhbGxvY2F0ZWQgMTYgcGFnZXMKdHN0X251bWEuYzoyNjogSU5GTzogTm9kZSA4IGFsbG9j
YXRlZCAwIHBhZ2VzCnNldF9tZW1wb2xpY3kwMS5jOjgyOiBQQVNTOiBjaGlsZDogTm9kZSAwIGFs
bG9jYXRlZCAxNgpzZXRfbWVtcG9saWN5MDEuYzo2MzogUEFTUzogc2V0X21lbXBvbGljeShNUE9M
X0JJTkQpIG5vZGUgOAp0c3RfbnVtYS5jOjkyOiBXQVJOOiBnZXRfbWVtcG9saWN5KC4uLikgcmV0
dXJuZWQgaW52YWxpZCBub2RlIDgKdHN0X251bWEuYzo5MjogV0FSTjogZ2V0X21lbXBvbGljeSgu
Li4pIHJldHVybmVkIGludmFsaWQgbm9kZSA4CnRzdF9udW1hLmM6OTI6IFdBUk46IGdldF9tZW1w
b2xpY3koLi4uKSByZXR1cm5lZCBpbnZhbGlkIG5vZGUgOAouLi4KdHN0X251bWEuYzoyNjogSU5G
TzogTm9kZSAwIGFsbG9jYXRlZCAwIHBhZ2VzCnRzdF9udW1hLmM6MjY6IElORk86IE5vZGUgOCBh
bGxvY2F0ZWQgMCBwYWdlcwpzZXRfbWVtcG9saWN5MDEuYzo4NjogRkFJTDogY2hpbGQ6IE5vZGUg
OCBhbGxvY2F0ZWQgMCwgZXhwZWN0ZWQgMTYKCmxzY3B1Ci0tLS0tCkFyY2hpdGVjdHVyZTogICAg
ICAgIHBwYzY0bGUKLi4uCkNQVShzKTogICAgICAgICAgICAgIDEyOApDb3JlKHMpIHBlciBzb2Nr
ZXQ6ICAxNgpTb2NrZXQocyk6ICAgICAgICAgICAyCk5VTUEgbm9kZShzKTogICAgICAgIDIKTW9k
ZWwgbmFtZTogICAgICAgICAgUE9XRVI5LCBhbHRpdmVjIHN1cHBvcnRlZAouLi4KTlVNQSBub2Rl
MCBDUFUocyk6ICAgMC02MwpOVU1BIG5vZGU4IENQVShzKTogICA2NC0xMjcKClNpZ25lZC1vZmYt
Ynk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgpDYzogQ3lyaWwgSHJ1YmlzIDxjaHJ1Ymlz
QHN1c2UuY3o+Ci0tLQogbGlicy9saWJsdHBudW1hL3RzdF9udW1hLmMgfCA1ICsrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2xpYnMvbGlibHRwbnVtYS90c3RfbnVtYS5jIGIvbGlicy9saWJsdHBudW1hL3RzdF9udW1hLmMK
aW5kZXggMGJhNmRhZjM5Li41NmM4NjQwZmYgMTAwNjQ0Ci0tLSBhL2xpYnMvbGlibHRwbnVtYS90
c3RfbnVtYS5jCisrKyBiL2xpYnMvbGlibHRwbnVtYS90c3RfbnVtYS5jCkBAIC04OCw4ICs4OCw5
IEBAIHZvaWQgdHN0X25vZGVtYXBfY291bnRfcGFnZXMoc3RydWN0IHRzdF9ub2RlbWFwICpub2Rl
cywKIAkJaWYgKHJldCA8IDApCiAJCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAiZ2V0X21lbXBv
bGljeSgpIGZhaWxlZCIpOwogCi0JCWlmIChub2RlIDwgMCB8fCAodW5zaWduZWQgaW50KW5vZGUg
Pj0gbm9kZXMtPmNudCkgewotCQkJdHN0X3JlcyhUV0FSTiwgImdldF9tZW1wb2xpY3koLi4uKSBy
ZXR1cm5lZCBpbnZhbGlkIG5vZGUgJWlcbiIsIG5vZGUpOworCQlpZiAobm9kZSA8IDApIHsKKwkJ
CXRzdF9yZXMoVFdBUk4sCisJCQkJImdldF9tZW1wb2xpY3koLi4uKSByZXR1cm5lZCBpbnZhbGlk
IG5vZGUgJWlcbiIsIG5vZGUpOwogCQkJY29udGludWU7CiAJCX0KIAotLSAKMi4yMC4xCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
