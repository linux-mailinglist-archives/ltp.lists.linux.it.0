Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416E384D2
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 09:18:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3F733EA6D8
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 09:18:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F3F7B3EA5E4
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 09:18:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 17184601251
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 09:18:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3725AED7;
 Fri,  7 Jun 2019 07:18:02 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Jun 2019 09:17:51 +0200
Message-Id: <20190607071751.9225-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Christian Amann <camann@suse.de>
Subject: [LTP] [PATCH 1/1] lib: Document the endianity in
	tst_get_unused_port()
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

VG8gcHJldmVudCBjb25mdXNpbmcgWzFdOgoKICAgIGlmIHlvdSB3YW50IHRvIHByaW50IHRoZSBw
b3J0IHlvdSBhY3R1YWxseSBoYXZlIHRvIHVzZQogICAgbnRvaHMoKSBmdW5jdGlvbiB0byBjb252
ZXJ0IGl0IHRvIHRoZSBob3N0IGVuZGlhbml0eS4gQW5kIGlmIHlvdSBhcmUKICAgIHBhc3Npbmcg
dGhhdCB2YWx1ZSBpbiB0aGUgc29ja2FkZHJfaW4gc3RydWN0dXJlIHlvdSBtdXN0IG5vdCB1c2Ug
dGhlCiAgICBodG9ucygpIHNpbmNlIHRoZSB2YWx1ZSBpcyBhbHJlYWR5IGluIHRoZSBjb3JyZWN0
IGJ5dGUgb3JkZXIuCgpbMV0gaHR0cDovL2xpc3RzLmxpbnV4Lml0L3BpcGVybWFpbC9sdHAvMjAx
OS1KdW5lLzAxMjI4OS5odG1sCgpTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3Vz
ZS5jej4KLS0tCiBsaWIvc2FmZV9uZXQuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL3NhZmVfbmV0LmMgYi9saWIvc2FmZV9uZXQuYwpp
bmRleCA5NzBhMmFiYTMuLmFiZWJkMTg5OSAxMDA2NDQKLS0tIGEvbGliL3NhZmVfbmV0LmMKKysr
IGIvbGliL3NhZmVfbmV0LmMKQEAgLTM3Myw2ICszNzMsOSBAQCBpbnQgc2FmZV9nZXRob3N0bmFt
ZShjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLAogCXJldHVybiBydmFsOwogfQog
CisvKgorICogQHJldHVybiBwb3J0IGluIG5ldHdvcmsgYnl0ZSBvcmRlci4KKyAqLwogdW5zaWdu
ZWQgc2hvcnQgdHN0X2dldF91bnVzZWRfcG9ydChjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQg
bGluZW5vLAogCSAgICAgIHZvaWQgKGNsZWFudXBfZm4pKHZvaWQpLCB1bnNpZ25lZCBzaG9ydCBm
YW1pbHksIGludCB0eXBlKQogewotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
