Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E76782B20D2
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:49:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 969A93C6574
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:49:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 83A9E3C2EBD
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:49:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2947E601CE6
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:49:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FFDDABD9;
 Fri, 13 Nov 2020 16:49:51 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 17:49:39 +0100
Message-Id: <20201113164944.26101-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/5] Introduce SAFE_FANOTIFY_MARK() macro + cleanup
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

Hi Amir,

quick fix for old distros.

changes v2->v3:
* move safe_fanotify_*() after constant definitions

Kind regards,
Petr

Petr Vorel (5):
  fanotify12: Drop incorrect hint
  fanotify: Handle supported features checks in setup()
  fanotify: Introduce SAFE_FANOTIFY_MARK() macro
  fanotify: Check FAN_REPORT_{FID,NAME} support
  fanotify: Add a pedantic check for return value

 testcases/kernel/syscalls/fanotify/fanotify.h | 150 +++++++++++++++---
 .../kernel/syscalls/fanotify/fanotify01.c     |  53 ++-----
 .../kernel/syscalls/fanotify/fanotify02.c     |  22 +--
 .../kernel/syscalls/fanotify/fanotify03.c     |  48 ++----
 .../kernel/syscalls/fanotify/fanotify04.c     |  32 +---
 .../kernel/syscalls/fanotify/fanotify05.c     |   9 +-
 .../kernel/syscalls/fanotify/fanotify06.c     |  21 +--
 .../kernel/syscalls/fanotify/fanotify07.c     |  17 +-
 .../kernel/syscalls/fanotify/fanotify09.c     |  19 +--
 .../kernel/syscalls/fanotify/fanotify10.c     |  44 ++---
 .../kernel/syscalls/fanotify/fanotify11.c     |   5 +-
 .../kernel/syscalls/fanotify/fanotify12.c     |  57 ++-----
 .../kernel/syscalls/fanotify/fanotify13.c     |  33 +---
 .../kernel/syscalls/fanotify/fanotify15.c     |  24 +--
 .../kernel/syscalls/fanotify/fanotify16.c     |  20 +--
 15 files changed, 209 insertions(+), 345 deletions(-)

-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
