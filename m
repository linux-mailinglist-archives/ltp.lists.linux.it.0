Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF69C2C863
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:13:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4C40294ADD
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:13:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 011F83EA4DB
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:12:58 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 61EE91401445
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:12:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6EA2630C1AFB;
 Tue, 28 May 2019 14:12:53 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1F845C26A;
 Tue, 28 May 2019 14:12:41 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: amir73il@gmail.com
Date: Tue, 28 May 2019 22:12:11 +0800
Message-Id: <20190528141214.18752-1-xzhou@redhat.com>
In-Reply-To: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 28 May 2019 14:12:53 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v6 1/4] lib/tst_ioctl.c: add helper tst_fibmap
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

VG8gY2hlY2sgaWYgRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZCBvbiB0aGUgZmlsZXN5c3RlbSB3
ZSBhcmUKdGVzdGluZyBvbi4gSXQgYWxzbyBjYW4gY2hlY2sgdGhlIHN1cHBvcnQgc3RhdHVzIG9m
IHNwZWNpZmljCmZpbGVzLCBidXQgdGhhdCBtYXkgbm90IG5lZWRlZCBmb3Igbm93LgoKU2lnbmVk
LW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5jb20+Ci0tLQp2NjoKICBNb2RpZnkg
bWFrZV9zd2FwZmlsZSgpIHRvIGNoZWNrIG1rc3dhcCBzdXBwb3J0IHN0YXR1cyBzYWZlbHkKICBS
ZW1vdmUgd2hpdGVsaXN0CiAgUmVtb3ZlIEJUUkZTIEVJTlZBTCBjaGVjawogIENoZWNrIG1rc3dh
cCBzdGF0dXMgYmVmb3JlIHRlc3Rpbmcgc3dhcG9uIGluIGhlbHBlcgogIElmIHN3YXBvbiBwYXNz
LCBmb2xsb3dpbmcgc3dhcG9mZiBmYWlsdXJlIHdpbGwgZmFpbCB0aGUgd2hvbGUgdGVzdCBhbmQg
YnJlYWsKICBBbHNvIG1vZGlmeSBzd2Fwb2ZmMDIgdG8gcmVtb3ZlIHdoaXRlbGlzdCBjb21wbGV0
ZWx5CnY1OgogIFNwbGl0IHRvIDQgcGF0Y2hlcwogIE9ubHkgdGFrZSBvbmUgZmlsZW5hbWUgcGFy
YW1ldGVyIGluIHRzdF9maWJtYXAKICBBZGQgaGVscGVyIGlzX3N3YXBfc3VwcG9ydGVkIHRvIGNo
ZWNrIHN3YXAgb3BlcmF0aW9uIHN1cHBvcnQgc3RhdHVzCiAgVGVzdCBmaWJtYXAvc3dhcG9uIGFu
ZCBzd2Fwb2ZmIG9wZXJhdGlvbiBpbiB0aGUgaGVscGVyCiAgS2VlcCBORlMvVE1QRlMgd2hpdGVs
aXN0CiAgS2VlcCBCVFJGUyBFSU5WQUwgaGFuZGxpbmcgbG9naWMsIGV4Y2VwdCBhYm92ZSAyIHNp
dHVhdGlvbjoKICAgIGlmIHN3YXBvbiBmYWlscyBhbmQgZmlibWFwIGlzIG5vdCBzdXBwb3J0ZWQs
IHRzdF9icmsgd2l0aCBUQ09ORgogICAgaWYgc3dhcG9uIGZhaWxzIGFuZCBmaWJtYXAgaXMgc3Vw
cG9ydGVkLCB0c3RfYnJrIHdpdGggVEZBSUwKICBJZiBzd2Fwb24gdGVzdCBwYXNzIGluIHRoZSBo
ZWxwZXIsIHRlc3Qgc3dhcG9mZiBzaW1pbGFybHkKICBQdXQgaXNfc3dhcF9zdXBwb3J0ZWQgaGVs
cGVyIGluIGxpYnN3YXBvbiwgbGluayBzd2Fwb2ZmIGJpbmFyaWVzIHRvIGl0CiAgTXV0ZSBhIHNw
cmludGYgZmlsYW5hbWUgd2Fucm5pbmcgYnkgdGhlIHdheQp2NDoKICBGYWlsIHNvZnRseSBpZiBG
SUJNQVAgbml0IHN1cHBvcnRlZCwgaW5zdGVhZCBvZiBza2lwIGVudGlyZSB0ZXN0Y2FzZQp2MzoK
ICBGaXggZnNfdHlwZSB1bmRlY2xhcmVkIGluIHN3YXBvZmYwMS5jCnYyOgogIFRlc3QgRklCTUFQ
IGluc3RlYWQgb2YgZnN0eXBlIHdoaXRlbGlzdAoKIGluY2x1ZGUvdHN0X2ZzLmggfCAgNSArKysr
KwogbGliL3RzdF9pb2N0bC5jICB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGxpYi90c3RfaW9jdGwuYwoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X2ZzLmggYi9pbmNs
dWRlL3RzdF9mcy5oCmluZGV4IGViY2EwNjVjNi4uNmQwMzM3MWVjIDEwMDY0NAotLS0gYS9pbmNs
dWRlL3RzdF9mcy5oCisrKyBiL2luY2x1ZGUvdHN0X2ZzLmgKQEAgLTE3OCw2ICsxNzgsMTEgQEAg
Y29uc3QgY2hhciAqKnRzdF9nZXRfc3VwcG9ydGVkX2ZzX3R5cGVzKHZvaWQpOwogICovCiB2b2lk
IHRzdF9maWxsX2ZzKGNvbnN0IGNoYXIgKnBhdGgsIGludCB2ZXJib3NlKTsKIAorLyoKKyAqIHRl
c3QgaWYgRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZAorICovCitpbnQgdHN0X2ZpYm1hcChjb25z
dCBjaGFyICpmaWxlbmFtZSk7CisKICNpZmRlZiBUU1RfVEVTVF9IX18KIHN0YXRpYyBpbmxpbmUg
bG9uZyB0c3RfZnNfdHlwZShjb25zdCBjaGFyICpwYXRoKQogewpkaWZmIC0tZ2l0IGEvbGliL3Rz
dF9pb2N0bC5jIGIvbGliL3RzdF9pb2N0bC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMC4uMzhhYTkzN2RiCi0tLSAvZGV2L251bGwKKysrIGIvbGliL3RzdF9pb2N0bC5jCkBA
IC0wLDAgKzEsMzcgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxh
dGVyCisKKyNpbmNsdWRlIDxlcnJuby5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVkZSA8
c3RkbGliLmg+CisjaW5jbHVkZSA8c3lzL2lvY3RsLmg+CisjaW5jbHVkZSA8bGludXgvZnMuaD4K
KworI2RlZmluZSBUU1RfTk9fREVGQVVMVF9NQUlOCisKKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgor
CitpbnQgdHN0X2ZpYm1hcChjb25zdCBjaGFyICpmaWxlbmFtZSkKK3sKKwkvKiB0ZXN0IGlmIEZJ
Qk1BUCBpb2N0bCBpcyBzdXBwb3J0ZWQgKi8KKwlpbnQgZmQsIGJsb2NrID0gMDsKKworCWZkID0g
b3BlbihmaWxlbmFtZSwgT19SRFdSIHwgT19DUkVBVCwgMDY2Nik7CisJaWYgKGZkIDwgMCkgewor
CQl0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLAorCQkJICJvcGVuKCVzLCBPX1JEV1IgfCBPX0NSRUFU
LCAwNjY2KSBmYWlsZWQiLCBmaWxlbmFtZSk7CisJCXJldHVybiAxOworCX0KKworCWlmIChpb2N0
bChmZCwgRklCTUFQLCAmYmxvY2spKSB7CisJCXRzdF9yZXMoVElORk8sICJGSUJNQVAgaW9jdGwg
aXMgTk9UIHN1cHBvcnRlZCIpOworCQljbG9zZShmZCk7CisJCXJldHVybiAxOworCX0KKwl0c3Rf
cmVzKFRJTkZPLCAiRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZCIpOworCisJaWYgKGNsb3NlKGZk
KSkgeworCQl0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAiY2xvc2UoZmQpIGZhaWxlZCIpOworCQly
ZXR1cm4gMTsKKwl9CisJcmV0dXJuIDA7Cit9Ci0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
