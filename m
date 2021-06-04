Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C05A39B260
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:06:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED5103C4EC7
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:06:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5E72E3C2822
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:06:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8D3BD1A01493
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:06:14 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F6B621A07;
 Fri,  4 Jun 2021 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622786773;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFoS33gDyfNCBmegG7dZ61FIDxYY95S1OBvYJFNvaPo=;
 b=yJBDb4ZQ8+vnzakZHG/oUjbds3O1b3nRht/8rn72efzEaueULP+BsJj23ljg0UZtvMUjE9
 84llgfdDRt20KIdP15xTr8x7RDLaH31G3lbfHhsRGZDxH8iqyO516ebqgmVJ4Kq+z5n8tq
 X1HTBn3hZJxU9GPqd7wbj6/OWndbsiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622786773;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFoS33gDyfNCBmegG7dZ61FIDxYY95S1OBvYJFNvaPo=;
 b=SyYm3lyjg9GZDFAeUgZR+sJdXBxVY6WITmAIrgwxt10KkiBZJfYiNGeFzXW+yTUjc4Ujo6
 BzkTciDG8OitC0DQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E016F118DD;
 Fri,  4 Jun 2021 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622786773;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFoS33gDyfNCBmegG7dZ61FIDxYY95S1OBvYJFNvaPo=;
 b=yJBDb4ZQ8+vnzakZHG/oUjbds3O1b3nRht/8rn72efzEaueULP+BsJj23ljg0UZtvMUjE9
 84llgfdDRt20KIdP15xTr8x7RDLaH31G3lbfHhsRGZDxH8iqyO516ebqgmVJ4Kq+z5n8tq
 X1HTBn3hZJxU9GPqd7wbj6/OWndbsiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622786773;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFoS33gDyfNCBmegG7dZ61FIDxYY95S1OBvYJFNvaPo=;
 b=SyYm3lyjg9GZDFAeUgZR+sJdXBxVY6WITmAIrgwxt10KkiBZJfYiNGeFzXW+yTUjc4Ujo6
 BzkTciDG8OitC0DQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id doNDNNTCuWASHQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 06:06:12 +0000
Date: Fri, 4 Jun 2021 08:06:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YLnC05icNAshbXtr@pevik>
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <20210603154825.30165-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603154825.30165-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/2] Add 'make checks' and clang-checks to
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

> Adds makefile pieces for tools/clang-checks/main which will be a
> libclang based tool. By default this is ran by 'make check'.

Compilation does not work from tools directory:

$ cd tools/ && make
../include/mk/testcases.mk:25: ../include/mk/clang-checks.mk: No such file or directory
make: *** No rule to make target '../include/mk/clang-checks.mk'.  Stop.

(works from tools/clang-checks/)

But even with compiled tools/clang-checks/main I'm not able to find how this is
supposed to be run, none of these work for me, what am I missing?

$ make autotools && ./configure

$ make check
make: *** No rule to make target 'check'.  Stop.

$ make check-clang
make: *** No rule to make target 'check-clang'.  Stop.

$ cd lib; make check
../include/mk/lib.mk:29: ../include/mk/clang-checks.mk: No such file or directory
make: *** No rule to make target '../include/mk/clang-checks.mk'.  Stop.

$ cd ../testcases/kernel/syscalls/fchown/
make check
../../../../include/mk/testcases.mk:25: ../../../../include/mk/clang-checks.mk: No such file or directory
make: *** No rule to make target '../../../../include/mk/clang-checks.mk'.  Stop.

$ tools/clang-checks/main
Failed to load translation unit: 4
=> maybe print some help info when running without parameters?

Kind regards,
Petr

> In theory allows other tools to be specified with
> 'make CHECK=tool CHECK_FLAGS=<args> check...'. e.g. 'make CHECK=sparse
> CHECK_FLAGS= check-tst_cgroup'

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
