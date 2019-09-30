Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F43C20A8
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 14:34:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4E793C230A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 14:34:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 69D613C1821
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 14:34:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E7ED61400B73
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 14:34:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E75AABC4;
 Mon, 30 Sep 2019 12:34:14 +0000 (UTC)
Date: Mon, 30 Sep 2019 14:33:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it, linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Message-ID: <20190930123355.GA27508@rei>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [ANNOUNCE] The Linux Test Project has been released for
 SEPTEMBER 2019
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

the Linux Test Project test suite stable release for *September 2019* has been
released.

Since the last release 267 patches by 41 authors were merged.

NOTABLE CHANGES
===============

* New tests
  - Basic eBPF map and program load tests
  - Netlink uevent socket tests
  - Basic ioprio() tests
  - Basic sendmmsg() test
  - mbind() tests
  - Memory protection (pkey) tests
  - prctl() with PR_CAP_AMBIENT
  - prctl() with PR_{GET,SET}_NO_NEW_PRIVS
  - prctl() with PR_{SET,GET}_NAME
  - prctl() with PR_{SET,GET}_SECCOMP
  - futext_cmp_requeue() tests
  - fanotify FAN_REPORT_FID tests
  - fanotify overlayfs tests
  - pidfd_send_signal() tests
  - IMA overlay tests
  - acct() tests
  - preadv2() RWF_NOWAIT tests

* New tests variants for
  - clock_getres()

* New regression tests
  - bpf_prog02: regression test for 3612af783cf52c (bpf: fix sanitation rewrite in case of non-pointers)
  - timer_create() aka CVE-2017-18344
  - alsa timer race aka CVE-2017-1000380
  - accept02 aka CVE-2017-8890
  - setsockopt04 aka CVE-2016-9793
  - move_pages12: regression tests for:
    e66f17ff7177 (mm/hugetlb: take page table lock in follow_huge_pmd())
    c9d398fa2378 (mm, hugetlb: use pte_present() instead of pmd_present() in follow_huge_pmd())
    4643d67e8cb0 (hugetlbfs: fix hugetlb page migration/fault race causing SIGBUS)
  - crypto_user02: regression test for 21d4120ec6f5 ("crypto: user - prevent operating on larval algorithms")
  - sysctl02: regression test for 32a5ad9c2285 ("sysctl: handle overflow for file-max")

* Increased coverage
  - copy_file_range()
     - tests for cross device copy
     - tests for invalid files (swapfile, pipe, ...)
  - intel PT tests
  - sync_file_range()
     - added partial range sync

* Added syscall tables for MIPS

* Guarded buffers, which are pages followed by a PROT_NONE and preceeded by a
  canary were introduced and 8 tests were changed to make use of the new
  feature. Also newly implemented tests are using the same buffers as well.

* Additional 36 tests were converted to the new test library


NOTABLE CHANGES IN NETWORK TESTS
================================
brought to you by Peter Vorel

* New net features:
  - introduce TST_GET_UNUSED_PORT() macro into C API

* Rewritten to new API:
  - tst_get_unused_port
  - bind01
  - setdomainname
  - sethostname


+ The usuall amount of fixes and cleanups.

DOWNLOAD AND LINKS
==================

The latest version of the test-suite contains 3000+ tests for the Linux
and can be downloaded at:

https://github.com/linux-test-project/ltp/releases/tag/20190930

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

git shortlog -s -e -n 20190517..

    68  Petr Vorel <pvorel@suse.cz>
    45  Cyril Hrubis <chrubis@suse.cz>
    27  Yang Xu <xuyang2018.jy@cn.fujitsu.com>
    19  Christian Amann <camann@suse.com>
    17  Jan Stancek <jstancek@redhat.com>
     9  Richard Palethorpe <rpalethorpe@suse.com>
     8  Li Wang <liwang@redhat.com>
     7  Murphy Zhou <xzhou@redhat.com>
     6  Jinhui huang <huangjh.jy@cn.fujitsu.com>
     5  Amir Goldstein <amir73il@gmail.com>
     5  Po-Hsu Lin <po-hsu.lin@canonical.com>
     5  Sandeep Patil <sspatil@android.com>
     5  Yixin Zhang <yixin.zhang@intel.com>
     4  Joerg Vehlow <joerg.vehlow@aox-tech.de>
     4  Xiao Yang <ice_yangxiao@163.com>
     3  He Zhe <zhe.he@windriver.com>
     3  Matthew Bobrowski <mbobrowski@mbobrowski.org>
     2  Caspar Zhang <caspar@linux.alibaba.com>
     2  Eric Biggers <ebiggers@google.com>
     2  Steve Muckle <smuckle@google.com>
     1  Alexey Kodanev <alexey.kodanev@oracle.com>
     1  Ammy Yi <ammy.yi@intel.com>
     1  Hongzhi.Song <hongzhi.song@windriver.com>
     1  Khem Raj <raj.khem@gmail.com>
     1  Linus Walleij <linus.walleij@linaro.org>
     1  Martin Doucha <martin.doucha@suse.com>
     1  Mathias Fiedler <mathias.fiedler@aox-tech.de>
     1  Michael Moese <mmoese@suse.de>
     1  Murphy Zhou <jencce.kernel@gmail.com>
     1  Petr Cervinka <pcervinka@suse.com>
     1  Ping Fang <pifang@redhat.com>
     1  Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
     1  Steven Price <steven.price@arm.com>
     1  Sultan Alsawaf <sultan@kerneltoast.com>
     1  Sumit Garg <sumit.garg@linaro.org>
     1  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
     1  Tobias Jordan <knilch-ltp@cdqe.de>
     1  Wu,Haiqiang <frequentemail@126.com>
     1  Yann Sionneau <ysionneau@kalray.eu>
     1  Yi Zhao <yi.zhao@windriver.com>
     1  Yu,Siliang <siliangx.yu@intel.com>


And also thanks to patch reviewers:

git log 20190517.. | grep -Ei '(reviewed|acked)-by:' | sed 's/.*by: //' | sort | uniq -c | sort -n -r

     94 Cyril Hrubis <chrubis@suse.cz>
     42 Li Wang <liwang@redhat.com>
     16 Amir Goldstein <amir73il@gmail.com>
     13 Jan Stancek <jstancek@redhat.com>
     11 Richard Palethorpe <rpalethorpe@suse.de>
      7 Petr Vorel <pvorel@suse.cz>
      6 Xiao Yang <ice_yangxiao@163.com>
      6 Clemens Famulla-Conrad <cfamullaconrad@suse.de>
      5 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
      4 Mimi Zohar <zohar@linux.ibm.com>
      4 Alexey Kodanev <alexey.kodanev@oracle.com>
      3 Sumit Garg <sumit.garg@linaro.org>
      2 Murphy Zhou <jencce.kernel@gmail.com>
      2 Ignaz Forster <iforster@suse.de>
      1 Sandeep Patil <sspatil@android.com>
      1 Richard Palethorpe <rpalethorpe@suse.com>
      1 Enji Cooper <yaneurabeya@gmail.com>
      1 Christian Amann <camann@suse.com>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
