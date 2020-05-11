Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B09BE1CD6C4
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 12:43:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54B783C55F5
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 12:43:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 335013C25A9
 for <ltp@lists.linux.it>; Mon, 11 May 2020 12:43:11 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DC212600754
 for <ltp@lists.linux.it>; Mon, 11 May 2020 12:42:53 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id hi11so7651735pjb.3
 for <ltp@lists.linux.it>; Mon, 11 May 2020 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kD2mUGX91TZZpSe3yW7BGKl1fjJP2wfMZLENist793g=;
 b=eJYWVOQ4v/CoUH45kVnAqb1jMgW+0unJS2f5RRasf9GHu6sz6j4qg7lYumvXSP1Prz
 2GU8ayg4Rb8Gr1BV9PMEoPYR5yIypeCBvzeFv2aORUbNpRjHShsxRmgjeUNpPQ03MeNs
 bIXUCXU9NpYzfBCRHydKaxYXQ+vLA6QuUyZ2RLhAR/7CgF7yFJPzlQD0Q91/X8hUilIA
 jnJ/foUECI2GbfJ/SZA/K8bUBQ2W42BiKDdQpndDfIDgzTHTizsPfbMQ/koSRvb8D2DV
 YUt5Xo1+8aUiEjjBGg3FavmND7+vKd5McFH86V3yClmhIBPXaoTAokXCMr0mwgE5z08Q
 8uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kD2mUGX91TZZpSe3yW7BGKl1fjJP2wfMZLENist793g=;
 b=dcuzfJgmgFFE4pwou+kNgz/yK1oOX4ryvrcHHXZ5xC1hLepLF+ALRK2OtwO7ZevVJq
 IaE7J+ShpsNX9djaSDNFfOFkc+FBz7yLD6qKVguAE7W2GHubPoX8g+n1gr11XQofy8XZ
 WIVp8blU+rBTLKVZI6E2NodmgGKTe3BqsjRa6ukNmA4bcbrAAeXNFrIFmtNgeNE9fEOx
 hoSJEiAaSIK7vh/EfDI9JR65H/o9Jjj83ItfwJMkgz7FoFteeTvLRCAynFbpu6vHs5/l
 1osykP4WWaFkc17JS/IlQuv+kLfN2AoEdcvCdwW4NRTG3TcshI556omyPOAsM9Hfs0Qj
 KNsQ==
X-Gm-Message-State: AGi0PuahUl0eXZLIEm5kQg3HES6swQi7Q+ZxrViNHTH88Lkt8bRIm7rR
 BW1Vz8CzSj0BGqLi15PrAUAvuw==
X-Google-Smtp-Source: APiQypI0xYLFTjiLBA2YyLRWogNZCvlEIXUUddv2tevSUchpiZ8YcGWYlFdAXYtHtNRrp9yRs0uL/Q==
X-Received: by 2002:a17:902:b102:: with SMTP id
 q2mr9194867plr.29.1589193789336; 
 Mon, 11 May 2020 03:43:09 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id z60sm10028984pjj.14.2020.05.11.03.43.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 03:43:08 -0700 (PDT)
Date: Mon, 11 May 2020 16:13:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200511104306.x4sit6vy2a4bmcgc@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAEemH2cX=zyULO6qZBV5fBQv74dm2yuiUeRJ8SMe7OXYWJJ_sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cX=zyULO6qZBV5fBQv74dm2yuiUeRJ8SMe7OXYWJJ_sQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

On 09-05-20, 12:21, Li Wang wrote:
> RHEL8.2(x84_64) failed as:
> 
> # ./semop05
> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> semop05.c:147: INFO: Testing variant: semop: vDSO or syscall
> semop05.c:132: PASS: expected failure: EIDRM (43)
> semop05.c:132: PASS: expected failure: EIDRM (43)
> semop05.c:132: PASS: expected failure: EINTR (4)
> semop05.c:132: PASS: expected failure: EINTR (4)
> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel spec64
> semop05.c:134: FAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try exporting
> LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)
> 
> 
> RHEL8.2(s390x) failed as:
> 
> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> semop05.c:147: INFO: Testing variant: semop: vDSO or syscall
> semop05.c:132: PASS: expected failure: EIDRM (43)
> semop05.c:132: PASS: expected failure: EIDRM (43)
> semop05.c:132: PASS: expected failure: EINTR (4)
> semop05.c:132: PASS: expected failure: EINTR (4)
> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel spec64
> semop.h:13: CONF: syscall(392) __NR_semtimedop not supported
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try exporting
> LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)

Some part of the timeout was left uninitialized and so was causing
some issues. Can you please try with this delta:

diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c b/testcases/kernel/syscalls/ipc/semop/semop05.c
index f892cd519ecf..0e18f77ba1f5 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop05.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop05.c
@@ -120,6 +120,7 @@ static void do_child(int i)
        struct tst_ts timeout;
 
        timeout.type = tv->type;
+       tst_ts_set_sec(&timeout, 1);
        tst_ts_set_nsec(&timeout, 10000);
 
        TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
