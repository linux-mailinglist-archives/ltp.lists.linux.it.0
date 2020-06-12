Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FF1F79E5
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:38:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F37723C68C8
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:38:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 289FF3C60F9
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:38:50 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 0DD3010006C2
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:38:49 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 31E7B20B7192;
 Fri, 12 Jun 2020 07:38:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 31E7B20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1591972727;
 bh=uZcrWtkRbaavUFYUbx/bgmLjUU3LZRGurmDlQ7RmLqY=;
 h=From:To:Cc:Subject:Date:From;
 b=ey6e6FLt/qlj55DoMynJtiXCTvHW3AYB2jsKfInrLPNY0pJgTuPgEm1F84+My0VJJ
 VrnDzzfZYXaYOzyKqSwlMqULn0AsONYVQnc3ieBqBfmYMiuD3jKjbwXu/rn/ZlQRFZ
 ocNLXTaOu+PnzN8R/5y0c0+COhhBUWqvCr+zvbWU=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	zohar@linux.ibm.com
Date: Fri, 12 Jun 2020 10:38:40 -0400
Message-Id: <20200612143842.3993-1-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] IMA: Key Measurement + Certificate Measurement
 Tests
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.com,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Changeslog:

v2:
* Un-linebreak a few strings
* Enforce that some commands are available before running
* Move compute_digest function to ima_setup.sh
* Fix file permissions on ima_key.sh
* Move IMA_POLICY variable to ima_setup.sh
* Add keycheck.policy datafile

Lachlan Sneff (2):
  IMA: Add a test to verify measurment of keys
  IMA: Add a test to verify importing a certificate into keyring

 runtest/ima                                   |   1 +
 .../integrity/ima/datafiles/keycheck.policy   |   1 +
 .../security/integrity/ima/tests/ima_keys.sh  | 106 ++++++++++++++++++
 .../integrity/ima/tests/ima_measurements.sh   |  36 +-----
 .../integrity/ima/tests/ima_policy.sh         |   1 -
 .../security/integrity/ima/tests/ima_setup.sh |  35 ++++++
 6 files changed, 144 insertions(+), 36 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_keys.sh

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
