Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BFA8C8860
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2024 16:48:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E20A3CFB44
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2024 16:48:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 44E683C0326
 for <ltp@lists.linux.it>; Fri, 17 May 2024 16:48:38 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=mdoucha@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4674160193F
 for <ltp@lists.linux.it>; Fri, 17 May 2024 16:48:36 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3D7975D496;
 Fri, 17 May 2024 14:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1715957314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L6+S5cs5i4PS067E2Wjn6SnoPI/GmriN4wS06Sb/jEo=;
 b=FriVYh+dI7dLwuVKvy41v+82mXL4kxjO59Joby6lEbHAJYyz2q60ZFPv4tIpHpomHvdfja
 hPQFbjdWqJns/E1ZtIvKfHN5tF4Co0zMdC4ghtEw+FgpSAs5fPXZtiqzZkD9l9O6+hzC3q
 DpyZ2qUoE3WXtkZ7eb3BPtZ/joDIGLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1715957314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L6+S5cs5i4PS067E2Wjn6SnoPI/GmriN4wS06Sb/jEo=;
 b=HOrwfgMTMORjTTEqwHY8p0KcKHhY6cEq7SgBA+S1/wSyKZZ+HxX7KFNxnzIUh5emofU0hK
 lzIEnloBcc1qE7DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1715957314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L6+S5cs5i4PS067E2Wjn6SnoPI/GmriN4wS06Sb/jEo=;
 b=FriVYh+dI7dLwuVKvy41v+82mXL4kxjO59Joby6lEbHAJYyz2q60ZFPv4tIpHpomHvdfja
 hPQFbjdWqJns/E1ZtIvKfHN5tF4Co0zMdC4ghtEw+FgpSAs5fPXZtiqzZkD9l9O6+hzC3q
 DpyZ2qUoE3WXtkZ7eb3BPtZ/joDIGLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1715957314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L6+S5cs5i4PS067E2Wjn6SnoPI/GmriN4wS06Sb/jEo=;
 b=HOrwfgMTMORjTTEqwHY8p0KcKHhY6cEq7SgBA+S1/wSyKZZ+HxX7KFNxnzIUh5emofU0hK
 lzIEnloBcc1qE7DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 340F413942;
 Fri, 17 May 2024 14:48:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ixESDEJuR2YBDgAAD6G6ig
 (envelope-from <mdoucha@suse.cz>); Fri, 17 May 2024 14:48:34 +0000
Message-ID: <ee920e44-272f-4e76-9b08-a40f86d51fef@suse.cz>
Date: Fri, 17 May 2024 16:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wei Gao <wegao@suse.com>, ltp@lists.linux.it
References: <20231228025537.28807-1-wegao@suse.com>
 <20240322112031.20939-1-wegao@suse.com>
From: Martin Doucha <mdoucha@suse.cz>
Autocrypt: addr=mdoucha@suse.cz; keydata=
 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
