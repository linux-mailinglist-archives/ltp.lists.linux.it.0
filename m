Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A62822C06
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jan 2024 12:23:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D43F3CD727
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jan 2024 12:23:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14C1A3CB297
 for <ltp@lists.linux.it>; Wed,  3 Jan 2024 12:22:58 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DF5B6200BD2
 for <ltp@lists.linux.it>; Wed,  3 Jan 2024 12:22:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0CB861FD14
 for <ltp@lists.linux.it>; Wed,  3 Jan 2024 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704280977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUUzcFesXuZBGFNNlUqbWmssJHLOuPnyKew00rP1LYg=;
 b=Hkw/aIymjTsSo1PNfDr1gnHTMFs58SNzsjYY8uOTMLefi1a6NZHLtY+4IF5ZdjEqXFZYwD
 v00HFdSk22D52rlkVQzZjnFjiJaylRqdTbqlnDIZgESuJZ+l2wRSmZa77NYGcSpxavoU6l
 jjtQxwK+7JEf1HNcQyRbSXUeum+86cQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704280977;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUUzcFesXuZBGFNNlUqbWmssJHLOuPnyKew00rP1LYg=;
 b=xvuBvDiRqy1uLsLBoGHItv6aJBWhc5HymuSsQG0JwCc5sUA0fTV4xKyPLqVfwkuDezoAhW
 YMCJw3KDhOO6w5AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704280976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUUzcFesXuZBGFNNlUqbWmssJHLOuPnyKew00rP1LYg=;
 b=o9hVcrVpqWAcQqjmqJ41JyiDqDYk8FPu4D16YOVaDdTiEwEfeTO6oL018T3CVBgt4N0B7y
 3v433aRp6cGN25cqRxOnDmPD2whuOB2dA8fmbBCtamJD0kjwTJmreKqjUnnhTlhEQIJoWh
 uw3IP1qlbDskO+rg4mgYlNUAOjQLvmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704280976;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUUzcFesXuZBGFNNlUqbWmssJHLOuPnyKew00rP1LYg=;
 b=GsO+1WiDPNmBMuPqsmjeYifP0P4G+mVfDS0rzw0Rv0UGPr5pvHW7P4a5E1SeqpginkL0yG
 syMFYGqGWd0L+bCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1A2813AA6
 for <ltp@lists.linux.it>; Wed,  3 Jan 2024 11:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sOOgOo9DlWXkEAAAD6G6ig
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Wed, 03 Jan 2024 11:22:55 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Wed,  3 Jan 2024 12:22:54 +0100
Message-ID: <20240103112255.1021-1-akumar@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103112023.32355-1-akumar@suse.de>
References: <20240103112023.32355-1-akumar@suse.de>
MIME-Version: 1.0
X-Spam-Level: ***
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o9hVcrVp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GsO+1WiD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.01 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_MISSING_CHARSET(2.50)[]; TO_DN_NONE(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCPT_COUNT_ONE(0.00)[1];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -1.01
X-Rspamd-Queue-Id: 0CB861FD14
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: Improve doc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 lib/README.md | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/lib/README.md b/lib/README.md
index ccb1cf1da..bfc05ae07 100644
--- a/lib/README.md
+++ b/lib/README.md
@@ -27,16 +27,16 @@
 
 When a test is executed the very first thing to happen is that we check for
 various test prerequisites. These are described in the tst\_test structure and
-range from simple '.require\_root' to a more complicated kernel .config boolean
+range from simple '.needs\_root' to a more complicated kernel .config boolean
 expressions such as: "CONFIG\_X86\_INTEL\_UMIP=y | CONFIG\_X86\_UMIP=y".
 
-If all checks are passed the process carries on with setting up the test
+If all checks are passed, the process continues with setting up the test
 environment as requested in the tst\_test structure. There are many different
 setup steps that have been put into the test library again ranging from rather
 simple creation of a unique test temporary directory to a bit more complicated
 ones such as preparing, formatting, and mounting a block device.
 
-The test library also intializes shrared memory used for IPC at this step.
+The test library also initializes shared memory used for IPC at this step.
 
 Once all the prerequisites are checked and test environment has been prepared
 we can move on executing the testcase itself. The actual test is executed in a
@@ -62,12 +62,11 @@ for test_variants:
 		fork_testrun()
 ```
 
-Before we fork() the test process the test library sets up a timeout alarm and
-also a heartbeat signal handlers and also sets up an alarm(2) accordingly to
-the test timeout. When a test times out the test library gets SIGALRM and the
-alarm handler mercilessly kills all forked children by sending SIGKILL to the
-whole process group. The heartbeat handler is used by the test process to reset
-this timer for example when the test functions run in a loop.
+Before we fork() the test process, the test library sets up a timeout alarm and
+also a heartbeat signal handler. When a test times out, the test library gets
+SIGALRM and the alarm handler mercilessly kills all forked children by sending
+SIGKILL to the whole process group. The heartbeat handler is used by the test
+process to reset this timer for example when the test functions run in a loop.
 
 With that done we finally fork() the test process. The test process firstly
 resets signal handlers and sets its pid to be a process group leader so that we
@@ -97,14 +96,14 @@ usually better option than exiting it in the middle.
 The test cleanup() is also called by the tst\_brk() handler in order to cleanup
 before exiting the test process, hence it must be able to cope even with
 partial test setup. Usually it suffices to make sure to clean up only
-resources that already have been set up and to do that in an inverse order that
-we did in setup().
+resources that already have been set up and to do that in the reverse order
+that we did in setup().
 
 Once the test process exits or leaves the run() or run\_all() function the test
 library wakes up from the waitpid() call, and checks if the test process
 exited normally.
 
-Once the testrun is finished the test library does a cleanup() as well to clean
+Once the testrun is finished, the test library does a cleanup() as well to clean
 up resources set up in the test library setup(), reports test results and
 finally exits the process.
 
@@ -126,8 +125,8 @@ This especially means that:
 - While the test results are, by the design, propagated to the test library
   we may still miss a child that gets killed by a signal or exits unexpectedly.
 
-The test writer should, because of this, take care for reaping these proceses
-properly, in most cases this could be simply done by calling
+The test writer should, because of this, take care fofor reaping these
+processes properly, in most cases this could be simply done by calling
 tst\_reap\_children() to collect and dissect deceased.
 
 Also note that tst\_brk() does exit only the current process, so if a child
@@ -136,9 +135,9 @@ exits.
 
 ### Test library and exec()
 
-The piece of mapped memory to store the results to is not preserved over
+The piece of mapped memory to store the results is not preserved over
 exec(2), hence to use the test library from a binary started by an exec() it
-has to be remaped. In this case the process must to call tst\_reinit() before
+has to be remapped. In this case, the process must call tst\_reinit() before
 calling any other library functions. In order to make this happen the program
 environment carries LTP\_IPC\_PATH variable with a path to the backing file on
 tmpfs. This also allows us to use the test library from shell testcases.
@@ -148,5 +147,5 @@ tmpfs. This also allows us to use the test library from shell testcases.
 The piece of mapped memory is also used as a base for a futex-based
 synchronization primitives called checkpoints. And as said previously the
 memory can be mapped to any process by calling the tst\_reinit() function. As a
-matter of a fact there is even a tst\_checkpoint binary that allows us to use
+matter of a fact, there is even a tst\_checkpoint binary that allows us to use
 the checkpoints from shell code as well.
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
