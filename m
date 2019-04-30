Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4AFA9A
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:38:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BB0E3EACA0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:38:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 19F2B3EA05E
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:38:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E2978200B17
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:38:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A6FFAD7B;
 Tue, 30 Apr 2019 13:38:46 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 30 Apr 2019 15:38:35 +0200
Message-Id: <20190430133836.28400-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] testcases.mk: Fix libs/ path for out-of-tree build
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

VGhlIHBhdGggdG8gdGhlIE1ha2VmaWxlIHdhcyBub3QgY29ycmVjdCBmb3IgdGhlIG91dC1vZi10
cmVlIGJ1aWxkCmJlY2F1c2UgaXQgd2FzIHBvaW50aW5nIHRvIHRoZSBidWlsZCBkaXJlY3Rvcnkg
cmF0aGVyIHRoYW4gdG8gdGhlIHNvdXJjZQpkaXJlY3RvcnkuCgpBcHBhcmVudGx5IHRoaXMgYWxz
byBjYXVzZWQgcmFuZG9tIGZhaWx1cmVzIGZvciBvdXQtb2YtdHJlZSBidWlsZC4gRm9yCnNvbWUg
cmVhc29uIHdoZW4gYnVpbGRpbmcgc3lzY2FsbHMvc2V0X21lbXBvbGljeS8gdGVzdGNhc2VzIHRo
ZSByZWJ1aWxkCm9mIHRoZSBsaWJsdHBudW1hLmEgbGlicmFyeSBpcyB0cmlnZ2VyZWQgZm9yIG91
dC1vZi10cmVlIGJ1aWxkIGZvciBhYm91dAoxMCUgb2YgdGhlIGNhc2VzIG9uIG1hc3NpdmVseSBw
YXJhbGxlbCBidWlsZC4gV2hpY2ggYXMgZmFyIGFzIEkgY2FuIHRlbGwKc2hvdWxkbid0IGhhcHBl
biBzaW5jZSB3ZSBidWlsZCBldmVyeXRoaW5nIGluIHRoZSBsaWJzLyBkaXJlY3RvcnkgYXMgYQpw
cmVyZXF1aXNpdGUgb2YgdGhlIHRlc3RjYXNlcy8gZGlyZWN0b3J5LiBTbyB0aGVyZSBpcyBsaWtl
bHkgc29tZQpzdHJhbmdlIHJhY2UgY29uZGl0aW9uIGhhcHBlbmluZyBhbmQgd2hpbGUgdGhpcyBk
b2VzIG5vdCBmaXggdGhlIGFjdHVhbApyYWNlIGl0IG1ha2VzIGl0IHF1aXRlIGhhcm1sZXNzIHNp
bmNlIHRoZSB0YXJnZXQgd2FzIGFscmVhZHkgYnVpbGQgYW5kCnRoZSBtYWtlIGluIHRoZSBsaWJz
L2xpYmx0cG51bWEvIGRpcmVjdG9yeSB3aWxsIGJlIG5vLW9wLgoKU2lnbmVkLW9mZi1ieTogQ3ly
aWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+CkNDOiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5j
ej4KQ0M6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvbWsv
dGVzdGNhc2VzLm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tay90ZXN0Y2FzZXMubWsgYi9pbmNsdWRl
L21rL3Rlc3RjYXNlcy5tawppbmRleCAxMzE4NTRlYzcuLjY4NDY1NWZiZiAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9tay90ZXN0Y2FzZXMubWsKKysrIGIvaW5jbHVkZS9tay90ZXN0Y2FzZXMubWsKQEAg
LTQ5LDcgKzQ5LDcgQEAgTFRQTElCU19GSUxFUyA9ICQoYWRkc3VmZml4IC5hLCAkKGFkZHByZWZp
eCAkKGFic190b3BfYnVpbGRkaXIpL2xpYnMvLCAkKGZvcmVhY2gKIE1BS0VfREVQUyArPSAkKExU
UExJQlNfRklMRVMpCiAKICQoTFRQTElCU19GSUxFUyk6ICQoTFRQTElCU19ESVJTKQotCSQoTUFL
RSkgLUMgIiReIiAtZiAiJF4vTWFrZWZpbGUiIGFsbAorCSQoTUFLRSkgLUMgIiReIiAtZiAiJChz
dWJzdCAkKGFic190b3BfYnVpbGRkaXIpLCQoYWJzX3RvcF9zcmNkaXIpLCReKS9NYWtlZmlsZSIg
YWxsCiAKIExERkxBR1MgKz0gJChhZGRwcmVmaXggLUwkKHRvcF9idWlsZGRpcikvbGlicy9saWIs
ICQoTFRQTElCUykpCiAKLS0gCjIuMTkuMgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
