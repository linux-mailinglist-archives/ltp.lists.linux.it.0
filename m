Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B23088A2671
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Apr 2024 08:23:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79EE13CF871
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Apr 2024 08:23:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D9E763CF7AF
 for <ltp@lists.linux.it>; Fri, 12 Apr 2024 08:23:04 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C09221A00EC2
 for <ltp@lists.linux.it>; Fri, 12 Apr 2024 08:23:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4664337F28;
 Fri, 12 Apr 2024 06:23:02 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E31D1368B;
 Fri, 12 Apr 2024 06:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Pl1zAUbTGGZ6VQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 12 Apr 2024 06:23:02 +0000
Date: Fri, 12 Apr 2024 08:22:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Message-ID: <20240412062256.GA384221@pevik>
References: <20240412052632.1787731-1-samasth.norway.ananda@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412052632.1787731-1-samasth.norway.ananda@oracle.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 4664337F28
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] mremap06: fallocate is not supported on
 nfsv4.1 or earlier
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
Cc: calum.mackay@oracle.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> The function fallocate() is only supported over NFSv4.2. Thus when we
> run the mremap06 ltp test over an NFSv4.1 or earlier filesystem the test
> fails.

> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> ---
>  testcases/kernel/syscalls/mremap/mremap06.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

> diff --git a/testcases/kernel/syscalls/mremap/mremap06.c b/testcases/kernel/syscalls/mremap/mremap06.c
> index 3bbaf441a..f3df0551c 100644
> --- a/testcases/kernel/syscalls/mremap/mremap06.c
> +++ b/testcases/kernel/syscalls/mremap/mremap06.c
> @@ -104,8 +104,13 @@ static void setup(void)
>  	fd = SAFE_OPEN("testfile", O_CREAT | O_RDWR | O_TRUNC, 0600);

>  	ret = fallocate(fd, 0, 0, mmap_size);
> -	if (ret == -1)
> +	if (ret != 0) {
> +		if (tst_fs_type(".") == TST_NFS_MAGIC && (errno == EOPNOTSUPP || errno == ENOSYS)) {
> +			tst_brk(TCONF,
> +				"fallocate system call is not implemented");
> +		}

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks!

NOTE: I'll amend the code formatting before merge:

		if (tst_fs_type(".") == TST_NFS_MAGIC && (errno == EOPNOTSUPP ||
												  errno == ENOSYS)) {
			tst_brk(TCONF, "fallocate system call is not implemented");
		}

And prepare following patch which adds safe_fallocate() in the library.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
