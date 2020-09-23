Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBC2754BA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:46:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF5203C4D50
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:46:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BD3BE3C101E
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:46:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B400B200C11
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:46:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 527C0ACB8;
 Wed, 23 Sep 2020 09:47:08 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 23 Sep 2020 11:46:25 +0200
Message-Id: <20200923094625.30601-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] recvmmsg01: Fix compilation
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
Cc: Filip.Bozuta@syrmia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

dm9pZCogY2Fubm90IGJlIGRpcmVjdGx5IHVzZWQsIGl0IG11c3QgYmUgcG9pbnRpbmcgdG8gdGhl
IHN0cnVjdC4KCnJlY3ZtbXNnMDEuYzo4Njo5OiBlcnJvcjogcmVxdWVzdCBmb3IgbWVtYmVyIOKA
mHR5cGXigJkgaW4gc29tZXRoaW5nIG5vdCBhCnN0cnVjdHVyZSBvciB1bmlvbgogIHRpbWVvdXQu
dHlwZSA9IHR2LT50c190eXBlOwoKRml4ZXM6IDEzNWFmOGVkZSAoInN5c2NhbGxzL3tzZW5kfHJl
Y3Z9bW1zZzogYWRkIGEgdGVzdCBjYXNlIGZvciB0aW1lb3V0CmFuZCBlcnJubyB0ZXN0IikKClJl
cG9ydGVkLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogUGV0
ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9y
ZWN2bW1zZy9yZWN2bW1zZzAxLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvcmVjdm1tc2cvcmVjdm1tc2cwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9y
ZWN2bW1zZy9yZWN2bW1zZzAxLmMKaW5kZXggZmU2Mzc0MzBiLi5hMTZhNzhmOWIgMTAwNjQ0Ci0t
LSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcmVjdm1tc2cvcmVjdm1tc2cwMS5jCisrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcmVjdm1tc2cvcmVjdm1tc2cwMS5jCkBAIC02NSw3
ICs2NSw4IEBAIHN0YXRpYyB2b2lkIGRvX3Rlc3QodW5zaWduZWQgaW50IGkpCiB7CiAJc3RydWN0
IHRpbWU2NF92YXJpYW50cyAqdHYgPSAmdmFyaWFudHNbdHN0X3ZhcmlhbnRdOwogCXN0cnVjdCB0
ZXN0X2Nhc2UgKnRjID0gJnRjYXNlW2ldOwotCXZvaWQgKnJjdl9tc2d2ZWMsICp0aW1lb3V0Owor
CXN0cnVjdCB0c3RfdHMgdDsKKwl2b2lkICpyY3ZfbXNndmVjLCAqdGltZW91dCA9ICZ0OwogCiAJ
dHN0X3JlcyhUSU5GTywgImNhc2UgJXMiLCB0Yy0+ZGVzYyk7CiAKQEAgLTgzLDcgKzg0LDcgQEAg
c3RhdGljIHZvaWQgZG9fdGVzdCh1bnNpZ25lZCBpbnQgaSkKIAltZW1zZXQocmN2MS0+aW92X2Jh
c2UsIDAsIHJjdjEtPmlvdl9sZW4pOwogCW1lbXNldChyY3YyLT5pb3ZfYmFzZSwgMCwgcmN2Mi0+
aW92X2xlbik7CiAKLQl0aW1lb3V0LnR5cGUgPSB0di0+dHNfdHlwZTsKKwkoKHN0cnVjdCB0c3Rf
dHMqKXRpbWVvdXQpLT50eXBlID0gdHYtPnRzX3R5cGU7CiAJdHN0X3RzX3NldF9zZWMoJnRzLCB0
Yy0+dHZfc2VjKTsKIAl0c3RfdHNfc2V0X25zZWMoJnRzLCB0Yy0+dHZfbnNlYyk7CiAKLS0gCjIu
MjguMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
