Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B437F4AB
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 11:06:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7604C3C4B94
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 11:06:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04CAC3C2306
 for <ltp@lists.linux.it>; Thu, 13 May 2021 11:06:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A42D710011D5
 for <ltp@lists.linux.it>; Thu, 13 May 2021 11:05:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D925BAEF8;
 Thu, 13 May 2021 09:05:40 +0000 (UTC)
To: Yang Xu <xuyang2018.jy@fujitsu.com>, chrubis@suse.cz
References: <1620896054-26151-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <96c15b88-4251-5794-03e0-12bcc048fa5e@suse.cz>
Date: Thu, 13 May 2021 11:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1620896054-26151-1-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mallinfo01: Disable free fastbin blocks
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

Hello,

On 13. 05. 21 10:54, Yang Xu wrote:
> When using malloc to allocate small space, it will use fastbin block firstly if
> we have free fastbin free blocks, it is more quickly.
> In here, we just test oldblks free chunks, it is the number of ordinary
> (i.e. non-fastbin) free blocks. So use mallopt(M_MXFAST, 0) to disable
> free fastbin block.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  testcases/kernel/syscalls/mallinfo/mallinfo01.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo01.c b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
> index 48fce0132..4e10e352e 100644
> --- a/testcases/kernel/syscalls/mallinfo/mallinfo01.c
> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
> @@ -64,6 +64,8 @@ static void setup(void)
>  {
>  	if (sizeof(info1.arena) != sizeof(int))
>  		tst_res(TFAIL, "The member of mallinfo struct is not int");
> +	if (mallopt(M_MXFAST, 0) == 0)
> +		tst_res(TFAIL, "mallopt(M_MXFAST, 0) failed");
>  
>  	info1 = mallinfo();
>  	print_mallinfo("Start", &info1);
> 

Sorry but this does not fix the problem. The failing subtest assumes that:
- malloc() will never increase ordblks
- free() will allways increase ordblks

mallinfo01 is failing because both of these assumptions are wrong.
Disabling fastbin block usage will not fix the failure.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
