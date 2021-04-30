Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9B36FE47
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 18:10:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95E8E3C60B3
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 18:10:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0D953C2B90
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 18:10:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 619B41000487
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 18:10:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F442B14D;
 Fri, 30 Apr 2021 16:10:27 +0000 (UTC)
Date: Fri, 30 Apr 2021 17:48:28 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YIwmzFbctS7F4PJu@yuki>
References: <20210430112649.16302-1-rpalethorpe@suse.com>
 <20210430112649.16302-4-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430112649.16302-4-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/7] Add new CGroups APIs
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
Found last two very minor issues, otherwise the code looks good.

With the two minor issues fixed:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> +static int cgroup_v1_mounted(void)
> +{
> +	return !!roots[1].ver;
> +}
> +
> +static int cgroup_mounted(void)
> +{
> +	return cgroup_v2_mounted() || cgroup_v1_mounted();
> +}
> +
> +static int cgroup_ctrl_on_v2(const struct cgroup_ctrl *const ctrl)
> +{
> +	return ctrl->ctrl_root && ctrl->ctrl_root->ver == TST_CGROUP_V2;
> +}
> +
> +int cgroup_dir_mk(const struct cgroup_dir *const parent,
^
static

> +		  const char *const dir_name,
> +		  struct cgroup_dir *const new)
> +{
> +	char *dpath;
> +
> +	new->dir_root = parent->dir_root;
> +	new->dir_name = dir_name;
> +	new->dir_parent = parent;
> +	new->ctrl_field = parent->ctrl_field;
> +	new->we_created_it = 0;
> +
> +	if (!mkdirat(parent->dir_fd, dir_name, 0777)) {
> +		new->we_created_it = 1;
> +		goto opendir;
> +	}
> +
> +	if (errno == EEXIST)
> +		goto opendir;
> +
> +	dpath = tst_decode_fd(parent->dir_fd);
> +
> +	if (errno == EACCES) {
> +		tst_brk(TCONF | TERRNO,
> +			"Lack permission to make '%s/%s'; premake it or run as root",
> +			dpath, dir_name);
> +	} else {
> +		tst_brk(TBROK | TERRNO,
> +			"mkdirat(%d<%s>, '%s', 0777)",
> +			parent->dir_fd, dpath, dir_name);
>  	}
> -	SAFE_FCLOSE(file);
>  
> -	return cg_check;
> +	return -1;
> +opendir:
> +	new->dir_fd = SAFE_OPENAT(parent->dir_fd, dir_name,
> +				  O_PATH | O_DIRECTORY);
> +
> +	return 0;
>  }

...

> -void tst_cgroup_umount(const char *cgroup_dir)
> +static void cgroup_group_init(struct tst_cgroup_group *const cg,
> +			      const char *const group_name)
>  {
> -	char *cgroup_new_dir;
> +	memset(cg, 0, sizeof(*cg));
> +
> +	if (!group_name)
> +		return;
>  
> -	cgroup_new_dir = tst_cgroup_get_path(cgroup_dir);
> -	tst_cgroupN_umount(cgroup_dir, cgroup_new_dir);
> -	tst_cgroup_del_path(cgroup_dir);
> +	if (strlen(group_name) > NAME_MAX)
> +		tst_brk(TBROK, "Group name is too long");
> +
> +	strncpy(cg->group_name, group_name, NAME_MAX);

We just checked that it will fit so just strcpy()

>  }

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
