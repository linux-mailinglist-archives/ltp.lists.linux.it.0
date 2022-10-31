Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E005613228
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 10:03:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F8673CA987
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 10:03:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 711973C1BEB
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 10:03:45 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4BE2B1A00715
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 10:03:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B77F21C87;
 Mon, 31 Oct 2022 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1667207023;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RHS0p2biesT+3wPDsuhsxIaQttPaCb6KkRLncRLxr+Q=;
 b=bb9qLcTnO0amhGwYpxXF3xgRB/yJuA8HTfyIo3pYuqCz3WEzXIpzbbCktqF9JRqErq7iP0
 O8l8Zd1wOxue2LbrKupJLTbPT01w5XKyswVZE0sZxOYB8jna5l+pi8aGxhcr5ripEzCbeL
 cSOs2O6D1gl/If7krqTNHYNMse0gzrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1667207023;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RHS0p2biesT+3wPDsuhsxIaQttPaCb6KkRLncRLxr+Q=;
 b=EwCWyNBAqHm7YYfJ9pDiZtgLdOr3DB6Ku6tpFX5fQvW5BbJlvXH0Lnfo+MxbforUFNvlsg
 ClMbP3vZizFi0JAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4144B13AAD;
 Mon, 31 Oct 2022 09:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7RfFDW+PX2MfUAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 31 Oct 2022 09:03:43 +0000
Date: Mon, 31 Oct 2022 10:03:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Edward Liaw <edliaw@google.com>
Message-ID: <Y1+PbX7fYqMR3iXR@pevik>
References: <20221027181531.3686476-1-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027181531.3686476-1-edliaw@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] tst_cgroup: use tmpdir
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
Cc: kernel-team@android.com, Richard Palethorpe <rpalethorpe@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Edward,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Although it's oke to have 3 lines duplicate, it'd be better to put it into
function, because we already have few places with this code
(_supported_fs_types.c, getcwd02.c, filecaps_common.h, openposix: tempfile.h).

I'm not sure myself for a correct place, maybe some file in lib/*.c, which uses
tst_fs.h (maybe we could merge some of these files which contain single function
into tst_fs.c and put new function here).

I'm ok to merge it as is and find correct place as another effort.

Kind regards,
Petr

> Use tmpdir instead of hardcoded /tmp path.

> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  lib/tst_cgroup.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index 6c015e4f8..458b823f2 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -290,7 +290,7 @@ static struct cgroup_ctrl controllers[] = {
>  static const char *cgroup_ltp_dir = "ltp";
>  static const char *cgroup_ltp_drain_dir = "drain";
>  static char cgroup_test_dir[NAME_MAX + 1];
> -static const char *cgroup_mount_ltp_prefix = "/tmp/cgroup_";
> +static const char *cgroup_mount_ltp_prefix = "cgroup_";
>  static const char *cgroup_v2_ltp_mount = "unified";

>  #define first_root				\
> @@ -645,8 +645,12 @@ static void cgroup_mount_v2(void)
>  {
>  	int ret;
>  	char mnt_path[PATH_MAX];
> +	const char *tmpdir = getenv("TMPDIR");
> +	if (!tmpdir)
> +		tmpdir = "/tmp";

> -	sprintf(mnt_path, "%s%s", cgroup_mount_ltp_prefix, cgroup_v2_ltp_mount);
> +	sprintf(mnt_path, "%s/%s%s",
> +		tmpdir, cgroup_mount_ltp_prefix, cgroup_v2_ltp_mount);

>  	if (!mkdir(mnt_path, 0777)) {
>  		roots[0].mnt_dir.we_created_it = 1;
> @@ -693,6 +697,9 @@ static void cgroup_mount_v1(struct cgroup_ctrl *const ctrl)
>  {
>  	char mnt_path[PATH_MAX];
>  	int made_dir = 0;
> +	const char *tmpdir = getenv("TMPDIR");
> +	if (!tmpdir)
> +		tmpdir = "/tmp";

>  	if (ctrl->ctrl_indx == CTRL_BLKIO && controllers[CTRL_IO].ctrl_root) {
>  		tst_res(TCONF,
> @@ -700,7 +707,8 @@ static void cgroup_mount_v1(struct cgroup_ctrl *const ctrl)
>  		return;
>  	}

> -	sprintf(mnt_path, "%s%s", cgroup_mount_ltp_prefix, ctrl->ctrl_name);
> +	sprintf(mnt_path, "%s/%s%s",
> +		tmpdir, cgroup_mount_ltp_prefix, ctrl->ctrl_name);

>  	if (!mkdir(mnt_path, 0777)) {
>  		made_dir = 1;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
