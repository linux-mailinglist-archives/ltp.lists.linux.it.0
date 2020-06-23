Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6D2050A4
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 13:28:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48B3C3C05A2
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 13:28:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E93E13C05A1
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 13:28:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 67CB6140199F
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 13:28:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF3B4AF69;
 Tue, 23 Jun 2020 11:28:08 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 23 Jun 2020 13:28:25 +0200
Message-Id: <20200623112827.10744-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] [RFC] Device discovery & UART test
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
Cc: automated-testing@yoctoproject.org, Carlos Hernandez <ceh@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is not 100% finished and I do not intend to merge the code as it
is. The main purpose is to show the direction in which I think we should
move in order to include the device drivers in LTP.

Have a look at the "Add support for device discovery" patch that
introduces the important pieces.

Cyril Hrubis (2):
  tst_test: Add support for device discovery
  device_drivers/uart01: Add uart01 test

 device-discovery.sh                           |   5 +
 include/tst_test.h                            |   3 +
 lib/tst_devices.c                             | 228 ++++++++
 lib/tst_devices.h                             |  32 ++
 lib/tst_test.c                                |  60 +-
 runtest/kernel_misc                           |   5 +
 .../kernel/device-drivers/uart/.gitignore     |   1 +
 testcases/kernel/device-drivers/uart/Makefile |   4 +
 testcases/kernel/device-drivers/uart/uart01.c | 522 ++++++++++++++++++
 9 files changed, 853 insertions(+), 7 deletions(-)
 create mode 100755 device-discovery.sh
 create mode 100644 lib/tst_devices.c
 create mode 100644 lib/tst_devices.h
 create mode 100644 testcases/kernel/device-drivers/uart/.gitignore
 create mode 100644 testcases/kernel/device-drivers/uart/Makefile
 create mode 100644 testcases/kernel/device-drivers/uart/uart01.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
