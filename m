Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B9232F75
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 11:26:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 496653C2617
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 11:26:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 969BE3C093E
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 11:26:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7C9C11003A51
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 11:26:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0867AAC20
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 09:26:55 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 30 Jul 2020 11:26:37 +0200
Message-Id: <20200730092637.487-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] semctl: Fix 32 bit build
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

Since dfe45f3cf libltpnewipc started to depend on safe macros from
libltp.a, thus order for linking must be -lltpnewipc -lltp.

Default order (where -lltp goes first) caused build failures on 32 bit:

cd testcases/kernel/syscalls/ipc/semctl
gcc -m32 -Wformat -Werror=format-security -Werror=implicit-function-declaration -Werror=return-type -fno-common -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -I../../../../../include -I../../../../../include -I../../../../../include/old/ -m32 -L../../../../../libs/libltpipc -L../../../../../libs/libltpnewipc -L../../../../../lib  semctl08.c  -lltp -lltpnewipc -o semctl08
/usr/bin/ld: ../../../../../libs/libltpnewipc/libltpnewipc.a(libnewipc.o): in function `probe_free_addr':
libs/libltpnewipc/libnewipc.c:79: undefined reference to `safe_shmget'
/usr/bin/ld: libs/libltpnewipc/libnewipc.c:81: undefined reference to `safe_shmat'
/usr/bin/ld: libs/libltpnewipc/libnewipc.c:82: undefined reference to `safe_shmdt'
/usr/bin/ld: libs/libltpnewipc/libnewipc.c:83: undefined reference to `safe_shmctl'

NOTE: other uses of -lltpnewipc (msg{ctl,get,snd}, shm{at,ctl})
are not affected.

Fixes: dfe45f3cf ("libs/libltpnewipc: Use safe macros")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

Reason why I don't push this fix directly is that
I wonder why msg{ctl,get,snd}, shm{at,ctl} aren't affected and whether
we can avoid directly specifying -lltp.

Kind regards,
Petr

 testcases/kernel/syscalls/ipc/semctl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index 99971a7db..2559b4c28 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -8,6 +8,6 @@ LTPLIBS = ltpipc ltpnewipc
 include $(top_srcdir)/include/mk/testcases.mk
 
 semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpipc
-semctl08: LDLIBS += -lltpnewipc
+semctl08: LDLIBS = -lltpnewipc -lltp
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
