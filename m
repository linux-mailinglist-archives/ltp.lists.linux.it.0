Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBB213211
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 05:15:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A75523C247C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 05:15:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8B3443C0271
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 05:15:38 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C9FA2200BB6
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 05:15:37 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id bf7so2770503plb.2
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 20:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HmuC4l4SQfbZsLxvqKdBgShKVWxOuK4xknloy6zUdC8=;
 b=yZmmWKyTBHVkkPCY7i4gG6nw9kpJttlV9e8oaqIo/a1O+jyODk6bucBWnLm93E+Osi
 W/mMzQFUnsikk1DSN7aOflu3+DohUdDXLbUMe2pIfGAJxcj4GrhL4cN7NPG2Bg2E+LTk
 BhGZJ1IZ1z+7/tu2qzpLKrwlbbdUHCZ/yvBAbdqdGK59GbuIcSj9KAiMDT2U6/n4eM/s
 bbz6IulvJbhwOXLAoU9BdgF3wT8Ig/B1+ORuOKJHWXUS2O3XRke8Ac373Owu4UGuvdR+
 hX3RLTxBYdrnqhcpXtxpL1/4JXX0p5niIe0mbRV7VkTzmDXOJ/FkpVAWWe91Qp11GpFj
 BDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HmuC4l4SQfbZsLxvqKdBgShKVWxOuK4xknloy6zUdC8=;
 b=PH9l2VG1KPYr5PB0SjpYHl9hoowWHe4pbffzGqBXvpsO28FwKMkrNjMGFfO42A/k4W
 i3xuvCi/KPb7tFRkRrvEUDW0vhKCVhdLntYsbH5LUY2Ldxm5KbIx2AG6ZJEpDbf4dmbk
 UUFhRvgEfR+3DV1j/PzoOk2qbmBErqoGMwJtmsxN76rZiTpN09b9wh/nCspak186JOHR
 Ncz/TovcUPX6Az8JJWV+0nEAF8FgMT6raMzVffqm7ThaLhTma9tyW20LuEq93SZSCkC/
 rZIERI6pjCdy0gOUIv28jkgvDt5PmFTKg6H2mkeCZIgo2N3PgF7mSTamMi8ja/UISMFQ
 bYwQ==
X-Gm-Message-State: AOAM532o+jlvz9WP4Km01fEQ0rmaTGMBEQQNku89TEvRZVycTlvfHoPg
 lHhB2U6IPGtldZ+3cf/+Hs/YXQ==
X-Google-Smtp-Source: ABdhPJy7FhC1BCplzKPXSzY4GmMIgJ16SPsQMTW4gsRwga/QJE9oSATk4mEJq6syf0saL5YWz+zllA==
X-Received: by 2002:a17:90a:1117:: with SMTP id
 d23mr36210338pja.136.1593746135860; 
 Thu, 02 Jul 2020 20:15:35 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id w64sm9812886pgd.67.2020.07.02.20.15.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jul 2020 20:15:35 -0700 (PDT)
Date: Fri, 3 Jul 2020 08:45:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200703031532.bjkwhkpfobdsxj4p@vireshk-i7>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <20200702130654.GC9101@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702130654.GC9101@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 05/19] syscalls/sched_rr_get_interval: Add
 support for time64 tests
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
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 02-07-20, 15:06, Cyril Hrubis wrote:
> Btw, we may as well add a check that the value is consistent with
> /proc/sys/kernel/sched_rr_timeslice_ms.

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 31d7b5d56a52..0641b6651502 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -44,6 +44,7 @@ static void setup(void)
 static void run(void)
 {
        struct test_variants *tv = &variants[tst_variant];
+       unsigned long long timeslice_ms;
 
        TEST(tv->func(0, tst_ts_get(&tp)));
 
@@ -54,6 +55,8 @@ static void run(void)
                        TST_RET);
        }
 
+       SAFE_FILE_SCANF("/proc/sys/kernel/sched_rr_timeslice_ms", "%llu", &timeslice_ms);
+
        if (!tst_ts_valid(&tp)) {
                tst_res(TPASS, "Time quantum %llis %llins",
                        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
@@ -62,6 +65,7 @@ static void run(void)
                        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
        }
 
+       tst_res(TINFO, "%llu: %llu", timeslice_ms, tst_ts_to_ms(tp));
 }
 
 static struct tst_test test = {



and it is coming as:

sched_rr_get_interval01.c:68: INFO: 25: 100

They aren't consistent here. Perhaps because first one is system wide
while other one is per process ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
