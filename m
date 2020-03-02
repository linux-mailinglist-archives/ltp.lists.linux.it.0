Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919F1757DA
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 11:02:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0162E3C6826
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 11:02:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 923893C67F6
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 11:02:50 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C5738600440
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 11:02:49 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id b22so3993487pls.12
 for <ltp@lists.linux.it>; Mon, 02 Mar 2020 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AJsLe8OO8EPPbForQp61so/bSCU2hVsmtmbK5EpW3VA=;
 b=TNwTGEEkEBbpxrVftAa5efKkl2AmxyJpyh4eRqaL4EOMSM9aSLERKQzdKrfowPlAab
 I89m9SAZKMjRGdHQPu/oKZMXJzRd7IhGOy/6Eq8DnUcNO0Tbh9F2bMWXlucLUznDR47Y
 WTTfidzZSBvFJxrsQ1eTq9iJ0iB3RpLZVFMkNcekACdm8SQp5wrzvVrXqmUoDbCQsirF
 aIyVMmnTca0etLuHiSscpluXo5HLjLylZbnQ97y7iFKy+0g1gwBPH+gt2TfA0pR6RkVV
 aCppaGui5HRssOV517qMdl5yTEpdIHY28jxceVTNKtdnpjlfwAE5R7u/QbQSGH/ScsBz
 E8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AJsLe8OO8EPPbForQp61so/bSCU2hVsmtmbK5EpW3VA=;
 b=oK9T8aD3jlQamT0R2JmC8B8v8Z3CvnH7R7aIPsFVIztxX9bEWGr6NKO7SwaFcSIqZE
 SfZHmBqXqp794zO6B8uhCUPPE7WmOqMKNCUBe2QO/ELBDi2EDAIagm63eIUlA8O6CLs/
 RlQSX6RkIlHOfQIHcx1+eA9LkGCFTZpAL/VN72sDU6k7K4v5PGxYvykqI1ApL5rQOQSs
 WdgNHjYLTewagHlqGDRI7vUQcmb0e7wkaVCl6+IIPYXF13p5NMxWX0VB4V1vEIRXNnJh
 HqMF7XOkn6RupDirHINUwqeZngbzl7XbsGiRHlROvTjUJjyOeUo91KnZgLVM6A8roMOr
 +w/A==
X-Gm-Message-State: APjAAAU6BEZOrAvFTOxECICIadOtKOoOR8s+wWRWIKyl48EsXxlc8Jsn
 xjIEPn7CFaLVEZ2tCsfgkkASY4/vhco=
X-Google-Smtp-Source: APXvYqzoG+h6MMXnCxX8u65GRSBhoZZ/k8Eo6Sg3wF5i2rFidya/mTfWSm3pUjxJblbzJK2V+O30qQ==
X-Received: by 2002:a17:90a:c592:: with SMTP id
 l18mr19943486pjt.105.1583143368076; 
 Mon, 02 Mar 2020 02:02:48 -0800 (PST)
Received: from localhost ([122.167.24.230])
 by smtp.gmail.com with ESMTPSA id o9sm20842117pfg.130.2020.03.02.02.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 02:02:47 -0800 (PST)
Date: Mon, 2 Mar 2020 15:32:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200302100244.6syqeskptbsnyf6t@vireshk-i7>
References: <b927e5f2cd36ec2dd57202b492563922b1a94e77.1582886993.git.viresh.kumar@linaro.org>
 <20200228132210.GC8324@rei>
 <20200302063714.claovt5uyi7gxf2o@vireshk-i7>
 <20200302084651.GA4736@rei.lan>
 <20200302090718.hmyxgbmrwltxiz56@vireshk-i7>
 <20200302093622.GA5288@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302093622.GA5288@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/openat2: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 02-03-20, 10:36, Cyril Hrubis wrote:
