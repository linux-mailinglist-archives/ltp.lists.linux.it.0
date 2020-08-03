Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 855DE23AC0E
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 19:59:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18D883C3354
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 19:59:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8F3A73C3346
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 19:59:43 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 35B2760071C
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 19:58:15 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id E49EB20B4908;
 Mon,  3 Aug 2020 10:59:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E49EB20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1596477580;
 bh=c6g4N5GTfq2Sy3Ud3da7Wg3nyPStYNaPqXbluSJ6JCQ=;
 h=From:To:Cc:Subject:Date:From;
 b=IvwkEq1yI66MJikOn5ZfDdQPFUCdl/4ryPFhv1OyY4X6TBM9vNOjev9Q40KgOUyVr
 obc7k8cQQ7q0qnHi4tqtV3eZVIWNY6F+Jr6Et9G8hRzWf/3xNBnIvrHmOrXZKjNdsc
 cA1Cb3KiE3KQBeJBhh10a6TRlzSc8zejHga+6/68=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: pvorel@suse.cz,
	zohar@linux.ibm.com,
	ltp@lists.linux.it
Date: Mon,  3 Aug 2020 13:59:01 -0400
Message-Id: <20200803175904.40269-1-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 0/3] Verify measurement of certificate imported
 into a keyring
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
Cc: tytyhicks@linux.microsoft.com, balajib@linux.microsoft.com,
 nramas@linux.microsoft.com, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The IMA subsystem supports measuring certificates that have been loaded into
user-defined keyrings and system built-in keyrings. A test to verify that
those measurements are correct is required.

The first two patches in this patchset fix up left-over documentation and
move some datafiles around to prepare for more datafiles in the 3rd patch.

The third patch adds a new test to the `ima_keys.sh` file, which imports
a certificate into a user-defined keyring, and then verifies that the
certificate has been measured correctly by the IMA subsystem.

Lachlan Sneff (3):
  IMA: Update key test documentation
  IMA: Refactor datafiles directory
  IMA: Add a test to verify measurement of certificate imported into a
    keyring

 .../kernel/security/integrity/ima/README.md   |  32 +++++++------
 .../security/integrity/ima/datafiles/Makefile |   6 +--
 .../integrity/ima/datafiles/keys/Makefile     |  15 ++++++
 .../integrity/ima/datafiles/keys/x509_ima.der | Bin 0 -> 650 bytes
 .../integrity/ima/datafiles/policy/Makefile   |  15 ++++++
 .../ima/datafiles/{ => policy}/kexec.policy   |   0
 .../datafiles/{ => policy}/keycheck.policy    |   0
 .../ima/datafiles/{ => policy}/measure.policy |   0
 .../{ => policy}/measure.policy-invalid       |   0
 .../security/integrity/ima/tests/ima_keys.sh  |  44 +++++++++++++++++-
 10 files changed, 91 insertions(+), 21 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/keys/Makefile
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/keys/x509_ima.der
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/policy/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/kexec.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/keycheck.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/measure.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/measure.policy-invalid (100%)

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
