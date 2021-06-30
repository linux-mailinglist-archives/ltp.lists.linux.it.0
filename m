Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B91583B8135
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 13:21:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85F033C6EBF
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 13:21:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3DB883C0234
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 13:21:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 66B552005D2
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 13:21:22 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B9601FE6D;
 Wed, 30 Jun 2021 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625052081;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcRrArCHTfHDKlREc0v42yvAQqrwOWz0WZkZ5LO8n4s=;
 b=S3IgIuyWDyuX8p2yDrC3P+Zz7yT+dUmn/Q6buRpXFUfisYyCMyfNIJWXEN6ZSsrke1Ochg
 tC1VjYU8C99xr5NncDqOxxOQSNuAhBjXsVLrlolY0wB641brbwa7KvHEePQ8UWspIWoM5t
 WKjlPxLok/2NLp39IXq4wdlJxdrTe8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625052081;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcRrArCHTfHDKlREc0v42yvAQqrwOWz0WZkZ5LO8n4s=;
 b=YZseHrTOXyx8NbqFSghQTJlPmC4BLf6geabxgn9iGXUrZRW14LrFuJo+1c2Lhbco0oO7Lp
 X1cwoETxqbMMOODQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 27488118DD;
 Wed, 30 Jun 2021 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625052081;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcRrArCHTfHDKlREc0v42yvAQqrwOWz0WZkZ5LO8n4s=;
 b=S3IgIuyWDyuX8p2yDrC3P+Zz7yT+dUmn/Q6buRpXFUfisYyCMyfNIJWXEN6ZSsrke1Ochg
 tC1VjYU8C99xr5NncDqOxxOQSNuAhBjXsVLrlolY0wB641brbwa7KvHEePQ8UWspIWoM5t
 WKjlPxLok/2NLp39IXq4wdlJxdrTe8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625052081;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcRrArCHTfHDKlREc0v42yvAQqrwOWz0WZkZ5LO8n4s=;
 b=YZseHrTOXyx8NbqFSghQTJlPmC4BLf6geabxgn9iGXUrZRW14LrFuJo+1c2Lhbco0oO7Lp
 X1cwoETxqbMMOODQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id MyrsBrFT3GCRKQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 30 Jun 2021 11:21:21 +0000
Date: Wed, 30 Jun 2021 13:21:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Josef Bacik <josef@toxicpanda.com>
Message-ID: <YNxTr43lvviG0GOn@pevik>
References: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
 <e4c71c01-ed70-10a6-be4d-11966d1fcb75@toxicpanda.com>
 <b5c6779b-f11d-661e-18c5-569a07f6fd8e@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5c6779b-f11d-661e-18c5-569a07f6fd8e@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [BUG] btrfs potential failure on 32 core LTP test
 (fallocate05)
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qu Wenruo <wqu@suse.com>, Chris Mason <clm@fb.com>,
 "kernel-team@lists.ubuntu.com" <kernel-team@lists.ubuntu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, David Sterba <dsterba@suse.com>,
 Filipe Manana <fdmanana@suse.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 29/06/2021 19:20, Josef Bacik wrote:
> > On 6/29/21 1:00 PM, Krzysztof Kozlowski wrote:
> >> Dear BTRFS folks,

> >> I am hitting a potential regression of btrfs, visible only with
> >> fallocate05 test from LTP (Linux Test Project) only on 32+ core Azure
> >> instances (x86_64).

> >> Tested:
> >> v5.8 (Ubuntu with our stable patches): PASS
> >> v5.11 (Ubuntu with our stable patches): FAIL
> >> v5.13 mainline: FAIL

> >> PASS means test passes on all instances
> >> FAIL means test passes on other instance types (e.g. 4 or 16 core) but
> >> fails on 32 and 64 core instances (did not test higher),
> >> e.g.: Standard_F32s_v2, Standard_F64s_v2, Standard_D32s_v3,
> >> Standard_E32s_v3

> >> Reproduction steps:
> >> git clone https://github.com/linux-test-project/ltp.git
> >> cd ltp
> >> ./build.sh && make install -j8
> >> cd ../ltp-install
> >> sudo ./runltp -f syscalls -s fallocate05


> > This thing keeps trying to test ext2, how do I make it only test btrfs?  Thanks,

> It tests all available file systems, just wait till it gets to btrfs. I
> don't know how to limit it only to one file system.
In the future we can add environment variable to specify the only fs to be
tested. There is LTP_DEV_FS_TYPE, but that does not work when .all_filesystems
flag is enabled. Thus just patch the file:

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fallocate/fallocate05.c testcases/kernel/syscalls/fallocate/fallocate05.c
index 55ec1aee4..7f5a3005a 100644
--- testcases/kernel/syscalls/fallocate/fallocate05.c
+++ testcases/kernel/syscalls/fallocate/fallocate05.c
@@ -149,7 +149,8 @@ static struct tst_test test = {
 	.mount_device = 1,
 	.dev_min_size = 512,
 	.mntpoint = MNTPOINT,
-	.all_filesystems = 1,
+	.needs_device = 1,
+	.dev_fs_type = "btrfs",
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = run,

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
