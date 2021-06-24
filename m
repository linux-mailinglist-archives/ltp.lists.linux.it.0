Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E13B2EF7
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 14:31:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1292C3C2DD7
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 14:31:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AACE63C2B53
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 14:31:46 +0200 (CEST)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DF39510005B0
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 14:31:45 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id f15so6462532wro.8
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 05:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/fNR6Am+Z+6KRZ6+5LLAGgPcqYXx2b9W/LQd2x5RU2w=;
 b=vC+DW6K2/Kf0uKv92cJmkoyakKo67pF73JmReQDJFciGNsAtMquS34V0M+ckJQuukX
 rwkt+9Mpr6IMNInaseDlYQeQmt+ETXmhB8WYyKagjHmdlJ8h4n1Jd3uHIFeROzbdvz6e
 yhXnDJ9Y2UDxuEs1IqQoyqAAOfPs3HH21kD2Hri7wt/mrcnmS1Z+/LfBCb1FPN+UcSwK
 6g134tK9Yug/9sbSLwbmHXiK5GhNVpWp+7Zmud6VWc6hbY1hcR6PSNc8eOjPWIsfoJ5C
 2axFWD+jdTYI94dJdHS9RFxUCjMFlUcxpDa9+8HkAWw9Zkx6J/od0fftj4kNgaggKbXs
 F+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/fNR6Am+Z+6KRZ6+5LLAGgPcqYXx2b9W/LQd2x5RU2w=;
 b=dFV2+InEQOe/bINXLr5XK2ymxXH58pLEqtn44DpKO/dMcf9XUW5yGQ02gYEpc2aqKW
 myS/Vu/ju8Nfy5nZJpHzn7dq2B9WlNNSFKvAy1je0VXDZuYxVT7V63TtViK96AjyEDnq
 2Yq5VHmG8ceRpaLSqs75KV1T+udSOLz3Mjzaqr4Vzx6sbh6XmfUY+fNQ4WCRgAzhkTtj
 manqTpmZPJ2IFgRjm6JD34jZf4EZYABampnXLsET/ubslB6BbHXV1/IAkwsaj6T11ghh
 tXXjowt2L0Nj7YZ2wUsK6zw3+Nsb3FvCgVCShrEZnnyqI+CG2oED6VSbl52Mr3qwPncf
 v+TA==
X-Gm-Message-State: AOAM533tkO1NBicWbiz1qzjo3PW6JECq8SvgKdrS/PsOiwHnJsPpyFyb
 6D/+fPjxGVnmmY0q55z5zlH1qQ==
X-Google-Smtp-Source: ABdhPJwi7fuSs/AYQ//JjlvyEvpCBAQI1qD1jncLUK0cFH9NOXhLiEc1tjNUnbVw5fvn2ZFshoEKpw==
X-Received: by 2002:adf:ea0a:: with SMTP id q10mr4109230wrm.44.1624537905448; 
 Thu, 24 Jun 2021 05:31:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:bf1d:1279:62a8:5382])
 by smtp.gmail.com with ESMTPSA id n4sm3179681wrw.21.2021.06.24.05.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:31:45 -0700 (PDT)
Date: Thu, 24 Jun 2021 13:31:43 +0100
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YNR7L2ftbwx6IUls@google.com>
References: <20210623134041.366838-1-balsini@android.com>
 <YNM6QGFYt/bpaPDS@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNM6QGFYt/bpaPDS@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getrlimit/getrlimit03: fix unavailable
 __NR_getrlimit for arm
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
From: Alessio Balsini via ltp <ltp@lists.linux.it>
Reply-To: Alessio Balsini <balsini@android.com>
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On Wed, Jun 23, 2021 at 03:42:24PM +0200, Cyril Hrubis wrote:
> Hi!
> > __NR_getrlimit has been deprecated from arm EABI, and is only available
> > if the OABI_COMPAT config option is defined.
> > This causes failures with the current test as it assumes that
> > __NR_getrlimit exists if __NR_ugetrlimit is defined, while this
> > assumption does not hold anymore.
> > 
> > Catch this exception by testing if __NR_getrlimit is defined and the
> > target is arm.
> 
> I suppose that this a proper fix for:
> 
> https://github.com/linux-test-project/ltp/issues/819
> 

