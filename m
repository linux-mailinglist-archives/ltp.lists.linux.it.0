Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC07191026B
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2024 13:22:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5EF43D0E14
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2024 13:22:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD0F13D0E0C
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 13:22:54 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 998961A00ED3
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 13:22:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3EAA1F455;
 Thu, 20 Jun 2024 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718882572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:
 list-unsubscribe:list-subscribe;
 bh=SD4yNCxhgnOLHenKntd6528C8QcimLADgpUvDf5QbYY=;
 b=eqPhiol/hR/wJ0e1vUjWD0RulYHFSY1kwHum9mRMkhMWONtI6mhOa3pDyPwpPrBbIQpKEY
 wJEtMTCyVDcLNWVFvYooP4OJyHH2BXwXVV8UVbRJ5Dy4g2G16FOeFSBHcuTLKDQquJDpN6
 BaFb5af+BEQTYfTF3uDotUfyTCGRtkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718882572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:
 list-unsubscribe:list-subscribe;
 bh=SD4yNCxhgnOLHenKntd6528C8QcimLADgpUvDf5QbYY=;
 b=5CIvXOQBA1sZ+reiX1uqitKJET8l7QkiSYFUSAPsFnfo5q0oi90r2Ppabd8wDsi+eHV+YA
 Rfq3+XKazENzzRBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718882570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:
 list-unsubscribe:list-subscribe;
 bh=SD4yNCxhgnOLHenKntd6528C8QcimLADgpUvDf5QbYY=;
 b=v2ImaHuTGpxZyVqwR7obwys6kfHa2VPzsJaZ+zMo097Os9ZHRbCkZ0chgR55a6ekvhnxYM
 gA9VJLag2aXM7Iwcas10ZZnVQnp6p+icKXVmHa93aEdQmjT346JuScSfDA6OL9IHz6mfze
 ZiWFBOMuG82l5dBvcZlVnThwiimNPSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718882570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:
 list-unsubscribe:list-subscribe;
 bh=SD4yNCxhgnOLHenKntd6528C8QcimLADgpUvDf5QbYY=;
 b=EJUP2vl+5DjV36Vr0lKF16GXwjG3HphYOXgrOz9M5m08lj/qbV2KvPn6u+OX2eeEgZYC0g
 ljsZGQalv3BbD7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A79A13AC1;
 Thu, 20 Jun 2024 11:22:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qODeGAoRdGZYHwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 20 Jun 2024 11:22:50 +0000
From: Petr Vorel <pvorel@suse.cz>
To: josef@toxicpanda.com, trond.myklebust@hammerspace.com, anna@kernel.org,
 linux-nfs@vger.kernel.org, kernel-team@fb.com
