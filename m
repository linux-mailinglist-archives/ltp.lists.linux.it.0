Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB71FAD1D
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 11:51:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 032B63C2CFE
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 11:51:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E4F743C0887
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 11:51:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 070C8240A6D
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 11:51:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94B93ACAD;
 Tue, 16 Jun 2020 09:51:54 +0000 (UTC)
Date: Tue, 16 Jun 2020 11:52:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200616095204.GA6239@yuki.lan>
References: <5d502fbc7070644ed83c423713941b457c3a7aff.1590057824.git.viresh.kumar@linaro.org>
 <7d7363384b5719fa48a5a5ba71b0aa581ebc91bd.1590131635.git.viresh.kumar@linaro.org>
 <20200615133125.GC25279@yuki.lan>
 <20200616064047.7njwpmlmxzyoikwo@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616064047.7njwpmlmxzyoikwo@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 3/5] syscalls: semctl: Add new test to verify
 the _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
> index 6895fb1967a1..d7002872ab42 100644
> --- a/testcases/kernel/syscalls/ipc/semctl/Makefile
> +++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
> @@ -3,7 +3,7 @@
>  
>  top_srcdir              ?= ../../../../..
>  
> -LTPLIBS = ltpipc
> +LTPLIBS = ltpipc ltpnewipc
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> @@ -11,4 +11,4 @@ semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpi
>  semctl08: LDLIBS += -lltpnewipc
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -LDFLAGS += -L$(top_builddir)/libs/libltpnewipc
> 
> This doesn't build for some reason.
> 
> make -C "/mnt/ssd/all/work/repos/tools/ltp/libs/libltpipc /mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc" -f "/mnt/ssd/all/work/repos/tools/ltp/libs/libltpipc /mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc/Makefile" all
> make[1]: *** /mnt/ssd/all/work/repos/tools/ltp/libs/libltpipc /mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc: No such file or directory.  Stop.
> ../../../../../include/mk/testcases.mk:52: recipe for target '/mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc/libltpnewipc.a' failed
> make: *** [/mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc/libltpnewipc.a] Error 2

Ah, right, the rule that rebuilds the libraries does not work correctly
for more than one library because I do pass "$^" there which is the list
of directories and not a single directory.

As a quick hack this should fix it:

diff --git a/include/mk/testcases.mk b/include/mk/testcases.mk
index 684655fbf..7e0ec13f9 100644
--- a/include/mk/testcases.mk
+++ b/include/mk/testcases.mk
@@ -49,7 +49,9 @@ LTPLIBS_FILES = $(addsuffix .a, $(addprefix $(abs_top_builddir)/libs/, $(foreach
 MAKE_DEPS += $(LTPLIBS_FILES)
 
 $(LTPLIBS_FILES): $(LTPLIBS_DIRS)
-       $(MAKE) -C "$^" -f "$(subst $(abs_top_builddir),$(abs_top_srcdir),$^)/Makefile" all
+       for dir in $^; do \
+               $(MAKE) -C "$$dir" -f "$(subst $(abs_top_builddir),$(abs_top_srcdir),$$dir)/Makefile" all; \
+       done
 
 LDFLAGS += $(addprefix -L$(top_builddir)/libs/lib, $(LTPLIBS))


This does not parallelize the build but I guess that it would be fine since
when we rebuild LTP from top directory the libraries are build first anyways
and this is no-op.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
