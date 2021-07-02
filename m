Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D403BA01C
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 13:54:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50AA53C8CD7
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 13:54:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49B873C30B7
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 13:54:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 91BD91001370
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 13:54:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82DCE22981;
 Fri,  2 Jul 2021 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625226859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWLKAbkq2pmKel7zlTaHAZONVl79OysfyGAfCw5P9Fw=;
 b=Qkfua3YzS1Tct+5VCT3UkD89S0O2uPtvvDH9bjE1Bc2g+8Tdsl00DaYFACIBZQf6kOS3pg
 sxUaB5HO0/QO3paQSTE7wNZjwgM8MicmDQYoG+UHw7gMYLv88igjauB9qZ6NjzGX/l/j9Y
 wqC9sjQTWAudymm1FvvHO4c19B+x0mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625226859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWLKAbkq2pmKel7zlTaHAZONVl79OysfyGAfCw5P9Fw=;
 b=5O7Qa8JgfV1mlO2L1GeGgvet3TM6GCfjFshrzZaBwK8Aqm/fHrWR3a/prr1KpYixDmCvSP
 Nx2n8SoBvx9PATBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6174D11C84;
 Fri,  2 Jul 2021 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625226859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWLKAbkq2pmKel7zlTaHAZONVl79OysfyGAfCw5P9Fw=;
 b=Qkfua3YzS1Tct+5VCT3UkD89S0O2uPtvvDH9bjE1Bc2g+8Tdsl00DaYFACIBZQf6kOS3pg
 sxUaB5HO0/QO3paQSTE7wNZjwgM8MicmDQYoG+UHw7gMYLv88igjauB9qZ6NjzGX/l/j9Y
 wqC9sjQTWAudymm1FvvHO4c19B+x0mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625226859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWLKAbkq2pmKel7zlTaHAZONVl79OysfyGAfCw5P9Fw=;
 b=5O7Qa8JgfV1mlO2L1GeGgvet3TM6GCfjFshrzZaBwK8Aqm/fHrWR3a/prr1KpYixDmCvSP
 Nx2n8SoBvx9PATBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 9uL9Fmv+3mDsDwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 02 Jul 2021 11:54:19 +0000
Date: Fri, 2 Jul 2021 13:28:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YN74bEchlEFD1nDN@yuki>
References: <20210701032931.132468-1-xieziyao@huawei.com>
 <20210701032931.132468-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701032931.132468-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] fork07: Rewrite the test to a proper
 synchronization
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
The more I look at the test to more I realize how broken it is.

It starts with a wrong premise that file offset changes, as a
consequences of read(), are not propagated between the child and parent
process for a file descriptor that has been opened by parent and
propagated to a child on a fork(). This is not true at all as internally
in kernel the child and parent file descriptor will refer to the same
open file structure. And the test avoids failures by reading a byte from
a libc FILE in the parent, which of course caches data in the FILE
buffer so the first read() in libc reads the whole buffer. After that
each forked child will get the exact FILE structure in it's userspace
memory with the buffered data.

In conclusion this test has to be deleted and we should write a new one
from a scratch.

When we are asked to check if file descriptors are passed down correctly
between forks it makes much more sense to do it as follows:

* Parent writes N bytes (for example 'a') to a file in setup()
* Parent opens a file descriptor for reading pointing to that file
* Parent forks N children
  - each child reads a byte from the file
    checks that the byte is 'a' then exits
* Parent waits the all the children
* Parent checks that the end of file is reached
  for example by checking that read() from the
  file descriptor returns 0


And the other way around would be:

* Parent opens a file descriptor for writing pointing to an empty file
  (the file should be unlinked() before the open with O_CREAT)
* Parent forks N children
  - each child writes a sequence of bytes 'test' or something like this
* Parent waits the all the children
* Parent checks that the file is filled with N string 'test' that are
  not interleaved

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