Date: Thu, 20 Jun 2024 13:22:45 +0200
Message-ID: <4cb938c107a6400baa723098d15dd8a3355d24e8.1708026931.git.josef@toxicpanda.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1708026931.git.josef@toxicpanda.com>
References: <cover.1708026931.git.josef@toxicpanda.com>
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176]) (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256
 (128/128 bits)) (No client certificate requested) by smtp.subspace.kernel.org
 (Postfix) with ESMTPS id 1AE8A13AA2A for <linux-nfs@vger.kernel.org>;
 Thu, 15 Feb 2024 19:57:45 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso1263173276.2 for <linux-nfs@vger.kernel.org>;
 Thu, 15 Feb 2024 11:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1708027065;
 x=1708631865; darn=vger.kernel.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id :reply-to;
 bh=rtLuNkJg1GjLuVwgzWgWd67FZ5UILcvpMOYAbQXWrSg=;
 b=O8nX5guSmYHchJRfDiEVTDXmWFTwK/TWOipgPGZ/usgbXY9r1y1bpBWCvFTiWiWzFb
 +m9TUPcG13FyzoTfyiiKfv0i30En7pV7tHmeXkYFVY5+n8EsjDMm4TXepD7FsGSZf6wo
 WCA9bH/c28uHeyUcKXiE5teNUlxtquMPbmZtHB9vI6bXW/3jSbN2XxSHt6kzSyeDCThK
 mCkVEfRbr31HKqut26r5t920otWhjYeMiXHvDWjhq4Od2aC6c5R9h3t6x9Jc4DHJIC3S
 xbWSj3B9pT5flLAbdYMXnamd/e+Ro72P/p/cju5duVgvHntwRoiSM7B1GaZkDxASQ4m5 EpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20230601; t=1708027065; x=1708631865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtLuNkJg1GjLuVwgzWgWd67FZ5UILcvpMOYAbQXWrSg=;
 b=Bb1Tfx82l8CI9DCFenfg827X/bsd69Jox5YK8VImLyNcV10VD7/kb3KEYjqJpg3Bnj
 WmPveK7chrVAOgWMfTPBm0aD0p9CuNHcUDS/iJEUb3wy4ESxyVT+ErbjcjaxxIZhrf84
 JOmiTb/83XdUhUUPJqiBXFNGBYEYJvQBPKWnapDBuz59Q9R7QKlMNnNeVMVcZRjR7V3A
 UX7IR5+i5QLLvihv3ZEEu0gxaMNi0d73PQ1b7C7/m5tDM7/FPI3o9LL/d8gMrtU2JWiJ
 XWQxm0Riz0lqKmaNZq52YSrlda5NoJG8VU+XFwzYcRHuQW2OStZLiYPpBSEc3j4Zl5yj M73g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCmn1DbMe+GagohwMsZ+OLLK/0hsXOlxc8QbnrcVWGWH4OVJav7nmak1fs+8DA+wwxPP5d902K5vmtqUC616EoF7vIdQjLcmuI
X-Gm-Message-State: AOJu0YzfE2fO9tRa6KdYpqC0861Un5/0q6JAwjmHOTS/4CkYtTQt0o1Z
 YhdclXklgmGdzdl0e9a281XwN09Kq6C41Tevo/h3sPj4ZDIUxlHKjuwvkqSiD3wSJDYRLe/1gf7 Q
X-Google-Smtp-Source: AGHT+IFJT2cfAUdh2DvQxFhOsw2AGvDCXURiriGyYuuLUTXwp0WiKTQORW4Zf3lRM3ICMO2X/HjN+A==
X-Received: by 2002:a25:cec9:0:b0:dcc:4747:c54a with SMTP id
 x192-20020a25cec9000000b00dcc4747c54amr2459702ybe.49.1708027065026;
 Thu, 15 Feb 2024 11:57:45 -0800 (PST)
Received: from localhost (076-182-020-124.res.spectrum.com. [76.182.20.124])
 by smtp.gmail.com with ESMTPSA id
 i126-20020a256d84000000b00dcd25ce965esm15265ybc.41.2024.02.15.11.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 11:57:44 -0800 (PST)
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-nfs@vger.kernel.org
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.06 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_TO(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MAILLIST(-0.15)[generic]; SUSE_ML_WHITELIST_VGER(-0.10)[];
 MIME_GOOD(-0.10)[text/plain]; HAS_LIST_UNSUB(-0.01)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,ozlabs.org:url,toxicpanda.com:email];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_FIVE(0.00)[5];
 PREVIOUSLY_DELIVERED(0.00)[linux-nfs@vger.kernel.org];
 RCVD_TLS_LAST(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 PRECEDENCE_BULK(0.00)[]
X-Spam-Score: -3.06
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 3/3] nfs: make the rpc_stat per net namespace
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: NeilBrown <neilb@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Josef Bacik <josef@toxicpanda.com>

> Now that we're exposing the rpc stats on a per-network namespace basis,
> move this struct into struct nfs_net and use that to make sure only the
> per-network namespace stats are exposed.

Hi Josef, all,

I suppose this or previous commit caused global /proc/net/rpc/nfs does not have
rpc statistics. Therefore I send a patch [1] [2] to update LTP test when running
on LTP namespaces. Hope the change was intentional, please let us know if not.

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/20240620111129.594449-1-pvorel@suse.cz/
[2] https://patchwork.ozlabs.org/project/ltp/patch/20240620111129.594449-1-pvorel@suse.cz/

> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  fs/nfs/client.c   | 5 ++++-
>  fs/nfs/inode.c    | 4 +++-
>  fs/nfs/internal.h | 2 --
>  fs/nfs/netns.h    | 2 ++
>  4 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/nfs/client.c b/fs/nfs/client.c
> index 44eca51b2808..4d9249c99989 100644
> --- a/fs/nfs/client.c
> +++ b/fs/nfs/client.c
> @@ -73,7 +73,6 @@ const struct rpc_program nfs_program = {
>  	.number			= NFS_PROGRAM,
>  	.nrvers			= ARRAY_SIZE(nfs_version),
>  	.version		= nfs_version,
> -	.stats			= &nfs_rpcstat,
>  	.pipe_dir_name		= NFS_PIPE_DIRNAME,
>  };
>  
> @@ -502,6 +501,7 @@ int nfs_create_rpc_client(struct nfs_client *clp,
>  			  const struct nfs_client_initdata *cl_init,
>  			  rpc_authflavor_t flavor)
>  {
> +	struct nfs_net		*nn = net_generic(clp->cl_net, nfs_net_id);
>  	struct rpc_clnt		*clnt = NULL;
>  	struct rpc_create_args args = {
>  		.net		= clp->cl_net,
> @@ -513,6 +513,7 @@ int nfs_create_rpc_client(struct nfs_client *clp,
>  		.servername	= clp->cl_hostname,
>  		.nodename	= cl_init->nodename,
>  		.program	= &nfs_program,
> +		.stats		= &nn->rpcstats,
>  		.version	= clp->rpc_ops->version,
>  		.authflavor	= flavor,
>  		.cred		= cl_init->cred,
> @@ -1175,6 +1176,8 @@ void nfs_clients_init(struct net *net)
>  #endif
>  	spin_lock_init(&nn->nfs_client_lock);
>  	nn->boot_time = ktime_get_real();
> +	memset(&nn->rpcstats, 0, sizeof(nn->rpcstats));
> +	nn->rpcstats.program = &nfs_program;
>  
>  	nfs_netns_sysfs_setup(nn, net);
>  }
> diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> index e11e9c34aa56..91b4d811958a 100644
> --- a/fs/nfs/inode.c
> +++ b/fs/nfs/inode.c
> @@ -2426,8 +2426,10 @@ EXPORT_SYMBOL_GPL(nfs_net_id);
>  
>  static int nfs_net_init(struct net *net)
>  {
> +	struct nfs_net *nn = net_generic(net, nfs_net_id);
> +
>  	nfs_clients_init(net);
> -	rpc_proc_register(net, &nfs_rpcstat);
> +	rpc_proc_register(net, &nn->rpcstats);
>  	return nfs_fs_proc_net_init(net);
>  }
>  
> diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
> index e3722ce6722e..06253695fe53 100644
> --- a/fs/nfs/internal.h
> +++ b/fs/nfs/internal.h
> @@ -449,8 +449,6 @@ int nfs_try_get_tree(struct fs_context *);
>  int nfs_get_tree_common(struct fs_context *);
>  void nfs_kill_super(struct super_block *);
>  
> -extern struct rpc_stat nfs_rpcstat;
> -
>  extern int __init register_nfs_fs(void);
>  extern void __exit unregister_nfs_fs(void);
>  extern bool nfs_sb_active(struct super_block *sb);
> diff --git a/fs/nfs/netns.h b/fs/nfs/netns.h
> index c8374f74dce1..a68b21603ea9 100644
> --- a/fs/nfs/netns.h
> +++ b/fs/nfs/netns.h
> @@ -9,6 +9,7 @@
>  #include <linux/nfs4.h>
>  #include <net/net_namespace.h>
>  #include <net/netns/generic.h>
> +#include <linux/sunrpc/stats.h>
>  
>  struct bl_dev_msg {
>  	int32_t status;
> @@ -34,6 +35,7 @@ struct nfs_net {
>  	struct nfs_netns_client *nfs_client;
>  	spinlock_t nfs_client_lock;
>  	ktime_t boot_time;
> +	struct rpc_stat rpcstats;
>  #ifdef CONFIG_PROC_FS
>  	struct proc_dir_entry *proc_nfsfs;
>  #endif
> -- 
> 2.43.0
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
