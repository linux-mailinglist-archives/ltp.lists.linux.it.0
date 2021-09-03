Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1EF3FFEAE
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 13:09:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 764413C959C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 13:09:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A4393C285B
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 13:09:44 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9A3001001351
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 13:09:41 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B61CA203AA;
 Fri,  3 Sep 2021 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630667380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=s0PC0r86jf0o/HAAXUkcZt1MOZCy3RhpFAx96vwvKMw=;
 b=1XvvLO7H+7rohmtwPA/2Sk0kcmzgddzKBNPnlhl7N+eyI6oH83D5DfVqAmTFmQ/eqISjG9
 xKNPxjy9WQzsBkKj1cE4J4L+UKlx961FQU/TAk0y1aZf2NVHlHNg+uN9ZGTOP4Otknl0MI
 xFd0LY46wG6SqZAon2b4ADM0kFbTQtA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630667380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=s0PC0r86jf0o/HAAXUkcZt1MOZCy3RhpFAx96vwvKMw=;
 b=eNBCKin5lUwzewNUxdwgItO3ueah1n5oMf90fuUTN5g/AtRuuA7BpIXQ5AUANjzj9hJNKO
 7q2JkPlH6+wXvSBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C082713736;
 Fri,  3 Sep 2021 11:09:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 9JFtJ3MCMmFdGAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 03 Sep 2021 11:09:39 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 13:09:20 +0200
Message-Id: <20210903110920.28178-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_test.sh: Use command -v instead of type
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
Cc: Stephen Kitt <steve@sk2.org>, Adam Katz <khopesh@apache.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to avoid checkbashisms warnings.

`type' is part of POSIX, but as part of the X/Open Systems Interfaces
option (XSI) [1]. As Stephen Kitt noted [2] quoting man checkbashisms(1):

    Note that the definition of a bashism in this context roughly
    equates to "a shell feature that is not required to be supported
    by POSIX"; this means that some issues flagged may be permitted
    under optional sections of POSIX, such as XSI or User Portability.

=> `type' is flagged because it is an optional feature.

`command -v' is POSIX (no XSI extension) [3] and we already started to
using it instead of which (e7302676f, f6cac3660).

[1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/type.html
[2] https://unix.stackexchange.com/a/667293
[3] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html

Cc: Stephen Kitt <steve@sk2.org>
Suggested-by: Adam Katz <khopesh@apache.org>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

this is a replacement to the original patch [4], which removed 'type'
from checkbashisms. While other issues reported by Joerg [5] are likely
checkbashisms false positives / bugs, this one is valid, thus I'd start
using command -v.

Kind regards,
Petr

[4] https://patchwork.ozlabs.org/project/ltp/patch/20210902115837.2199-1-pvorel@suse.cz/
[5] https://patchwork.ozlabs.org/comment/2745374/

 testcases/lib/tst_test.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index acf62c9ac..8f69b0551 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -30,7 +30,7 @@ _tst_do_exit()
 	TST_DO_EXIT=1
 
 	if [ -n "$TST_DO_CLEANUP" -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
-		if type $TST_CLEANUP >/dev/null 2>/dev/null; then
+		if command -v $TST_CLEANUP >/dev/null 2>/dev/null; then
 			$TST_CLEANUP
 		else
 			tst_res TWARN "TST_CLEANUP=$TST_CLEANUP declared, but function not defined (or cmd not found)"
@@ -691,7 +691,7 @@ tst_run()
 	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
 
 	if [ -n "$TST_SETUP" ]; then
-		if type $TST_SETUP >/dev/null 2>/dev/null; then
+		if command -v $TST_SETUP >/dev/null 2>/dev/null; then
 			TST_DO_CLEANUP=1
 			$TST_SETUP
 		else
@@ -723,7 +723,7 @@ _tst_run_tests()
 
 	TST_DO_CLEANUP=1
 	for _tst_i in $(seq ${TST_CNT:-1}); do
-		if type ${TST_TESTFUNC}1 > /dev/null 2>&1; then
+		if command -v ${TST_TESTFUNC}1 > /dev/null 2>&1; then
 			_tst_run_test "$TST_TESTFUNC$_tst_i" $_tst_i "$_tst_data"
 		else
 			_tst_run_test "$TST_TESTFUNC" $_tst_i "$_tst_data"
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
