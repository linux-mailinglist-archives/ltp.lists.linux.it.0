Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5620CE6C
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 14:05:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 373903C574A
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 14:05:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 695F53C2B07
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 14:05:32 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BE5B0600AD8
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 14:05:31 +0200 (CEST)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MxEcg-1isFdq3tfc-00xd81 for <ltp@lists.linux.it>; Mon, 29 Jun 2020
 14:05:31 +0200
Received: by mail-qk1-f169.google.com with SMTP id b185so4348332qkg.1
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 05:05:30 -0700 (PDT)
X-Gm-Message-State: AOAM530egihHfppkcgT44ja8h/cyWX2s1DzAnEjH58zm0VgBbyImfdge
 aqbL7uATJdXdVa9umTrCOuBsGatA7tvOCJzgsOs=
X-Google-Smtp-Source: ABdhPJxkA6VW0NrOY+V3EYprWpOhCp1Y2sfcEguonYFReo/orEBjuSW2VOSKmEnGHqUNuny74KHqLpH5v6VFo5Sydlw=
X-Received: by 2002:a37:9dd6:: with SMTP id
 g205mr15112191qke.352.1593432329828; 
 Mon, 29 Jun 2020 05:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
 <7d8f71c73ac4518375b81651f82ef040c02082a1.1593430825.git.viresh.kumar@linaro.org>
In-Reply-To: <7d8f71c73ac4518375b81651f82ef040c02082a1.1593430825.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Jun 2020 14:05:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ZAjUnybGVD4Kh5t5PZth3wgt672SwNf9iVPmqBUg4LQ@mail.gmail.com>
Message-ID: <CAK8P3a0ZAjUnybGVD4Kh5t5PZth3wgt672SwNf9iVPmqBUg4LQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:J3scUPRO/j/0kPdLeWBhDnE8ExGLb5wRzZpQIdF6Kt4ql/lAcjT
 Fpf+ko56zwYD9bI7kw9MIgYq7ERRld4Wzkeo6sFIEWiGRfAkv8+Q6VlHyXi+DktDZNWTK7R
 p1JI587aaoVpliPvr3jS9s8iVhRbaTm0aWTrsgX4ZOfBlcd8WrdsRTeY8myY0Mh6eyXUeBX
 GPVoOKeEykLRci+9AjFZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1OJtHTWpZrA=:03u+D0qP1ISsQK4/OU1bAd
 BKkIrIA0w6Uz7VH/yi9/BMS0dSzWDIp0myQnM0/mX5Z5rvdrQfybR8rQC5WWeXhfFtVh8NPZC
 Mjv/aeAQcbgr/RgKjR9UDiHhxMyG4v7qAGMJ/x0e/7cxgp17nyo+x2GzEHaKnKdsKGwUcaCP6
 rgcg3VPtLHIncZNwAWFN4Wq1u+9MDHglY439SVcdg40nA484RoZJzgC8Rx13lj/Hx5yEaxixd
 D3MEEgtTIkgqqe9xrSRzf37A2WQDL18VRbpyF61sz8qMbDJewxIT8c0ApN7EtoluxANQFMeZ3
 Bf0OBUpdZtCPTZyV6WVUiKAiX5nfeuRqxbsm8j1GTlX1rAvD6fcCppQXPXIE3LgAUlAam2+67
 wzoF3xUnELADg/xvNQ0tPEXQmZLuCSAV3+arAYLfmsB63LHKTGD41i5F/6Ew+H4ohD+Ie5aJt
 CUPhDnS2PfKQjx5KHRGQJTb3IgTT+X4xJ0185TEX4GtvLGdlJHlqDp/X502iy1TJyu+ZCKvrQ
 s8+U690Q0aYHiFVdyG2Nwjx0EfbEl85aG8GdEPNTl0Z6YufZ8c9W2OoIp7zVWsk/r6V2QsfvH
 +kFcgv6Wd9Q5PSMnesbFMpFUBVtFxFgbSVBl+J4kiXSxzX3Z7WvPyJu9hvOC4bnGrpqCgDYsv
 /Th0w5ez4aPnYMSSXn+BFAfl8JY2uSWoY+XsG796U7dZkFHQIpOUCGJcFkhX7t65AOJnz19pM
 WvLqBhIDnvjr7oTDNyqSS/vkxfgjezOfoGowy6ZtBIeqq84QTu8PQmrnFuNODnadxG3CKZmWf
 YnY+zhWKhJHhQCWFpu+bi+qMiLYrksOKzCfQHdyJcNHgi9a8Ys=
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/timer_settime01: Make sure the timer
 fires
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

On Mon, Jun 29, 2020 at 1:43 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This patch improves the testcase by doing multiple things:
>
> - Make sure the timer fires and catch the signals.
>
> - Verify the values set to the itimerspec by reading them again using
>   timer_gettime() syscalls.
>
> - Reduce the timer interval, 5 seconds was way too much.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Cyril/Arnd,
>
> This works well for all clocks except CLOCK_PROCESS_CPUTIME_ID and
> CLOCK_THREAD_CPUTIME_ID for some reason. I tried to read the values for
> those clocks by sleeping for 1 second and then reading values using
> timer_gettime() in a loop, and the value incremented every 15-16 seconds
> by a value of 1 (which was in ms if I am not wrong).
>
> No idea what the hell is going on here and so need experts advice :)

The problem is that these clocks only tick while the process is running. Instead
of sleeping for one second, you need to be in a busy-loop to ensure they
actually advance.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
