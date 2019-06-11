Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D353C561
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:48:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 568CF3EB001
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:48:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C9B923EAEBE
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:31 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9A98A6009B3
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C37F30860B7;
 Tue, 11 Jun 2019 07:48:29 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8CA85C22E;
 Tue, 11 Jun 2019 07:48:26 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: liwang@redhat.com
Date: Tue, 11 Jun 2019 15:47:38 +0800
Message-Id: <20190611074741.31903-1-xzhou@redhat.com>
In-Reply-To: <CAEemH2e5b4q+bOeE3v8FG-piSUteCinPMVmxpnkVcYCmrUc4Uw@mail.gmail.com>
References: <CAEemH2e5b4q+bOeE3v8FG-piSUteCinPMVmxpnkVcYCmrUc4Uw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 11 Jun 2019 07:48:29 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Subject: [LTP] [PATCH v7 1/4] lib/tst_ioctl.c: add helper tst_fibmap
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

VG8gY2hlY2sgaWYgRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZCBieSB0aGUgZmlsZXN5c3RlbSB3
ZSBhcmUKdGVzdGluZyBvbi4gSXQgYWxzbyBjYW4gY2hlY2sgdGhlIHN1cHBvcnQgc3RhdHVzIG9m
IHNwZWNpZmljCmZpbGVzLCBidXQgdGhhdCBtYXkgbm90IG5lZWRlZCBmb3Igbm93LgoKUmV2aWV3
ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNdXJwaHkg
WmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCnY3OgogIE1ha2UgdHN0X2ZpYm1hcCByZXR1cm4g
dmFsdWUgbW9yZSBhY2N1cmF0ZQogIFByaW50IGVycm5vIGlmIGZpYm1hcCBpb2N0bCBkb2VzIG5v
dCBzdWNjZWVkCiAgTWFrZSBzd2Fwb2ZmMDIgdXNlIG5ldyBoZWxwZXIKICBNdXRlIHNvbWUgYnVp
bGQgd2Fybm5pbmdzCiAgY2MgbGludXgtZnNkZXZlbCBsaXN0CiAgT3ZlcmFsbCBkaWZmIHN0YXQ6
CgogaW5jbHVkZS90c3RfZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsr
KysrCiBsaWIvdHN0X2lvY3RsLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlICAgICB8ICAzICsrLQogdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlLmluYyB8ICA2ICsrKysrKwogdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb2ZmL3N3YXBvZmYwMS5jICB8IDEwICsrLS0tLS0tLS0KIHRlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9zd2Fwb2ZmMDIuYyAgfCAxMSArKy0tLS0tLS0tLQog
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMgICB8IDQ1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmggICB8ICA3ICsrKysrKy0KIHRlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMgICAgfCAxMSArKy0tLS0tLS0tLQogdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYyAgICB8IDEzICsrKy0tLS0t
LS0tLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAzLmMgICAgfCAx
NSArKysrLS0tLS0tLS0tLS0KIDExIGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCA1
MSBkZWxldGlvbnMoLSkKCnY2OgogIE1vZGlmeSBtYWtlX3N3YXBmaWxlKCkgdG8gY2hlY2sgbWtz
d2FwIHN1cHBvcnQgc3RhdHVzIHNhZmVseQogIFJlbW92ZSB3aGl0ZWxpc3QKICBSZW1vdmUgQlRS
RlMgRUlOVkFMIGNoZWNrCiAgQ2hlY2sgbWtzd2FwIHN0YXR1cyBiZWZvcmUgdGVzdGluZyBzd2Fw
b24gaW4gaGVscGVyCiAgSWYgc3dhcG9uIHBhc3MsIGZvbGxvd2luZyBzd2Fwb2ZmIGZhaWx1cmUg
d2lsbCBmYWlsIHRoZSB3aG9sZSB0ZXN0IGFuZCBicmVhawogIEFsc28gbW9kaWZ5IHN3YXBvZmYw
MiB0byByZW1vdmUgd2hpdGVsaXN0IGNvbXBsZXRlbHkKdjU6CiAgU3BsaXQgdG8gNCBwYXRjaGVz
CiAgT25seSB0YWtlIG9uZSBmaWxlbmFtZSBwYXJhbWV0ZXIgaW4gdHN0X2ZpYm1hcAogIEFkZCBo
ZWxwZXIgaXNfc3dhcF9zdXBwb3J0ZWQgdG8gY2hlY2sgc3dhcCBvcGVyYXRpb24gc3VwcG9ydCBz
dGF0dXMKICBUZXN0IGZpYm1hcC9zd2Fwb24gYW5kIHN3YXBvZmYgb3BlcmF0aW9uIGluIHRoZSBo
ZWxwZXIKICBLZWVwIE5GUy9UTVBGUyB3aGl0ZWxpc3QKICBLZWVwIEJUUkZTIEVJTlZBTCBoYW5k
bGluZyBsb2dpYywgZXhjZXB0IGFib3ZlIDIgc2l0dWF0aW9uOgogICAgaWYgc3dhcG9uIGZhaWxz
IGFuZCBmaWJtYXAgaXMgbm90IHN1cHBvcnRlZCwgdHN0X2JyayB3aXRoIFRDT05GCiAgICBpZiBz
d2Fwb24gZmFpbHMgYW5kIGZpYm1hcCBpcyBzdXBwb3J0ZWQsIHRzdF9icmsgd2l0aCBURkFJTAog
IElmIHN3YXBvbiB0ZXN0IHBhc3MgaW4gdGhlIGhlbHBlciwgdGVzdCBzd2Fwb2ZmIHNpbWlsYXJs
eQogIFB1dCBpc19zd2FwX3N1cHBvcnRlZCBoZWxwZXIgaW4gbGlic3dhcG9uLCBsaW5rIHN3YXBv
ZmYgYmluYXJpZXMgdG8gaXQKICBNdXRlIGEgc3ByaW50ZiBmaWxhbmFtZSB3YW5ybmluZyBieSB0
aGUgd2F5CnY0OgogIEZhaWwgc29mdGx5IGlmIEZJQk1BUCBuaXQgc3VwcG9ydGVkLCBpbnN0ZWFk
IG9mIHNraXAgZW50aXJlIHRlc3RjYXNlCnYzOgogIEZpeCBmc190eXBlIHVuZGVjbGFyZWQgaW4g
c3dhcG9mZjAxLmMKdjI6CiAgVGVzdCBGSUJNQVAgaW5zdGVhZCBvZiBmc3R5cGUgd2hpdGVsaXN0
CgogaW5jbHVkZS90c3RfZnMuaCB8ICA1ICsrKysrCiBsaWIvdHN0X2lvY3RsLmMgIHwgMzcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0MiBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3RzdF9pb2N0bC5jCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS90c3RfZnMuaCBiL2luY2x1ZGUvdHN0X2ZzLmgKaW5kZXggZWJjYTA2NWM2
Li42ZDAzMzcxZWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdHN0X2ZzLmgKKysrIGIvaW5jbHVkZS90
c3RfZnMuaApAQCAtMTc4LDYgKzE3OCwxMSBAQCBjb25zdCBjaGFyICoqdHN0X2dldF9zdXBwb3J0
ZWRfZnNfdHlwZXModm9pZCk7CiAgKi8KIHZvaWQgdHN0X2ZpbGxfZnMoY29uc3QgY2hhciAqcGF0
aCwgaW50IHZlcmJvc2UpOwogCisvKgorICogdGVzdCBpZiBGSUJNQVAgaW9jdGwgaXMgc3VwcG9y
dGVkCisgKi8KK2ludCB0c3RfZmlibWFwKGNvbnN0IGNoYXIgKmZpbGVuYW1lKTsKKwogI2lmZGVm
IFRTVF9URVNUX0hfXwogc3RhdGljIGlubGluZSBsb25nIHRzdF9mc190eXBlKGNvbnN0IGNoYXIg
KnBhdGgpCiB7CmRpZmYgLS1naXQgYS9saWIvdHN0X2lvY3RsLmMgYi9saWIvdHN0X2lvY3RsLmMK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi4zNjQyMjBiY2QKLS0tIC9kZXYv
bnVsbAorKysgYi9saWIvdHN0X2lvY3RsLmMKQEAgLTAsMCArMSwzNyBAQAorLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKworI2luY2x1ZGUgPGVycm5vLmg+Cisj
aW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDxzeXMvaW9j
dGwuaD4KKyNpbmNsdWRlIDxsaW51eC9mcy5oPgorCisjZGVmaW5lIFRTVF9OT19ERUZBVUxUX01B
SU4KKworI2luY2x1ZGUgInRzdF90ZXN0LmgiCisKK2ludCB0c3RfZmlibWFwKGNvbnN0IGNoYXIg
KmZpbGVuYW1lKQoreworCS8qIHRlc3QgaWYgRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZCAqLwor
CWludCBmZCwgYmxvY2sgPSAwOworCisJZmQgPSBvcGVuKGZpbGVuYW1lLCBPX1JEV1IgfCBPX0NS
RUFULCAwNjY2KTsKKwlpZiAoZmQgPCAwKSB7CisJCXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sCisJ
CQkgIm9wZW4oJXMsIE9fUkRXUiB8IE9fQ1JFQVQsIDA2NjYpIGZhaWxlZCIsIGZpbGVuYW1lKTsK
KwkJcmV0dXJuIC0xOworCX0KKworCWlmIChpb2N0bChmZCwgRklCTUFQLCAmYmxvY2spKSB7CisJ
CXRzdF9yZXMoVElORk8gfCBURVJSTk8sICJGSUJNQVAgaW9jdGwgaXMgTk9UIHN1cHBvcnRlZCIp
OworCQljbG9zZShmZCk7CisJCXJldHVybiAxOworCX0KKwl0c3RfcmVzKFRJTkZPLCAiRklCTUFQ
IGlvY3RsIGlzIHN1cHBvcnRlZCIpOworCisJaWYgKGNsb3NlKGZkKSkgeworCQl0c3RfcmVzKFRX
QVJOIHwgVEVSUk5PLCAiY2xvc2UoZmQpIGZhaWxlZCIpOworCQlyZXR1cm4gLTE7CisJfQorCXJl
dHVybiAwOworfQotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
