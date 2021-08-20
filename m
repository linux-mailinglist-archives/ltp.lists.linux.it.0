Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B4F3F2A42
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:43:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49E7F3C4F3B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:43:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4EB7F3C194A
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:43:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D25C7600717
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:43:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C2A31FE02;
 Fri, 20 Aug 2021 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629456222;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8hLvOi/2akoZneXqqSTOacGl1rf9jsvdurOa2mrAYg=;
 b=L2JcTZioWuNMRcjPBXLabKoK1rVBCziWW6wal8ovCV19+6cJLDyqG6rv8gv6+sEUoaJ172
 K9Lh/1hKkpT1hFZQz5iWWhUxoE3twCB8KF5UDdPkahwufmRw/3BLwt+07dSPK7QLGWMBk0
 NcBDx2G5tFNPDpNMTTJUABrUM08rIKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629456222;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8hLvOi/2akoZneXqqSTOacGl1rf9jsvdurOa2mrAYg=;
 b=BvumVLeAjF5zvZBl2kXYAeX8w720GD1abxFYhCf17pcEPaBwPodjT/ndXD5hGLHquWbVzH
 +0+gibequZKXYsDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DD22713883;
 Fri, 20 Aug 2021 10:43:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id jBVrMV2HH2GebAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 20 Aug 2021 10:43:41 +0000
Date: Fri, 20 Aug 2021 12:43:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YR+HXE01R1RE8TTH@pevik>
References: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
 <20210804120446.32835-2-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804120446.32835-2-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] network/tst_net.sh: fix busybox/sysctl in
 tst_set_sysctl()
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

Hi Alexey,

> busybox/sysctl expects -e option to be set before 'name=value'.
> This can easily be fixed by splitting the string in tst_set_sysctl(),
> so that 'rparam' with '-e' option is added in between.
Good catch.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 511fb7eb1..bb30c13ec 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -918,7 +918,7 @@ tst_set_sysctl()
>  	local rparam=
>  	[ "$TST_USE_NETNS" = "yes" ] && rparam="-r '-e'"

> -	tst_net_run $safe $rparam "sysctl -q -w $name=$value"
> +	tst_net_run $safe $rparam "sysctl -q -w" "$name=$value"

I wonder if it were a bit clearer if we moves all params to second arg:
	tst_net_run $safe "sysctl" "$name=$value -q -w"

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
