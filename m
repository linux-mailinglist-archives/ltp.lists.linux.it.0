Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C276719584B
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 14:47:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D46853C24A1
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 14:47:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 479F93C24A1
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 14:47:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B1B496009C4
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 14:47:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC3DBAC6C;
 Fri, 27 Mar 2020 13:47:09 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 14:47:05 +0100
Message-Id: <20200327134707.4532-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] [RFC] Add needs_devices && basic uart test
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
Cc: Carlos Hernandez <ceh@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is not yet finished and work-in-progress, but it shows the
directions I think the device drivers should take.

This series adds a .needs_devices array of strings to the tst_test
structure which is expected to hold well defined list of environment
variables with well known names. In this case its UART_RX and UART_TX
which should be obvious. Other tests may need I2C_ADDR etc.

The value of these depends on a particular hardware/lab settings so
apart from checking that these are defined the test libary does not
attempt to do anything about these. The expectation here is that in the
future the test description format I'm working on would be parsed by the
test execution framework, which would then call a user defined helper
script to get the values for these variables. For now we would have to
run these scripts prior the LTP run to get these variables defined.

Cyril Hrubis (2):
  tst_test: Add support for needs_devices
  device_drivers/uart01: Add uart01 test

 include/tst_test.h                            |   3 +
 lib/tst_test.c                                |  32 ++
 runtest/kernel_misc                           |   5 +
 .../kernel/device-drivers/uart/.gitignore     |   1 +
 testcases/kernel/device-drivers/uart/Makefile |   4 +
 testcases/kernel/device-drivers/uart/uart01.c | 522 ++++++++++++++++++
 6 files changed, 567 insertions(+)
 create mode 100644 testcases/kernel/device-drivers/uart/.gitignore
 create mode 100644 testcases/kernel/device-drivers/uart/Makefile
 create mode 100644 testcases/kernel/device-drivers/uart/uart01.c

-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
