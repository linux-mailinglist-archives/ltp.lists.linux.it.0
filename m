Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD79A39BAE5
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:28:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14A0D3C7FE2
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:28:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5C903C1892
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:28:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4D25C601CD0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:28:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B541321A2E
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622816910;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wt5pa7Gex5rZHzf7qcpn4C5lvIYOpb89d6V3Csjm7Ws=;
 b=OVLZbJUZb2byyMvFY6r+9Q5LSOOLGkwrV8Lz5H+KivmFrASGkpfimyZqscQjyRH/5dQAWl
 HklnDALy27g37MOh31kO8PpFKzAAPGpcz1od0m8papeC5Qn5EMi95Zd1A7XYqmt0tqD9Ar
 ug3PSakRbWHql9lQTZQnpoOLxgeNats=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622816910;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wt5pa7Gex5rZHzf7qcpn4C5lvIYOpb89d6V3Csjm7Ws=;
 b=m1ujw9f2gSKiBj7PtoMDzjaKCeL0zE+/WIMO5+AtSXHvsD5ktMpPQzJ+ch2+lTj1j+tTfy
 BYK0SmOL6gRAWrAQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 736AAA3B81;
 Fri,  4 Jun 2021 14:28:30 +0000 (UTC)
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com> <YLo0XKY9b+S2ROQQ@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YLo0XKY9b+S2ROQQ@pevik>
Date: Fri, 04 Jun 2021 15:28:29 +0100
Message-ID: <87zgw5iu0i.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hell Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Allows the user to run 'make check' to check all source files or
>> 'make check-<target>' to check one source file corresponding to a
>> target.
>
>> Adds makefile pieces for tools/clang-check/main which will be a
>> libclang based tool. By default this is ran by 'make check'.
>
> I haven't looked at Coccinelle, but this LGTM.
>
> But, it still fails to compile:
>
> $ make autotools && ./configure && cd testcases/kernel/syscalls/chown/
> $ make clean; make
>
> make -C "/home/pvorel/install/src/ltp.git/lib" -f "/src/ltp/lib/Makefile" all
> make[1]: Entering directory '/src/ltp/lib'
> make[2]: Nothing to be done for 'all'.
> make[2]: Nothing to be done for 'all'.
> make[1]: Leaving directory '/src/ltp/lib'
> CC testcases/kernel/syscalls/chown/chown01.o
> LD testcases/kernel/syscalls/chown/chown01
> CC testcases/kernel/syscalls/chown/chown02.o
> LD testcases/kernel/syscalls/chown/chown02
> CC testcases/kernel/syscalls/chown/chown03.o
> LD testcases/kernel/syscalls/chown/chown03
> CC testcases/kernel/syscalls/chown/chown04.o
> LD testcases/kernel/syscalls/chown/chown04
> CC testcases/kernel/syscalls/chown/chown05.o
> LD testcases/kernel/syscalls/chown/chown05
> make: *** No rule to make target 'chown01_16.c', needed by 'chown01_16'.  Stop.
> rm chown01.o chown03.o chown02.o chown05.o chown04.o
>
> This is a newly introduced failure caused by some change in include/mk/ in this
> commit.

I guess if Cyril likes the overall approach and doesn't spot what is
causing this, then I will try fixing it.

>
> Could we have also make check in the top level Makefile?

Yes, I didn't try it for the RFC though.

>
> $ make check
> make: *** No rule to make target 'check'.  Stop.
>
> $ cd lib && make check
> CHECK lib/cloner.c
> CHECK lib/get_path.c
> CHECK lib/parse_opts.c
> CHECK lib/random_range.c
> CHECK lib/safe_file_ops.c
> CHECK lib/safe_macros.c
> CHECK lib/safe_net.c
> CHECK lib/safe_pthread.c
> CHECK lib/safe_stdio.c
> CHECK lib/self_exec.c
> CHECK lib/tlibio.c
> tst_af_alg.c:16:2: CHECK ERROR: TEST() macro should not be used in library
> tst_af_alg.c:27:2: CHECK ERROR: TEST() macro should not be used in library
> tst_af_alg.c:74:2: CHECK ERROR: TEST() macro should not be used in library
> tst_af_alg.c:109:2: CHECK ERROR: TEST() macro should not be used in library
> tst_af_alg.c:119:2: CHECK ERROR: TEST() macro should not be used in library
> make: *** [../include/mk/rules.mk:46: check-tst_af_alg] Error 1
>
> Similarly what I added to my patchset which also adds new make target:
> https://patchwork.ozlabs.org/project/ltp/patch/20210603183827.24339-2-pvorel@suse.cz/
> Although my code has duplicate issue:
> ../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-c'
> ../include/mk/generic_leaf_target.inc:110: warning: ignoring old recipe for target 'check-c'
> ../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-shell'
> ../include/mk/generic_leaf_target.inc:118: warning: ignoring old recipe for target 'check-shell'
>
> Also make check on regular test expect it's a library. IMHO these two must be
> probably separated:
>
> $ cd testcases/kernel/syscalls/fchown/ && make check
> CHECK testcases/kernel/syscalls/fchown/fchown01.c
> CHECK testcases/kernel/syscalls/fchown/fchown02.c
> CHECK testcases/kernel/syscalls/fchown/fchown03.c
> CHECK testcases/kernel/syscalls/fchown/fchown04.c
> fchown05.c:80:4: CHECK ERROR: TEST() macro should not be used in library
> make: *** [../../../../include/mk/rules.mk:46: check-fchown05] Error 1

It fails because it is using the old test API, so there is no struct
tst_test test var. I don't think we need to separate the checker. It can
detect what type of file (translation unit) it is processing. In the
case of old API tests, I would simply disable any checks.

All the old tests and test libraries will have something in common. For
the tests, they all import "test.h" (even if through another header), so
we can identify them by that.

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
