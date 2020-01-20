Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA2143012
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 17:39:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECEB93C22CB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 17:39:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 93BD03C0EAF
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 17:39:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 52CC71A011C8
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 17:39:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63533ABB3;
 Mon, 20 Jan 2020 16:39:36 +0000 (UTC)
Date: Mon, 20 Jan 2020 17:39:33 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it, linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Message-ID: <20200120163933.GA7391@rei>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_RHS_DOB autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [ANNOUNCE] The Linux Test Project has been released for
 JANUARY 2020
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

the Linux Test Project test suite stable release for *January 2020* has been
released.

Since the last release 195 patches by 31 authors were merged.

NOTABLE CHANGES
===============

* New tests
  - vmsplice03 (splicing pipe to user memory)
  - prctl08, prctl09 (PR_{SET,GET}_TIMERSLACK)

* New regression tests
  - bpf_prog03

* Increased coverage
  - quotactl tests were rewritten and coverage was increased

* Additional 19 tests were converted to the new test library

* Removed tests
  - TI-RPC authdes related tests (authdes is disabled by default since libtirpc 1.2.5)
  - openposix/pi_test*
  - ext4 features tests
    (the interesting bits are being moved to xfstests
     https://patchwork.kernel.org/patch/11290345/)

* Our Travis now includes native ppc64le and s390x builds

* Improved musl support, build with musl in Travis CI using Alpine Linux
  (broken tests are documented in Travis build script travis/alpine.sh)

* Regression tests now print possibly missing kernel commits:

    --------------------------------------------------------------------------
    snd_timer01.c:134: FAIL: kernel seems vulnerable

    HINT: You _MAY_ be missing kernel fixes, see:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d11662f4f798
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba3021b2c79b

    HINT: You _MAY_ be vulnerable to CVE(s), see:

    https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-1000380

    Summary:
    passed   0
    failed   1
    skipped  0
    warnings 0
    --------------------------------------------------------------------------

+ The usual amount of fixes and cleanups.


METADATA EXTRACTION & TEST CATALOGUE
====================================

There is an ongoing experiment that attempts to extract metadata[1] from the
testcases, we also have a proof of concept web page that renders the json
metadata into a browseable test documentation[2]. There is not much there yet,
but we are hoping, among other things, to build a nice, searchable and
browseable test catalogue based on these efforts.

[1] https://github.com/metan-ucw/ltp/tree/master/docparse
[2] http://metan.ucw.cz/outgoing/metadata.html
    http://metan.ucw.cz/outgoing/metadata.html?test=abort01
    http://metan.ucw.cz/outgoing/metadata.html?test=pcrypt_aead01


NOTABLE CHANGES IN NETWORK TESTS
================================
brought to you by Petr Vorel

* iptables: add new test for iptables-translate and nft, add IPv6 support
* route: rewrite route change destination, gateway and interface tests into new API


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

git shortlog -s -e -n 20190930..
    45  Petr Vorel <pvorel@suse.cz>
    22  Jan Stancek <jstancek@redhat.com>
    22  Yang Xu <xuyang2018.jy@cn.fujitsu.com>
    13  Cyril Hrubis <chrubis@suse.cz>
    13  Petr Vorel <petr.vorel@gmail.com>
    11  Li Wang <liwang@redhat.com>
    10  Joerg Vehlow <joerg.vehlow@aox-tech.de>
    10  Martin Doucha <mdoucha@suse.cz>
     7  Alexey Kodanev <alexey.kodanev@oracle.com>
     6  Clemens Famulla-Conrad <cfamullaconrad@suse.de>
     5  Xiao Yang <ice_yangxiao@163.com>
     3  Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
     2  Jorik Cronenberg <jcronenberg@suse.de>
     2  Pengfei Xu <pengfei.xu@intel.com>
     2  Ping Fang <pifang@redhat.com>
     2  Richard Palethorpe <rpalethorpe@suse.com>
     1  Cai Zhenglong <caizhenglong_cm@deepin.com>
     1  Dylan Chung <dylan@andestech.com>
     1  Eric Lin <tesheng@andestech.com>
     1  Fabrice Fontaine <fontaine.fabrice@gmail.com>
     1  He Zhe <zhe.he@windriver.com>
     1  Ivan Hu <ivan.hu@canonical.com>
     1  Ma Feng <mafeng.ma@huawei.com>
     1  Mathias Fiedler <mathias.fiedler@aox-tech.de>
     1  Rachel Sibley <rasibley@redhat.com>
     1  Song Jian <songjian15@huawei.com>
     1  Sultan Alsawaf <sultan@kerneltoast.com>
     1  Xiang Li <lixian@qti.qualcomm.com>
     1  Yi Zhao <yi.zhao@windriver.com>
     1  Yongxin Liu <yongxin.liu@windriver.com>
     1  Zou Wei <zou_wei@huawei.com>


And also thanks to patch reviewers:

git log 20190930.. | grep -Ei '(reviewed|acked)-by:' | sed 's/.*by: //' | sort | uniq -c | sort -n -r
     76 Cyril Hrubis <chrubis@suse.cz>
     46 Petr Vorel <pvorel@suse.cz>
     28 Li Wang <liwang@redhat.com>
     19 Jan Stancek <jstancek@redhat.com>
      9 Alexey Kodanev <alexey.kodanev@oracle.com>
      5 Clemens Famulla-Conrad <cfamullaconrad@suse.de>
      4 Richard Palethorpe <rpalethorpe@suse.com>
      3 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
      1 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
      1 Sumit Garg <sumit.garg@linaro.org>
      1 Steve Dickson <steved@redhat.com>
      1 Petr Vorel <petr.vorel@gmail.com>
      1 Joerg Vehlow <joerg.vehlow@aox-tech.de>
      1 Amir Goldstein <amir73il@gmail.com>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
