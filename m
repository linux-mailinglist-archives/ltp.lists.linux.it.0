Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E80B2D6
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Apr 2019 07:52:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA8933EA20F
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Apr 2019 07:52:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 058253EA0B7
 for <ltp@lists.linux.it>; Sat, 27 Apr 2019 07:52:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 693761A0122B
 for <ltp@lists.linux.it>; Sat, 27 Apr 2019 07:52:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9AAE6AE20
 for <ltp@lists.linux.it>; Sat, 27 Apr 2019 05:52:17 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Sat, 27 Apr 2019 07:52:10 +0200
Message-Id: <20190427055210.11697-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] net: Use $TST_IPVER in tst_icmp() and
	tst_ipsec_vti()
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

U2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQogdGVzdGNhc2Vz
L2xpYi90c3RfbmV0LnNoICAgICAgICAgICAgICAgICAgICB8IDcgKysrLS0tLQogdGVzdGNhc2Vz
L25ldHdvcmsvc3RyZXNzL2lwc2VjL2lwc2VjX2xpYi5zaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9saWIvdHN0X25ldC5zaCBiL3Rlc3RjYXNlcy9saWIvdHN0X25ldC5zaAppbmRleCA2OWQxOTZm
NzguLjY5MjI3ODM2MSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2xpYi90c3RfbmV0LnNoCisrKyBi
L3Rlc3RjYXNlcy9saWIvdHN0X25ldC5zaApAQCAtNjY5LDcgKzY2OSw2IEBAIHRzdF9pY21wKCkK
IAlsb2NhbCBvcHRzPQogCWxvY2FsIG51bT0KIAlsb2NhbCByZXQ9MAotCWxvY2FsIHZlcj0iJHtU
U1RfSVBWNjotNH0iCiAKIAlPUFRJTkQ9MAogCXdoaWxlIGdldG9wdHMgOnQ6czogb3B0OyBkbwpA
QCAtNjg5LDEyICs2ODgsMTIgQEAgdHN0X2ljbXAoKQogCW9wdHM9IiR7b3B0c30tTSAkKHRzdF9o
d2FkZHIgcmhvc3QpIC10ICR0aW1lb3V0IgogCiAJZm9yIHNpemUgaW4gJG1zZ19zaXplczsgZG8K
LQkJbnMtaWNtcHYke3Zlcn1fc2VuZGVyIC1zICRzaXplICRvcHRzCisJCW5zLWljbXB2JHtUU1Rf
SVBWRVJ9X3NlbmRlciAtcyAkc2l6ZSAkb3B0cwogCQlyZXQ9JD8KIAkJaWYgWyAkcmV0IC1lcSAw
IF07IHRoZW4KLQkJCXRzdF9yZXNfIFRQQVNTICInbnMtaWNtcHYke3Zlcn1fc2VuZGVyIC1zICRz
aXplICRvcHRzJyBwYXNzIgorCQkJdHN0X3Jlc18gVFBBU1MgIiducy1pY21wdiR7VFNUX0lQVkVS
fV9zZW5kZXIgLXMgJHNpemUgJG9wdHMnIHBhc3MiCiAJCWVsc2UKLQkJCXRzdF9yZXNfIFRGQUlM
ICInbnMtaWNtcHYke3Zlcn1fc2VuZGVyIC1zICRzaXplICRvcHRzJyBmYWlsIgorCQkJdHN0X3Jl
c18gVEZBSUwgIiducy1pY21wdiR7VFNUX0lQVkVSfV9zZW5kZXIgLXMgJHNpemUgJG9wdHMnIGZh
aWwiCiAJCQlicmVhawogCQlmaQogCWRvbmUKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9uZXR3b3Jr
L3N0cmVzcy9pcHNlYy9pcHNlY19saWIuc2ggYi90ZXN0Y2FzZXMvbmV0d29yay9zdHJlc3MvaXBz
ZWMvaXBzZWNfbGliLnNoCmluZGV4IDc0ZDRmYzBjYi4uZDQwOTQxZDQ1IDEwMDY0NAotLS0gYS90
ZXN0Y2FzZXMvbmV0d29yay9zdHJlc3MvaXBzZWMvaXBzZWNfbGliLnNoCisrKyBiL3Rlc3RjYXNl
cy9uZXR3b3JrL3N0cmVzcy9pcHNlYy9pcHNlY19saWIuc2gKQEAgLTI0NSw3ICsyNDUsNyBAQCB0
c3RfaXBzZWNfdnRpKCkKIAogCWxvY2FsIG9fZGlyPSJzcmMgJHNyYyBkc3QgJGRzdCIKIAlsb2Nh
bCBpX2Rpcj0ic3JjICRkc3QgZHN0ICRzcmMiCi0JbG9jYWwgaXB4PSJpcCAtJHtUU1RfSVBWNjot
NH0geGYiCisJbG9jYWwgaXB4PSJpcCAtJFRTVF9JUFZFUiB4ZiIKIAogCWNsZWFudXBfdnRpPSR2
dGkKIAotLSAKMi4yMC4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
