Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA1145AC36
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 20:26:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 968D53C8EBD
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 20:26:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 001F13C8982
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 20:26:53 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D969020096F
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 20:26:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21D7C1FD29;
 Tue, 23 Nov 2021 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637695612;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBxXe9JMgo+6QeGTVFHx4bOgTdo8uQ46LHDHPdhHeYk=;
 b=GNaj227u7Gjdr4hxiUlf11XEglK9WX3xXzVbe/T1BU0o+jy43kSb3ho/uLFWL2vqR88f4G
 VBErZ2A5zUc4gzDV2gm0WAIwyY7FHX9JYEMncjPKptSKj3Yy6s/f3zjQzw6p2x16l1M8mF
 HJvIhvZexgzB09HEU5ds2lhLYfJpj2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637695612;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBxXe9JMgo+6QeGTVFHx4bOgTdo8uQ46LHDHPdhHeYk=;
 b=xA8u0sQDzaF7zeR8LQ3hfVknm7ZoqLTPBsMPB3fIJdS02gnF6Y11rogyF7KQDnlF0F7U5E
 qT+bTpmJ1lw7s7Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA4DE13E5B;
 Tue, 23 Nov 2021 19:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ca8qKXtAnWHYKQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 23 Nov 2021 19:26:51 +0000
Date: Tue, 23 Nov 2021 20:26:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YZ1AefvsjpFwsbti@pevik>
References: <20211123151537.14913-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123151537.14913-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] nfs_lib.sh: Add nfs_get_remote_path()
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

> Sometimes it's necessary to manipulate remote NFS directory directly e.g.
> to simulate external server activity. nfs_get_remote_path() will print
> the remote path so that it can then be used by tst_rhost_run().
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---

> Changes since v1: None

>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 206f11fdd..790655643 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -52,6 +52,19 @@ get_socket_type()
>  	done
>  }

> +nfs_get_remote_path()
> +{
> +	local v
> +	local type=$(get_socket_type ${2:-0})
> +
> +	for v in $VERSION; do
> +		break;
> +	done
> +
> +	v=${1:-$v}
> +	echo "$TST_TMPDIR/$v/$type"
> +}
> +
>  nfs_server_udp_enabled()
>  {
>  	local config f

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
