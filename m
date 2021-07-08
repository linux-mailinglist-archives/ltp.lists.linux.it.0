Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2A3BF510
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 07:27:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01DF53C681A
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 07:27:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3152D3C4DB0
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 07:26:58 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5C87F601517
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 07:26:57 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 75C7E9FBF9;
 Thu,  8 Jul 2021 05:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625722015; bh=OTDpuq2DQCqC+JGBAVhHxzEtXNaW8aQ4TT9nJQxYDf0=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=cBLXE2iTc5jO3Hb5fsebHSvZ4dQNXmFtaza9Fu3hs8Kyt+0NXK2dQuWnFpNGH23p/
 t76TAO7cB/RodkTmCNMgVbCXbyVONbZ5A8Ewj4a3pDIHiSbfZQf1fxcCzlc1zDGoc0
 1fs6u6JpdKi0QRAajhLKhbRxDPLIiCZ7NtRYnTW0=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it, pvorel@suse.cz, rpalethorpe@suse.de
References: <20210706120434.867426-1-lkml@jv-coder.de>
 <20210706120434.867426-4-lkml@jv-coder.de>
Message-ID: <d862f662-c06a-74d2-5e2d-8cd7a1e77a49@jv-coder.de>
Date: Thu, 8 Jul 2021 07:26:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706120434.867426-4-lkml@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 3/4] fs_bind: Convert cloneNS tests
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

please do not merge, I found a bug in the code

On 7/6/2021 2:04 PM, Joerg Vehlow wrote:
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> diff --git a/testcases/kernel/fs/fs_bind/fs_bind_lib.sh b/testcases/kernel/fs/fs_bind/fs_bind_lib.sh
> index b644ef512..94e94024c 100644
> --- a/testcases/kernel/fs/fs_bind/fs_bind_lib.sh
> +++ b/testcases/kernel/fs/fs_bind/fs_bind_lib.sh
> @@ -28,6 +28,8 @@ FS_BIND_DISK2="disk2"
>   FS_BIND_DISK3="disk3"
>   FS_BIND_DISK4="disk4"
>   
> +FS_BIND_MNTNS_PID=
> +
>   # Creates a directory and bind-mounts it to itself.
>   # usage: fs_bind_makedir share_mode directory
>   # where
> @@ -68,16 +70,23 @@ fs_bind_makedir()
>   #              If -n is given, only two directories are allowed.
>   fs_bind_check()
>   {
> -	local expect_diff args msg dir1 dir2 fail output
> +	local expect_diff use_ns args msg dir1 dir2 fail output
>   	expect_diff=0
> -	while getopts "n" args; do
> +	use_ns=0
> +	while getopts "ns" args; do
>   		case "$args" in
>   		n) expect_diff=1; shift; ;;
> +		s) use_ns=1; shift; ;;
>   		esac
>   	done
This getopts loop does not seem to be portable. I will send a v3....

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
