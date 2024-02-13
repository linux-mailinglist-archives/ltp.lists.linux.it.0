Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C60EA85368A
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Feb 2024 17:48:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 948B73D07EC
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Feb 2024 17:48:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 603DE3CCAB2
 for <ltp@lists.linux.it>; Tue, 13 Feb 2024 17:48:52 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 203141400433
 for <ltp@lists.linux.it>; Tue, 13 Feb 2024 17:48:50 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC2B121EA7;
 Tue, 13 Feb 2024 16:48:49 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5539E1329E;
 Tue, 13 Feb 2024 16:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id m3lxEHGdy2U5EAAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Tue, 13 Feb 2024 16:48:49 +0000
Date: Tue, 13 Feb 2024 17:48:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20240213164847.GA699750@pevik>
References: <20240213140233.14445-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213140233.14445-1-mdoucha@suse.cz>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AC2B121EA7
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] Add test for file truncation over NFS
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

Hi Martin,

Merged, thank you!

> Some older kernels have a bug in NFS where the client caches that
> a file does not exist after unsuccessful access to it and then
> does not pass O_TRUNC flag to the server even though the file may
> have been created by another client in the mean time. This may result
> in new data being merged with old file contents instead of replacing
> them.
...

> +++ b/runtest/net.nfs
> @@ -83,6 +83,17 @@ nfs08_v40_ip6t nfs08.sh -6 -v 4 -t tcp
>  nfs08_v41_ip6t nfs08.sh -6 -v 4.1 -t tcp
>  nfs08_v42_ip6t nfs08.sh -6 -v 4.2 -t tcp

> +nfs09_v30_ip4u nfs09.sh -v 3 -t udp
> +nfs09_v30_ip4t nfs09.sh -v 3 -t tcp

For a record, this is the test which fails. And NFSv3 is affected on all
kernels, including latest stable 6.7.4 and 6.8.0-rc1 (both openSUSE packages).

> +nfs09_v40_ip4t nfs09.sh -v 4 -t tcp
> +nfs09_v41_ip4t nfs09.sh -v 4.1 -t tcp
> +nfs09_v42_ip4t nfs09.sh -v 4.2 -t tcp
> +nfs09_v30_ip6u nfs09.sh -6 -v 3 -t udp
> +nfs09_v30_ip6t nfs09.sh -6 -v 3 -t tcp
> +nfs09_v40_ip6t nfs09.sh -6 -v 4 -t tcp
> +nfs09_v41_ip6t nfs09.sh -6 -v 4.1 -t tcp
> +nfs09_v42_ip6t nfs09.sh -6 -v 4.2 -t tcp
...
> +++ b/testcases/network/nfs/nfs_stress/nfs09.sh
...
> +do_test()
> +{
> +	local local_file="testfile"
> +	local remote_file="$(nfs_get_remote_path)/$local_file"
> +	local testmsg='File truncated'
> +	local data
> +
> +	EXPECT_FAIL "ls -l '$local_file'"
> +	tst_rhost_run -c "echo -n 'File rewritten not' >'$remote_file'"
> +	echo -n "$testmsg" >"$local_file"
echo is considered unportable (printf is preferred), but "echo -n" should be
hopefully safe nowadays.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