> The code you had there in the first place was passing by accident
> because the were non-zero bytes on the stack after the structure, which
> is pretty bad, because if it started to fail randomly nobody would know
> why.

I know :)

What about this? This doesn't test the success case with pad = 0 though, as it
is a success case. Don't want to add a separate file for it. :)

diff --git a/testcases/kernel/syscalls/openat2/openat202.c b/testcases/kernel/syscalls/openat2/openat202.c
index 6889c89ab68d..c945d279dcdf 100644
--- a/testcases/kernel/syscalls/openat2/openat202.c
+++ b/testcases/kernel/syscalls/openat2/openat202.c
@@ -9,7 +9,10 @@
 
 #define TEST_FILE "test_file"
 
-static struct open_how *how;
+struct open_how_pad {
+       struct open_how how;
+       uint64_t pad;
+} *phow;
 
 static struct tcase {
        const char *name;
@@ -18,28 +21,31 @@ static struct tcase {
        uint64_t flags;
        uint64_t mode;
        uint64_t resolve;
+       uint64_t pad;
        size_t size;
        int exp_errno;
 } tcases[] = {
-       {"invalid-dfd", -1, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, sizeof(struct open_how), EBADF},
-       {"invalid-pathname", AT_FDCWD, NULL, O_RDONLY | O_CREAT, S_IRUSR, 0, sizeof(struct open_how), EFAULT},
-       {"invalid-flags", AT_FDCWD, TEST_FILE, O_RDONLY, S_IWUSR, 0, sizeof(struct open_how), EINVAL},
-       {"invalid-mode", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, -1, 0, sizeof(struct open_how), EINVAL},
-       {"invalid-resolve", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, -1, sizeof(struct open_how), EINVAL},
-       {"invalid-size-0", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 0, EINVAL},
-       {"invalid-size-big", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 2 * sizeof(struct open_how), EFAULT},
-       {"invalid-size-small", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, sizeof(struct open_how) - 1, EINVAL},
+       {"invalid-dfd", -1, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 0, sizeof(struct open_how), EBADF},
+       {"invalid-pathname", AT_FDCWD, NULL, O_RDONLY | O_CREAT, S_IRUSR, 0, 0, sizeof(struct open_how), EFAULT},
+       {"invalid-flags", AT_FDCWD, TEST_FILE, O_RDONLY, S_IWUSR, 0, 0, sizeof(struct open_how), EINVAL},
+       {"invalid-mode", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, -1, 0, 0, sizeof(struct open_how), EINVAL},
+       {"invalid-resolve", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, -1, 0, sizeof(struct open_how), EINVAL},
+       {"invalid-size-0", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 0, 0, EINVAL},
+       {"invalid-size-big-with-pad", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 1, sizeof(struct open_how_pad), E2BIG},
+       {"invalid-size-big", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 0, 2 * sizeof(struct open_how_pad), EFAULT},
+       {"invalid-size-small", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 0, sizeof(struct open_how) - 1, EINVAL},
 };
 
 static void run(unsigned int n)
 {
        struct tcase *tc = &tcases[n];
 
-       how->flags = tc->flags;
-       how->mode = tc->mode;
-       how->resolve = tc->resolve;
+       phow->how.flags = tc->flags;
+       phow->how.mode = tc->mode;
+       phow->how.resolve = tc->resolve;
+       phow->pad = tc->pad;
 
-       TEST(openat2(tc->dfd, tc->pathname, how, tc->size));
+       TEST(openat2(tc->dfd, tc->pathname, &phow->how, tc->size));
 
        if (TST_RET >= 0) {
                SAFE_CLOSE(TST_RET);
@@ -63,7 +69,7 @@ static struct tst_test test = {
        .setup = openat2_supported_by_kernel,
        .needs_tmpdir = 1,
        .bufs = (struct tst_buffers []) {
-               {&how, .size = sizeof(*how)},
+               {&phow, .size = sizeof(*phow)},
                {},
        }
 };

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
