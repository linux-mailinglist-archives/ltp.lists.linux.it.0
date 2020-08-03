Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F02EC23A078
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 09:47:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89E1A3C6F8C
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 09:47:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B93533C0EAD
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 09:47:55 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id DA78E6017A0
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 09:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596440873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=9X4OfDsK8STmCcY3L8zoUdX17bBDn5AV+yh9Miq/O2k=;
 b=C33zLARmWq5ZMUQjapppFKxF0JbUVpwT+kWdhPVO7ksK218rO14bgIAwz6Jll0GN5dwX9L
 O71+ZI0x1ckFHKpiTr4coEW2UyjAnrWc+gAA3V8+MkPilWUPkrhBgbs6WZz1uOHDm4X8jb
 Lrx0CWw2UEp5CzMG1pPRZB2BA6yeN/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-nUOOnt0iNY-7-1sX0lwMbQ-1; Mon, 03 Aug 2020 03:47:51 -0400
X-MC-Unique: nUOOnt0iNY-7-1sX0lwMbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B2579EC5;
 Mon,  3 Aug 2020 07:47:50 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A835F5C6DD;
 Mon,  3 Aug 2020 07:47:49 +0000 (UTC)
Date: Mon, 3 Aug 2020 09:47:46 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200731121508.12805-2-chrubis@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FAKE_REPLY_C,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] build system: Add explicit make rules
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


----- Original Message -----
> This commit adds explicit build rules, the main motivation are recent
> build failures caused by library orderings. To fix that this commit
> introduces LTPLDLIBS special variable that is passed to linker before
> the LDLIBS which avoids the need for tricks as
> "LDLIBS := -lltpfoo $(LDLIBS)" in the Makefiles.
> 
> This commit also silences the output by default a bit, the verbose
> output could be enabled by VERBOSE=1 env variable, which is probably
> what most of the build systems will do if this gets commited. I guess
> that we can as well silence a bit the "make entering/leaving directory"
> if this the right way to go.

alias for V=0 / V=1 would be nice

LTPLDLIBS should probably be mentioned in doc/build-system-guide.txt


> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  include/mk/env_post.mk |  2 ++
>  include/mk/rules.mk    | 29 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 include/mk/rules.mk
> 
> diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
> index f4169ad66..bdf8c696d 100644
> --- a/include/mk/env_post.mk
> +++ b/include/mk/env_post.mk
> @@ -107,4 +107,6 @@ $(error You must define $$(prefix) before executing
> install)
>  endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
>  endif
>  
> +include $(top_srcdir)/include/mk/rules.mk
> +
>  endif
> diff --git a/include/mk/rules.mk b/include/mk/rules.mk
> new file mode 100644
> index 000000000..e9b9c35ef
> --- /dev/null
> +++ b/include/mk/rules.mk
> @@ -0,0 +1,29 @@
> +%.o: %.c
> +ifdef VERBOSE
> +	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
> +else
> +	@$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
> +	@echo CC $@
> +endif

What if we wouldn't print "DIR" (for non-clean targets) and printed relative paths instead?

CC lib/tst_timer_test.o
CC lib/tst_checkpoint.o
CC lib/tst_supported_fs_types.o
...
CC lib/tests/tst_dataroot03
CC lib/tests/tst_strerrno
..
CC lib/newlib_tests/test07
CC lib/newlib_tests/test13
CC lib/newlib_tests/test11
..
CC testcases/kernel/syscalls/execv/execv01_child
CC testcases/kernel/syscalls/execv/execv01
CC testcases/kernel/syscalls/exit/exit01
CC testcases/kernel/syscalls/exit/exit02
CC testcases/kernel/syscalls/setresgid/setresgid02.o
LD testcases/kernel/syscalls/setresgid/setresgid02
CC testcases/kernel/syscalls/setresgid/setresgid03.o
LD testcases/kernel/syscalls/setresgid/setresgid03



diff --git a/include/mk/env_pre.mk b/include/mk/env_pre.mk
index c4a1f470810e..abc7e7cf9e02 100644
--- a/include/mk/env_pre.mk
+++ b/include/mk/env_pre.mk
@@ -79,7 +79,9 @@ builddir			:= .
 
 abs_builddir			:= $(CURDIR)
 
-cwd_rel_from_top		:= $(subst $(abs_top_builddir),,$(abs_builddir))
+cwd_rel1			:= $(subst $(abs_top_builddir),,$(abs_builddir))
+cwd_rel2			:= $(subst $(abs_top_builddir)/,,$(abs_builddir))
+cwd_rel_from_top		:= $(if $(cwd_rel1),$(cwd_rel2),$(cwd_rel1))
 
 # Where's the source located at? Squish all of the / away by using abspath...
 ifdef MAKE_3_80_COMPAT
diff --git a/include/mk/generic_trunk_target.inc b/include/mk/generic_trunk_target.inc
index e89c7f4e0028..fc59f944fc14 100644
--- a/include/mk/generic_trunk_target.inc
+++ b/include/mk/generic_trunk_target.inc
@@ -103,7 +103,6 @@ ifdef VERBOSE
 	done
 else
 	@set -e; for dir in $(SUBDIRS); do \
-	    echo "DIR $$dir"; \
 	    $(MAKE) --no-print-directory -C $$dir -f "$(abs_srcdir)/$$dir/Makefile" $@; \
 	done
 endif
diff --git a/include/mk/rules.mk b/include/mk/rules.mk
index e9b9c35ef224..6a22e43af7ec 100644
--- a/include/mk/rules.mk
+++ b/include/mk/rules.mk
@@ -1,15 +1,17 @@
+target_rel_dir := $(if $(cwd_rel_from_top),$(cwd_rel_from_top)/,)
+
 %.o: %.c
 ifdef VERBOSE
 	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
 else
 	@$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
-	@echo CC $@
+	@echo CC $(target_rel_dir)$@
 endif
 
 ifdef VERBOSE
 COMPILE.c=$(CC) $(CPPFLAGS) $(CFLAGS) -c
 else
-COMPILE.c=@echo CC $@; $(CC) $(CPPFLAGS) $(CFLAGS) -c
+COMPILE.c=@echo CC $(target_rel_dir)$@; $(CC) $(CPPFLAGS) $(CFLAGS) -c
 endif
 
 %: %.o
@@ -17,7 +19,7 @@ ifdef VERBOSE
 	$(CC) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
 else
 	@$(CC) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
-	@echo LD $@
+	@echo LD $(target_rel_dir)$@
 endif
 
 %: %.c
@@ -25,5 +27,5 @@ ifdef VERBOSE
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
 else
 	@$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
-	@echo CC $@
+	@echo CC $(target_rel_dir)$@
 endif


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
