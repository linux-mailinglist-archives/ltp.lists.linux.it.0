Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076E2FE9F3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 13:26:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E64033C6387
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 13:26:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 46F5C3C298C
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 13:26:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AC55C140098C
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 13:26:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E29E2AE87;
 Thu, 21 Jan 2021 12:26:53 +0000 (UTC)
Date: Thu, 21 Jan 2021 13:27:57 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it, linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Message-ID: <YAlzTaWcKTGurolF@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [ANNOUNCE] The Linux Test Project has been released for
 JANUARY 2021
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

the Linux Test Project test suite stable release for *January 2021* has been
released.

Since the last release 303 patches by 35 authors were merged.

NOTABLE CHANGES
===============

* New tests
  - finit_module()
  - init_module()
  - delete_module()
  - semctl09 for SEM_STAT_ANY flag
  - msgctl06 for MSG_STAT_ANY flag
  - shmctl04 for SHM_STAT_ANY flag
  - sendmmsg() failure tests
  - recvmmsg() failure tests
  - open_by_handle_at()
  - name_to_handle_at()
  - ptrace11 to check if we can trace PID 1
  - select04 failure tests
  - select04 to check if rfds/wfds flags are clered on empty/full fd

* New regression tests
  - inotify10 added test for fecc4559780d (fsnotify: fix events reported to watching parent and child)
  - fanotify09 for 7372e79c9eb9 (fanotify: fix logic of reporting name info with watched parent)
  - ptrace10 bd14406b78e6 (perf/hw_breakpoint: Modify breakpoint even if the new attr has disabled set)

* Increased coverage
  - fanotify09 added case with FAN_CLOSE_NOWRITE on a sibling non-dir child

* Removed tests
  - sync01, sync02 these tests were useless so there was no point in keeping them 

* The metadata extraction patchset was merged. LTP now produces metadata.json
  with a metadata for new library testcases and also html test catalogue build
  from the extracted metadata.

  https://github.com/linux-test-project/ltp/blob/master/docparse/README.md

* Kernel .config parser was rewritten to support proper boolean expressions

* LTP now requires pkg-config > 0.23 (working version 0.24 was released in 2010)

* Error handling in test library (mostly SAFE_MACROS()) was unified

* High level test library overview was written:
  https://github.com/linux-test-project/ltp/blob/master/lib/README.md

* IMA/EVM
 - fixed ima_tpm.sh for TPM 2.0 and for TPM 1.2 on kernel >= v5.8 (commit 6f1a1d103b48)
 - rewrote ima_boot_aggregate.c to new API

* 16 testcases were converted to the new test library

+ The usual amount of fixes and cleanups.

NOTABLE CHANGES IN NETWORK TESTS
================================
brought to you by Petr Vorel

* New tests
  - wireguard tests

* Fixes
  - fix various false-positive failures in tests using tst_netload
    (tests in net.features and net_stress.ipsec_* runtest files)
  - if-mtu-change.sh on s390x: fix max packet size for IPv4

* Compatibility fixes:
  - ping and traceroute from BusyBox
  - MUSL (netstress)
  - traceroute6 from iputils

+ various other fixes and cleanup

* Rewrite into new API
  - host01
  - netstat01.sh

DOWNLOAD AND LINKS
==================

The latest version of the test-suite contains 3000+ tests for the Linux
and can be downloaded at:

https://github.com/linux-test-project/ltp/releases/tag/20210121

The project pages as well as GIT repository are hosted on GitHub:

https://github.com/linux-test-project/ltp
http://linux-test-project.github.io/

If you ever wondered how to write a LTP testcase, don't miss our developer
documentation at:

https://github.com/linux-test-project/ltp/wiki/C-Test-Case-Tutorial
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines
https://github.com/linux-test-project/ltp/wiki/BuildSystem

Patches, new tests, bugs, comments or questions should go to to our mailing
list at ltp@lists.linux.it.

CREDITS
=======

Many thanks to the people contributing to this release:

git shortlog -s -e -n 20200930..

    88  Petr Vorel <pvorel@suse.cz>
    52  Cyril Hrubis <chrubis@suse.cz>
    25  Martin Doucha <mdoucha@suse.cz>
    19  Yang Xu <xuyang2018.jy@cn.fujitsu.com>
    18  Viresh Kumar <viresh.kumar@linaro.org>
    10  Xiao Yang <yangx.jy@cn.fujitsu.com>
     8  Alexey Kodanev <alexey.kodanev@oracle.com>
     8  Amir Goldstein <amir73il@gmail.com>
     8  Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
     8  Kory Maincent <kory.maincent@bootlin.com>
     7  Radoslav Kolev <radoslav.kolev@suse.com>
     5  Richard Palethorpe <rpalethorpe@suse.com>
     4  Cixi Geng <cixi.geng1@unisoc.com>
     4  Krzysztof Dynowski <k.dynowski@samsung.com>
     4  Li Wang <liwang@redhat.com>
     4  Po-Hsu Lin <po-hsu.lin@canonical.com>
     4  Joerg Vehlow <joerg.vehlow@aox-tech.de>
     3  Alexander Egorenkov <egorenar@linux.ibm.com>
     2  Khem Raj <raj.khem@gmail.com>
     2  Li Zhijian <lizhijian@cn.fujitsu.com>
     2  Pengfei Xu <pengfei.xu@intel.com>
     2  Tree Davies <tdavies@darkphysics.net>
     2  Yang Xu <xuyang_jy_0410@163.com>
     2  Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
     2  Johannes Nixdorf <j.nixdorf@avm.de>
     1  Alexander Egorenkov <Alexander.Egorenkov@ibm.com>
     1  Deepak Rawat <derawa@microsoft.com>
     1  Filip Bozuta <Filip.Bozuta@syrmia.com>
     1  Jan Stancek <jstancek@redhat.com>
     1  Peter Bee <bijunda1@xiaomi.com>
     1  Petr Cervinka via ltp <ltp@lists.linux.it>
     1  Punit Agrawal <punit1.agrawal@toshiba.co.jp>
     1  Radoslav Kolev via ltp <ltp@lists.linux.it>
     1  Xinpeng Liu <liuxp11@chinatelecom.cn>
     1  bhargavdas <bhargav_das@mentor.com>

And also thanks to patch reviewers:

git log 20200930.. | grep -Ei '(reviewed|acked)-by:' | sed 's/.*by: //' | sort | uniq -c | sort -n -r

    114 Cyril Hrubis <chrubis@suse.cz>
     58 Petr Vorel <pvorel@suse.cz>
     51 Li Wang <liwang@redhat.com>
     13 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
     11 Amir Goldstein <amir73il@gmail.com>
     10 Alexey Kodanev <alexey.kodanev@oracle.com>
      9 Jan Stancek <jstancek@redhat.com>
      5 Xiao Yang <yangx.jy@cn.fujitsu.com>
      5 Jan Kara <jack@suse.cz>
      3 Xiao Yang <yangx.jy@cn.fujitsu.com>
      5 Richard Palethorpe <rpalethorpe@suse.com>
      3 Martin Doucha <mdoucha@suse.cz>
      2 Mimi Zohar <zohar@linux.ibm.com>
      1 Kory Maincent <kory.maincent@bootlin.com>
      1 Joerg Vehlow <joerg.vehlow@aox-tech.de>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
