Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 034053F4BDB
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 15:48:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 968AC3C9E8D
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 15:48:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FD103C3290
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:48:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C5BFE1000998
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:48:14 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1654B1FFCF;
 Mon, 23 Aug 2021 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629726494;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cUjlbUzJ9HHI92pzmnWeo+z5CLKv5ZVqoRxgjRnUKYY=;
 b=y7qMRQY5YaGUF1oJu5JYbkm/sNGhJHxVVC5CUAqBbu94ES6+Bwv5iOvh3WaHYjPoFl4ISF
 9qweT33PgQlcqRy5vGs/3IwbGlbypyoWNakQ4AnGR7JNawU/sTo31ksDVF2I+Akp484uUA
 CFtZHWtzX4CQM2Fx7GF2CmRREV7Tx9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629726494;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cUjlbUzJ9HHI92pzmnWeo+z5CLKv5ZVqoRxgjRnUKYY=;
 b=csINlUYpVXD4ll3RC+ZLb+MrMO2yK3rglc7S8nQDeGDkxtvcqdNYI+SrooabezQBg/HUOy
 tg5mXjPMx0zDWzAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B2F9C13B2A;
 Mon, 23 Aug 2021 13:48:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id SGGZKR2nI2HDLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 23 Aug 2021 13:48:13 +0000
Date: Mon, 23 Aug 2021 15:48:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YSOnHBMsOKPqyjLu@pevik>
References: <20210804015248.GA22328@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804015248.GA22328@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6,
 1/4] lib: tst_umount: umount a mount point instead of a device
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Current check inside tst_umount for whehter a device is mounted is ambiguous.
> Fix it by checking for the existance of the exact mount point the fs is mounted upon,
> and use the mount point instead of the device to do the umount process.
> This patch make tst_umount umount TST_MNTPOINT by default,
> and reject any argument that does not start with '/'.

> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
>  testcases/lib/tst_test.sh | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index c6aa2c487..1060bda2f 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -277,31 +277,35 @@ tst_mount()

>  tst_umount()
>  {
> -	local device="${1:-$TST_DEVICE}"
> +	local mntpoint="${1:-$TST_MNTPOINT}"
>  	local i=0

> -	[ -z "$device" ] && return
> +	[ -z "$mntpoint" ] && return

> -	if ! grep -q "$device" /proc/mounts; then
> -		tst_res TINFO "The $device is not mounted, skipping umount"
> +	if [[ "$mntpoint" != /* ]]; then
[[ ]] is a bashism, it cannot be used. [1]
Instead grep must be used to compare regex:

if echo "$mntpoint" |grep -q ^/; then

This can be changed during merge.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

[1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-shell-coding-style

> +		tst_brk TCONF "The $mntpoint is not an absolute path"
> +	fi
> +
> +	if ! grep -q "${mntpoint%/}" /proc/mounts; then
> +		tst_res TINFO "The $mntpoint is not mounted upon, skipping umount"
>  		return
>  	fi

>  	while [ "$i" -lt 50 ]; do
> -		if umount "$device" > /dev/null; then
> +		if umount "$mntpoint" > /dev/null; then
>  			return
>  		fi

>  		i=$((i+1))

> -		tst_res TINFO "umount($device) failed, try $i ..."
> +		tst_res TINFO "umount($mntpoint) failed, try $i ..."
>  		tst_res TINFO "Likely gvfsd-trash is probing newly mounted "\
>  		              "fs, kill it to speed up tests."

>  		tst_sleep 100ms
>  	done

> -	tst_res TWARN "Failed to umount($device) after 50 retries"
> +	tst_res TWARN "Failed to umount($mntpoint) after 50 retries"
>  }

>  tst_mkfs()

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
