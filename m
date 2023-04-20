Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB476E9939
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Apr 2023 18:09:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2E963CBFAB
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Apr 2023 18:09:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 56D483CBF72
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 18:09:22 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0BB0460083E
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 18:09:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F7611480
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 09:10:01 -0700 (PDT)
Received: from e126380.arm.com (unknown [10.57.59.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 049103F6C4
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 09:09:16 -0700 (PDT)
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
To: ltp@lists.linux.it
Date: Thu, 20 Apr 2023 17:09:08 +0100
Message-Id: <20230420160910.809091-1-teo.coupriediaz@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] setpgid: Test EPERM error paths more reliably
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The current EPERM case in setpgid02 can fail in systems running the
login shell as init (PID 1).

Change the failing case to fail due to an invalid PGID instead of
a different session, but add a case in setpgid03 to continue
testing this error path in the kernel.

This is because setpgid03 already has the necessary scaffolding ready
by forking and synchronizing with a child that does setsid().


CI Build: https://github.com/Teo-CD/ltp/actions/runs/4756354740

Teo Couprie Diaz (2):
  setpgid02: Use pid_max as PGID for EPERM
  setpgid03: Add test for PGID in different session

 testcases/kernel/syscalls/setpgid/setpgid02.c | 14 +++++++-------
 testcases/kernel/syscalls/setpgid/setpgid03.c |  4 ++++
 2 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
