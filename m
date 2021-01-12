Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C5C2F3A83
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 20:31:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A0233C645F
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 20:31:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6A2833C26DD
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 20:30:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F3A22600C68
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 20:30:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D844AB7A;
 Tue, 12 Jan 2021 19:30:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 Jan 2021 20:30:36 +0100
Message-Id: <20210112193039.12506-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] Build fix undefined struct file_handle
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

Hi all,

this would be great to get merged before release.

Kind regards,
Petr

Petr Vorel (3):
  lapi: Move struct file_handle into lapi/fcntl.h
  fanotify: Fix build on undefined struct file_handle
  syscalls: Remove unused include <fcntl.h>

 include/lapi/fcntl.h                                   | 10 ++++++++++
 include/lapi/name_to_handle_at.h                       |  9 +--------
 testcases/kernel/syscalls/fanotify/fanotify.h          |  2 +-
 testcases/kernel/syscalls/fanotify/fanotify09.c        |  1 -
 testcases/kernel/syscalls/fanotify/fanotify13.c        |  1 -
 testcases/kernel/syscalls/fanotify/fanotify15.c        |  1 -
 testcases/kernel/syscalls/fanotify/fanotify16.c        |  1 -
 .../syscalls/name_to_handle_at/name_to_handle_at01.c   |  1 -
 .../syscalls/name_to_handle_at/name_to_handle_at02.c   |  1 -
 .../syscalls/open_by_handle_at/open_by_handle_at01.c   |  1 -
 .../syscalls/open_by_handle_at/open_by_handle_at02.c   |  1 -
 11 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
