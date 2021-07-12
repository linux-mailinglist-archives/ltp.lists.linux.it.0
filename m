Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E43C6157
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 19:02:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AD193C7620
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 19:02:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9CBE3C1C00
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 19:02:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E220010009DA
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 19:02:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 372F71FFCD;
 Mon, 12 Jul 2021 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626109352;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=UtrG5ByvMyKRPJw+WBQOuU29a+twqqsEMe6ui9XdoUk=;
 b=DJBvJeS7OLDjREZ+Fq7Rl54tGGWCIedq42bUEiTtdI0y1iPdJbklQrEOlSvt8aIX3jlvXz
 MVMLBWp47JeBUn9QmHHmq3o+VP/gLV5JpMqDO7ZPfSnbW1Hw1l0kbXtMPS1QrKbRULkQ9F
 YafruPknUS0Mz9Vbq4HMgu6SLrnsgVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626109352;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=UtrG5ByvMyKRPJw+WBQOuU29a+twqqsEMe6ui9XdoUk=;
 b=LcTMSVmKN9ZGGdw2VmqPAL/3kdM90xGUbxbVngQ8s8mpmAJCeedidgxaDu0hTo+iqRtxie
 mIz6BA77N1HqqVCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E620113AC8;
 Mon, 12 Jul 2021 17:02:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gb33Nad17GAQJQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Jul 2021 17:02:31 +0000
Date: Mon, 12 Jul 2021 19:02:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
 Li Wang <liwang@redhat.com>
Message-ID: <YOx1pir0UuBNM+4w@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] tst_strstatus.c fails on Alpine
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

I see failures of lib/newlib_tests/tst_strstatus on Alpine:

tst_strstatus.c:31: TPASS: exited with 1
tst_strstatus.c:31: TPASS: killed by SIGHUP
tst_strstatus.c:31: TPASS: is stopped
tst_strstatus.c:31: TPASS: is resumed
tst_strstatus.c:29: TFAIL: killed by ??? != invalid status 0xff

Any idea what could be wrong?

Kind regards,
Petr

$ strace -ff ./lib/newlib_tests/tst_strstatus
write(2, "tst_test.c:1261: \33[1;34mTINFO: \33"..., 65tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
) = 65
getpid()                                = 6286
setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=300, tv_usec=0}}, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=0, tv_usec=0}}) = 0
rt_sigaction(SIGINT, {sa_handler=0x557c315e0fd0, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6b1a5b7304}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigprocmask(SIG_BLOCK, ~[], [], 8)   = 0
fork(strace: Process 6287 attached
 <unfinished ...>
[pid  6287] gettid()                    = 6287
[pid  6287] rt_sigprocmask(SIG_SETMASK, [],  <unfinished ...>
[pid  6286] <... fork resumed>)         = 6287
[pid  6287] <... rt_sigprocmask resumed>NULL, 8) = 0
[pid  6287] rt_sigaction(SIGALRM, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6b1a5b7304},  <unfinished ...>
[pid  6286] rt_sigprocmask(SIG_SETMASK, [],  <unfinished ...>
[pid  6287] <... rt_sigaction resumed>{sa_handler=0x557c315e1010, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6b1a5b7304}, 8) = 0
[pid  6286] <... rt_sigprocmask resumed>NULL, 8) = 0
[pid  6287] rt_sigaction(SIGUSR1, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6b1a5b7304},  <unfinished ...>
[pid  6286] wait4(6287,  <unfinished ...>
[pid  6287] <... rt_sigaction resumed>{sa_handler=0x557c315e0ea0, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6b1a5b7304}, 8) = 0
[pid  6287] rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6b1a5b7304}, {sa_handler=0x557c315e0fd0, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6b1a5b7304}, 8) = 0
[pid  6287] setpgid(0, 0)               = 0
[pid  6287] clock_gettime(CLOCK_REALTIME, NULL) = -1 EFAULT (Bad address)
[pid  6287] clock_gettime(CLOCK_MONOTONIC, {tv_sec=12534, tv_nsec=660628778}) = 0
[pid  6287] getppid()                   = 6286
[pid  6287] kill(6286, SIGUSR1)         = 0
[pid  6287] getpid()                    = 6287
[pid  6286] <... wait4 resumed>0x7ffc58615040, 0, NULL) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
[pid  6287] getpid()                    = 6287
[pid  6287] write(2, "tst_strstatus.c:31: \33[1;32mTPASS"..., 52tst_strstatus.c:31: TPASS: exited with 1
) = 52
[pid  6286] --- SIGUSR1 {si_signo=SIGUSR1, si_code=SI_USER, si_pid=6287, si_uid=1000} ---
[pid  6287] getpid()                    = 6287
[pid  6287] wait4(-1, 0x7ffc58614fe4, 0, NULL) = -1 ECHILD (No child process)
[pid  6286] setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=300, tv_usec=0}}, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=299, tv_usec=994322}}) = 0
[pid  6287] write(2, "tst_strstatus.c:31: \33[1;32mTPASS"..., 55tst_strstatus.c:31: TPASS: killed by SIGHUP
) = 55
[pid  6287] getpid()                    = 6287
[pid  6287] wait4(-1, 0x7ffc58614fe4, 0, NULL) = -1 ECHILD (No child process)
[pid  6287] write(2, "tst_strstatus.c:31: \33[1;32mTPASS"..., 49 <unfinished ...>
[pid  6286] rt_sigreturn({mask=[]}tst_strstatus.c:31: TPASS: is stopped
 <unfinished ...>
[pid  6287] <... write resumed>)        = 49
[pid  6286] <... rt_sigreturn resumed>) = 61
[pid  6287] getpid()                    = 6287
[pid  6287] wait4(-1, 0x7ffc58614fe4, 0, NULL) = -1 ECHILD (No child process)
[pid  6287] write(2, "tst_strstatus.c:31: \33[1;32mTPASS"..., 49 <unfinished ...>
[pid  6286] wait4(6287, tst_strstatus.c:31: TPASS: is resumed
 <unfinished ...>
[pid  6287] <... write resumed>)        = 49
[pid  6287] getpid()                    = 6287
[pid  6287] wait4(-1, 0x7ffc58614fe4, 0, NULL) = -1 ECHILD (No child process)
[pid  6287] write(2, "tst_strstatus.c:29: \33[1;31mTFAIL"..., 75tst_strstatus.c:29: TFAIL: killed by ??? != invalid status 0xff
) = 75
[pid  6287] getpid()                    = 6287
[pid  6287] wait4(-1, 0x7ffc58614fe4, 0, NULL) = -1 ECHILD (No child process)
[pid  6287] clock_gettime(CLOCK_MONOTONIC, {tv_sec=12534, tv_nsec=663302915}) = 0
[pid  6287] getppid()                   = 6286
[pid  6287] kill(6286, SIGUSR1)         = 0
[pid  6286] <... wait4 resumed>0x7ffc58615040, 0, NULL) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
[pid  6287] exit_group(0)               = ?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
