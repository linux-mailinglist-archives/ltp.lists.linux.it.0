Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4062F967FB8
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2024 08:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725259900; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=lsvZtUQDwY37lT2CCpv+exZlnpU2oO0MokByRYyZxXk=;
 b=lW0NoRE5sLy4BPf9mnb8gRI9JSGpAuexaduYJebOVMhMjO5n702EQseAgkTg74IN8zugd
 izFQcyQ2w0bDieNYGvH1XynkDvMPSXjejmFit0ACHI+7S8BtcPQ4K70/bLNlX1UCK8jfE5N
 BRQe1vDFxJ10zpBg+GZ15kHtI81PO7o=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8D903C3138
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2024 08:51:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 468253C30A3
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 08:51:38 +0200 (CEST)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 84953200C07
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 08:51:37 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c218866849so4004278a12.0
 for <ltp@lists.linux.it>; Sun, 01 Sep 2024 23:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725259897; x=1725864697; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wMtbyLDxos/OrPEXCiKvOYvaFJDFJOR3Oivw4QwLkpE=;
 b=FgBuxh3ZFTRW7+T6YpfQv8DlPi+5U08g4tyg1MzXd8M359/J4Piipi+Yg/GU6x7ITm
 dMDqkzb2OTAB2QvY8O1RmRAScQavRUZ3Na4DMqdTCbrmxzRz76a2a+B37n9ccQ/A0wy9
 KTYPVHEHXBTG13qYVxzDry0952Bwm5t+7SlMUlhXILr/fQWa0gJ3P+cx4g2WUhlotCOc
 ZoMErVg41Uhc7jKh4JXtdLs2FQJzIRpW+rbSRcnA2yXMYQTOmegxhHI+U8UoGueKuHSe
 3e7x4gIS/3kbBcIiQmgg11mart4z50r2nwm6RyVML6xWg0FRgi8B6TmIKaJfMNLsoqyo
 L0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725259897; x=1725864697;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMtbyLDxos/OrPEXCiKvOYvaFJDFJOR3Oivw4QwLkpE=;
 b=SOSOkEXzEPChdsa6e5wZfYxwuxvNXKSKOxYxdw2vfEFLhN/NeEAJZmF249GyCpHC+j
 kyXhUwA9DLsKwwaaiUfTjVuqMVos+OhuIabyy5s3guD/u4nF9uzKQncx4NkFjDQGweeF
 se/nLYPfVwvooxDYp0JymxmLRLluqU9TzKuDaL7zCCDF9mVrGy32l9F4yrLySOKn5b4p
 8HTVm+Jk4GK25h+ozw9K0BHlvzkZF2JXv728jyOdBQ5ilMHwCP067Cj9sqHl4sy1TncV
 YquIHWuWWwtO1PSxJ8+ZC2IDgU2qDDFD9hnpMBszLCkrqk0QV8y1OusWR9hT59eLsBXF
 tZIw==
X-Gm-Message-State: AOJu0YyPqrrQ1RSbk2QDCTcxKIk6jcIVQieSASp69cXz/SFrQ7cuBfJH
 24Mtdi+EQeX6O6zXwl/7wasEXVK05Vo+7YaselEMzWnNZXWfxS6Mov6PpDswj2SxF9ZhXprM54A
 =
X-Google-Smtp-Source: AGHT+IHXPg+/+Qu4Y+yKVRul6ia4EHSfpgXZclbWqrxH51CWirQauI3j1PoYRNi1/TCLmcH+AQKh+g==
X-Received: by 2002:a05:6402:5250:b0:5c2:609d:397e with SMTP id
 4fb4d7f45d1cf-5c2609d3a67mr766936a12.15.1725259896049; 
 Sun, 01 Sep 2024 23:51:36 -0700 (PDT)
Received: from wegao ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c256f49edasm1298435a12.93.2024.09.01.23.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 23:51:35 -0700 (PDT)
Date: Mon, 2 Sep 2024 02:51:29 -0400
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZtVgcX/C4bDYIjsa@wegao>
References: <20240902062738.267190-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902062738.267190-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/1] isofs.sh: Use nobody user
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Sep 02, 2024 at 08:27:38AM +0200, Petr Vorel wrote:
> From: Wei Gao <wegao@suse.com>
> 
> Some distros don't have user/group 'bin' (e.g. SUSE SLE-Micro).
> Although this user/group is required and created IDcheck.sh.
> (This script should be replaced in the future with library call,
> but it's still supported).
> 
> Replace 'bin' user/group with 'nobody' user (more common on various
> Linux distributions). Most of the distros name have 'nobody' user's
> group also 'nobody', but at least Debian name it 'nogroup'. Therefore
> detect this name with 'id -g -n'.
> 
> Reported-by: Wei Gao <wegao@suse.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v1->v2:
> * Correct fallback condition (thanks Wei for the report):
> -	[ "$TEST_USER" ] || TEST_GROUP="$TEST_USER"
> +	[ "$TEST_GROUP" ] || TEST_GROUP="$TEST_USER"
> 
>  testcases/kernel/fs/iso9660/isofs.sh | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/fs/iso9660/isofs.sh b/testcases/kernel/fs/iso9660/isofs.sh
> index d1a362d979..088e062d67 100755
> --- a/testcases/kernel/fs/iso9660/isofs.sh
> +++ b/testcases/kernel/fs/iso9660/isofs.sh
> @@ -13,10 +13,19 @@ TST_NEEDS_CMDS="mount umount"
>  TST_NEEDS_TMPDIR=1
>  TST_TESTFUNC=do_test
>  TST_CNT=3
> +TST_SETUP="setup"
>  
>  MAX_DEPTH=3
>  MAX_DIRS=4
>  
> +TEST_USER='nobody'
> +
> +setup()
> +{
> +	TEST_GROUP="$(id -g -n $TEST_USER)"
> +	[ "$TEST_GROUP" ] || TEST_GROUP="$TEST_USER"
If $TEST_GROUP can not be found then this case will failed unless we create new group.
My suggestion is remove above line totally or we start create group for nobody user.
> +}
> +
>  gen_fs_tree()
>  {
>  	local cur_path="$1"
> @@ -92,8 +101,8 @@ do_test()
>  			"loop,block=512,unhide" \
>  			"loop,block=1024,cruft" \
>  			"loop,block=2048,nocompress" \
> -			"loop,check=strict,map=off,gid=bin,uid=bin" \
> -			"loop,check=strict,map=acorn,gid=bin,uid=bin" \
> +			"loop,check=strict,map=off,gid=$TEST_GROUP,uid=$TEST_USER" \
> +			"loop,check=strict,map=acorn,gid=$TEST_GROUP,uid=$TEST_USER" \
>  			"loop,check=relaxed,map=normal" \
>  			"loop,block=512,unhide,session=2"
>  		do
> -- 
> 2.45.2
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
