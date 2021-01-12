Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2AC2F3A81
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 20:30:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 339133C6457
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 20:30:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 65B743C26C0
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 20:30:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0FDD6600C73
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 20:30:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 875EEAF5A;
 Tue, 12 Jan 2021 19:30:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 Jan 2021 20:30:38 +0100
Message-Id: <20210112193039.12506-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112193039.12506-1-pvorel@suse.cz>
References: <20210112193039.12506-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] fanotify: Fix build on undefined struct
 file_handle
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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

VGhpcyBmaXhlcyBlcnJvcjoKZmFub3RpZnkwOS5jOjIwMTozMjogZXJyb3I6IGRlcmVmZXJlbmNp
bmcgcG9pbnRlciB0byBpbmNvbXBsZXRlIHR5cGUg4oCYc3RydWN0IGZpbGVfaGFuZGxl4oCZCiAg
MjAxIHwgIGZpbGVuYW1lID0gKGNoYXIgKilmaWxlX2hhbmRsZS0+Zl9oYW5kbGUgKyBmaWxlX2hh
bmRsZS0+aGFuZGxlX2J5dGVzOwoKU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1
c2UuY3o+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5o
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5o
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5oCmluZGV4IDg5
MDdkYjA1Mi4uMDM5Mzc5OTYxIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2Zhbm90aWZ5L2Zhbm90aWZ5LmgKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5v
dGlmeS9mYW5vdGlmeS5oCkBAIC0xMiw4ICsxMiw4IEBACiAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+
CiAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KICNpbmNsdWRlIDxlcnJuby5oPgotI2luY2x1ZGUgPGZj
bnRsLmg+CiAjaW5jbHVkZSA8c3lzL2Zhbm90aWZ5Lmg+CisjaW5jbHVkZSAibGFwaS9mY250bC5o
IgogCiBpbnQgc2FmZV9mYW5vdGlmeV9pbml0KGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBs
aW5lbm8sCiAJdW5zaWduZWQgaW50IGZsYWdzLCB1bnNpZ25lZCBpbnQgZXZlbnRfZl9mbGFncykK
LS0gCjIuMjkuMgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
