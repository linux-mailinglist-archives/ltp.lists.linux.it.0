Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D221F909
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 20:17:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6424F3C4F92
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 20:17:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 56A943C286A
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 20:17:17 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7B6A2600900
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 20:17:16 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id B678A20B4908;
 Tue, 14 Jul 2020 11:17:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B678A20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1594750634;
 bh=Ad1/fz3D4iUrimekvzH9B6xVELSEZ6B4e+CTu5517NI=;
 h=From:To:Cc:Subject:Date:From;
 b=i4/dMu7hq4Y2kgrmFnCbTIwVzF7vcAQw2qmUsG3TrwkROk3LhSYxgXtJ5ANvLQxcW
 FbkDF9SxSU4ZEg2VDjFxUluaesHlebHkm4yResWMqbgq4eKIr+Hdrul5JWOppy8eP1
 6o032koryCUWBisMBX4gMbxk1W3R2T5vrKCZPdDo=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: zohar@linux.ibm.com,
	pvorel@suse.cz,
	ltp@lists.linux.it
Date: Tue, 14 Jul 2020 14:17:01 -0400
Message-Id: <20200714181703.6374-1-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/2] IMA: Verify measurement of certificates
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

The IMA subsystem is capable of importing and measuring certificates. This
set of patches adds tests for verifying that keys are imported and measured
correctly.


Changelog:

v5
- Fix failure case of key measurement test.

v4
- Clarify documentation about required certificate.
- Fix case where multiple KEY_CHECK rules are present.

v3
- Document requirements for running the ima key tests and provide resources
  for generating keys.

v2
- Un-linebreak a few strings
- Enforce that some commands are available before running
- Move compute_digest function to ima_setup.sh
- Fix file permissions on ima_key.sh
- Move IMA_POLICY variable to ima_setup.sh
- Add keycheck.policy datafile

v1
- The following patchsets should be applied in that order.
- Add tests that verify measurement of keys and importing certificates.


Lachlan Sneff (2):
  IMA: Add a test to verify measurment of keys
  IMA: Add a test to verify importing a certificate into keyring

 runtest/ima                                   |   1 +
 .../kernel/security/integrity/ima/README.md   |  22 ++++
 .../integrity/ima/datafiles/keycheck.policy   |   1 +
 .../security/integrity/ima/tests/ima_keys.sh  | 111 ++++++++++++++++++
 .../integrity/ima/tests/ima_measurements.sh   |  36 +-----
 .../integrity/ima/tests/ima_policy.sh         |   1 -
 .../security/integrity/ima/tests/ima_setup.sh |  35 ++++++
 7 files changed, 171 insertions(+), 36 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_keys.sh

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
