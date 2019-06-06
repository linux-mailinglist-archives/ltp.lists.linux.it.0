Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A4376B7
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 16:30:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6F7D3EAA00
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 16:30:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DCA923EA9CC
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 16:30:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 107271401AED
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 16:30:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 153EBAFE3;
 Thu,  6 Jun 2019 14:30:22 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  6 Jun 2019 16:30:17 +0200
Message-Id: <20190606143017.2233-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] shell: Fix tst_get_unused_port endianity
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

dHN0X2dldF91bnVzZWRfcG9ydCBpcyBhIHNoZWxsIGhlbHBlciwgdGhlcmVmb3JlIGl0IHNob3Vs
ZCB1c2UgaG9zdApieXRlIG9yZGVyICh3ZSdyZSBub3QgZXhwZWN0aW5nIHRoaXMgdmFsdWUgd291
bGQgYmUgYWRkZWQgZGlyZWN0bHkgdG8Kc29ja2FkZHJfaW4gc3RydWN0dXJlLCB3aGljaCByZXF1
aXJlIG5ldHdvcmsgYnl0ZSBvcmRlcikuCldyYXAgVFNUX0dFVF9VTlVTRURfUE9SVCgpIHdpdGgg
bnRvaHMoKSB0byBhY2hpZXZlIGl0LgoKUmVwb3J0ZWQtYnk6IENocmlzdGlhbiBBbWFubiA8Y2Ft
YW5uQHN1c2UuY29tPgpTdWdnZXN0ZWQtYnk6IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6
PgpTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KLS0tCkhpLAoKSSBn
dWVzcyB3ZSBkaWRuJ3Qgbm90aWNlZCB0aGlzIGluIHNoZWxsIHNjcmlwdCBhcyBzZW5kZmlsZTAx
IGlzIHRoZSBvbmx5Cm9uZSBub3QgcmVxdWlyaW5nIHJvb3QgKGRucy1zdHJlc3MsIHRzdF9uZXRf
c3RyZXNzLnNoLCBzc2gtc3RyZXNzLCBzc2gtc3RyZXNzMDMtcm10IGRvIHJlcXVpcmUgaXQpLgoK
SSB0ZXN0ZWQgcGF0Y2ggd2l0aCBsaXR0bGUgc2NyaXB0IChjb3VsZCBiZSBlYXNpbHkgY29udmVy
dGVkIHRvIHByb3Blcgp0ZXN0IHBsYWNlZCBpbiBsaWIvbmV3bGliX3Rlc3RzLykKCmV4cG9ydCBQ
QVRIPSIvb3B0L2x0cC90ZXN0Y2FzZXMvYmluLzokUEFUSCIKaT0wCndoaWxlIFsgJGkgLWx0IDIw
NDggXTsgZG8KICAgIGZvciBqIGluIGlwdjQgaXB2NjsgZG8KICAgICAgICBmb3IgayBpbiBzdHJl
YW0gZGdyYW07IGRvCiAgICAgICAgICAgIHA9IiQodHN0X2dldF91bnVzZWRfcG9ydCAkaiAkayki
CiAgICAgICAgICAgIHByaW50ZiAiJGkgKCRqICRrKTogJHAgIgogICAgICAgICAgICBpZiBbICRw
IC1sdCAxMDI0IF07IHRoZW4KICAgICAgICAgICAgICAgIGVjaG8gIihiYWQpIgogICAgICAgICAg
ICAgICAgZXhpdCAxCiAgICAgICAgICAgIGVsc2UKICAgICAgICAgICAgICAgIGVjaG8gIihvayki
CiAgICAgICAgICAgIGZpCiAgICAgICAgZG9uZQogICAgZG9uZQogICAgaT0kKChpKzEpKQpkb25l
CmVjaG8gIlRlc3Qgd2FzIG9rIgoKIHRlc3RjYXNlcy9saWIvdHN0X2dldF91bnVzZWRfcG9ydC5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2xpYi90c3RfZ2V0X3VudXNlZF9wb3J0LmMgYi90ZXN0Y2Fz
ZXMvbGliL3RzdF9nZXRfdW51c2VkX3BvcnQuYwppbmRleCAwMTczZjE2MzQuLmE4NDNjYzZlMyAx
MDA2NDQKLS0tIGEvdGVzdGNhc2VzL2xpYi90c3RfZ2V0X3VudXNlZF9wb3J0LmMKKysrIGIvdGVz
dGNhc2VzL2xpYi90c3RfZ2V0X3VudXNlZF9wb3J0LmMKQEAgLTU0LDYgKzU0LDYgQEAgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJcmV0dXJuIDE7CiAJfQogCi0JcHJpbnRmKCIl
ZCIsIFRTVF9HRVRfVU5VU0VEX1BPUlQoZmFtaWx5LCB0eXBlKSk7CisJcHJpbnRmKCIlZCIsIG50
b2hzKFRTVF9HRVRfVU5VU0VEX1BPUlQoZmFtaWx5LCB0eXBlKSkpOwogCXJldHVybiAwOwogfQot
LSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
