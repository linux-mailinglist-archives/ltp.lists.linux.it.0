Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08844496627
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 21:07:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 651853C9707
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 21:07:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B18133C96DF
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 21:07:21 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C41F9140005A
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 21:07:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF7E121115;
 Fri, 21 Jan 2022 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642795637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=eCcMVlEOChBlkP+qtwlva0QdXn/3kpgzMif2BYjAImk=;
 b=wb+ZUqj+1AmUZqE0F7xHlDfYCnqJ/rOsQmp1Ar43NMcxpysY1Nldio6Yu2m19Z/aoE+a/w
 fMDsWkJmF7kuyCaBwUb8o+HX2TfyyIuzoIB9c6kMEdIyb0KQqggk+NB28zZxUEXR6W+QW/
 2pkdCnGGwMSJn6EZsPp58MejG8YC+XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642795637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=eCcMVlEOChBlkP+qtwlva0QdXn/3kpgzMif2BYjAImk=;
 b=qSgs+28zq6g8gmNqunb/lGIwavRImqFoTIJOo51VMquB89/BhUJxMGfR3cASaIux4mCpj8
 ixsKrgsSUPBMuABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C484513A9F;
 Fri, 21 Jan 2022 20:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XshtL3US62FidQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 21 Jan 2022 20:07:17 +0000
Date: Fri, 21 Jan 2022 21:09:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it, linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Message-ID: <YesS3xuskwEGiQ6E@yuki>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [ANNOUNCE] The Linux Test Project has been released for
 JANUARY 2022
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

Good news everyone,

the Linux Test Project test suite stable release for *January 2022* has been
released.

Since the last release 269 patches by 32 authors were merged.

Patch review is what most of the projects struggle with and LTP is no
different. If you can spare some effort helping with the patch review is more
than welcomed.

NOTABLE CHANGES
===============

* New tests
  - quotactl{08,09} tests for quota info hidden in filesystem.
  - fanotify22 test for FAN_FS_ERROR events by intentionally corrupting a fs image
  - memcontrol02 test for cgroup memory.current and memory.stat
  - memcontrol01 test for cgroup subtree_control and memory controller
  - write06 test if write() works correctly with O_APPEND fd
  - statx08 statx test for the stx_attributes_mask
  - fanotify{20,21} tests for FAN_REPORT_PIDFD
  - irqbalance01 test that tries to assert that IRQ are spread between CPUs reasonably
  - dup207 tests that file offset is correct for both original and dup()ed fds
  - dup206 tests special case where oldfd == newfd
  - ima_conditionals.sh test uid, gid, fowner, and fgroup options added
                        in kernel commit 40224c41661b ("ima: add gid support") from v5.16

* Increased coverage
  - quotactl* tests added support for quotactl_fd and hidden quota files
  - quotaclt* tests also test with vfsv1 format
  - statx01 added check for stx_mnt_id
  - statx01 added check for nlink
  - stat01 added check for nlink
  - finit_module02 added ETXTBSY check
  - epoll_create added two test variants (libc wrapper and raw syscall)
  - creat09 runs on all filesystems now
  - dup202 added check that file mode is same after it has been changed on dup()ed fd

* The test library process, that watches over timeouts and carries on with the
  test cleanup, now adjusts it's own OOM score so that it's more likely that it
  outlives the child process that runs the test

* First half of the ltp-aiodio testcases was rewritten and cleaned up
  - the rewritten tests are free of runtest file hacks that were problematic for years
  - the second half should get fixed during the next development cycle
  - the rewritten tests so far are:
     - dio_truncate
     - dio_read (previously ltp-diorh)
     - dio_append
     - dio_sparse
     - aiodio_append

* 39 tests were rewritten to the new library

* 'make check' improvements
  - added check if test.tags is properly NULL terminated
  - added check if test global functions and variables are static
  - fixed not to report tst_ prefixed static inline functions

* The test library gained support for 'known-fail' tag
  - to mark kernel bugs that are unfixed for a long time
  - this is similar to the existing tags
  - the first use of the interface are ustat() tests that are failing on Btrfs
    ever since the introduction of the filesystem

* The test library gained support for version check when a tool is required to
  be installed on a system, e.g. .needs_cmds = {"mkfs.ext4 >= 1.43.0", NULL} will
  skip the test unless the mkfs.ext4 is present and the version is at least 1.43.0

* The test library added .supported_archs field to the test_test structure
  which can be used to limit the test to a subset of CPU architectures

* The test library added .skip_in_compat flag to skip tests in compat (-m32) mode

* The shell library gained support boolean expressions on kernel .config
  variables

* New environment variable KCONFIG_SKIP_CHECK was added that allows users to
  skip kernel config checks

* New environment variable LTP_SINGLE_FS_TYPE was added that can be
  used to limit tests that run against all filesystem to a single one

* The new library testcases now print environment variables in help (-h)

