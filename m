Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD001CEBDC
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 06:19:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37E573C560C
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 06:19:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DA52A3C2232
 for <ltp@lists.linux.it>; Tue, 12 May 2020 06:19:19 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 039091400279
 for <ltp@lists.linux.it>; Tue, 12 May 2020 06:19:18 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id y9so2237784plk.10
 for <ltp@lists.linux.it>; Mon, 11 May 2020 21:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ps1neeBfw4q6bDYTW0zjataGAx60UF0TwDQXfzWTHKU=;
 b=St3xZvY8DJ0Mjd1F15yIb+65B3iIkdXCjHzCFnp/IVr7jmOYlycPN4vNZQ0mF8kmh2
 0gNWq5ua0sMNJ5HNIDuSjj7YzawbDErCfbFArIgaPmZogOzbd77bY67yXiuoR8p1A9rb
 95OPKFfyAZKcXXHs7k2eJZlxg0qsIaHlDs8SkImWf8K9OjHoI18Ap1ofDl7DPao9V1L/
 PUDz032wIqkNGqklJVoKU3Z4BeNEQZSi2Idxx7dHuBNSa0Ajzvb58safmgBDik+1amaz
 k9RMJKf5mLGt9nM5PYtPcHNlGPVj3tYVz/9OOwMEt//wsG8qe3eKK1T07Cr0+OsREot5
 UupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ps1neeBfw4q6bDYTW0zjataGAx60UF0TwDQXfzWTHKU=;
 b=k99CIfc5q37CTOB96gezgnjqcJ6/XF4BP92vU285K7psCRecKZYs75QSr67uFSHMZ+
 9wjSqMWhhxrBtL9PPqIHXPfKcAydtq+GNvfbwAHMccluFAmfy13VLFh4UY8v21eM9YiS
 Gishj3Cy9PwhcMzgRMDk7L5F9w0ecpNW7aJz5lex/h3qeuB7huj8AMYu12uCCvurXAUy
 11miRRC+DWyKPaNObUmvuGJaOofz8eNdmps7saH30zN5YzAKd4/05FkuLR+Dmq3NUVO4
 0t1aUUXBrBR09V7Jj+xCS4qczxtgPCOt39lzQ/H/0Low7lbE71uJhcD9y5xgObNi3T1O
 pZKA==
X-Gm-Message-State: AGi0PuZdzA6WtvwXdW5km83OZaWwXvPQU0tTgDIX0Ksouk8y+i1crKIu
 U1+XCsQc9dd8RHHk7zzgqg/VjQ==
X-Google-Smtp-Source: APiQypIHFUv0P/RSqdBYq3gYxkvOJZGofUgsOc3iPOqKvcZTgKVmYMD1y7OvigSjSt20pkSKfxmC9w==
X-Received: by 2002:a17:902:7249:: with SMTP id
 c9mr17758288pll.23.1589257157329; 
 Mon, 11 May 2020 21:19:17 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id v2sm11474816pje.52.2020.05.11.21.19.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 21:19:16 -0700 (PDT)
Date: Tue, 12 May 2020 09:49:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200512041913.6nd5ws6foc7bszp2@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAEemH2cX=zyULO6qZBV5fBQv74dm2yuiUeRJ8SMe7OXYWJJ_sQ@mail.gmail.com>
 <20200511104306.x4sit6vy2a4bmcgc@vireshk-i7>
 <CAEemH2dps8ib=GQKd+GftKYFdefFM+9sgvJw8SWccSDcXTRHaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dps8ib=GQKd+GftKYFdefFM+9sgvJw8SWccSDcXTRHaQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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

On 11-05-20, 20:29, Li Wang wrote:
> This delta works(on x86_64) for me. But the s390x issue looks like the same
> as the futex TCONF in another email.

Ah, this should fix it then:

diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
index 7180f6e35185..584d12c68e0d 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop.h
+++ b/testcases/kernel/syscalls/ipc/semop/semop.h
@@ -44,4 +44,12 @@ static inline int call_semop(struct test_variants *tv, int semid,
 	return tv->semtimedop(semid, sops, nsops, tst_ts_get(timeout));
 }
 
+static inline void semop_supported_by_kernel(struct test_variants *tv)
+{
+       /* Check if the syscall is implemented on the platform */
+       TEST(call_semop(tv, 0, NULL, 0, NULL));
+       if (TST_RET == -1 && TST_ERR == ENOSYS)
+               tst_brk(TCONF, "Test not supported on kernel/platform");
+}
+
 #endif /* SEMOP_VAR__ */
diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
index cc8725bdbed3..7947183c837b 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -99,9 +99,11 @@ static void run(void)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	int i;
 
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
 
 	get_arr.array = malloc(sizeof(unsigned short int) * PSEMS);
 	if (get_arr.array == NULL)
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index 5af1909480b5..4ffb9dd72c1c 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -47,13 +47,15 @@ static struct test_case_t {
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	char nobody_uid[] = "nobody";
 	struct passwd *ltpuser;
 	key_t semkey2;
 	struct seminfo ipc_buf;
 	union semun arr;
 
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
 
 	ltpuser = SAFE_GETPWNAM(nobody_uid);
 	SAFE_SETUID(ltpuser->pw_uid);
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index e877f989edaa..40a6b095c57d 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -88,7 +88,10 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
 
 	/* get an IPC resource key */
 	semkey = GETIPCKEY();
diff --git a/testcases/kernel/syscalls/ipc/semop/semop04.c b/testcases/kernel/syscalls/ipc/semop/semop04.c
index 226a64603943..5e4bfeb625e2 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop04.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop04.c
@@ -94,7 +94,10 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
 
 	val = 1;
 
diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c b/testcases/kernel/syscalls/ipc/semop/semop05.c
index 0e18f77ba1f5..770646bc564c 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop05.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop05.c
@@ -145,7 +145,10 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
 
 	SAFE_SIGNAL(SIGHUP, sighandler);
 

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
