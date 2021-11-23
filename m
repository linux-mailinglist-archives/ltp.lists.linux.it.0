Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0C45AC42
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 20:29:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFE193C8F0A
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 20:29:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CBFCC3C8982
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 20:29:11 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2955D1A00A31
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 20:29:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 334432191A;
 Tue, 23 Nov 2021 19:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637695750;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FavU/CaImktFX2qhFaclvsM3g3JHbjUTWZk8lXAY9c8=;
 b=RPzuISIH3aE/IaK+zfyUIUGL/GcgMEERLSycIuiEXcJ+dgURqLboJIaPF9MM3TE9P9FG5q
 GQ+qQ3C+OQ0rQaWEfAT8sPKB/Sk17TnBgnDa6sVo18PQq1cOYJ+IQ1dktTbG+R6jDiScEO
 7x9SY/yMlTakEBJGQzG7YAvLqr/EDgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637695750;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FavU/CaImktFX2qhFaclvsM3g3JHbjUTWZk8lXAY9c8=;
 b=ormX9Zvcp6FgeuEYQUYkq1JMKvzgAW57oTSy9OCkxJHKBdvan0A/lv6BECSsPcpUn0s+Fp
 kpOByDHokyibZ4Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF5E413E5B;
 Tue, 23 Nov 2021 19:29:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 55fHNAVBnWG+KgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 23 Nov 2021 19:29:09 +0000
Date: Tue, 23 Nov 2021 20:29:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YZ1BBI+RK7selCWU@pevik>
References: <20211123151537.14913-1-mdoucha@suse.cz>
 <20211123151537.14913-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123151537.14913-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] nfs_lib.sh: Add support for test-specific
 parameters
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

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---

> Changes since v1: None

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 790655643..b01215136 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -19,10 +19,12 @@ nfs_parse_args()
>  	case "$1" in
>  	v) VERSION="$(echo $2 | tr ',' ' ')";;
>  	t) SOCKET_TYPE="$(echo $2 | tr ',' ' ')";;
> +	*) [ "$NFS_PARSE_ARGS_CALLER" ] && $NFS_PARSE_ARGS_CALLER "$@";;
>  	esac
>  }

> -TST_OPTS="v:t:"
> +NFS_PARSE_ARGS_CALLER="$TST_PARSE_ARGS"
> +TST_OPTS="v:t:$TST_OPTS"
>  TST_PARSE_ARGS=nfs_parse_args
>  TST_USAGE=nfs_usage
>  TST_NEEDS_TMPDIR=1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