In-Reply-To: <20240322112031.20939-1-wegao@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MID_RHS_MATCH_FROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email, suse.cz:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.29
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] move_mount03: check allow to mount beneath top
 mount
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
one note below but this can be merged as is.

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 22. 03. 24 12:20, Wei Gao via ltp wrote:
> Signed-off-by: Wei Gao <wegao@suse.com>
> ---
>   include/lapi/fsmount.h                        |   4 +
>   runtest/syscalls                              |   1 +
>   .../kernel/syscalls/move_mount/.gitignore     |   1 +
>   .../kernel/syscalls/move_mount/move_mount03.c | 137 ++++++++++++++++++
>   4 files changed, 143 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/move_mount/move_mount03.c
> 
> diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
> index 07eb42ffa..216e966c7 100644
> --- a/include/lapi/fsmount.h
> +++ b/include/lapi/fsmount.h
> @@ -115,6 +115,10 @@ static inline int mount_setattr(int dirfd, const char *from_pathname, unsigned i
>   }
>   #endif /* HAVE_MOUNT_SETATTR */
>   
> +#ifndef MOVE_MOUNT_BENEATH
> +#define MOVE_MOUNT_BENEATH 		0x00000200
> +#endif /* MOVE_MOUNT_BENEATH */
> +
>   /*
>    * New headers added in kernel after 5.2 release, create them for old userspace.
>   */
> diff --git a/runtest/syscalls b/runtest/syscalls
> index b1125dd75..04b758fd9 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -824,6 +824,7 @@ mount_setattr01 mount_setattr01
>   
>   move_mount01 move_mount01
>   move_mount02 move_mount02
> +move_mount03 move_mount03
>   
>   move_pages01 move_pages01
>   move_pages02 move_pages02
> diff --git a/testcases/kernel/syscalls/move_mount/.gitignore b/testcases/kernel/syscalls/move_mount/.gitignore
> index 83ae40145..ddfe10128 100644
> --- a/testcases/kernel/syscalls/move_mount/.gitignore
> +++ b/testcases/kernel/syscalls/move_mount/.gitignore
> @@ -1,2 +1,3 @@
>   /move_mount01
>   /move_mount02
> +/move_mount03
> diff --git a/testcases/kernel/syscalls/move_mount/move_mount03.c b/testcases/kernel/syscalls/move_mount/move_mount03.c
> new file mode 100644
> index 000000000..dfdad080e
> --- /dev/null
> +++ b/testcases/kernel/syscalls/move_mount/move_mount03.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2023 Christian Brauner <brauner@kernel.org>
> + * Copyright (c) 2023 Wei Gao <wegao@suse.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Test allow to mount beneath top mount feature
> + */
> +
> +/*
> + * Test create for following commit:
> + * commit 6ac392815628f317fcfdca1a39df00b9cc4ebc8b
> + * Author: Christian Brauner <brauner@kernel.org>
> + * Date:   Wed May 3 13:18:42 2023 +0200
> + *     fs: allow to mount beneath top mount
> + *
> + * Above commit has heavily commented but i found following commit
> + * contain simple summary of this feature for easy understanding:
> + *
> + * commit c0a572d9d32fe1e95672f24e860776dba0750a38
> + * Author: Linus Torvalds <torvalds@linux-foundation.org>
> + *       TL;DR:
> + *
> + *         > mount -t ext4 /dev/sda /mnt
> + *           |
> + *           --/mnt    /dev/sda    ext4
> + *
> + *         > mount --beneath -t xfs /dev/sdb /mnt
> + *           |
> + *           --/mnt    /dev/sdb    xfs
> + *             --/mnt  /dev/sda    ext4
> + *
> + *         > umount /mnt
> + *           |
> + *           --/mnt    /dev/sdb    xfs
> + *
> + * So base above scenario design following scenario for LTP check:
> + *
> + *         > mount -t tmpfs /DIRA
> + *           |
> + *           --/DIRA(create A file within DIRA)
> + *
> + *         > mount -t tmpfs /DIRB
> + *           |
> + *           --/DIRA(create B file within DIRB)
> + *
> + *         > move_mount --beneath /DIRA /DIRB
> + *           |
> + *           --/mnt    /DIRA /DIRB
> + *             --/mnt  /DIRB
> + *
> + *         If you check content of /DIRB, you can see file B
> + *
> + *         > umount /DIRB
> + *           |
> + *           --/mnt    /DIRA /DIRB
> + *         Check content of /DIRB, you can see file A exist since
> + *         current /DIRB mount source is already become /DIRA
> + *
> + * See also:
> + * https://lwn.net/Articles/930591/
> + * https://github.com/brauner/move-mount-beneath
> + */
> +
> +#include <stdio.h>
> +
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
> +#include "lapi/sched.h"
> +
> +#define DIRA "LTP_DIR_A"
> +#define DIRB "LTP_DIR_B"
> +
> +static int fda = -1, fdb = -1;
> +
> +static void run(void)
> +{
> +	SAFE_MOUNT("none", DIRA, "tmpfs", 0, 0);
> +	SAFE_MOUNT("none", DIRB, "tmpfs", 0, 0);
> +	SAFE_TOUCH(DIRA "/A", 0, NULL);
> +	SAFE_TOUCH(DIRB "/B", 0, NULL);
> +
> +	fda = open_tree(AT_FDCWD, DIRA, OPEN_TREE_CLOEXEC | OPEN_TREE_CLONE);
> +	if (fda == -1)
> +		tst_brk(TBROK | TERRNO, "open_tree() failed");
> +
> +	fdb = SAFE_OPEN(DIRB, O_PATH | O_NOFOLLOW, 0666);
> +	TST_EXP_PASS(move_mount(fda, "", fdb, "",
> +				MOVE_MOUNT_BENEATH | MOVE_MOUNT_F_EMPTY_PATH |
> +				MOVE_MOUNT_T_EMPTY_PATH));
> +	SAFE_CLOSE(fda);
> +	SAFE_CLOSE(fdb);
> +
> +	TST_EXP_PASS(access(DIRB "/B", F_OK));

That extra check I've asked for in v3 would still be nice here.

> +	SAFE_UMOUNT(DIRB);
> +	TST_EXP_PASS(access(DIRB "/A", F_OK));
> +
> +	SAFE_UMOUNT(DIRB);
> +	SAFE_UMOUNT(DIRA);
> +}
> +
> +static void setup(void)
> +{
> +	SAFE_MKDIR(DIRA, 0777);
> +	SAFE_MKDIR(DIRB, 0777);
> +}
> +
> +static void cleanup(void)
> +{
> +
> +	if (fda >= 0)
> +		SAFE_CLOSE(fda);
> +
> +	if (fdb >= 0)
> +		SAFE_CLOSE(fdb);
> +
> +	if (tst_is_mounted_at_tmpdir(DIRA))
> +		SAFE_UMOUNT(DIRA);
> +
> +	if (tst_is_mounted_at_tmpdir(DIRB))
> +		SAFE_UMOUNT(DIRB);
> +
> +	if (tst_is_mounted_at_tmpdir(DIRB))
> +		SAFE_UMOUNT(DIRB);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.needs_root = 1,
> +	.min_kver = "6.5.0",
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};

-- 
Martin Doucha   mdoucha@suse.cz
SW Quality Engineer
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
