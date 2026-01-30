Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBFQLRvUfGlbOwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 16:54:03 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423BBC444
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 16:54:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA0263CC2B5
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 16:54:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B52B93C937C
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 16:54:00 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E728A100024A
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 16:53:59 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A0505BCE2;
 Fri, 30 Jan 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769788438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8VVFV6yuHy2UuPZ8AywBMeQlFn4l26kD0Gt7Vluv/+0=;
 b=0MFYGMF/mGnh7dM2/Itzxa3juu1KRdCSbYSG7XYP2a9gTsdcFLF7nywKO1oYTyeqa9tPG5
 Z6Usblr4vSAaq7TEyDl0cdhQHD3b5fH7PQQK5I0RZy4uk0aOYWoSJwFSvK3uwKbhe5fEEs
 9I9pwKFOTIivgsZh2Hk+uIf58Ka7cxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769788438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8VVFV6yuHy2UuPZ8AywBMeQlFn4l26kD0Gt7Vluv/+0=;
 b=MHNC7q9S5DUdlkTsjQmlIS6kbTYV6+cm6M8UTI+V8lQEPJuHr14XVmznMGvATGP3nueg4e
 ioNnicFcKwnNxCAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="0MFYGMF/";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=MHNC7q9S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769788438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8VVFV6yuHy2UuPZ8AywBMeQlFn4l26kD0Gt7Vluv/+0=;
 b=0MFYGMF/mGnh7dM2/Itzxa3juu1KRdCSbYSG7XYP2a9gTsdcFLF7nywKO1oYTyeqa9tPG5
 Z6Usblr4vSAaq7TEyDl0cdhQHD3b5fH7PQQK5I0RZy4uk0aOYWoSJwFSvK3uwKbhe5fEEs
 9I9pwKFOTIivgsZh2Hk+uIf58Ka7cxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769788438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8VVFV6yuHy2UuPZ8AywBMeQlFn4l26kD0Gt7Vluv/+0=;
 b=MHNC7q9S5DUdlkTsjQmlIS6kbTYV6+cm6M8UTI+V8lQEPJuHr14XVmznMGvATGP3nueg4e
 ioNnicFcKwnNxCAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AD273EA61;
 Fri, 30 Jan 2026 15:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LLMAERbUfGn9JQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 30 Jan 2026 15:53:58 +0000
Date: Fri, 30 Jan 2026 16:55:18 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it, linux-kernel@vger.kernel.org,
 libc-alpha@sourceware.org, valgrind-developers@lists.sourceforge.net
