Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 782602BE60
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F23D3EA4E4
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CE66C3EA183
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:03 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BA1521401739
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6FFFE3086224;
 Tue, 28 May 2019 04:39:59 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7BD060BF4;
 Tue, 28 May 2019 04:39:58 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: chrubis@suse.cz
Date: Tue, 28 May 2019 12:39:26 +0800
Message-Id: <20190528043929.19671-1-xzhou@redhat.com>
In-Reply-To: <20190523135518.GF30616@rei.lan>
References: <20190523135518.GF30616@rei.lan>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 28 May 2019 04:39:59 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v5 1/4] lib/tst_ioctl.c: add helper tst_fibmap
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
LW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5jb20+Ci0tLQp2NToKICBTcGxpdCB0
byA0IHBhdGNoZXMKICBPbmx5IHRha2Ugb25lIGZpbGVuYW1lIHBhcmFtZXRlciBpbiB0c3RfZmli
bWFwCiAgQWRkIGhlbHBlciBpc19zd2FwX3N1cHBvcnRlZCB0byBjaGVjayBzd2FwIG9wZXJhdGlv
biBzdXBwb3J0IHN0YXR1cwogIFRlc3QgZmlibWFwL3N3YXBvbiBhbmQgc3dhcG9mZiBvcGVyYXRp
b24gaW4gdGhlIGhlbHBlcgogIEtlZXAgTkZTL1RNUEZTIHdoaXRlbGlzdAogIEtlZXAgQlRSRlMg
RUlOVkFMIGhhbmRsaW5nIGxvZ2ljLCBleGNlcHQgYWJvdmUgMiBzaXR1YXRpb246CiAgICBpZiBz
d2Fwb24gZmFpbHMgYW5kIGZpYm1hcCBpcyBub3Qgc3VwcG9ydGVkLCB0c3RfYnJrIHdpdGggVENP
TkYKICAgIGlmIHN3YXBvbiBmYWlscyBhbmQgZmlibWFwIGlzIHN1cHBvcnRlZCwgdHN0X2JyayB3
aXRoIFRGQUlMCiAgSWYgc3dhcG9uIHRlc3QgcGFzcyBpbiB0aGUgaGVscGVyLCB0ZXN0IHN3YXBv
ZmYgc2ltaWxhcmx5CiAgUHV0IGlzX3N3YXBfc3VwcG9ydGVkIGhlbHBlciBpbiBsaWJzd2Fwb24s
IGxpbmsgc3dhcG9mZiBiaW5hcmllcyB0byBpdAogIE11dGUgYSBzcHJpbnRmIGZpbGFuYW1lIHdh
bnJuaW5nIGJ5IHRoZSB3YXkKdjQ6CiAgRmFpbCBzb2Z0bHkgaWYgRklCTUFQIG5pdCBzdXBwb3J0
ZWQsIGluc3RlYWQgb2Ygc2tpcCBlbnRpcmUgdGVzdGNhc2UKdjM6CiAgRml4IGZzX3R5cGUgdW5k
ZWNsYXJlZCBpbiBzd2Fwb2ZmMDEuYwp2MjoKICBUZXN0IEZJQk1BUCBpbnN0ZWFkIG9mIGZzdHlw
ZSB3aGl0ZWxpc3QKCiBpbmNsdWRlL3RzdF9mcy5oIHwgIDUgKysrKysKIGxpYi90c3RfaW9jdGwu
YyAgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdHN0X2lvY3Rs
LmMKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF9mcy5oIGIvaW5jbHVkZS90c3RfZnMuaAppbmRl
eCBlYmNhMDY1YzYuLjZkMDMzNzFlYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS90c3RfZnMuaAorKysg
Yi9pbmNsdWRlL3RzdF9mcy5oCkBAIC0xNzgsNiArMTc4LDExIEBAIGNvbnN0IGNoYXIgKip0c3Rf
Z2V0X3N1cHBvcnRlZF9mc190eXBlcyh2b2lkKTsKICAqLwogdm9pZCB0c3RfZmlsbF9mcyhjb25z
dCBjaGFyICpwYXRoLCBpbnQgdmVyYm9zZSk7CiAKKy8qCisgKiB0ZXN0IGlmIEZJQk1BUCBpb2N0
bCBpcyBzdXBwb3J0ZWQKKyAqLworaW50IHRzdF9maWJtYXAoY29uc3QgY2hhciAqZmlsZW5hbWUp
OworCiAjaWZkZWYgVFNUX1RFU1RfSF9fCiBzdGF0aWMgaW5saW5lIGxvbmcgdHN0X2ZzX3R5cGUo
Y29uc3QgY2hhciAqcGF0aCkKIHsKZGlmZiAtLWdpdCBhL2xpYi90c3RfaW9jdGwuYyBiL2xpYi90
c3RfaW9jdGwuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjM4YWE5Mzdk
YgotLS0gL2Rldi9udWxsCisrKyBiL2xpYi90c3RfaW9jdGwuYwpAQCAtMCwwICsxLDM3IEBACisv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCisjaW5jbHVkZSA8
ZXJybm8uaD4KKyNpbmNsdWRlIDxzdGRpby5oPgorI2luY2x1ZGUgPHN0ZGxpYi5oPgorI2luY2x1
ZGUgPHN5cy9pb2N0bC5oPgorI2luY2x1ZGUgPGxpbnV4L2ZzLmg+CisKKyNkZWZpbmUgVFNUX05P
X0RFRkFVTFRfTUFJTgorCisjaW5jbHVkZSAidHN0X3Rlc3QuaCIKKworaW50IHRzdF9maWJtYXAo
Y29uc3QgY2hhciAqZmlsZW5hbWUpCit7CisJLyogdGVzdCBpZiBGSUJNQVAgaW9jdGwgaXMgc3Vw
cG9ydGVkICovCisJaW50IGZkLCBibG9jayA9IDA7CisKKwlmZCA9IG9wZW4oZmlsZW5hbWUsIE9f
UkRXUiB8IE9fQ1JFQVQsIDA2NjYpOworCWlmIChmZCA8IDApIHsKKwkJdHN0X3JlcyhUV0FSTiB8
IFRFUlJOTywKKwkJCSAib3BlbiglcywgT19SRFdSIHwgT19DUkVBVCwgMDY2NikgZmFpbGVkIiwg
ZmlsZW5hbWUpOworCQlyZXR1cm4gMTsKKwl9CisKKwlpZiAoaW9jdGwoZmQsIEZJQk1BUCwgJmJs
b2NrKSkgeworCQl0c3RfcmVzKFRJTkZPLCAiRklCTUFQIGlvY3RsIGlzIE5PVCBzdXBwb3J0ZWQi
KTsKKwkJY2xvc2UoZmQpOworCQlyZXR1cm4gMTsKKwl9CisJdHN0X3JlcyhUSU5GTywgIkZJQk1B
UCBpb2N0bCBpcyBzdXBwb3J0ZWQiKTsKKworCWlmIChjbG9zZShmZCkpIHsKKwkJdHN0X3JlcyhU
V0FSTiB8IFRFUlJOTywgImNsb3NlKGZkKSBmYWlsZWQiKTsKKwkJcmV0dXJuIDE7CisJfQorCXJl
dHVybiAwOworfQotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
