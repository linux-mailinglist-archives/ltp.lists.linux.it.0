Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E061F0FC
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 13:50:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C6DE294ABE
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 13:50:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 023FB294AA6
 for <ltp@lists.linux.it>; Wed, 15 May 2019 13:50:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DB82E100172F
 for <ltp@lists.linux.it>; Wed, 15 May 2019 13:50:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23665AF6E
 for <ltp@lists.linux.it>; Wed, 15 May 2019 11:50:51 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 May 2019 13:50:45 +0200
Message-Id: <20190515115045.27207-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH] tst_rod: Fix path names in error messages
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

Rml4aW5nIG9idmlvdXMgY29weSBwYXN0ZSBlcnJvci4KClNpZ25lZC1vZmYtYnk6IFBldHIgVm9y
ZWwgPHB2b3JlbEBzdXNlLmN6PgotLS0KIHRlc3RjYXNlcy9saWIvdHN0X3JvZC5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9saWIvdHN0X3JvZC5jIGIvdGVzdGNhc2VzL2xpYi90c3Rfcm9kLmMK
aW5kZXggOGQ0MzZmYzIyLi5kYjZkMTc2NDEgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9saWIvdHN0
X3JvZC5jCisrKyBiL3Rlc3RjYXNlcy9saWIvdHN0X3JvZC5jCkBAIC0xMTMsNyArMTEzLDcgQEAg
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJaWYgKG9wZW4oc3Rkb3V0X3BhdGgs
IE9fQ1JFQVR8T19XUk9OTFl8T19UUlVOQywgMDc3NykgPCAwKSB7CiAJCQlmcHJpbnRmKHN0ZGVy
ciwKIAkJCSAgICAgICAgIiVzOiBGYWlsZWQgdG8gb3BlbiAnJXMnIGZvciB3cml0aW5nOiAlc1xu
IiwKLQkJCQlhcmd2WzBdLCBzdGRpbl9wYXRoLCBzdHJlcnJvcihlcnJubykpOworCQkJCWFyZ3Zb
MF0sIHN0ZG91dF9wYXRoLCBzdHJlcnJvcihlcnJubykpOwogCQkJcmV0dXJuIDE7CiAJCX0KIAl9
CkBAIC0xMzEsNyArMTMxLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJ
aWYgKGZkIDwgMCkgewogCQkJZnByaW50ZihzdGRlcnIsCiAJCQkgICAgICAgICIlczogRmFpbGVk
IHRvIG9wZW4gJyVzJyBmb3Igd3JpdGluZzogJXNcbiIsCi0JCQkJYXJndlswXSwgc3RkaW5fcGF0
aCwgc3RyZXJyb3IoZXJybm8pKTsKKwkJCQlhcmd2WzBdLCBzdGRlcnJfcGF0aCwgc3RyZXJyb3Io
ZXJybm8pKTsKIAkJCXJldHVybiAxOwogCQl9CiAKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