Message-ID: <aXzUZma8fglWW0NL@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [ANNOUNCE] The Linux Test Project has been released for
 January 2026
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
Cc: lwn@lwn.net, akpm@linux-foundation.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	DMARC_NA(0.00)[suse.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: 5423BBC444
X-Rspamd-Action: no action

Good news everyone,

the Linux Test Project test suite stable release for *January 2026* has been
released.

Since the last release 164 patches by 29 authors were merged.

Patch review is what most of the projects struggle with and LTP is no
different. If you can spare some effort helping with the patch review is more
than welcomed.

NOTABLE CHANGES
===============

* New tests

  - file_attr05 Check for EOPNOTSUPP when filesystem does not support FSX operations.
                Regression test for 474b155adf392 ("fs: make vfs_fileattr_[get|set] return -EOPNOTSUPP")
  - userfaultfd05 Test for UFFDIO_WRITEPROTECT
  - userfaultfd04 Test for UFFDIO_ZEROPAGE
  - userfaultfd03 Test for /dev/userfaultfd
  - userfaultfd02 Test for UFFDIO_MOVE
  - userfaultfd01 Test for UFFD_USER_MODE_ONLY
  - clone10 Test for CLONE_SETTLS
  - clone11, clone304 Tests for more EPERM conditions
  - name_to_handle_at03 Tests for AT_HANDLE_FID

* Increased coverage

  - fanotify24 Added a regression test for 28bba2c2935e2 ("fsnotify: Pass correct offset to fsnotify_mmap_perm()")

* Rewritten and updated tests

  - lio_listio_2-1, aio_cancel_5-1 Were rewritten to actually block while writing and not relying on a chance.

  - Tests that compile and load kernel modules now properly skip the test when kernel is Lockdown/Secure boot.

  - swapon03 Now does not try to calculate the exact maximal number of swap files based on kernel config.

  - readahead02: Was fixed to wait for the readahead to happen and also updated
                 to use mincore() instead of system wide I/O counters.

  - ima_conditionals.sh Was split into four tests so that subset of the tests
                        is not skipped without CONFIG_IMA_WRITE_POLICY=y.

* New shell tst_runas.c helper

  We are replacing the use of sudo with simpler tst_runas.c helper that changes
  UID and GID before executing a command. This makes tests less likely to fail
  because of system restrictions on sudo (such as setting /usr/sbin/nologin as
  a login shell).

* Openposix tests had to be updated with new invalid clock IDs

  Since the addition of CONFIG_POSIX_AUX_CLOCK the clock id 17 was not invalid anymore.

* New shell library now supports setting runtime

* New documentation:
  - https://linux-test-project.readthedocs.io/en/latest/developers/ground_rules.html
  - https://linux-test-project.readthedocs.io/en/latest/developers/api_c_tests.html#process-state
  - https://linux-test-project.readthedocs.io/en/latest/developers/api_c_tests.html#saving-and-restoring-proc-sys-values

* Kirk was updated to v3.2.1

+ The usual amount of fixes and cleanups


DOWNLOAD AND LINKS
==================

The latest version of the test-suite contains 3000+ tests for the Linux
and can be downloaded at:

https://github.com/linux-test-project/ltp/releases/tag/20260130

The project pages as well as GIT repository are hosted on GitHub:

https://github.com/linux-test-project/ltp

If you ever wondered how to write a LTP testcase, don't miss our developer
documentation at:

https://linux-test-project.readthedocs.io/en/latest/developers/test_case_tutorial.html

And our library API documentation at:

https://linux-test-project.readthedocs.io/en/latest/developers/api_c_tests.html

Patches, new tests, bugs, comments or questions should go to to our mailing
list at ltp@lists.linux.it.


CREDITS
=======

Many thanks to the people contributing to this release:

git shortlog -s -e -n 20250930..

    77  Petr Vorel <pvorel@suse.cz>
    14  Andrea Cervesato <andrea.cervesato@suse.com>
    10  Martin Doucha <mdoucha@suse.cz>
     9  Cyril Hrubis <chrubis@suse.cz>
     9  Li Wang <liwang@redhat.com>
     9  Wei Gao <wegao@suse.com>
     7  Ricardo Branco <rbranco@suse.de>
     4  Avinesh Kumar <akumar@suse.de>
     2  Ben Copeland <ben.copeland@linaro.org>
     4  Po-Hsu Lin <po-hsu.lin@canonical.com>
     1  Amir Goldstein <amir73il@gmail.com>
     1  Anders Roxell <anders.roxell@linaro.org>
     1  Brian Grech via ltp <ltp@lists.linux.it>
     1  Chenghao Duan <duanchenghao@kylinos.cn>
     1  Jan Kara <jack@suse.cz>
     1  Jiaying Song <jiaying.song.cn@windriver.com>
     1  Juerg Haefliger via ltp <ltp@lists.linux.it>
     1  Kunwu Chan <kunwu.chan@hotmail.com>
     1  Kushal Chand K <kushalkataria5@gmail.com>
     1  Masahiro Yamada <masahiro.yamada@canonical.com>
     1  Naresh Kamboju <naresh.kamboju@linaro.org>
     1  Sebastian Chlad <sebastianchlad@gmail.com>
     1  Stephen Bertram <sbertram@redhat.com>
     1  Terry Tritton <terry.tritton@linaro.org>
     1  Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
     1  Vincent Chen <vincent.chen@sifive.com>
     1  chunfuwen <chwen@redhat.com>
     1  fangqiurong <fangqiurong@kylinos.cn>
     1  vamoosebbf <38994993+vamoosebbf@users.noreply.github.com>

And also thanks to patch reviewers:

git log 20250930.. | grep -Ei '(reviewed|acked)-by:' | sed 's/.*by: //' | sort | uniq -c | sort -n -r

     67 Petr Vorel <pvorel@suse.cz>
     37 Cyril Hrubis <chrubis@suse.cz>
     35 Li Wang <liwang@redhat.com>
     21 Andrea Cervesato <andrea.cervesato@suse.com>
     12 Avinesh Kumar <akumar@suse.de>
      5 Wei Gao <wegao@suse.com>
      3 Martin Doucha <mdoucha@suse.cz>
      3 Jan Stancek <jstancek@redhat.com>
      2 Mimi Zohar <zohar@linux.ibm.com>
      1 Mingyu Li <limy83@chinatelecom.cn>
      1 Jan Kara <jack@suse.cz>
      1 Arnd Bergmann <arnd@arndb.de>
      1 Amir Goldstein <amir73il@gmail.com>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
