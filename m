Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA9EE456
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:59:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DB5F3C2541
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:59:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 36A593C2417
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:59:02 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8E11B1400B7B
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:59:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0D8DAED6;
 Mon,  4 Nov 2019 15:59:01 +0000 (UTC)
Date: Mon, 4 Nov 2019 16:59:01 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191104155900.GA5683@rei.lan>
References: <4e93b0d943960d957b71bdb998b33ad30424b07c.1572881777.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e93b0d943960d957b71bdb998b33ad30424b07c.1572881777.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all_sys: skip debugfs
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
> debugfs is meant for debugging, it exposes also device registers
> and can pretty much do anything:
>   https://lore.kernel.org/linux-arm-kernel/1507592549.3785589.1570404050459.JavaMail.zimbra@redhat.com/
>   https://lore.kernel.org/stable/2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com/
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  runtest/fs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/runtest/fs b/runtest/fs
> index 07d6e2b67964..fba19cae03e8 100644
> --- a/runtest/fs
> +++ b/runtest/fs
> @@ -71,7 +71,7 @@ proc01 proc01 -m 128
>  
>  read_all_dev read_all -d /dev -p -q -r 10
>  read_all_proc read_all -d /proc -q -r 10
> -read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count
> +read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count -e '/sys/kernel/debug/*'

Do we even support multiple parameters for the same option?

I looked that the library code and I would say that we will replace the
value with each iteration which means that we will effectively use the
last one.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
