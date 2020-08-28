Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1F255B11
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 15:19:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E43F3C2E3D
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 15:19:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E97E13C04C3
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 15:18:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2BC4B600F56
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 15:18:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44A59B5C8;
 Fri, 28 Aug 2020 13:19:31 +0000 (UTC)
Date: Fri, 28 Aug 2020 15:18:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200828131856.GA29915@dell5510>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820090824.3033-4-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 3/5] IMA: Refactor datafiles directory
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> --- a/testcases/kernel/security/integrity/ima/datafiles/Makefile
> +++ b/testcases/kernel/security/integrity/ima/datafiles/Makefile
> @@ -1,6 +1,8 @@

>  #    testcases/kernel/security/integrity/ima/policy testcases Makefile.

> +#    Copyright (c) Linux Test Project, 2019-2020
> +#    Copyright (c) 2020 Microsoft Corporation
>  #    Copyright (C) 2009, Cisco Systems Inc.

>  #    This program is free software; you can redistribute it and/or modify
> @@ -20,12 +22,10 @@
>  # Ngie Cooper, July 2009


> -top_srcdir		?= ../../../../../..
> +top_srcdir	?= ../../../../../..

>  include	$(top_srcdir)/include/mk/env_pre.mk

> -INSTALL_DIR		:= testcases/data/ima_policy
> +SUBDIRS	:= ima_*
It looks this broke build on out-of-tree build:
https://travis-ci.org/github/linux-test-project/ltp/builds/722003659
https://travis-ci.org/github/linux-test-project/ltp/jobs/722003661
https://travis-ci.org/github/linux-test-project/ltp/jobs/722003662
https://travis-ci.org/github/linux-test-project/ltp/jobs/722003663
...

I'm sorry I overlooked that. I'll have look on Monday (unless anybody fixes it).

Kind regards,
Petr

> -INSTALL_TARGETS		:= measure.policy-invalid *.policy
> -
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +include $(top_srcdir)/include/mk/generic_trunk_target.mk

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
