Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A939BABB
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:10:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A92A53C7FCA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:10:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0339E3C26C2
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:10:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E5829140026D
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:10:38 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BC371FD47;
 Fri,  4 Jun 2021 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622815838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKJs+WJDZ8xgjI9Ch/NdIxdcpMnitjUGlqdgF2IFz8s=;
 b=c2fG3KCC3nRX6/WmlhoYtvi+iU3UPgh4BMbc0+/gE5OX8JfWlAU5/bhDv0p/RItQACjzVu
 HyYr0de8UsRzWAaq0C35xl1+snHyNx/je29E8UlQbHae5yRvdcrTfUnAk9C77H+1R2pOib
 uQGQ20Q3fxgiKvbBfM/Pl9lH1NQltBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622815838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKJs+WJDZ8xgjI9Ch/NdIxdcpMnitjUGlqdgF2IFz8s=;
 b=wPLQIhSeOXEJ+rDotEYuUFKOntv3TmT/I1SPmmMXM37uGCwk5KWC2BYP1frRYcEd0Nckw0
 k/9OqgRYa7qEDsCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E6483118DD;
 Fri,  4 Jun 2021 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622815838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKJs+WJDZ8xgjI9Ch/NdIxdcpMnitjUGlqdgF2IFz8s=;
 b=c2fG3KCC3nRX6/WmlhoYtvi+iU3UPgh4BMbc0+/gE5OX8JfWlAU5/bhDv0p/RItQACjzVu
 HyYr0de8UsRzWAaq0C35xl1+snHyNx/je29E8UlQbHae5yRvdcrTfUnAk9C77H+1R2pOib
 uQGQ20Q3fxgiKvbBfM/Pl9lH1NQltBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622815838;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKJs+WJDZ8xgjI9Ch/NdIxdcpMnitjUGlqdgF2IFz8s=;
 b=wPLQIhSeOXEJ+rDotEYuUFKOntv3TmT/I1SPmmMXM37uGCwk5KWC2BYP1frRYcEd0Nckw0
 k/9OqgRYa7qEDsCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ifEHNV00umBmagAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 14:10:37 +0000
Date: Fri, 4 Jun 2021 16:10:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YLo0XKY9b+S2ROQQ@pevik>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604111434.21422-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/2] Add 'make check' and clang-check to
 build system
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> Allows the user to run 'make check' to check all source files or
> 'make check-<target>' to check one source file corresponding to a
> target.

> Adds makefile pieces for tools/clang-check/main which will be a
> libclang based tool. By default this is ran by 'make check'.

I haven't looked at Coccinelle, but this LGTM.

But, it still fails to compile:

$ make autotools && ./configure && cd testcases/kernel/syscalls/chown/
$ make clean; make

make -C "/home/pvorel/install/src/ltp.git/lib" -f "/src/ltp/lib/Makefile" all
make[1]: Entering directory '/src/ltp/lib'
make[2]: Nothing to be done for 'all'.
make[2]: Nothing to be done for 'all'.
make[1]: Leaving directory '/src/ltp/lib'
CC testcases/kernel/syscalls/chown/chown01.o
LD testcases/kernel/syscalls/chown/chown01
CC testcases/kernel/syscalls/chown/chown02.o
LD testcases/kernel/syscalls/chown/chown02
CC testcases/kernel/syscalls/chown/chown03.o
LD testcases/kernel/syscalls/chown/chown03
CC testcases/kernel/syscalls/chown/chown04.o
LD testcases/kernel/syscalls/chown/chown04
CC testcases/kernel/syscalls/chown/chown05.o
LD testcases/kernel/syscalls/chown/chown05
make: *** No rule to make target 'chown01_16.c', needed by 'chown01_16'.  Stop.
rm chown01.o chown03.o chown02.o chown05.o chown04.o

This is a newly introduced failure caused by some change in include/mk/ in this
commit.

Could we have also make check in the top level Makefile?

$ make check
make: *** No rule to make target 'check'.  Stop.

$ cd lib && make check
CHECK lib/cloner.c
CHECK lib/get_path.c
CHECK lib/parse_opts.c
CHECK lib/random_range.c
CHECK lib/safe_file_ops.c
CHECK lib/safe_macros.c
CHECK lib/safe_net.c
CHECK lib/safe_pthread.c
CHECK lib/safe_stdio.c
CHECK lib/self_exec.c
CHECK lib/tlibio.c
tst_af_alg.c:16:2: CHECK ERROR: TEST() macro should not be used in library
tst_af_alg.c:27:2: CHECK ERROR: TEST() macro should not be used in library
tst_af_alg.c:74:2: CHECK ERROR: TEST() macro should not be used in library
tst_af_alg.c:109:2: CHECK ERROR: TEST() macro should not be used in library
tst_af_alg.c:119:2: CHECK ERROR: TEST() macro should not be used in library
make: *** [../include/mk/rules.mk:46: check-tst_af_alg] Error 1

Similarly what I added to my patchset which also adds new make target:
https://patchwork.ozlabs.org/project/ltp/patch/20210603183827.24339-2-pvorel@suse.cz/
Although my code has duplicate issue:
../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-c'
../include/mk/generic_leaf_target.inc:110: warning: ignoring old recipe for target 'check-c'
../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-shell'
../include/mk/generic_leaf_target.inc:118: warning: ignoring old recipe for target 'check-shell'

Also make check on regular test expect it's a library. IMHO these two must be
probably separated:

$ cd testcases/kernel/syscalls/fchown/ && make check
CHECK testcases/kernel/syscalls/fchown/fchown01.c
CHECK testcases/kernel/syscalls/fchown/fchown02.c
CHECK testcases/kernel/syscalls/fchown/fchown03.c
CHECK testcases/kernel/syscalls/fchown/fchown04.c
fchown05.c:80:4: CHECK ERROR: TEST() macro should not be used in library
make: *** [../../../../include/mk/rules.mk:46: check-fchown05] Error 1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
