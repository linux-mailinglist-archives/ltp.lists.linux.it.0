Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74939D8FD
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:42:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9282D3C7C4F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:42:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9CD273C187D
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:42:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F714600965
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:42:51 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B959D21A8A;
 Mon,  7 Jun 2021 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgoSbRu5PR9aMTS7egDPBJt0PWox108C5biiT20mlwk=;
 b=uhr6lnc13t3u8J51gADnlmnKpYj5sRlotXXp7/EimkjyRjZexvTJTHQCWUufW2oaGTO9A0
 nL9Ol8kixt4vnXWFkwBhgNsn6v4i1WqNxrm8KJjQBEKvnWZI/FV9VM1/LlLG0GxZdIuB+S
 tJD30ayWXBqXSBnzsbrrSh1IYuNhUZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgoSbRu5PR9aMTS7egDPBJt0PWox108C5biiT20mlwk=;
 b=0i4JrfzqbjUAgwlz98hgmUrnyvK04wTVpbfO0ydhSDGy2qJz0p1AbwStYkdf3LfDU5Ixn5
 2vI1QEiVkF4LNyBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8F752118DD;
 Mon,  7 Jun 2021 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgoSbRu5PR9aMTS7egDPBJt0PWox108C5biiT20mlwk=;
 b=uhr6lnc13t3u8J51gADnlmnKpYj5sRlotXXp7/EimkjyRjZexvTJTHQCWUufW2oaGTO9A0
 nL9Ol8kixt4vnXWFkwBhgNsn6v4i1WqNxrm8KJjQBEKvnWZI/FV9VM1/LlLG0GxZdIuB+S
 tJD30ayWXBqXSBnzsbrrSh1IYuNhUZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058970;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgoSbRu5PR9aMTS7egDPBJt0PWox108C5biiT20mlwk=;
 b=0i4JrfzqbjUAgwlz98hgmUrnyvK04wTVpbfO0ydhSDGy2qJz0p1AbwStYkdf3LfDU5Ixn5
 2vI1QEiVkF4LNyBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3530IBrqvWDRGgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 09:42:50 +0000
Date: Mon, 7 Jun 2021 11:42:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <YL3qGZasDuppV3LH@pevik>
References: <20210223140323.126555-1-zhaogongyi@huawei.com>
 <YDWugcEDg/z4tRrX@pevik> <6035DD9C.4080308@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6035DD9C.4080308@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] unshare01.sh: Setup parent mount flag before
 unshare testing
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

Hi Yang, Zhongyi,

> Hi Zhongyi, Petr

> I don't like the approach which enforces mountpoint to be shared in parent
> mount namespace.
> I think we can tune expected value by checking propagation flag in parent
> mount namespace because of two reasons:
> 1) Make test cover more cases.
> 2) Don't depend on the fixed tmpfs.

> Zhongyi,  could you test the following patch on your enviorment?
> -------------------------------------------------------------------------------------------------
> diff --git a/testcases/commands/unshare/unshare01.sh
> b/testcases/commands/unshare/unshare01.sh
> index bf163a7f4..78ea83fc0 100755
> --- a/testcases/commands/unshare/unshare01.sh
> +++ b/testcases/commands/unshare/unshare01.sh
> @@ -40,6 +40,17 @@ max_mntns_path="/proc/sys/user/max_mnt_namespaces"
>  default_max_userns=-1
>  default_max_mntns=-1

> +parse_propagation_flag()
> +{
> +       mount --bind dir_A dir_B
> +       if grep -w 'dir_B' /proc/self/mountinfo | grep -qw 'shared'; then
> +               echo "mounted"
> +       else
> +               echo "unmounted"
> +       fi
> +       umount dir_B
> +}
> +
>  setup()
>  {
>         # On some distributions(e.g RHEL7.4), the default value of
> @@ -149,7 +160,8 @@ do_test()
>         4) unshare_test "--user --map-root-user" "id -g" "0";;
>         5) unshare_test "--mount" "mount --bind dir_A dir_B" "unmounted";;
>         6) unshare_test "--mount --propagation shared" \
> -                       "mount --bind dir_A dir_B" "mounted";;
> +                       "mount --bind dir_A dir_B" \
> +                       "$(parse_propagation_flag)";;
>         7) unshare_test "--user --map-root-user --mount" \
>                         "mount --bind dir_A dir_B" "unmounted";;
>         8) unshare_test "--user --map-root-user --mount --propagation
> shared" \

Sorry for a big delay in this.
Your changes makes sense to me, ack.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
