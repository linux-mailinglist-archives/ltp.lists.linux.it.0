Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5E3983D6
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 10:08:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04F393C54B7
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 10:08:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54C1A3C2926
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 10:08:37 +0200 (CEST)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BA6992005F1
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 10:08:36 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id b18so1970715lfv.11
 for <ltp@lists.linux.it>; Wed, 02 Jun 2021 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FCFE3wcJl4cMUcO5pESrxZ1COffREp/VqksgtbqZj6o=;
 b=DeJ247OxkkB6NPNH+MQs5ePNHPe0V+3jirk92z6LZW74OpXbmvPpWMPmWktDw4WTq7
 EBbim96zlcrsZlEKEYweYoz3b4dmO7EXt67tq/qsD1sOH6AHTzSBs1BPpzKGKjRDn8Qp
 Kct98H/s/6gherlaYK7D+W6eZmuw0ca5VYI8a224NEjtrG1123cowEpJX1L/jF9odICL
 uPXMfYybh/efl6iYDk2Ef2dxQISpP11+6kW9vdUW0cFGVPPpXp1uzfnVgAHBgTrUV6jU
 CJeCMEm/EE30Z0pWImzfzRT+JnYkBL0dm0UGBEOfBsqwINF3niRfT7xoyAv7sHVnbnMA
 cXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FCFE3wcJl4cMUcO5pESrxZ1COffREp/VqksgtbqZj6o=;
 b=QNYyHe0KPKKIdq6GxSVYTyyFafLbO498100NmVeB8vEhJDUhJm8I1ZtkbAKmgODXtm
 MX8j5DbTcVjUOaKYdszq6d2L3XMAQe/dtRGuE8JBXyXlAi4KxBYIpcP4IkP9YdEwU+VZ
 K5PTHpoeLWbdIydKUsGvg/sYWuvDNrvsp5UqD7cQzdV+xh8FTZlbGddoAkrDioaaqYLr
 9VQ74388gUMHlz8E2pMc1ZuJo1XT28Lsw0AdA54zW/hJcz3ocuAd2j6crr9IEUy7uZ6f
 37czMzfPf8fZI27zfkJGg1Vk0E2qlTtkf6pcJ1l9fS6yg9nm3QXwprsDAIHjnjL8UBOa
 QTsg==
X-Gm-Message-State: AOAM532grA68zaMw9y6EpczZZ+G/msOvZ6/lkrG6Z+j6uKUpgxuOAfUC
 U+Ht+uK/X6SkNlHEl+eEqVPc
X-Google-Smtp-Source: ABdhPJyYwiM3tYuAQYfbs3auU9QO6USQg3MKAJPq4FydXJn8qt4Rdnb95i6Pbo6Cr44QlLyvnjEf6w==
X-Received: by 2002:ac2:569a:: with SMTP id 26mr12619764lfr.257.1622621316001; 
 Wed, 02 Jun 2021 01:08:36 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id z8sm235607lfg.243.2021.06.02.01.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 01:08:35 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210526172503.18621-1-pvorel@suse.cz>
 <20210526172503.18621-3-pvorel@suse.cz>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <02781c77-9fed-b111-c3ad-3043a6e0ca29@bell-sw.com>
Date: Wed, 2 Jun 2021 11:08:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526172503.18621-3-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [LTP PATCH v2 3/3] nfs_lib.sh: Check running rpc.mountd,
 rpc.statd
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26.05.2021 20:25, Petr Vorel wrote:
> NOTE: we're not checking rpcbind/portmap which is required for NFSv3,
> as it's rpc.mountd dependency.
> 
> Deliberately not add pgrep as required dependency.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> changes v1->v2:
> * check for rpc.mountd, rpc.statd
> (previsously checked for rpc.mountd, rpcbind/portmap)
> 
>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 26b670c35..9bef1b86a 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -27,7 +27,7 @@ TST_PARSE_ARGS=nfs_parse_args
>  TST_USAGE=nfs_usage
>  TST_NEEDS_TMPDIR=1
>  TST_NEEDS_ROOT=1
> -TST_NEEDS_CMDS="$TST_NEEDS_CMDS mount exportfs"
> +TST_NEEDS_CMDS="$TST_NEEDS_CMDS exportfs mount"

Does it change anything?

The rest looks good.

>  TST_SETUP="${TST_SETUP:-nfs_setup}"
>  TST_CLEANUP="${TST_CLEANUP:-nfs_cleanup}"
>  TST_NEEDS_DRIVERS="nfsd"
> @@ -110,11 +110,6 @@ nfs_mount()
>  
>  nfs_setup()
>  {
> -	# Check if current filesystem is NFS
> -	if [ "$(stat -f . | grep "Type: nfs")" ]; then
> -		tst_brk TCONF "Cannot run nfs-stress test on mounted NFS"
> -	fi
> -
>  	local i
>  	local type
>  	local n=0
> @@ -123,6 +118,16 @@ nfs_setup()
>  	local remote_dir
>  	local mount_dir
>  
> +	if [ "$(stat -f . | grep "Type: nfs")" ]; then
> +		tst_brk TCONF "Cannot run nfs-stress test on mounted NFS"
> +	fi
> +
> +	if tst_cmd_available pgrep; then
> +		for i in rpc.mountd rpc.statd; do
> +			pgrep $i > /dev/null || tst_brk TCONF "$i not running"
> +		done
> +	fi
> +
>  	for i in $VERSION; do
>  		type=$(get_socket_type $n)
>  		tst_res TINFO "setup NFSv$i, socket type $type"
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
