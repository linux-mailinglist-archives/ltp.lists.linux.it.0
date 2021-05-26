Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79204391151
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 09:18:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39E353C2B3C
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 09:18:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 27AC53C2ADF
 for <ltp@lists.linux.it>; Wed, 26 May 2021 09:18:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B7A401000DEE
 for <ltp@lists.linux.it>; Wed, 26 May 2021 09:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622013517;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c5H5JRKKmjjBhQfax+E+J9cnBGMk183awC6JObZvHrg=;
 b=xdDgVHCexHcyW4x1pvEg4392D2pMlLpXATUkTl1wsCic4WsreLmYLoLnNMbbkVBLYvhNCV
 99GehY3e8JO7gMOYLlhkrNq6JUbKcCUvgH9ghlLGD3fvBd3DzHbvln9iQzK2I08dZNjm2G
 DA2nYmI544yCyJkoMphbxE3hhSMtkjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622013517;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c5H5JRKKmjjBhQfax+E+J9cnBGMk183awC6JObZvHrg=;
 b=i3AlrAsasxntGWQblXSiNIDScvqDPy082GCb7bcnhObL9+yrYn6RRg14vYjx0ieNDLsPzy
 wZgGI+OQ23p4NDCQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 172CDABED;
 Wed, 26 May 2021 07:18:37 +0000 (UTC)
Date: Wed, 26 May 2021 09:18:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YK32S7sPQdxf3NO2@pevik>
References: <20210525135012.877-1-pvorel@suse.cz>
 <20210525135012.877-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525135012.877-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] nfs_lib.sh: Check running rpc.mountd,
 rpcbind/portmap
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> Both are required to be running for NFS tests.

> This requires to add pgrep dependency, as we don't have custom LTP C
> based tool for searching in processes.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 1bd057717..25fe67bda 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -27,7 +27,7 @@ TST_PARSE_ARGS=nfs_parse_args
>  TST_USAGE=nfs_usage
>  TST_NEEDS_TMPDIR=1
>  TST_NEEDS_ROOT=1
> -TST_NEEDS_CMDS="$TST_NEEDS_CMDS mount exportfs"
> +TST_NEEDS_CMDS="$TST_NEEDS_CMDS exportfs mount pgrep"
>  TST_SETUP="${TST_SETUP:-nfs_setup}"
>  TST_CLEANUP="${TST_CLEANUP:-nfs_cleanup}"

> @@ -107,6 +107,11 @@ nfs_setup()
>  		tst_brk TCONF "Cannot run nfs-stress test on mounted NFS"
>  	fi

> +	pgrep rpc.mountd > /dev/null || \
> +		tst_brk TCONF "rpc.mountd not running"
> +
> +	check_portmap_rpcbind

I found that at least some tests (e.g. nfs01) runs with stopped rpcbind.
I suppose that's because nfs-server.service is able to restart it
(it's activated via socket).

Although rpc.mountd (nfs-mountd.service) is required, nfs-mountd.service is a
nfs-server.service dependency (nfs-server.service:Requires=nfs-mountd.service).
Thus it's probably enough to check that rpc.nfsd is running.
=> sending v2 with just single commit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
