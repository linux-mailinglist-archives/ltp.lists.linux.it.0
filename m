Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671A28BD21
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 18:02:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB2123C32D5
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 18:02:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5327C3C1C9E
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 18:02:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E90A320033C
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 18:02:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC829ACE5;
 Mon, 12 Oct 2020 16:02:10 +0000 (UTC)
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
References: <20201012091204.875-1-po-hsu.lin@canonical.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <26c947ca-12b7-92ad-4b7f-52603c3b173d@suse.cz>
Date: Mon, 12 Oct 2020 18:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012091204.875-1-po-hsu.lin@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ioctl_sg01: correct the fix SHA1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Oops, thanks for noticing this.

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 12. 10. 20 11:12, Po-Hsu Lin wrote:
> Correct the fix SHA1 to match with the one in the comment.
> 
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> index 8ad2ffed5..94b30dc6b 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> @@ -127,7 +127,7 @@ static struct tst_test test = {
>  	.setup = setup,
>  	.cleanup = cleanup,
>  	.tags = (const struct tst_tag[]) {
> -		{"linux-git", "e093c4be760e"},
> +		{"linux-git", "a45b599ad808"},
>  		{"CVE", "2018-1000204"},
>  		{}
>  	}
> 


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
