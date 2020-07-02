Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA462127FD
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 17:36:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAEBA3C210F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 17:36:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D17513C185E
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 17:36:01 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9C2DA14019C9
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 17:36:00 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id CD50720B717A;
 Thu,  2 Jul 2020 08:35:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CD50720B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1593704158;
 bh=JAZ9uFnGTR0/IdqAvUfcp9GdIzwUCl2MIfw/1Nrtl9k=;
 h=From:To:Cc:Subject:Date:From;
 b=QJJ4WkvwkeoDnR3rFs8FlXcL4g4tyjxTDTLL5+9qfM7iXGGlTAFBdadRSXKwDd0+b
 zJ8gY/vGBCd/XFfexA3spOnorLZFCBtWZwAosFOtme1b6jk9G6kGEQxFRmKb43Ugvy
 EOA+6Z2IviuZhWlXWZgn1RoJO2pPo27wkYgXkPSE=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: zohar@linux.ibm.com,
	pvorel@suse.cz,
	ltp@lists.linux.it
Date: Thu,  2 Jul 2020 11:35:43 -0400
Message-Id: <20200702153545.3126-1-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Test cmdline measurement and IMA buffer passing
 through kexec
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patchset adds two tests that verify that data is passed correctly
through a kexec. Since the machine reboots several times when running these
tests, they must be run standalone and cannot be run with `runltp`.

The first test verifies that the kernel command line is measured correctly
when using kexec. The second test verifies that the IMA buffer is being
passed through kexec correctly.

Support for passing the IMA buffer through kexec has only been upstreamed
on powerpc so far, with a patchset in the process of being upstreamed for
support on arm64. Therefore, the only architectures that the tests
allow you to run them on (via `uname -m`) are ppc, ppc64, ppcle, ppc64le,
and aarch64.

The tests have been verified on ARM64. Would appreciate if
someone can execute the tests on a PowerPC machine and validate.

Lachlan Sneff (2):
  IMA: Verify that the kernel cmdline is passed and measured correctly
    through the kexec barrier.
  IMA: Verify IMA buffer passing through the kexec barrier

 testcases/kexec/README.md     | 30 ++++++++++++++
 testcases/kexec/cmdline.sh    | 78 +++++++++++++++++++++++++++++++++++
 testcases/kexec/ima_buffer.sh | 42 +++++++++++++++++++
 testcases/kexec/utils.sh      | 47 +++++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 testcases/kexec/README.md
 create mode 100755 testcases/kexec/cmdline.sh
 create mode 100755 testcases/kexec/ima_buffer.sh
 create mode 100755 testcases/kexec/utils.sh

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
