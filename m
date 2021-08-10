Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E983E5C48
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 15:54:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D41993C70B0
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 15:54:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 31BCB3C6868
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 15:54:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A53B91A00936
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 15:54:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C03501FE56;
 Tue, 10 Aug 2021 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628603643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nhDSFoKrha755WnFlRUl3RmiAoxWCjc77A+r4BIMwK8=;
 b=S7glQ/LkSJ+dfkNXJngdHfdrxc+TccCGkQWHBlEeRekQnXsX2NkMH0rWJ6bnkUJ3s7Adft
 CHrcMLHWGvNKJ2MwsCskjpqOmqOjS0w/X8lu+7vqTVpYDZPjt5FhoFTuTYVM9GQFxxgXWn
 ZmYwsX+fTwDQ4wgRA7xW38KmWLZce8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628603643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nhDSFoKrha755WnFlRUl3RmiAoxWCjc77A+r4BIMwK8=;
 b=J9cs243kTcrwRuwnjSqM3DBOMD+btmfvsysOvvxVL8lPdWo5613ibOGMsiUarcqKRrzbuL
 ui00YrBd0/mAbZBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC3D913B3D;
 Tue, 10 Aug 2021 13:54:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3XbGKPuEEmGNcQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Aug 2021 13:54:03 +0000
Date: Tue, 10 Aug 2021 15:54:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YRKFBxpUwJExuMzi@yuki>
References: <20210806062456.11678-1-sujiaxun@uniontech.com>
 <YRJM9PffB27VBngU@yuki>
 <69afbc39-4c9d-dbab-beb2-4ff43d733818@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69afbc39-4c9d-dbab-beb2-4ff43d733818@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,
 1/6] syscalls/sysfs: Convert sysfs01 to the new API
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
> I checked with "checkpatch.pl -f" and there were no errors or warnings. 
> I use "git am" to apply the patch normally without any warning. How did 
> you check that there are spaces.

Have you used recent enough version?

Latest kernel git:

$ ~/linux/scripts/checkpatch.pl -f sysfs01.c

ERROR: code indent should use tabs where possible
#20: FILE: sysfs01.c:20:
+        /* option 1, buf holds fs name */$

ERROR: code indent should use tabs where possible
#21: FILE: sysfs01.c:21:
+        TST_EXP_POSITIVE(tst_syscall(__NR_sysfs, 1, "proc"),$

WARNING: please, no spaces at the start of a line
#21: FILE: sysfs01.c:21:
+        TST_EXP_POSITIVE(tst_syscall(__NR_sysfs, 1, "proc"),$

ERROR: code indent should use tabs where possible
#22: FILE: sysfs01.c:22:
+                        "sysfs(1,'proc')");$

WARNING: please, no spaces at the start of a line
#22: FILE: sysfs01.c:22:

...


$ cd ~/linux/; git describe

v5.14-rc5-2-g9a73fa375d58

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
