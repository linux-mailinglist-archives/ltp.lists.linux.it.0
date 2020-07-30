Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A22333F0
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 16:08:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA3333C4C04
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 16:08:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7B0D53C093E
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 16:08:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D1F421000AC9
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 16:08:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DA7EB165
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 14:09:03 +0000 (UTC)
Date: Thu, 30 Jul 2020 16:09:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200730140912.GE3457@yuki.lan>
References: <20200730092637.487-1-pvorel@suse.cz>
 <20200730094842.GB3457@yuki.lan> <20200730101643.GA6381@dell5510>
 <20200730122226.GD3457@yuki.lan> <20200730125329.GA31867@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730125329.GA31867@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] semctl: Fix 32 bit build
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I wonder what would be the easiest solution here.
> 
> > The main problem is that these flags are per-testcase defined and are
> > not expanded before we enter rule to build a test. And as we are using
> > implicit rules to compile C code we cannot easily change that.
> 
> > I guess that we can write down our rules and do whatever we want there
> > though.
> Thanks for info. Well, I'll probably merge the original fix then.

So I've been looking into the problem for a while and due to a make
limitations the best bet for a solution would be adding a special
variable for the LTP libraries as:

diff --git a/include/mk/testcases.mk b/include/mk/testcases.mk
index bb22be82e..03937516a 100644
--- a/include/mk/testcases.mk
+++ b/include/mk/testcases.mk
@@ -59,5 +59,8 @@ LDFLAGS += $(addprefix -L$(top_builddir)/libs/lib, $(LTPLIBS))
 
 endif
 
+%: %.c
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LTPLDLIBS) $(LDLIBS) -o $@
+
 $(LTPLIBS_DIRS) $(APICMDS_DIR) $(LIBLTP_DIR): %:
 	mkdir -p "$@"
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index 0172bb495..2e0ed0ceb 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -10,7 +10,7 @@ shmctl05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LDLIBS += -lltpipc
-shmctl06: LDLIBS += -lltpnewipc
+shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LTPLDLIBS = -lltpipc
+shmctl06: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
