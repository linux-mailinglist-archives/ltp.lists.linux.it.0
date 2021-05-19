Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623F388D8B
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 14:07:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 020863C3105
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 14:07:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 96A863C303F
 for <ltp@lists.linux.it>; Wed, 19 May 2021 14:07:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CAC67200DCA
 for <ltp@lists.linux.it>; Wed, 19 May 2021 14:07:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32984AF19;
 Wed, 19 May 2021 12:07:36 +0000 (UTC)
Date: Wed, 19 May 2021 13:41:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YKT5ZHrFW0/tCIhu@yuki>
References: <20210513152125.25766-1-rpalethorpe@suse.com>
 <20210513152125.25766-6-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513152125.25766-6-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/6] API/cgroups: Auto add controllers to
 subtree_control in new subgroup
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> -	if (dir->dir_root->ver == TST_CGROUP_V2)
> +	if (dir->dir_root->ver != TST_CGROUP_V1)
>  		cg->dirs_by_ctrl[0] = dir;

This change is useless, isn't it?

>  	for_each_ctrl(ctrl) {
> -		if (has_ctrl(dir->ctrl_field, ctrl))
> -			cg->dirs_by_ctrl[ctrl->ctrl_indx] = dir;
> +		if (!has_ctrl(dir->ctrl_field, ctrl))
> +			continue;
> +
> +		cg->dirs_by_ctrl[ctrl->ctrl_indx] = dir;
> +
> +		if (!parent || dir->dir_root->ver == TST_CGROUP_V1)
> +			continue;
> +
> +		SAFE_CGROUP_PRINTF(parent, "cgroup.subtree_control",
> +				   "+%s", ctrl->ctrl_name);
>  	}

Looks good. Agree that we should copy the controllers from parent here
for V2.

>  	for (i = 0; cg->dirs[i]; i++);
> @@ -876,7 +885,7 @@ tst_cgroup_group_mk(const struct tst_cgroup_group *const parent,
>  	for_each_dir(parent, 0, dir) {
>  		new_dir = SAFE_MALLOC(sizeof(*new_dir));
>  		cgroup_dir_mk(*dir, group_name, new_dir);
> -		cgroup_group_add_dir(cg, new_dir);
> +		cgroup_group_add_dir(parent, cg, new_dir);
>  	}
>  
>  	return cg;
> @@ -1029,7 +1038,7 @@ static struct tst_cgroup_group *cgroup_group_from_roots(const size_t tree_off)
>  		dir = (typeof(dir))(((char *)root) + tree_off);
>  
>  		if (dir->ctrl_field)
> -			cgroup_group_add_dir(cg, dir);
> +			cgroup_group_add_dir(NULL, cg, dir);
>  	}
>  
>  	if (cg->dirs[0]) {

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
