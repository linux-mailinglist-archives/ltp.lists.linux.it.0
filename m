Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 051543BC898
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:41:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1E793C68B6
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:41:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F7A03C0F90
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:41:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0007260073E
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:41:02 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 407892258D;
 Tue,  6 Jul 2021 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625564462;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PyWWFXooLrTnmuMCfdvNR3+T1A0+Z+uxW+C+WihmSes=;
 b=bBlsxMODctPhBA6YgKM5gvyDTRvUqD79h5k5ZPHzRerWUoTlFAI/9etC//94B+UimLE+0p
 0yiKxHgqUG0tegJEUh0Kyiy2Rgtw4krQG2Np1UKbd33ETyG9uffzyZl2d578T9JN1ksHMG
 x3flUT/1nYZSxLaiPIs+BV/0PVANXAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625564462;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PyWWFXooLrTnmuMCfdvNR3+T1A0+Z+uxW+C+WihmSes=;
 b=Iclnso/nSmMeBBXPUXW4i4NemTsoRgH61C4G3rpMFEiD3sbs7e+EdjK8wgfj/W2O2Aqi6b
 J4DgNAwL7VAZpvCg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C357EA3BA6;
 Tue,  6 Jul 2021 09:41:01 +0000 (UTC)
References: <20210705135014.679200-1-lkml@jv-coder.de>
 <20210705135014.679200-2-lkml@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20210705135014.679200-2-lkml@jv-coder.de>
Date: Tue, 06 Jul 2021 10:41:00 +0100
Message-ID: <87zguz7par.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs_bind: Convert to ltp tests
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Joerg,

Joerg Vehlow <lkml@jv-coder.de> writes:

> diff --git a/testcases/kernel/fs/fs_bind/cloneNS/fs_bind_cloneNS02.sh b/testcases/kernel/fs/fs_bind/cloneNS/fs_bind_cloneNS02.sh
> new file mode 100755
> index 000000000..9e0f5fe05
> --- /dev/null
> +++ b/testcases/kernel/fs/fs_bind/cloneNS/fs_bind_cloneNS02.sh
> @@ -0,0 +1,53 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) International Business Machines  Corp., 2005
> +# Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> +# Author: Avantika Mathur (mathurav@us.ibm.com)
> +
> +FS_BIND_TESTFUNC=test
> +
> +. fs_bind_lib.sh
> +
> +test()
> +{
> +    tst_res TINFO "cloneNS: namespaces with parent-slave"
> +
> +	fs_bind_makedir rshared dir1
> +	EXPECT_PASS mount --bind "$FS_BIND_DISK1" dir1
> +
> +	mkdir dir2
> +	EXPECT_PASS mount --bind dir1 dir2

There seems to be a section of tabs instead of spaces here. Also in
other places.

I wonder how you converted these?

Looks promising.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
