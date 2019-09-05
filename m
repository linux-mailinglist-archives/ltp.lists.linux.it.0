Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC25A9FAB
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 12:30:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A58C23C207C
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 12:30:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 66CF83C205D
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 12:30:14 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 829731A023E1
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 12:30:12 +0200 (CEST)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE44B2A09CE
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 10:30:10 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id a17so1008409oto.20
 for <ltp@lists.linux.it>; Thu, 05 Sep 2019 03:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGbl13DZZ8hck39bCBQdt8Ka1GUFhTyGZCw5sAgxQ4I=;
 b=EZZVTNckGLB8z6BiwiJ3a16CA3m3ydhcGIseP7vyrfPA8B9EGbfD8syBjDBUcMEjVf
 oVug1NbY2/q9WdgPorNhCkpKNN0jPAfcavn/w7bVeSSzBYHSQ4mxibgdGwkUdWWoXZ3h
 u63ktrjadYs38uqEhCyU53dwoORQNBYUDO3YP+RHsRgdZdgGnDVfEFMoH/RPes1+7Rvi
 FvMBH4V5sRERBKdPFj4D3wgWU5X0Zy+OxWmIm1cMgQ1gZR8XdewfKT10XNBzxdsz1uPw
 Q/xLqX/LMP/lKPMdRwHD+WexDMmsg9gnwBKNOj1AntCbUxk33Nes+MoatMoeclLRKZnQ
 nlCg==
X-Gm-Message-State: APjAAAX15nB/Gkcyr6nYPxxDBuQPYrIOZ5xYsZMtGklc1Sp63fWLMSXi
 W1K67LedNNRe4fIJlb4FNkRwAPrDzaEW3iwUqEEdnLJkqfdahVjSJotqMwN559Vl8PdvTkZqlLV
 3sSLw/2gdG+a9UpuxzxHpmiv5Uog=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr1939928ota.17.1567679410360; 
 Thu, 05 Sep 2019 03:30:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPMUpaR7kBtYj27XTOsZ+QEXLQVHuqxbTKDoUT1xR+YFFQ95PWtiEhltr2JzGXuIyyzSz6msvFHR7JdHNGN4k=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr1939902ota.17.1567679410013; 
 Thu, 05 Sep 2019 03:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
 <CAEemH2fiJkau0A3yQH+nHVPXMwtTzyV3_weTQRniZFR+EJqN_g@mail.gmail.com>
 <18fd25c6-857f-e049-8c8d-9640f4deba68@oracle.com>
In-Reply-To: <18fd25c6-857f-e049-8c8d-9640f4deba68@oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 5 Sep 2019 18:29:58 +0800
Message-ID: <CAEemH2eLnTQ4obrpSOzoBE4OQ3x47DLNZdAGyE91CnwQ7TOVsw@mail.gmail.com>
To: Shuang Qiu <shuang.qiu@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise09:Change PAGES size to the value more
 than 32
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 5, 2019 at 6:02 PM Shuang Qiu <shuang.qiu@oracle.com> wrote:
>
> On 09/05/2019 04:29 PM, Li Wang wrote:
> > On Wed, Sep 4, 2019 at 2:01 PM <shuang.qiu@oracle.com> wrote:
> >> From: Shuang Qiu <shuang.qiu@oracle.com>
> >>
> >> In upstream patch 1a61ab (mm: memcontrol: replace zone summing with lruvec_page_state()),
> >> it modify the lruvec state in batch,equal and less than 32 MADV_FREE pages will not trigger
> >> the account of lruvec_stat,and will not be free in memory pressure either.
> >> So the testcase may fail with:
> >> ...
> >> madvise09.c:219: INFO: Memory hungry child 6178 started, try 10
> >> madvise09.c:254: INFO: Memory map: pppppppppppppppppppppppppppppppp
> >> madvise09.c:259: FAIL: No MADV_FREE page was freed on low memory
> >> ...
> >> Change the PAGES to the value more than 32 can fix such issue.
> >>
> >> Signed-off-by: Shuang Qiu <shuang.qiu@oracle.com>
> >> ---
> >>   testcases/kernel/syscalls/madvise/madvise09.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/testcases/kernel/syscalls/madvise/madvise09.c b/testcases/kernel/syscalls/madvise/madvise09.c
> >> index 01075f6..3759053 100644
> >> --- a/testcases/kernel/syscalls/madvise/madvise09.c
> >> +++ b/testcases/kernel/syscalls/madvise/madvise09.c
> >> @@ -57,7 +57,7 @@ static int sleep_between_faults;
> >>
> >>   static int swap_accounting_enabled;
> >>
> >> -#define PAGES 32
> >> +#define PAGES 64
> > I'm not sure why 64 pages is a proper value? Can you explain more?
> I think any value which larger than 32 is ok.
> So I tested 64 and works fine.

I just tried with '42' randomly, but it doesn't work. I guess that
might have a waterline to trigger this memory page reclaiming.

I looked at the code calling path, it seems the 'sc->nr_reclaimed' is
the key value to control that, but still not 100% sure, I will keep
debugging it for a while.

try_to_free_mem_cgroup_pages
  do_try_to_free_pages
    shrink_zone
      shrink_node
        shrink_node_memcg
          get_scan_count
            lruvec_lru_size
              lruvec_page_state

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
