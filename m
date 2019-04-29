Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2CE2FD
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 14:46:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 899B22B02ED
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 14:46:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 60F77294A93
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 14:46:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BFEC11000CC9
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 14:46:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86DFEAE1D;
 Mon, 29 Apr 2019 12:46:36 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 29 Apr 2019 14:46:30 +0200
Message-Id: <20190429124630.4834-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_net.sh: Remove -B option from tst_rhost_run()
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

VGhpcyBvcHRpb24gd2FzIGFkZGVkIGluIDZiY2Y3Y2UwNSAoImxpYjogdHN0X3Job3N0X3J1bjog
bmV3IG9wdGlvbiAtQgpmb3Igc2F2aW5nIGJhY2tncm91bmQgbG9nIikgYW5kIHVzZWQgaW4gdHN0
X2R1bXBfcmhvc3RfY21kKCkgYWRkZWQgaW4KOTIxZmIyZDJjICgibmV0d29yay90c3RfbmV0bG9h
ZDogZHVtcCBiYWNrZ3JvdW5kIG5ldHN0cmVzcyBvdXRwdXQgb24KZmFpbHVyZSIpLgpCdXQgZDZj
ZTMzYTJlICgibmV0c3RyZXNzOiBzZXQgcG9ydCBkeW5hbWljYWxseSBvbiB0aGUgc2VydmVyLXNp
ZGUiKQptb3ZlZCBsb2dnaW5nIGludG8gbmV0c3RyZXNzLmxvZywgY3JlYXRlZCBieSBuZXRzdHJl
c3MuYywgLUIgaXMgbm90CnVzZWQgYW55IG1vcmUuCgpOT1RFOiBpZiB0aGlzIGZlYXR1cmUgaXMg
cmVpbnRyb2R1Y2VkLCBpdCBzaG91bGQgY2hlY2sgd2hldGhlcgpUU1RfTkVFRFNfVE1QRElSPTEg
aXMgc2V0IChzaW1pbGFyIHRvIGZpeCBlM2ExYWExMDYgKCJuZXQvdHN0X25ldGxvYWQ6ClRCUk9L
IHdoZW4gVFNUX05FRURTX1RNUERJUiBub3Qgc2V0IikpLgoKU2lnbmVkLW9mZi1ieTogUGV0ciBW
b3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQogdGVzdGNhc2VzL2xpYi90c3RfbmV0LnNoIHwgOSAr
KystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2xpYi90c3RfbmV0LnNoIGIvdGVzdGNhc2VzL2xpYi90
c3RfbmV0LnNoCmluZGV4IDY5MjI3ODM2MS4uYzI3NDYwZjVmIDEwMDY0NAotLS0gYS90ZXN0Y2Fz
ZXMvbGliL3RzdF9uZXQuc2gKKysrIGIvdGVzdGNhc2VzL2xpYi90c3RfbmV0LnNoCkBAIC0xMjks
NyArMTI5LDYgQEAgaW5pdF9sdHBfbmV0c3BhY2UoKQogIyBSdW4gY29tbWFuZCBvbiByZW1vdGUg
aG9zdC4KICMgT3B0aW9uczoKICMgLWIgcnVuIGluIGJhY2tncm91bmQKLSMgLUIgcnVuIGluIGJh
Y2tncm91bmQgYW5kIHNhdmUgb3V0cHV0IHRvICRUU1RfVE1QRElSL2JnLmNtZAogIyAtcyBzYWZl
IG9wdGlvbiwgaWYgc29tZXRoaW5nIGdvZXMgd3JvbmcsIHdpbGwgZXhpdCB3aXRoIFRCUk9LCiAj
IC1jIHNwZWNpZnkgY29tbWFuZCB0byBydW4gKHRoaXMgbXVzdCBiZSBiaW5hcnksIG5vdCBzaGVs
bCBidWlsZGluL2Z1bmN0aW9uKQogIyBSRVRVUk46IDAgb24gc3VjY2VzcywgMSBvbiBmYWlsdXJl
CkBAIC0xNDEsMTUgKzE0MCwxMyBAQCB0c3Rfcmhvc3RfcnVuKCkKIAlsb2NhbCB1c2VyPSJyb290
IgogCWxvY2FsIGNtZD0KIAlsb2NhbCBzYWZlPTAKLQlsb2NhbCBiZz0KIAogCU9QVElORD0wCiAK
LQl3aGlsZSBnZXRvcHRzIDpiQnNjOnU6IG9wdDsgZG8KKwl3aGlsZSBnZXRvcHRzIDpic2M6dTog
b3B0OyBkbwogCQljYXNlICIkb3B0IiBpbgotCQlifEIpIFsgIiRUU1RfVVNFX05FVE5TIiBdICYm
IHByZV9jbWQ9IHx8IHByZV9jbWQ9Im5vaHVwIgotCQkgICBbICIkb3B0IiA9IGIgXSAmJiBiZz0i
L2Rldi9udWxsIiB8fCBiZz0iJFRTVF9UTVBESVIvYmcuY21kIgotCQkgICBwb3N0X2NtZD0iID4g
JGJnIDI+JjEgJiIKKwkJYikgWyAiJFRTVF9VU0VfTkVUTlMiIF0gJiYgcHJlX2NtZD0gfHwgcHJl
X2NtZD0ibm9odXAiCisJCSAgIHBvc3RfY21kPSIgPiAvZGV2L251bGwgMj4mMSAmIgogCQkgICBv
dXQ9IjE+IC9kZXYvbnVsbCIKIAkJOzsKIAkJcykgc2FmZT0xIDs7Ci0tIAoyLjIxLjAKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
