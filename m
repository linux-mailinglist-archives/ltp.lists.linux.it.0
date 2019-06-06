Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCA36EB3
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 10:33:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 018DB3EA9C8
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 10:33:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EDC303EA4BC
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 10:33:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 34655600199
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 10:33:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65AE1AF4C
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 08:33:12 +0000 (UTC)
From: Petr Cervinka <pcervinka@suse.com>
To: ltp@lists.linux.it
Date: Thu,  6 Jun 2019 10:32:47 +0200
Message-Id: <20190606083247.6848-1-pcervinka@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Petr Cervinka <pcervinka@suse.com>
Subject: [LTP] [PATCH v3] Fix shebang in open-posix makefile generator
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

U2lnbmVkLW9mZi1ieTogUGV0ciBDZXJ2aW5rYSA8cGNlcnZpbmthQHN1c2UuY29tPgotLS0KQ2hh
bmdlcyB2Mi12MzoKICAqIFNpZ24gY29tbWl0Ci0tLQogdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVz
dHN1aXRlL3NjcmlwdHMvZ2VuZXJhdGUtbWFrZWZpbGVzLnNoIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2Vz
L29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvZ2VuZXJhdGUtbWFrZWZpbGVzLnNoIGIvdGVz
dGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvZ2VuZXJhdGUtbWFrZWZpbGVzLnNo
CmluZGV4IDQ2NjY3MzlmNS4uN2IxMWM5OGJkIDEwMDc1NQotLS0gYS90ZXN0Y2FzZXMvb3Blbl9w
b3NpeF90ZXN0c3VpdGUvc2NyaXB0cy9nZW5lcmF0ZS1tYWtlZmlsZXMuc2gKKysrIGIvdGVzdGNh
c2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvZ2VuZXJhdGUtbWFrZWZpbGVzLnNoCkBA
IC0xODYsNyArMTg2LDcgQEAgRU9GCiAJaWYgISBncmVwIC1xICdecnVuLnNoJyAiJG1ha2VmaWxl
LjMiOyB0aGVuCiAJCWNhdCA+PiAiJG1ha2VmaWxlLjMiIDw8RU9GCiBydW4uc2g6Ci0JQGVjaG8g
JyMvYmluL3NoJyA+IFwkQAorCUBlY2hvICcjIS9iaW4vc2gnID4gXCRACiAJQGVjaG8gIlwkKHRv
cF9zcmNkaXIpL2Jpbi9ydW4tdGVzdHMuc2ggXCQoc3ViZGlyKSBcJChJTlNUQUxMX1RBUkdFVFMp
IiA+PiBcJEAKIAlAY2htb2QgK3ggcnVuLnNoCiAKLS0gCjIuMTYuNAoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
