Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68546363D7D
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 10:32:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F7033C6D70
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 10:32:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63DFF3C2659
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 10:32:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AD11668FF5E
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 10:32:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3C75AEEB;
 Mon, 19 Apr 2021 08:32:23 +0000 (UTC)
Date: Mon, 19 Apr 2021 10:19:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YH09Ckqng/puMxSa@yuki>
References: <20210416165355.5160-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416165355.5160-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> -	fd = SAFE_OPEN("splice02-temp", O_WRONLY | O_CREAT | O_TRUNC, 0644);
> +	tst_res(TINFO, "checking file content");
> +	do {
> +		i = 0;
> +		size = to_check > SPLICE_SIZE ? SPLICE_SIZE : to_check;
> +		map = SAFE_MMAP(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
                                                                        ^
									This offset
									should
									increase
									by
									size
									on
									each
									iteration.


As it is we check only the first few pages of the file again and again.

> +		while (map[i] && i < size) {
                          ^
		Why map[i]? The i < size should be enough to make sure
		we newer get bytes after end of the file.

> +			if (map[i] != letter)
> +				fail++;
> +			i++;
> +		}
> +		SAFE_MUNMAP(map, size);
> +		to_check -= size;
> +	} while (to_check > 0);
>  
> -	TEST(splice(STDIN_FILENO, NULL, fd, NULL, SPLICE_SIZE, 0));
> -	if (TST_RET < 0) {
> -		tst_res(TFAIL, "splice failed - errno = %d : %s",
> -			TST_ERR, strerror(TST_ERR));
> -	} else {
> -		tst_res(TPASS, "splice() system call Passed");
> +	if (fail) {
> +		tst_res(TFAIL, "%ld failed bytes found", fail);
                                      ^
				      Wrong? Unexpected?
> +		return;
>  	}
>  
> +	tst_res(TPASS, "splice() system call passed");
> +
> +cleanup:
>  	SAFE_CLOSE(fd);
> +	exit(0);
> +}
> +
> +static void run(void)
> +{
> +	size_t size, written, max_pipe_size, to_write;
> +	char buf[BUFSIZE];
> +
> +	SAFE_PIPE(pipe_fd);
> +
> +	memset(buf, letter, BUFSIZE);
> +
> +	if (!file_size) {
> +		max_pipe_size = SAFE_FCNTL(pipe_fd[1], F_GETPIPE_SZ);
> +		file_size = max_pipe_size << 4;
> +	}
> +
> +	to_write = file_size;
> +
> +	if (!SAFE_FORK())
> +		do_child();
> +
> +	tst_res(TINFO, "writting %d bytes", file_size);
> +
> +	while (to_write > 0) {
> +		size = to_write > BUFSIZE ? BUFSIZE : to_write;
> +		written = SAFE_WRITE(1, pipe_fd[1], &buf, size);
> +		to_write -= written;
> +	}
> +
> +	SAFE_CLOSE(pipe_fd[0]);
> +	SAFE_CLOSE(pipe_fd[1]);
> +
> +	tst_reap_children();
>  }
>  
>  static struct tst_test test = {
> -	.test_all = splice_test,
> +	.test_all = run,
> +	.setup = setup,
> +	.needs_checkpoints = 1,
>  	.needs_tmpdir = 1,
> +	.forks_child = 1,
>  	.min_kver = "2.6.17",
> +	.options = (struct tst_option[]) {
> +		{"s:", &sarg, "-s x     Size of output file in bytes (default: 16x max pipe size, i.e. 1M on intel)"},
> +		{}
> +	},
>  };
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
