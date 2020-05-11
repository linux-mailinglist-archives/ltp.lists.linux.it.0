Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6471CD740
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 13:08:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76CAD3C55F6
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 13:08:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 099F33C26BF
 for <ltp@lists.linux.it>; Mon, 11 May 2020 13:08:55 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EEF441A00A5A
 for <ltp@lists.linux.it>; Mon, 11 May 2020 13:08:54 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id 18so4587801pfv.8
 for <ltp@lists.linux.it>; Mon, 11 May 2020 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3uerJjC6Ay+DPptqaFyLRWI++TU7iYdivbFW7/Uuymw=;
 b=gEc3bePuFKAj29VKaeZFIwSvYGlGCbQq4vtKvvv7jYcnt3sWDQ36b/TNr38zXgRfPc
 s+dT6LXppdzyL8B1JXLYKw87ekMgitZ4GJKycsZrCs4vWjy7X90V0vRNaCSFCycqkFUC
 TzGyCkDzXYUg7vemI3we2p14O+x0RJLi/OXd3klGkPYmQ/7tP326RUsWhZCBuPt3mzQZ
 qKSW9wENb4S36jYf11QIfMgyFwzCZr77bnmnh3LOprYTlPprx3G7Za7rjlT9/suCnQ3b
 7Kvmmvs+0Ffrj58xR4AkiGgvMTMTnFMbzO4L1SzBY47/U8/XxhQULlymPF0MZFw8WNPv
 wbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3uerJjC6Ay+DPptqaFyLRWI++TU7iYdivbFW7/Uuymw=;
 b=ip4piifN2UiXaJB/kfG3VA46g5pSbObw4aKvjIO19bVhD+HEQsUkbYYT3vvrPJkXUo
 SF1l+xefaxZ9WnyOH4YymtdZi9ysN2f6NXeToNrswPY7laftjYdxPSj97hIFiQya0acw
 WB9VaT8yE5vTPEceQVvz1/jYUw30nM4Ku9rZspMqDkrJ11sf/8XJ86SY/1nU0Tjy5LSm
 alylmCx5FIIvrCwuk4sh9/QTLZfB+kbdRfy5Qs3Yo+Nq2bratI3C51vnAEhAcPmqSpEc
 rpBBgKyXL9ifCnP7WS+vaxx1n4TjOrYmmuvS9F+tOwCRaq/R164ZuucGzmUPpKZB9A9D
 O67g==
X-Gm-Message-State: AOAM530frPoHa43oDShLOiMoHQLTJz6WkmXNJs2n/6taMrFtfM6HP1XK
 8xJ0TLU4SuKdEJeVFVw2rFGE0w==
X-Google-Smtp-Source: ABdhPJz8+xgEnTm+3uytvQ9/ocp6lu0RfjRIflR6gUyUV+wz8kRcB/6JgjCyVcWPjvXDEauOHVCcbA==
X-Received: by 2002:a63:30f:: with SMTP id 15mr4081840pgd.373.1589195333251;
 Mon, 11 May 2020 04:08:53 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id i10sm9040462pfa.166.2020.05.11.04.08.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 04:08:52 -0700 (PDT)
Date: Mon, 11 May 2020 16:38:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200511110849.jugfm7ett67uxfpb@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <5432ab11234b37bf7f46db7c1a624a432c8aedf3.1588911607.git.viresh.kumar@linaro.org>
 <CAEemH2f8fQ58f_sJBkF4j2gnRORYm28g5Bzy21TF_M_wKuANUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f8fQ58f_sJBkF4j2gnRORYm28g5Bzy21TF_M_wKuANUg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 06/17] syscalls/futex: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 09-05-20, 17:02, Li Wang wrote:
> This might not safe to use it directly if only check __NR_futex_time64 being
> defined. i.e Test it on the platform without achieving the system
> syscall(but
> define __NR_futex_time64), the test children exit with TCONF will cause
> kind of issues.

I will add this to the patch then, I am wondering if I need to add
this to all tests now ? Cyril ?

diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
index efde3410f564..537641766357 100644
--- a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
+++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
@@ -194,7 +194,11 @@ static void verify_futex_cmp_requeue(unsigned int n)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
+
 	max_sleep_ms = tst_multiply_timeout(5000);
 
 	sd = SAFE_MMAP(NULL, sizeof(*sd), PROT_READ | PROT_WRITE,
diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue02.c b/testcases/kernel/syscalls/futex/futex_cmp_requeue02.c
index e1af5ddab509..dd8fafb3ee38 100644
--- a/testcases/kernel/syscalls/futex/futex_cmp_requeue02.c
+++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue02.c
@@ -69,7 +69,11 @@ static void verify_futex_cmp_requeue(unsigned int n)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
+
 	futexes = SAFE_MMAP(NULL, sizeof(futex_t) * 2, PROT_READ | PROT_WRITE,
 			    MAP_ANONYMOUS | MAP_SHARED, -1, 0);
 
diff --git a/testcases/kernel/syscalls/futex/futex_wait01.c b/testcases/kernel/syscalls/futex/futex_wait01.c
index 41b21a71f2c6..e884e696ef55 100644
--- a/testcases/kernel/syscalls/futex/futex_wait01.c
+++ b/testcases/kernel/syscalls/futex/futex_wait01.c
@@ -74,7 +74,10 @@ static void run(unsigned int n)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/futex/futex_wait02.c b/testcases/kernel/syscalls/futex/futex_wait02.c
index 7b19115073dd..34b78357f6e6 100644
--- a/testcases/kernel/syscalls/futex/futex_wait02.c
+++ b/testcases/kernel/syscalls/futex/futex_wait02.c
@@ -74,7 +74,10 @@ static void run(void)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 
 	futex = SAFE_MMAP(NULL, sizeof(*futex), PROT_READ | PROT_WRITE,
 			  MAP_ANONYMOUS | MAP_SHARED, -1, 0);
diff --git a/testcases/kernel/syscalls/futex/futex_wait03.c b/testcases/kernel/syscalls/futex/futex_wait03.c
index 83601479adc0..e436b238a165 100644
--- a/testcases/kernel/syscalls/futex/futex_wait03.c
+++ b/testcases/kernel/syscalls/futex/futex_wait03.c
@@ -73,7 +73,10 @@ static void run(void)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/futex/futex_wait04.c b/testcases/kernel/syscalls/futex/futex_wait04.c
index ba6988a20e98..8de3c90b08d3 100644
--- a/testcases/kernel/syscalls/futex/futex_wait04.c
+++ b/testcases/kernel/syscalls/futex/futex_wait04.c
@@ -53,7 +53,10 @@ static void run(void)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/futex/futex_wait_bitset01.c b/testcases/kernel/syscalls/futex/futex_wait_bitset01.c
index 9f2f4025d4a4..a871af992572 100644
--- a/testcases/kernel/syscalls/futex/futex_wait_bitset01.c
+++ b/testcases/kernel/syscalls/futex/futex_wait_bitset01.c
@@ -102,7 +102,10 @@ static void run(unsigned int n)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/futex/futex_wake01.c b/testcases/kernel/syscalls/futex/futex_wake01.c
index 21cf158daac7..2dbe8cc2f3aa 100644
--- a/testcases/kernel/syscalls/futex/futex_wake01.c
+++ b/testcases/kernel/syscalls/futex/futex_wake01.c
@@ -58,7 +58,10 @@ static void run(unsigned int n)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/futex/futex_wake02.c b/testcases/kernel/syscalls/futex/futex_wake02.c
index cd535163a6e9..3491839872ac 100644
--- a/testcases/kernel/syscalls/futex/futex_wake02.c
+++ b/testcases/kernel/syscalls/futex/futex_wake02.c
@@ -147,7 +147,10 @@ static void run(void)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/futex/futex_wake03.c b/testcases/kernel/syscalls/futex/futex_wake03.c
index b059cf6fa272..29e586c40132 100644
--- a/testcases/kernel/syscalls/futex/futex_wake03.c
+++ b/testcases/kernel/syscalls/futex/futex_wake03.c
@@ -103,7 +103,10 @@ static void run(void)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 
 	futex = SAFE_MMAP(NULL, sizeof(*futex), PROT_READ | PROT_WRITE,
 			  MAP_ANONYMOUS | MAP_SHARED, -1, 0);
diff --git a/testcases/kernel/syscalls/futex/futex_wake04.c b/testcases/kernel/syscalls/futex/futex_wake04.c
index 2f58efc1eb2a..edbb9c644c57 100644
--- a/testcases/kernel/syscalls/futex/futex_wake04.c
+++ b/testcases/kernel/syscalls/futex/futex_wake04.c
@@ -62,6 +62,7 @@ static void setup(void)
 	struct test_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	futex_supported_by_kernel(tv->fntype);
 
 	to.type = tv->tstype;
 	tst_ts_set_sec(&to, 30);
diff --git a/testcases/kernel/syscalls/futex/futextest.h b/testcases/kernel/syscalls/futex/futextest.h
index a9dcbbedd249..816f2f1f4689 100644
--- a/testcases/kernel/syscalls/futex/futextest.h
+++ b/testcases/kernel/syscalls/futex/futextest.h
@@ -88,6 +88,17 @@ enum futex_fn_type {
 	FUTEX_FN_FUTEX64,
 };
 
+static inline void futex_supported_by_kernel(enum futex_fn_type fntype)
+{
+	if (fntype != FUTEX_FN_FUTEX64)
+		return;
+
+	/* Check if the syscall is backported on an older kernel */
+	TEST(sys_futex_time64(NULL, 0, 0, NULL, NULL, 0));
+	if (TST_RET == -1 && TST_ERR == ENOSYS)
+		tst_brk(TCONF, "Test not supported on kernel");
+}
+
 /**
  * futex_syscall() - futex syscall wrapper
  * @fntype:	Futex function type

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
