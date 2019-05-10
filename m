Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4ED197BC
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 06:39:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 613793EA0B7
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 06:39:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B98843EA05E
 for <ltp@lists.linux.it>; Fri, 10 May 2019 06:38:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B3F24200B0B
 for <ltp@lists.linux.it>; Fri, 10 May 2019 06:38:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77CAEC05E760;
 Fri, 10 May 2019 04:38:52 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 995CC60BFB;
 Fri, 10 May 2019 04:38:51 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 10 May 2019 12:38:45 +0800
Message-Id: <20190510043845.4977-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 10 May 2019 04:38:52 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: linux-cifs@vger.kernel.org
Subject: [LTP] [PATCH] safe_setuid: skip if testing on CIFS
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

QXMgQ0lGUyBpcyBub3Qgc3VwcG9ydGluZyBzZXR1aWQgb3BlcmF0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvdHN0X2ZzLmgg
ICAgICB8ICAxICsKIGxpYi9zYWZlX21hY3Jvcy5jICAgICB8IDE2ICsrKysrKysrKysrKysrKysK
IGxpYi90c3RfZnNfdHlwZS5jICAgICB8ICAyICsrCiBsaWIvdHN0X3NhZmVfbWFjcm9zLmMgfCAg
OCArKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS90c3RfZnMuaCBiL2luY2x1ZGUvdHN0X2ZzLmgKaW5kZXggNDIzY2E4MmVjLi41
MDI1ZjA0NTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdHN0X2ZzLmgKKysrIGIvaW5jbHVkZS90c3Rf
ZnMuaApAQCAtNDIsNiArNDIsNyBAQAogI2RlZmluZSBUU1RfTklMRlNfTUFHSUMgICAgMHgzNDM0
CiAjZGVmaW5lIFRTVF9FWE9GU19NQUdJQyAgICAweDVERjUKICNkZWZpbmUgVFNUX09WRVJMQVlG
U19NQUdJQyAweDc5NGM3NjMwCisjZGVmaW5lIFRTVF9DSUZTX01BR0lDICAgICAweGZlNTM0ZDQy
CiAKIGVudW0gewogCVRTVF9CWVRFUyA9IDEsCmRpZmYgLS1naXQgYS9saWIvc2FmZV9tYWNyb3Mu
YyBiL2xpYi9zYWZlX21hY3Jvcy5jCmluZGV4IGJhYzM0Y2RiNy4uYzNiYTFkNWJlIDEwMDY0NAot
LS0gYS9saWIvc2FmZV9tYWNyb3MuYworKysgYi9saWIvc2FmZV9tYWNyb3MuYwpAQCAtMjc3LDYg
KzI3NywxNCBAQCBpbnQgc2FmZV9zZXRldWlkKGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBs
aW5lbm8sIHZvaWQgKCpjbGVhbnVwX2ZuKSAodm9pZCksCiAgICAgICAgICAgICAgICAgIHVpZF90
IGV1aWQpCiB7CiAJaW50IHJ2YWw7CisJbG9uZyBmc190eXBlOworCisJZnNfdHlwZSA9IHRzdF9m
c190eXBlKE5VTEwsICIuIik7CisJaWYgKGZzX3R5cGUgPT0gVFNUX0NJRlNfTUFHSUMpIHsKKwkJ
dHN0X2Jya20oVENPTkYsIGNsZWFudXBfZm4sCisJCQkgInNldGV1aWQgaXMgbm90IHN1cHBvcnRl
ZCBvbiAlcyBmaWxlc3lzdGVtIiwKKwkJCSB0c3RfZnNfdHlwZV9uYW1lKGZzX3R5cGUpKTsKKwl9
CiAKIAlydmFsID0gc2V0ZXVpZChldWlkKTsKIAlpZiAocnZhbCA9PSAtMSkgewpAQCAtMzA3LDYg
KzMxNSwxNCBAQCBpbnQgc2FmZV9zZXR1aWQoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxp
bmVubywgdm9pZCAoKmNsZWFudXBfZm4pICh2b2lkKSwKICAgICAgICAgICAgICAgICB1aWRfdCB1
aWQpCiB7CiAJaW50IHJ2YWw7CisJbG9uZyBmc190eXBlOworCisJZnNfdHlwZSA9IHRzdF9mc190
eXBlKE5VTEwsICIuIik7CisJaWYgKGZzX3R5cGUgPT0gVFNUX0NJRlNfTUFHSUMpIHsKKwkJdHN0
X2Jya20oVENPTkYsIGNsZWFudXBfZm4sCisJCQkgInNldHVpZCBpcyBub3Qgc3VwcG9ydGVkIG9u
ICVzIGZpbGVzeXN0ZW0iLAorCQkJIHRzdF9mc190eXBlX25hbWUoZnNfdHlwZSkpOworCX0KIAog
CXJ2YWwgPSBzZXR1aWQodWlkKTsKIAlpZiAocnZhbCA9PSAtMSkgewpkaWZmIC0tZ2l0IGEvbGli
L3RzdF9mc190eXBlLmMgYi9saWIvdHN0X2ZzX3R5cGUuYwppbmRleCAxZDBhYzk2NjkuLmVlYTdj
NWQ0YiAxMDA2NDQKLS0tIGEvbGliL3RzdF9mc190eXBlLmMKKysrIGIvbGliL3RzdF9mc190eXBl
LmMKQEAgLTg0LDYgKzg0LDggQEAgY29uc3QgY2hhciAqdHN0X2ZzX3R5cGVfbmFtZShsb25nIGZf
dHlwZSkKIAkJcmV0dXJuICJFWE9GUyI7CiAJY2FzZSBUU1RfT1ZFUkxBWUZTX01BR0lDOgogCQly
ZXR1cm4gIk9WRVJMQVlGUyI7CisJY2FzZSBUU1RfQ0lGU19NQUdJQzoKKwkJcmV0dXJuICJDSUZT
IjsKIAlkZWZhdWx0OgogCQlyZXR1cm4gIlVua25vd24iOwogCX0KZGlmZiAtLWdpdCBhL2xpYi90
c3Rfc2FmZV9tYWNyb3MuYyBiL2xpYi90c3Rfc2FmZV9tYWNyb3MuYwppbmRleCAwZTU5YTNmOTgu
LjM2OTQxZWMwYiAxMDA2NDQKLS0tIGEvbGliL3RzdF9zYWZlX21hY3Jvcy5jCisrKyBiL2xpYi90
c3Rfc2FmZV9tYWNyb3MuYwpAQCAtMTExLDYgKzExMSw3IEBAIGludCBzYWZlX3NldHJldWlkKGNv
bnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8sCiAJCSAgdWlkX3QgcnVpZCwgdWlkX3Qg
ZXVpZCkKIHsKIAlpbnQgcnZhbDsKKwlsb25nIGZzX3R5cGU7CiAKIAlydmFsID0gc2V0cmV1aWQo
cnVpZCwgZXVpZCk7CiAJaWYgKHJ2YWwgPT0gLTEpIHsKQEAgLTExOSw2ICsxMjAsMTMgQEAgaW50
IHNhZmVfc2V0cmV1aWQoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywKIAkJCSAo
bG9uZylydWlkLCAobG9uZylldWlkKTsKIAl9CiAKKwlmc190eXBlID0gdHN0X2ZzX3R5cGUoIi4i
KTsKKwlpZiAoZnNfdHlwZSA9PSBUU1RfQ0lGU19NQUdJQykgeworCQl0c3RfYnJrXyhmaWxlLCBs
aW5lbm8sIFRDT05GLAorCQkJICJzZXRyZXVpZCBpcyBub3Qgc3VwcG9ydGVkIG9uICVzIGZpbGVz
eXN0ZW0iLAorCQkJIHRzdF9mc190eXBlX25hbWUoZnNfdHlwZSkpOworCX0KKwogCXJldHVybiBy
dmFsOwogfQogCi0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