We spotted this failure on Android, but they are indeed the same issue!

> 
> I guess that this generates a few unused function warnings, can we fix
> all the places with #if SIGNED_GETRLIMIT in the source code please?
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

Here below the new patch that should fixed the unused functions warnings, as
well as the useless definition of rlimit_long if the signed version of
__NR_getrlimit does not exist.

Thanks,
Alessio

-- >8 --
Subject: [PATCH] getrlimit/getrlimit03: fix deprecated __NR_getrlimit for arm

__NR_getrlimit has been deprecated from arm EABI, and is only available
if the OABI_COMPAT config option is defined.
This may cause failures with the current test as it assumes that
__NR_getrlimit always exists if __NR_ugetrlimit is defined, but this
assumption does not hold anymore.

Catch this exception by testing if __NR_getrlimit is defined and the
target is arm.

Signed-off-by: Alessio Balsini <balsini@android.com>

---
 .../kernel/syscalls/getrlimit/getrlimit03.c   | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
index 319bc494a..8601b6caa 100644
--- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
+++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
@@ -36,13 +36,25 @@
  * the architecture predates the "new" handler.  For clarity, this test
  * will call them getrlimit_long and getlimit_ulong internally.
  */
-#define SIGNED_GETRLIMIT (__NR_ugetrlimit != __LTP__NR_INVALID_SYSCALL)
-#if SIGNED_GETRLIMIT
+#if __NR_ugetrlimit != __LTP__NR_INVALID_SYSCALL
+
+/**
+ * __NR_getrlimit has been deprecated from arm EABI and moved to OABI_COMPAT,
+ * so the syscall on arm may or may not be available, also if __NR_ugetrlimit
+ * exists.
+ */
+#if !defined(__arm__) || __NR_getrlimit != __LTP__NR_INVALID_SYSCALL
+#define SIGNED_GETRLIMIT
+#endif
+
 #define __NR_getrlimit_ulong           __NR_ugetrlimit
 #define __NR_getrlimit_ulong_str       "__NR_ugetrlimit"
+
 #else
+
 #define __NR_getrlimit_ulong           __NR_getrlimit
 #define __NR_getrlimit_ulong_str       "__NR_getrlimit"
+
 #endif

 #ifndef HAVE_STRUCT_RLIMIT64
@@ -74,12 +86,13 @@ static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
        return syscall(__NR_getrlimit_ulong, resource, rlim);
 }

-#if SIGNED_GETRLIMIT
+const long RLIM_INFINITY_L = LONG_MAX;
+
+#ifdef SIGNED_GETRLIMIT
 struct rlimit_long {
        long rlim_cur;
        long rlim_max;
 };
-const long RLIM_INFINITY_L = LONG_MAX;

 static int getrlimit_long(int resource, struct rlimit_long *rlim)
 {
@@ -116,7 +129,7 @@ static int compare_u64_ulong(int resource, uint64_t val_u64,
        return 0;
 }

-#if SIGNED_GETRLIMIT
+#ifdef SIGNED_GETRLIMIT
 static int compare_u64_long(int resource, uint64_t val_u64, long val_l,
                            const char *kind)
 {
@@ -142,7 +155,7 @@ static void run(unsigned int resource)
        int ret_ul;
        int errno_ul;

-#if SIGNED_GETRLIMIT
+#ifdef SIGNED_GETRLIMIT
        struct rlimit_long rlim_l;
        int ret_l;
        int errno_l;
@@ -167,7 +180,7 @@ static void run(unsigned int resource)
        tst_res(TPASS, "__NR_prlimit64(%d) and %s(%d) gave consistent results",
                resource, __NR_getrlimit_ulong_str, resource);

-#if SIGNED_GETRLIMIT
+#ifdef SIGNED_GETRLIMIT
        errno = 0;
        ret_l = getrlimit_long(resource, &rlim_l);
        errno_l = errno;
--
2.32.0.288.g62a8d224e6-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
