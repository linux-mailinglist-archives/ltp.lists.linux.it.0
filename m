Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E851718BD
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 14:32:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E012D3C24B8
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 14:32:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C76343C2377
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 14:32:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1469F1A01A33
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 14:32:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06FF3AF82;
 Thu, 27 Feb 2020 13:32:00 +0000 (UTC)
Date: Thu, 27 Feb 2020 14:31:59 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200227133159.GA24778@rei>
References: <fa386b967db52665ca84150a59058d0f601ca051.1582806435.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa386b967db52665ca84150a59058d0f601ca051.1582806435.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/bpf: bump RLIMIT_MEMLOCK limit
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
> Some bpf array types reserve space according to number of
> possible CPUs. This is running into limits on a ppc64le with
> 64k pages and NR_CPUS==2048:
>     84 bpf_map01(1049142):   <-bpf_map_init_from_attr
>     89 bpf_map01(1049142):   ->bpf_map_charge_init mem={.pages=0, .user=0x0} size=208456
>     94 bpf_map01(1049142):   <-bpf_map_charge_init return=0xffffffffffffffff
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/bpf/bpf_common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/bpf/bpf_common.h b/testcases/kernel/syscalls/bpf/bpf_common.h
> index 1dbbd5f25635..d36a2b09ffd9 100644
> --- a/testcases/kernel/syscalls/bpf/bpf_common.h
> +++ b/testcases/kernel/syscalls/bpf/bpf_common.h
> @@ -6,7 +6,7 @@
>  #ifndef LTP_BPF_COMMON_H
>  #define LTP_BPF_COMMON_H
>  
> -#define BPF_MEMLOCK_ADD (256*1024)
> +#define BPF_MEMLOCK_ADD (2*1024*1024)

Looks still reasonably small so that we can raise it unconditionally,
acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
