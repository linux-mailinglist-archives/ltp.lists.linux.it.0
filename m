Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A218E49
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 18:41:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E83293EAC0A
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 18:41:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DE7D63EABD5
 for <ltp@lists.linux.it>; Thu,  9 May 2019 18:41:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4EB3B6010F6
 for <ltp@lists.linux.it>; Thu,  9 May 2019 18:41:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E4FBAD89;
 Thu,  9 May 2019 16:41:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 May 2019 18:41:24 +0200
Message-Id: <20190509164125.619-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_net_vars.c: Fix size for IPv4 address buffer
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

SU5FVF9BRERSU1RSTEVOIGlzIG1heGltdW0gSVB2NCBsZW5ndGggaW5jbHVkaW5nIHRoZSB0ZXJt
aW5hdGluZyBudWxsCmJ5dGUsIHRodXMgcmVtb3ZpbmcgKyAxIGZyb20gYnVmZmVyIHNpemUuCgpG
aXhlczogZDE4ZTEzNWQwICgibmV0d29yazogQWRkIHRvb2xzIGZvciBzZXR1cCBJUCByZWxhdGVk
IGVudmlyb25tZW50CnZhcmlhYmxlcyIpCgpTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9y
ZWxAc3VzZS5jej4KLS0tCiB0ZXN0Y2FzZXMvbGliL3RzdF9uZXRfdmFycy5jIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2xpYi90c3RfbmV0X3ZhcnMuYyBiL3Rlc3RjYXNlcy9saWIvdHN0X25l
dF92YXJzLmMKaW5kZXggZmM2M2YxMzk1Li5kYTlhNGU2NGMgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNl
cy9saWIvdHN0X25ldF92YXJzLmMKKysrIGIvdGVzdGNhc2VzL2xpYi90c3RfbmV0X3ZhcnMuYwpA
QCAtMTUzLDcgKzE1Myw3IEBAIHN0YXRpYyBpbnQgaXNfaW5fc3VibmV0X2lwdjYoY29uc3Qgc3Ry
dWN0IGluNl9hZGRyICpuZXR3b3JrLAogICovCiBzdGF0aWMgY2hhciAqZ2V0X2lwdjRfbmV0bWFz
ayh1bnNpZ25lZCBpbnQgcHJlZml4KQogewotCWNoYXIgYnVmW0lORVRfQUREUlNUUkxFTiArIDFd
OworCWNoYXIgYnVmW0lORVRfQUREUlNUUkxFTl07CiAJc3RydWN0IGluX2FkZHIgbWFzayA9IHBy
ZWZpeDJtYXNrKHByZWZpeCk7CiAKIAlpZiAocHJlZml4ID4gTUFYX0lQVjRfUFJFRklYKQpAQCAt
MjAwLDcgKzIwMCw3IEBAIHN0YXRpYyBjaGFyICpnZXRfaXB2NF9icm9hZGNhc3Qoc3RydWN0IGlu
X2FkZHIgaXAsIHVuc2lnbmVkIGludCBwcmVmaXgpCiB7CiAJc3RydWN0IGluX2FkZHIgbWFzayA9
IHByZWZpeDJtYXNrKHByZWZpeCk7CiAJc3RydWN0IGluX2FkZHIgYnJvYWRjYXN0OwotCWNoYXIg
YnVmW0lORVRfQUREUlNUUkxFTiArIDFdOworCWNoYXIgYnVmW0lORVRfQUREUlNUUkxFTl07CiAK
IAltZW1zZXQoJmJyb2FkY2FzdCwgMCwgc2l6ZW9mKGJyb2FkY2FzdCkpOwogCWJyb2FkY2FzdC5z
X2FkZHIgPSAoaXAuc19hZGRyICYgbWFzay5zX2FkZHIpIHwgfm1hc2suc19hZGRyOwpAQCAtNDcx
LDcgKzQ3MSw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3ByZWZpeF9yYW5nZSh1bnNpZ25lZCBpbnQg
cHJlZml4LCBpbnQgaXNfaXB2NiwgaW50IGlzX2xob3N0KQogCiBzdGF0aWMgY2hhciAqZ2V0X2lw
djRfbmV0d29yayhpbnQgaXAsIHVuc2lnbmVkIGludCBwcmVmaXgpCiB7Ci0JY2hhciBidWZbSU5F
VF9BRERSU1RSTEVOICsgMV07CisJY2hhciBidWZbSU5FVF9BRERSU1RSTEVOXTsKIAljaGFyICpw
X2J1ZiA9IGJ1ZjsKIAl1bnNpZ25lZCBjaGFyIGJ5dGU7CiAJdW5zaWduZWQgaW50IGk7Ci0tIAoy
LjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
