Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F51F36FB07
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 14:57:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0BEB3C5ECB
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 14:57:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24AF13C22CA
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 14:57:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 75947601116
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 14:57:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7BF5AE58;
 Fri, 30 Apr 2021 12:57:18 +0000 (UTC)
Date: Fri, 30 Apr 2021 14:35:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YIv5jiM9oNgNyd+g@yuki>
References: <20210429125220.31412-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429125220.31412-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/fcntl: Replace TINFO with TPASS or
 TFAIL
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
> 1)remove redundant variable
> 2)remove redundant log
> 3)replace TINFO with TPASS or TFAIL
> 
> For those:
> 	testcases/kernel/syscalls/fcntl/fcntl16.c
> 	testcases/kernel/syscalls/fcntl/fcntl18.c

First of all it looks like the patch got corrupted, possibly by your
email client, there is a missing space somewhere in the middle of the
patch which prevents it from being applied.

> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  testcases/kernel/syscalls/fcntl/fcntl16.c | 70 +++++++----------------
>  testcases/kernel/syscalls/fcntl/fcntl18.c | 40 ++-----------
>  2 files changed, 27 insertions(+), 83 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fcntl/fcntl16.c b/testcases/kernel/syscalls/fcntl/fcntl16.c
> index a77a81298..04d86202c 100644
> --- a/testcases/kernel/syscalls/fcntl/fcntl16.c
> +++ b/testcases/kernel/syscalls/fcntl/fcntl16.c
> @@ -441,7 +441,7 @@ void setup(void)
>  	sigaction(SIGALRM, &sact, NULL);
>  }
> 
> -int run_test(int file_flag, int file_mode, int start, int end)
> +static void run_test(int file_flag, int file_mode, int start, int end)
>  {
>  	int child_count;
>  	int child;
> @@ -468,7 +468,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  				 errno);
>  			close(fd);
>  			unlink(tmpname);
> -			return 1;
> +			goto err;
>  		}
> 
>  		/* Initialize second parent lock structure */
> @@ -482,7 +482,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  					 test + 1, errno);
>  				close(fd);
>  				unlink(tmpname);
> -				return 1;
> +				goto err;
>  			}
>  		}
> 
> @@ -502,7 +502,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  					if (self_exec(argv0, "ddddd", i, parent,
>  						      test, thislock, fd) < 0) {
>  						perror("self_exec failed");
> -						return 1;
> +						goto err;
> 					}
>  #else
>  					dochild(i);
> @@ -510,7 +510,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  				}
>  				if (child < 0) {
>  					perror("Fork failed");
> -					return 1;
> +					goto err;
>  				}
>  				child_count++;
>  				child_pid[i] = child;
> @@ -553,7 +553,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  				 test + 1, errno);
>  			close(fd);
>  			unlink(tmpname);
> -			return 1;
> +			goto err;
>  		}
> 
>  		/* Initialize fourth parent lock structure */
> @@ -567,7 +567,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  					 test + 1, errno);
>  				close(fd);
>  				unlink(tmpname);
> -				return 1;
> +				goto err;
>  			}
>  		}
> 
> @@ -640,12 +640,16 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  		close(fd);
>  	}
>  	unlink(tmpname);
> -	if (fail) {
> -		return 1;
> -	} else {
> -		return 0;
> +
> +	if (!fail) {
> +		tst_resm(TPASS, "locking test successed");
> +		return;
>  	}
> -	return 0;
> +err:
> +	if (file_mode & S_ISGID && !NO_NFS)
> +		tst_resm(TCONF, "NFS does not support mandatory locking");
> +	else
> +		tst_resm(TFAIL, "locking test failed");

This does not help at all, we print TFAIL messages before we do goto
err, so this would be still a failed test.

Looking at the code we should rather skip the test in the main instead
as it was done in the original code as:

	if (NO_NFS)
		run_test(...);
	else
		tst_resm(TCONF, "Skipping mandatory locking on NFS");

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
