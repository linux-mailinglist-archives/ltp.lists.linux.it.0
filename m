Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF586140911
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD5093C2259
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 376CD3C2033
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B0944200385
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E09D8AECB;
 Fri, 17 Jan 2020 11:37:22 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jan 2020 12:37:12 +0100
Message-Id: <20200117113715.22786-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] Fixes for old distros
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

Hi,

few fixes for old SLES we still support,
which I'd like to merge before release.

Kind regards,
Petr

Petr Vorel (3):
  pidfd_send_signal: Build with _GNU_SOURCE
  tst_device.h: Use lapi/syscalls.h instead of <sys/syscall.h>
  lapi/syscalls: Add syncfs

 include/lapi/syscalls/arm.in                                    | 1 +
 include/lapi/syscalls/hppa.in                                   | 1 +
 include/lapi/syscalls/i386.in                                   | 1 +
 include/lapi/syscalls/ia64.in                                   | 1 +
 include/lapi/syscalls/powerpc.in                                | 1 +
 include/lapi/syscalls/powerpc64.in                              | 1 +
 include/lapi/syscalls/s390.in                                   | 1 +
 include/lapi/syscalls/s390x.in                                  | 1 +
 include/lapi/syscalls/sh.in                                     | 1 +
 include/lapi/syscalls/sparc.in                                  | 1 +
 include/lapi/syscalls/sparc64.in                                | 1 +
 include/lapi/syscalls/x86_64.in                                 | 1 +
 include/tst_device.h                                            | 2 +-
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c     | 1 +
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c     | 1 +
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c     | 1 +
 16 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