* The test metadata are parsed during the build and installed by default now,
  which is another step towards making the test executor smarter.

+ The usual amount of fixes and cleanups

WHAT IS IN THE QUEUE
====================

In-flight patchse include:

- KVM test infrastructure that would allow us implement KVM regression tests
- watchqueue (pipe based kernel notification) testsuite
- futex_waitv tests
- CGroup testcases and fixes
- Test runtime API for the test library that would allow us to controll
  testrun runtime explicitly and fix a few tests that run into timeouts
  on older/slower hardware

Unfortunately the runltp-ng is still not included in LTP, we will try to work
on it during the next development cycle as well, but we can't promise it will
be rock stable to be included in the next release either.


NOTABLE CHANGES IN NETWORK TESTS
================================
brought to you by Petr Vorel

* NFS tests get support for emulating external server activity
* fix: run exportfs at "server side" in LTP_NETNS case
* new test: nfs07.sh - NFS directory listing regression


DOWNLOAD AND LINKS
==================

The latest version of the test-suite contains 3000+ tests for the Linux
and can be downloaded at:

https://github.com/linux-test-project/ltp/releases/tag/20220121

The project pages as well as GIT repository are hosted on GitHub:

https://github.com/linux-test-project/ltp
http://linux-test-project.github.io/

If you ever wondered how to write a LTP testcase, don't miss our developer
documentation at:

https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines

https://github.com/linux-test-project/ltp/wiki/C-Test-API

https://github.com/linux-test-project/ltp/wiki/C-Test-Network-API

https://github.com/linux-test-project/ltp/wiki/Shell-Test-API

https://github.com/linux-test-project/ltp/wiki/C-Test-Case-Tutorial

https://github.com/linux-test-project/ltp/wiki/BuildSystem

Patches, new tests, bugs, comments or questions should go to to our mailing
list at ltp@lists.linux.it.

CREDITS
=======

Many thanks to the people contributing to this release:

git shortlog -s -e -n 20210927..

    51  Petr Vorel <pvorel@suse.cz>
    47  Yang Xu <xuyang2018.jy@fujitsu.com>
    31  Richard Palethorpe <rpalethorpe@suse.com>
    24  Joerg Vehlow <joerg.vehlow@aox-tech.de>
    17  Cyril Hrubis <chrubis@suse.cz>
    15  Andrea Cervesato <andrea.cervesato@suse.com>
    14  tangmeng <tangmeng@uniontech.com>
     9  Gabriel Krisman Bertazi <krisman@collabora.com>
     7  zhanglianjie <zhanglianjie@uniontech.com>
     6  Dai Shili <daisl.fnst@fujitsu.com>
     6  Li Wang <liwang@redhat.com>
     6  Martin Doucha <mdoucha@suse.cz>
     4  Jan Stancek <jstancek@redhat.com>
     3  Alex Henrie <alexh@vpitech.com>
     3  Matthew Bobrowski <repnop@google.com>
     3  Zhao Gongyi <zhaogongyi@huawei.com>
     3  sujiaxun <sujiaxun@uniontech.com>
     2  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
     2  QI Fuli <qi.fuli@fujitsu.com>
     2  Ralph Siemsen <ralph.siemsen@linaro.org>
     2  YiLin.Li <YiLin.Li@linux.alibaba.com>
     2  wenyehai <wenyehai@huawei.com>
     1  Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
     1  Egor Petrov <egor.petrov@oracle.com>
     1  Fabian Vogt <fvogt@suse.de>
     1  Fabrice Fontaine <fontaine.fabrice@gmail.com>
     1  Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
     1  Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
     1  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
     1  Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>
     1  chengweibin <chengweibin@uniontech.com>
     1  sujiauxn <sujiaxun@uniontech.com>


And also thanks to patch reviewers:

git log 20210927.. | grep -Ei '(reviewed|acked)-by:' | sed 's/.*by: //' | sort | uniq -c | sort -n -r

    154 Cyril Hrubis <chrubis@suse.cz>
     71 Petr Vorel <pvorel@suse.cz>
     29 Li Wang <liwang@redhat.com>
     24 Richard Palethorpe <rpalethorpe@suse.com>
     12 Amir Goldstein <amir73il@gmail.com>
     11 Yang Xu <xuyang2018.jy@fujitsu.com>
      9 Martin Doucha <mdoucha@suse.cz>
      3 Tim Bird <tim.bird@sony.com>
      3 Matthew Bobrowski <repnop@google.com>
      3 Jan Stancek <jstancek@redhat.com>
      3 Eric Biggers <ebiggers@google.com>
      3 Alexey Kodanev <aleksei.kodanev@bell-sw.com>
      2 Liu Xinpeng <liuxp11@chinatelecom.cn>
      2 Andrea Cervesato <andrea.cervesato@suse.com>
      1 Petr Vorel <petr.vorel@gmail.com>
      1 Mimi Zohar <zohar@linux.ibm.com>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
