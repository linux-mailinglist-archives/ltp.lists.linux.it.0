Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB04E502F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Mar 2022 11:17:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A837D3C93D7
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Mar 2022 11:17:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E6BE3C3040
 for <ltp@lists.linux.it>; Wed, 23 Mar 2022 11:17:44 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A4D071400BC2
 for <ltp@lists.linux.it>; Wed, 23 Mar 2022 11:17:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E934A1F38F;
 Wed, 23 Mar 2022 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648030662;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcYTL9TSffgFv5WZf+84CQkSAve4i/TuNAFrL+ozwW4=;
 b=2/MPQoHN6eeY2vUF0EsPTxBA4pLpICt2NXwEYiE8mSTa6FvmkG46w+07vO1BqXC1B0LmTq
 VuEGSgd0TmqHEn3dBy/GKlQ5GEQdfqawbi+NcxlObBQUsJoQ6XxEHTkpO4C+VcbXnqRA8P
 X3rkEiMU0H350y1Sv2XdS67Xw2E+NF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648030662;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcYTL9TSffgFv5WZf+84CQkSAve4i/TuNAFrL+ozwW4=;
 b=xrDSf5KNdouI9GKfeZvmRqgIPLsHVLzWKyS/hmJjHAXWX19YvUNf17JJqe/O/ynDAX90Jp
 NYki0TpDlxhRsmDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C61AF132BA;
 Wed, 23 Mar 2022 10:17:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t/CrLsbzOmJdQgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 23 Mar 2022 10:17:42 +0000
Date: Wed, 23 Mar 2022 11:17:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <YjrzxcAZeZKc7CDK@pevik>
References: <20220315122351.8556-1-andrea.cervesato@suse.de>
 <20220315122351.8556-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315122351.8556-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/8] Rewrite userns01.c using new LTP API
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

Hi Andrea,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

nit: I'd sometimes use underscore to make names more readable
i.e. update_map, parent_map_pid, OVERFLOW_UID_PATH, OVERFLOW_GID_PATH

> +static inline int check_newuser(void)
> +{
> +	int pid, status;
> +
> +	if (tst_kvercmp(3, 8, 0) < 0)
> +		tst_brk(TCONF, "CLONE_NEWUSER not supported");
Is this limitation needed, when we have the same check with ltp_clone_quick()?
> +
> +	pid = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, dummy_child, NULL);
> +	if (pid == -1)
> +		tst_brk(TCONF | TTERRNO, "CLONE_NEWUSER not supported");
> +
> +	SAFE_WAIT(&status);
> +
> +	return 0;
> +}
> +
> +static inline void updatemap(int cpid, bool type, int idnum, int parentmappid)
> +{
> +	char path[BUFSIZ];
> +	char content[BUFSIZ];
> +	int fd;
> +
> +	if (type == UID_MAP)
> +		sprintf(path, "/proc/%d/uid_map", cpid);
> +	else if (type == GID_MAP)
> +		sprintf(path, "/proc/%d/gid_map", cpid);
> +	else
> +		tst_brk(TBROK, "invalid type parameter");

nit: maybe switch would be more readable.

...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
