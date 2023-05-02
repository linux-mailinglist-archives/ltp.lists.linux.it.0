Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 121DB6F3FE1
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 11:12:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A68453CB8CF
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 11:12:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B40703CB8C4
 for <ltp@lists.linux.it>; Tue,  2 May 2023 11:12:10 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EF4291000449
 for <ltp@lists.linux.it>; Tue,  2 May 2023 11:12:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D5461F8BD;
 Tue,  2 May 2023 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683018729;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBZtGubKAKw8X4l6cRxcULYMBD7utJtTtnzCHe2AbzY=;
 b=XUDE5SxzKlmtcn0Wbrkw3IHeGTFQtp9xH6kWT74sLMbpMqaFjITQTPx69MTNBrYbdTME7u
 yoqu87b/mE+eQJ5ru2P2f957UPdwnyG/+w9GT7XxWPjghR8gI4hglHpygjPjOIsPIPqqYg
 j9VF6bNu5fxbUukuFgm/IErVuR94QNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683018729;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBZtGubKAKw8X4l6cRxcULYMBD7utJtTtnzCHe2AbzY=;
 b=sxfTqw24qaXvVxBVUQSOEWEo7gsCwO+37VoRfgs+wU7rPj2mNV9JQ/APTzKMDvgcYVuFGh
 kCfRRc9FU9UXtvDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6D06139C3;
 Tue,  2 May 2023 09:12:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7bOoNejTUGQmTAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 02 May 2023 09:12:08 +0000
Date: Tue, 2 May 2023 11:12:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20230502091222.GA3624664@pevik>
References: <20230428101038.7253-1-wegao@suse.com>
 <20230430074811.29555-1-wegao@suse.com>
 <20230430074811.29555-2-wegao@suse.com>
 <CAEemH2cK60iL2cxeJQVfAwcqmhtmdA5=L25M5QEreMmp74-gCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cK60iL2cxeJQVfAwcqmhtmdA5=L25M5QEreMmp74-gCA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v12 1/2] tst_cgroup.c: Add a cgroup base controller
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

Hi Li, Wei,

> Hi Wei,

> Seems we have to skip the cgroup.subtree_control cleanup
> process inside tst_cg_cleanup(), otherwise, test complains that
> there is error operation in line#1020 if the unified cgroup-V2
> was mounted by LTP.

> (no need to resend another patch, someone who merge this can help fix.)

> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -1012,7 +1012,8 @@ void tst_cg_cleanup(void)
>         }

>         for_each_ctrl(ctrl) {
> -               if (!cgroup_ctrl_on_v2(ctrl) ||
> !ctrl->ctrl_root->we_mounted_it)
> +               if (!cgroup_ctrl_on_v2(ctrl) ||
> !ctrl->ctrl_root->we_mounted_it
> +                               || !strcmp(ctrl->ctrl_name, "base"))
>                         continue;

>                 SAFE_FILE_PRINTFAT(ctrl->ctrl_root->mnt_dir.dir_fd,

Merged with this change. Thanks to both!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
