Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D53A9D21
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 16:11:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 972673C7187
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 16:11:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B98123C3106
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 16:11:36 +0200 (CEST)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 25094600703
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 16:11:36 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id r198so4543615lff.11
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W6ZQPJw2MyaL6HVnwIFj/9K9CpwVSAk22lpgkVNWJ20=;
 b=APSuDKWWcAgfKBxGA2519LyrcLZGJa3FwD++DILgLe7egHWZbaLPo8BFTlyi0Wfk2h
 LFUpP/fv4r71srSENSEnvzxr9sYH6PveoulrBtS5Y1+2stmnLBhJiiq+SGyvaa/Dz7kz
 goiMjuVqlRPY8w5Sfoz0JLaXD2TX32dx8cDKPSfOwPnr8gJTuaurAZ9ILwp3oVUN91Yl
 zwQUvEyw/Tt1HpD2W8ByKjCn1c4txxgeBde7nlnkTfJF2gTqOD+joAIwPLM+/FsaI1Ub
 5vrGR7dQLULkGC/ub0MfWwdUvE0+odGwmCMbhaZ6yIY21DI259MROV9FTIi8Fsoe6TXu
 29ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W6ZQPJw2MyaL6HVnwIFj/9K9CpwVSAk22lpgkVNWJ20=;
 b=VRzgiRVR5pOV5lfCDruXYvoX7xZVCaw4PUrNwHoiLZrbPIoZe+RjCiaUNEkeG4s8JS
 Z9JJXwYq99DXi10s1I4x+iDEzyb5gANS9LXtTHvf6CsOSOLkJxTsFxaYErYqHkdBE+rv
 f8ZYCqWWPxZUNtwg2yOY45XXyYIlYoOTBZ7yU3RyMZfxfHA5X2LQqbXg4n071fIhAfrv
 AoiVq/zbXSeUoXVTF5+EDn2QDgMEWpionWtgYAH3lBSc6VNzFf5HOAtH7iYxXLOLOdWU
 hO9H1e4/GKy9TdAZmMq59f77i+aIbw5C31QdXrQR57Xpd7Od6aDY0tKCSQCAiyxoSz1j
 BOjQ==
X-Gm-Message-State: AOAM531rZx0Tpe+++jzCU9x5gF0uqo9Sh4Hp2KhaCy709HeclFBaaZn5
 wPECqpLtQIVokURTyk6FwVSC
X-Google-Smtp-Source: ABdhPJzIECgEoUVkCJSYB7Ndr13+BTeqOJWcSBzSptJITGpF/x5BtlRhSE0cnqEKw3thfsJ8fIZz4A==
X-Received: by 2002:a05:6512:ba3:: with SMTP id
 b35mr3904386lfv.7.1623852695450; 
 Wed, 16 Jun 2021 07:11:35 -0700 (PDT)
Received: from [192.168.1.53] ([91.233.45.237])
 by smtp.gmail.com with ESMTPSA id t30sm258650lfg.289.2021.06.16.07.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:11:35 -0700 (PDT)
To: Joerg Vehlow <lkml@jv-coder.de>, ltp@lists.linux.it, pvorel@suse.cz
References: <20210616081856.3026223-1-lkml@jv-coder.de>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <fb4b9d45-2cbb-5e5c-fefe-3ca429373a54@bell-sw.com>
Date: Wed, 16 Jun 2021 17:11:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616081856.3026223-1-lkml@jv-coder.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] ssh-stress: Convert to new api
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16.06.2021 11:18, Joerg Vehlow wrote:
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> 
> Apart from pure conversion:
>  - Use "StrictModes no" in ssh config, to get rid of
>    access permission problems; All part of the path of the
>    authorized_keys file must not be writeable by anyone but the owner.
>    This allows writing the file to the default temp directory
>  - Moved all rhost scripts into ssh-stress.sh
> 
> Changes in v3:
> - use pkill instead of ps | awk | xargs
> - Changed test descriptions slightly
>   * include actual ip version
>   * dropped "for a long time", the tests do not run
>     for a long time with the default config
> - Use netstress -B and ssh -f for background processes
>   This implies using pgrep to get the pids of these processes.
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
...
>  
> -TCID=ssh-stress
> -TST_TOTAL=3
>  TST_CLEANUP="cleanup"
> +TST_SETUP="setup"
> +TST_TESTFUNC="test"
> +TST_CNT=3
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_TMPDIR=1
> +TST_NEEDS_CMDS="sshd ssh od pkill pgrep"
>  
> -TST_USE_LEGACY_API=1
>  . tst_net.sh
>  
> -# Temporary directory to store sshd setting or ssh key
> -# Note: ssh doesn't work when those directory is under /tmp.
> -TMPDIR="/root"
> +# SSH config file on the remote host
> +RHOST_SSH_CONF=
> +# SSH command to connect from the remote host to the test host
> +RHOST_SSH=
> +# Processes started on the remote host, killed at cleanup
> +RHOST_PIDS=
> +# Netstress process started on the test host, killed at cleanup
> +NETSTRESS_PID=
>  
>  cleanup()
>  {
> +	local pids
> +
>  	# Stop the ssh daemon
> -	test -s sshd.pid && kill $(cat sshd.pid)
> -	pkill 'netstress$'
> -	tst_rmdir
> -	[ "$rtmpdir" ] && tst_rhost_run -c "rm -rf $rtmpdir"
> -	TMPDIR=
> +	[ -s sshd.pid ] && kill $(cat sshd.pid)
> +	[ -n "$NETSTRESS_PID" ] && kill -2 $NETSTRESS_PID >/dev/null 2>&1
> +
> +	tst_rhost_run -c "kill $RHOST_PIDS"  >/dev/null 2>&1
> +
> +	# Kill all remaining ssh processes
> +	tst_rhost_run -c "pkill -f '^ssh $RHOST_SSH_CONF'"

Perhaps we should check that $RHOST_SSH_CONF is set before running
pkill.


For the rest:
Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
