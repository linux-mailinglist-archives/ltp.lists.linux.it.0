Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C127B5A1
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 21:47:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47AA13C2B92
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 21:47:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 18F7D3C061B
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 21:47:36 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 2DA6660095F
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 21:47:35 +0200 (CEST)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id CF09120B7178;
 Mon, 28 Sep 2020 12:47:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CF09120B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1601322454;
 bh=mp/cwU/D1jFQ2uxW67x5UACNptiiB8HeXLS+UpRGtuA=;
 h=From:To:Cc:Subject:Date:From;
 b=DVtyyviQ/DcGrJim5lBcPFk6thGBshSZJL2YXwKo+iqaJZrz+EsLLUfZSmkhQNi11
 h35D+BWZ8mmLQOdJ939TI0nuy1sSVmCYPF1v90zE9ETjBeMq+myIIRoxZ0XgB2cxVy
 SjWwuV5VI8KgA+1xmVyqK3bt+qKesx5/8HjjCW3Y=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: pvorel@suse.cz, zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
 paul@paul-moore.com
Date: Mon, 28 Sep 2020 12:47:29 -0700
Message-Id: <20200928194730.20862-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 0/1] ima: Add test for selinux measurement
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
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

New functionality is being added to IMA to measure data provided by
kernel components. With this feature, IMA policy can be set to enable
measuring data provided by Linux Security Modules (LSM). Currently one
such LSM namely selinux is being updated to use this functionality.
This new functionality needs test automation in LTP.

This patch set adds tests which verify that the IMA subsystem correctly
measures the data provided by selinux.

This patch is based on 
commit 286401a1c1f3 ("thp04: Add linux tag")
in "master" branch in https://github.com/linux-test-project/ltp

This patch is dependent on the following patch series in LTP
https://patchwork.kernel.org/patch/11802771/

This series needs a kernel built on the following repo/branch/patches:
repo: https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
branch: next
commit 8861d0af642c ("selinux: Add helper functions to get and set checkreqprot")

And the following patch series should be applied in the following order:
  1, https://patchwork.kernel.org/patch/11709527/
  2, https://patchwork.kernel.org/patch/11795559/
  3, https://patchwork.kernel.org/patch/11801525/
  4, https://patchwork.kernel.org/patch/11801585/

Lakshmi Ramasubramanian (1):
  ima: Add test for selinux measurement

 runtest/ima                                   |   2 +
 .../kernel/security/integrity/ima/README.md   |  19 +++
 .../integrity/ima/tests/ima_selinux_policy.sh |  72 ++++++++++
 .../integrity/ima/tests/ima_selinux_state.sh  | 136 ++++++++++++++++++
 .../security/integrity/ima/tests/ima_setup.sh |  28 ++++
 5 files changed, 257 insertions(+)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_selinux_policy.sh
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_selinux_state.sh

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
