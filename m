Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8DFF111B
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 09:33:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E2C23C23B6
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 09:33:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AA87A3C1CB2
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 09:33:27 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5897660148F
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 09:33:27 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.176])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 54EA59F747;
 Wed,  6 Nov 2019 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1573029204; bh=q5rEfF9FWoxTq7wki4JarcLYz3xxqw3FqYtfmwuSe3A=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=eObM02nyxfWQX9Nec2uHwo0MKWAa2YJAUtwcOGoxpITUXuNnP/QnQ7wNq8HeIPIea
 tIu3iQGGXx3dLpzVOm1vP4bgMd9/S8qUiHm1yMTVxI1luJUKmhS6Uux9P6L7vwj6BA
 w2l15/cKS+sPzt1yIT862dfwVoWnnuVf5qIdPc0c=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
References: <20191106073621.58738-1-lkml@jv-coder.de>
Message-ID: <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
Date: Wed, 6 Nov 2019 09:33:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191106073621.58738-1-lkml@jv-coder.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg_lib/memcg_process: Better synchronization
 of signal USR1
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


> diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> index aadaae4d2..7440e1eee 100755
> --- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> +++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> @@ -124,6 +124,7 @@ signal_memcg_process()
>   	local usage_start=$(cat ${path}memory.usage_in_bytes)
>   
>   	kill -s USR1 $pid 2> /dev/null
> +	TST_CHECKPOINT_WAIT 1
Actually this does not work like this, because some of the
tests trigger the oom killer and TEST_CHECKPOINT_WAIT calling
tst_checkpoint uses ROD. Is it ok to directly call

tst_checkpoint wait 10000 "1"

and ignore the result here?

BTW: Is there no such thing like TST_CHECKPOINT in the new
shell test library?



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
