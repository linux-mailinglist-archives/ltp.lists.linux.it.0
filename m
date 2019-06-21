Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 741024E5DC
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:26:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E5F93EAEC7
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:26:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 007093EA191
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:26:38 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2195E2011BC
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:26:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 243B559440
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 10:26:33 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10C621001B18;
 Fri, 21 Jun 2019 10:26:31 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 21 Jun 2019 18:26:25 +0800
Message-Id: <20190621102628.4800-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 21 Jun 2019 10:26:33 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] Test for Memory Protection Key
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

Q2hhbmdlIGxvZzogCiAgICB2MSAtLT4gdjIKICAgICogY29ycmVjdCBzeXNjYWxsIG51bWJlcnMg
aW4gYWFyY2g2NC5pbgogICAgKiBoYW5kbGUgRU5PU1BDIGVycm9yIGluIGNoZWNrX3BrZXlfc3Vw
cG9ydAogICAgKiBhdm9pZCBnZXR0aW5nIGNvcmVzIGZyb20gcGtleTAxIGNoaWxkcmVuCiAgICAq
IGFkZCBwa2V5MDIgdG8gdGVzdCB3aXRoIG1vcmUgZGlmZmVyZW50IG1lbW9yeQoKTGkgV2FuZyAo
Myk6CiAgcGtleTogYWRkIHN5c2NhbGwgbnVtYmVycyBmb3IgcGtleQogIHBrZXk6IGFkZCB0ZXN0
IGZvciBtZW1vcnkgcHJvdGVjdGlvbiBrZXlzCiAgcGtleTogYWRkIHBrZXkwMiB0ZXN0CgogY29u
ZmlndXJlLmFjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGluY2x1ZGUv
bGFwaS9zeXNjYWxscy9hYXJjaDY0LmluICAgICAgICAgICB8ICAgMyArCiBpbmNsdWRlL2xhcGkv
c3lzY2FsbHMvYXJtLmluICAgICAgICAgICAgICAgfCAgIDMgKwogaW5jbHVkZS9sYXBpL3N5c2Nh
bGxzL2kzODYuaW4gICAgICAgICAgICAgIHwgICAzICsKIGluY2x1ZGUvbGFwaS9zeXNjYWxscy9p
YTY0LmluICAgICAgICAgICAgICB8ICAgMyArCiBpbmNsdWRlL2xhcGkvc3lzY2FsbHMvcG93ZXJw
Yy5pbiAgICAgICAgICAgfCAgIDMgKwogaW5jbHVkZS9sYXBpL3N5c2NhbGxzL3Bvd2VycGM2NC5p
biAgICAgICAgIHwgICAzICsKIGluY2x1ZGUvbGFwaS9zeXNjYWxscy9zMzkwLmluICAgICAgICAg
ICAgICB8ICAgMyArCiBpbmNsdWRlL2xhcGkvc3lzY2FsbHMvczM5MHguaW4gICAgICAgICAgICAg
fCAgIDMgKwogaW5jbHVkZS9sYXBpL3N5c2NhbGxzL3NwYXJjLmluICAgICAgICAgICAgIHwgICAz
ICsKIGluY2x1ZGUvbGFwaS9zeXNjYWxscy9zcGFyYzY0LmluICAgICAgICAgICB8ICAgMyArCiBp
bmNsdWRlL2xhcGkvc3lzY2FsbHMveDg2XzY0LmluICAgICAgICAgICAgfCAgIDMgKwogcnVudGVz
dC9zeXNjYWxscyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKIHRlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvcGtleXMvLmdpdGlnbm9yZSB8ICAgMiArCiB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3BrZXlzL01ha2VmaWxlICAgfCAgIDggKysKIHRlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvcGtleXMvcGtleS5oICAgICB8ICA1MCArKysrKysrKwogdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9wa2V5cy9wa2V5MDEuYyAgIHwgMTI2ICsrKysrKysrKysrKysrKysrKysKIHRlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvcGtleXMvcGtleTAyLmMgICB8IDEzNCArKysrKysrKysrKysr
KysrKysrKysKIDE4IGZpbGVzIGNoYW5nZWQsIDM1NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wa2V5cy8uZ2l0aWdub3JlCiBjcmVh
dGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wa2V5cy9NYWtlZmlsZQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGtleXMvcGtleS5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wa2V5cy9wa2V5
MDEuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGtleXMv
cGtleTAyLmMKCi0tIAoyLjIwLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
