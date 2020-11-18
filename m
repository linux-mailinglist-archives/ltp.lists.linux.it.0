Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA82B7B19
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 11:22:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81B423C30B2
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 11:22:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id BF4953C25D2
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 11:22:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D6FA36011D4
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 11:22:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6B10ABF4;
 Wed, 18 Nov 2020 10:22:01 +0000 (UTC)
References: <20201112154748.17857-1-chrubis@suse.cz>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201112154748.17857-1-chrubis@suse.cz>
Date: Wed, 18 Nov 2020 10:22:01 +0000
Message-ID: <87wnyjnewm.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/2] Add support for kconfig strings
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> We add a support for strings into the boolean tokenizer and also
> validator for kconfig variables into the kconfig parser so that we find
> most of the typos even before we attempt to evaluate the expressions.
>
> Cyril Hrubis (2):
>   lib: tst_bool_expr: Add support for strings
>   lib/tst_kconfig: Validate variables
>
>  lib/newlib_tests/.gitignore       |   1 +
>  lib/newlib_tests/config01         |   1 +
>  lib/newlib_tests/config02         |   1 +
>  lib/newlib_tests/config03         |   1 +
>  lib/newlib_tests/config04         |   1 +
>  lib/newlib_tests/config05         |   1 +
>  lib/newlib_tests/test_kconfig.c   |   1 +
>  lib/newlib_tests/test_kconfig02.c |  29 +++++++++
>  lib/newlib_tests/tst_bool_expr.c  |   3 +
>  lib/tst_bool_expr.c               |   7 ++
>  lib/tst_kconfig.c                 | 102 ++++++++++++++++++++++++++++++
>  11 files changed, 148 insertions(+)
>  create mode 100644 lib/newlib_tests/test_kconfig02.c
>
> -- 
> 2.26.2

LGTM

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.de>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
