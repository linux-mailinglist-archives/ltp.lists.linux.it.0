Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DBF310DA0
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 17:10:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0D8D3C7301
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 17:10:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8399E3C0ED0
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 17:10:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 888556009CA
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 17:09:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF06EAC97
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:09:55 +0000 (UTC)
Date: Fri, 5 Feb 2021 17:09:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YB1t0lP2j+x2yKdn@pevik>
References: <20210204110342.11821-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204110342.11821-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] Prevent linker issues in lapi/io_uring.h
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Fallback io_uring syscall wrappers were not defined as static inline. This
> will lead to linker issues when safe function variants get added to LTP
> library.

> Also add check for <linux/io_uring.h> to configure script and #include it
> in the LAPI header if it's available.

Thanks for cleanup!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +++ b/configure.ac
> @@ -49,6 +49,7 @@ AC_CHECK_HEADERS_ONCE([ \
>      linux/if_alg.h \
>      linux/if_ether.h \
>      linux/if_packet.h \
> +    linux/io_uring.h \
>      linux/keyctl.h \
>      linux/mempolicy.h \
>      linux/module.h \
...

> +++ b/include/lapi/io_uring.h
...
> +#ifdef HAVE_LINUX_IO_URING_H
> +#include <linux/io_uring.h>
> +#endif
> +
>  #ifndef IOSQE_FIXED_FILE
This could be also guarded as ! HAVE_LINUX_IO_URING_H (#else branch), but
keeping IOSQE_FIXED_FILE is probably safer.

>  #ifndef __kernel_rwf_t
> @@ -260,8 +264,8 @@ struct io_uring_probe {


>  #ifndef HAVE_IO_URING_REGISTER
> -int io_uring_register(int fd, unsigned int opcode, void *arg,
> -		      unsigned int nr_args)
> +static inline int io_uring_register(int fd, unsigned int opcode, void *arg,
> +	unsigned int nr_args)
>  {
>  	return tst_syscall(__NR_io_uring_register, fd, opcode, arg, nr_args);
>  }
> @@ -269,22 +273,23 @@ int io_uring_register(int fd, unsigned int opcode, void *arg,
...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
