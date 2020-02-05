Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AED1532C8
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 15:25:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13D153C264F
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 15:25:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2AF503C23E3
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 15:25:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A74A200043
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 15:25:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B4ABFB196
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 14:25:16 +0000 (UTC)
Date: Wed, 5 Feb 2020 15:25:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200205142515.GB30186@rei>
References: <20200203113956.13176-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203113956.13176-1-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add TST_SPIN_TEST() macro
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
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  include/tst_common.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/include/tst_common.h b/include/tst_common.h
> index a0c06a3f7..72e00ca81 100644
> --- a/include/tst_common.h
> +++ b/include/tst_common.h
> @@ -55,6 +55,34 @@
>  	ERET;								\
>  })
>  
> +/**
> + * TST_SPIN_TEST() - Repeatedly retry a function with an increasing delay.
> + * @FUNC - The function which will be retried
> + *
> + * Same as TST_RETRY_FUNC() but any non-negative return value is accepted
> + * as success and tst_brk() will not be called on timeout.
> + */
> +#define TST_SPIN_TEST(FUNC) \
> +	TST_SPIN_TEST_EXP_BACKOFF(FUNC, 1, -1)
> +
> +#define TST_SPIN_TEST_EXP_BACKOFF(FUNC, MAX_DELAY, GOOD_ERRNO)	\
> +({	unsigned int tst_delay_, tst_max_delay_;			\
> +	tst_delay_ = 1;							\
> +	tst_max_delay_ = tst_multiply_timeout(MAX_DELAY * 1000000);	\
> +	for (;;) {							\
> +		TEST(FUNC);						\
> +		if (TST_RET >= 0 || (GOOD_ERRNO >= 0 && TST_ERR == GOOD_ERRNO))	\
> +			break;						\
> +		if (tst_delay_ < tst_max_delay_) {			\
> +			usleep(tst_delay_);				\
> +			tst_delay_ *= 2;				\
> +		} else {						\
> +			break;						\
> +		}							\
> +	}								\
> +	TST_RET;							\
> +})

This looks like we will end up adding more specialized variants over
time, I do wonder if we can make one generic implementation. It would
probably make more sense to pass a function that converts the FUNC
output into boolean instead.

Something as:

diff --git a/include/tst_common.h b/include/tst_common.h
index a0c06a3f7..b7c644d0d 100644
--- a/include/tst_common.h
+++ b/include/tst_common.h
@@ -34,25 +34,26 @@
  * (the total time sleeping will be approximately one second as well). When the
  * delay exceeds one second tst_brk() is called.
  */
-#define TST_RETRY_FUNC(FUNC, ERET) \
-	TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, 1)
+#define TST_RETRY_FUNC(FUNC, ECHCK) \
+	TST_RETRY_FN_EXP_BACKOFF(FUNC, ECHCK, 1)
 
-#define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)	\
+#define TST_RETRY_FN_EXP_BACKOFF(FUNC, ECHCK, MAX_DELAY)		\
 ({	unsigned int tst_delay_, tst_max_delay_;			\
 	tst_delay_ = 1;							\
 	tst_max_delay_ = tst_multiply_timeout(MAX_DELAY * 1000000);	\
+	typeof(FUNC) tst_ret_;                                          \
 	for (;;) {							\
-		typeof(FUNC) tst_ret_ = FUNC;				\
-		if (tst_ret_ == ERET)					\
+		tst_ret_ = FUNC;					\
+		if (ECHCK(tst_ret_))					\
 			break;						\
 		if (tst_delay_ < tst_max_delay_) {			\
 			usleep(tst_delay_);				\
 			tst_delay_ *= 2;				\
 		} else {						\
-			tst_brk(TBROK, #FUNC" timed out");		\
+			break;                                          \
 		}							\
 	}								\
-	ERET;								\
+	tst_ret_;							\
 })
 
 #define TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition) \
diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c b/testcases/kernel/syscalls/tgkill/tgkill03.c
index 593a21726..a303d0c9c 100644
--- a/testcases/kernel/syscalls/tgkill/tgkill03.c
+++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
@@ -39,11 +39,14 @@ static void *defunct_thread_func(void *arg)
 	return arg;
 }
 
+#define HAS_FAILED(x) ((x) == -1)
+
 static void setup(void)
 {
 	sigset_t sigusr1;
 	pthread_t defunct_thread;
 	char defunct_tid_path[PATH_MAX];
+	int ret;
 
 	sigemptyset(&sigusr1);
 	sigaddset(&sigusr1, SIGUSR1);
@@ -59,7 +62,9 @@ static void setup(void)
 	SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func, NULL);
 	SAFE_PTHREAD_JOIN(defunct_thread, NULL);
 	sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(), defunct_tid);
-	TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), -1, 15);
+	ret = TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), HAS_FAILED, 1);
+	if (!HAS_FAILED(ret))
+		tst_brk(TBROK, "Timeout %s still exists", defunct_tid_path);
 }
 
 static void cleanup(void)

Also I do not like that we are using the TEST() macro inside of an
macro, that may lead to unexpected consequencies. The TST_RET and
TST_ERR should not change unless user used TEST() macro explicitely.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
