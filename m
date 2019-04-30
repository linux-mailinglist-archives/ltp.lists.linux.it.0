Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E33FCFA9B
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:38:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7AE93EACA2
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:38:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B33CC3EACA0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:38:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 644611A01478
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:38:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C8F8AD85;
 Tue, 30 Apr 2019 13:38:49 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 30 Apr 2019 15:38:36 +0200
Message-Id: <20190430133836.28400-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190430133836.28400-1-chrubis@suse.cz>
References: <20190430133836.28400-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] Makefile: Fix target redefinition
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

VGhlcmUgaXMgbm8gbmVlZCB0byBhZGQgYSBydWxlIGZvciB0aGUgbGlicyBkaXJlY3RvcnkgYmVj
YXVzZSB0aGVyZSBpcyBhCmdlbmVyaWMgcnVsZSBmb3IgZGlyZWN0b3J5IGNyZWF0aW9uIGFscmVh
ZHkuIEFsbCB3ZSBuZWVkIHRvIGRvIGlzIHRvCm1ha2UgdGhlIGxpYnMtYWxsIHRhcmdldCBkZXBl
bmQgb24gdGhlIGRpcmVjdG9yeSBwYXRoLCB3aGljaCB3ZSBkbwphbHJlYWR5IHNvIHRoYXQgdGhl
IGRpcmVjdG9yeSBpcyBjcmVhdGVkIGJlZm9yZSB3ZSBhdHRlbXB0IHRvIGV4ZWN1dGUKbWFrZSB0
aGVyZS4KCkZpeGVzOiAxN2E1YjBmYjYzYmY2NWVmZjQzM2JkZWUzYmY1ZjczODI2YTUwZTBmCgpT
aWduZWQtb2ZmLWJ5OiBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4KQ0M6IFBldHIgVm9y
ZWwgPHB2b3JlbEBzdXNlLmN6PgpDQzogSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+
Ci0tLQogTWFrZWZpbGUgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQppbmRleCBjNDZkMDUwY2UuLjc2OGNhNDYw
NiAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTEwMiw5ICsxMDIsNiBA
QCAkKHNvcnQgJChhZGRwcmVmaXggJChhYnNfdG9wX2J1aWxkZGlyKS8sJChCT09UU1RSQVBfVEFS
R0VUUykpICQoSU5TVEFMTF9ESVIpICQoRAogIyMgUGF0dGVybiBiYXNlZCBzdWJ0YXJnZXQgcnVs
ZXMuCiBsaWItaW5zdGFsbDogbGliLWFsbAogCi0kKGFic190b3BfYnVpbGRkaXIpL2xpYnM6Ci0J
bWtkaXIgLW0gMDA3NTUgLXAgIiRAIgotCiBsaWJzLWFsbDogJChhYnNfdG9wX2J1aWxkZGlyKS9s
aWJzCiAKICQoTUFLRV9UQVJHRVRTKSBpbmNsdWRlLWFsbCBsaWItYWxsIGxpYnMtYWxsOgotLSAK
Mi4xOS4yCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
