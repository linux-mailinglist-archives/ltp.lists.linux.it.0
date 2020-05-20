Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA941DADDF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 10:47:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC4723C4E34
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 10:47:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2AD5D3C4DFF
 for <ltp@lists.linux.it>; Wed, 20 May 2020 10:47:36 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 720C51401B40
 for <ltp@lists.linux.it>; Wed, 20 May 2020 10:47:35 +0200 (CEST)
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MsHwC-1in4162wGI-00tnBT for <ltp@lists.linux.it>; Wed, 20 May 2020
 10:47:34 +0200
Received: by mail-qv1-f42.google.com with SMTP id d1so954269qvl.6
 for <ltp@lists.linux.it>; Wed, 20 May 2020 01:47:34 -0700 (PDT)
X-Gm-Message-State: AOAM532j5mdcFFCd/zqIA9FhwjfHmdyBERyKieMMYvu7DLvJ7ir/ij48
 /41nAwNh0rHuguyYLVNsZMURCHR9wwqEEtkKooE=
X-Google-Smtp-Source: ABdhPJzmMcw1aMDN7CSEL3Z5gSFH1vdiBEMFLt8JC4BURh1LKs5ayX+flCuve0+yPQuQblMWhhyTFJCyfmiGE4dd//4=
X-Received: by 2002:a05:6214:3f0:: with SMTP id
 cf16mr3860021qvb.4.1589964453533; 
 Wed, 20 May 2020 01:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
 <20200519122155.GB16008@yuki.lan> <20200520073151.y5xttqnqeqe4jmka@vireshk-i7>
In-Reply-To: <20200520073151.y5xttqnqeqe4jmka@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 May 2020 10:47:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3kS-_ZynTR=o9FVAXEyr9VcAaigOcnG-_Se+wA_+jQoA@mail.gmail.com>
Message-ID: <CAK8P3a3kS-_ZynTR=o9FVAXEyr9VcAaigOcnG-_Se+wA_+jQoA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:1YJKIU5ACjErGE+67n8bf9mNAgwOytnPHi3NpBStpNO54uwbzbg
 SfEHbqR7Rpky6w6cGRiYKslsC/nk3ChJgQXEpqDesNqkBLoJYpgXqoi8u4NkIFR126Vn82N
 dGPoI54asBgTX9xU6N/xHgoWu235adRc7QhoboMi6QllpQShPhjmJXUButZuIPaDwXRj1JC
 it8tfeyChqMIT9wgEi8gA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RUzrZgVE3P0=:2y82p45LBgg2zdswArLCa3
 ryDGlH1UvLJt7XqMhjGcRE43dDtDxZ9OPiVMl1izPTWSmOO5vj7IGDwwf1HIrpIPa8LNodt7/
 5G0eWAfaZjCVnIGhJBcGLtbjoB1JN7cZ3f/k8Tw896RzjFl2CATEOn/yzdHNLDpqaI8bnj2/Y
 MWufBxb8bxusVoADXjwMXmTNu25hEh1EyWmp6Uy4O+mcE0Nf++AtpGfhanLDPMYLVBMdttueZ
 7eLU6cG0rcxCfy3v8MqBG8RhW4SRS4C/Ae0beg0Jap2DASom6GprHToEEHeqCxyIGLQt+8Y9/
 jMa/a8Ev8Xg/rjIZklqcxEDwiWEyM3zBh52h20rG6dnrHZPCkEgCclsDagRiatFn0geRyYJmk
 EECNIsTpkZLpXJ34sW14O4vU0LfD3H5WpMfWRizLXjni59+FrEKnzEdEFm4S3l84NGDzpspPu
 vLlxmekufsbupPfPK4/eH7wACSXV8bLP+z8LFZGGIrFLCh6hJIu2eSEdN+7eX3Mz9/BBzu7YA
 faVVdzDY/5i9AsMK8p835AEkDhLF8I4gMvFpW9vqrdJODN597NfkrUzZ4Eh8GprG331eaMZwY
 7E79nVVFD2f60WzQfcIvxlzXhI9zkaT/aY5wC+ENXsJoo2MCnh9dy1HNxD27WhfgsUwtxLCyx
 S3kdLs0s+fJA3TmrQEtlXMtK6hQ7aWEh18DsKFNdJ4HIgjB9rvbLIS07Ir7dSwJ6B97v4vOQ5
 igF+iD8Th6YSlO4SoniIq2jzwJFjER2n1/XZn4O+j3o4+nDPi/o5GJJpfqmlhI8gI3cFrP7ZH
 NtPH/tYETye6OprZpMaeQEMt/k5bVzeVz+1mflDcmAXu95aZcM=
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, May 20, 2020 at 9:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 19-05-20, 14:21, Cyril Hrubis wrote:
> > So we can as well so that they take the tst_ts structure, then we are
> > also free to change the way the timestamp is acquired without the need
> > to change all the callers.
>
> I am not sure I understood it all. What do you mean by "also free to change the
> way the timestamp is acquired"?

The bug in the current implementation is that the tst_clock_gettime() takes
the libc type but the argument to the kernel that may expect a different
type.

Your patch solves the problem by using the kernel type consistently,
but the other way to solve it is to keep passing the glibc type and
instead make tst_clock_gettime() get a timestamp through the low
level kernel interface using the kernel type and then convert it, like

int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 {
       int ret;

#ifdef(__NR_clock_gettime64)
        struct __kernel_timespec newts;
        ret = tst_syscall(__NR_clock_gettime64, clk_id, &newts);
        *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_nsec =
newts.tv_nsec };
        if (ret != -ENOSYS)
              return ret;
#endif

#ifdef __NR_clock_gettime
        struct __kernel_old_timespec oldts;
        ret = tst_syscall(__NR_clock_gettime, clk_id, &oldts);
        *ts = (struct timespec) { .tv_sec = oldts.tv_sec, .tv_nsec =
oldts.tv_nsec };
        if (ret != -ENOSYS)
              return ret;
#endif

       /* fallback for prehistoric linux */
        struct timeval tv;
        ret = gettimeofday(&tv, NULL);
        *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_usec =
newts.tv_nsec / 1000};

        return ret;
}

Or something like it that works reliably.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
