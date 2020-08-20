Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D4924FFCD
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 16:29:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82C353C2EF2
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 16:29:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 334C03C2555
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 01:41:15 +0200 (CEST)
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A24D6200250
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 01:41:14 +0200 (CEST)
Received: by mail-ua1-x943.google.com with SMTP id s29so49610uae.1
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 16:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1O+1/CsI+47q3r1tf4be3UUszpXYNzxIYQuUKvWdkbI=;
 b=c04YKGWtXq9P/kGSguZgQKKbCMR7pMyWhuf82lf8FxWzAkLQG6DN3QM4cjfht6udgZ
 s5APlytdqfALgI6ejpriGzjTt7YdsamcwdQCmnXSUUthXrt48AymlCh4ikYaggjc8wLJ
 WkY0Y0ywOLK1Yh/PBACeTwAdqV4IF/c4WeK8pKOkodp1T4Znvu+VdXErw+HEFfhtHZR0
 7VUEIKWrJOCCU1SOFzKQb3l8AIlXrY7ug7UtGJLEpwspXc32+v12LZauLxOEyK3x8xUT
 50XOO99Ziq0Rehz9W+7om1h0EOZ2HSrl0lehLSsgnIV/ZVrieNO2qxxCNIGlaG6Vz3p9
 Pu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1O+1/CsI+47q3r1tf4be3UUszpXYNzxIYQuUKvWdkbI=;
 b=g6ii5/E4OHDywlzVASnLmx2Pek2IxNW+JNYACfBoyuSdxX/mvQyn0TQj59rYTc4SAn
 D0+LPuRdfJXyGs/VA1Isc+cgsHV3Gv3yO4ZT/n565AQS/jor2WPgyqRCPZTJKK7LLg98
 fIQFyR/Epf7UQg2yqovdCdjWaMC0axeqQO4Tk1Htp59F7HDjCGzNsEWJ5QJQfPESBnyV
 VBS+snCredOJGqMxuWW/du1z9eZqIRlNQuIadBTjc86J302iF2Ev+3kXcPC41LSYwBDO
 hFkmmeFZw/1XChD81yXg86c4BZBaSAwT3v267OlgEosLfKdicPXvbYJO3wtn7NxlaYQu
 DEWQ==
X-Gm-Message-State: AOAM530G4/yUFqxFm8PIcyZDWHen4ex2V3r3Apnuwx96trlZTKwNPqHk
 VTbwaE2TY0IDE0iFjtZ9dGBI7qG2FE1++QKbwAYUrw==
X-Google-Smtp-Source: ABdhPJzRkuGhYg370oA2CaXg4M7NPZRr2EMi2tto0q4wMrlDi7lvRL1bB6Jx81jGLhoBg0jIwAbCWylbxYV44zhBPO8=
X-Received: by 2002:ab0:1d3:: with SMTP id 77mr140267ual.13.1597966873190;
 Thu, 20 Aug 2020 16:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200811180604.4073173-1-aiden.gaoyuan@gmail.com>
 <CAEemH2dxX2-t7S0TN3p7=zMLY_=TquSZdKUgqDRE9fpg_t8hdA@mail.gmail.com>
In-Reply-To: <CAEemH2dxX2-t7S0TN3p7=zMLY_=TquSZdKUgqDRE9fpg_t8hdA@mail.gmail.com>
Date: Thu, 20 Aug 2020 16:41:02 -0700
Message-ID: <CAJuCfpH_Y6HwtZAiNLzBAf7q7MPjJe2UBchdthMkSc9v0SQ6bg@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-15.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 24 Aug 2020 16:29:56 +0200
Subject: Re: [LTP] [PATCH v2 1/3] hotplug/memory_hotplug: Handle NULL
 returned by strtok_r when parsing inputs
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
From: Suren Baghdasaryan via ltp <ltp@lists.linux.it>
Reply-To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

On Thu, Aug 20, 2020 at 2:16 AM Li Wang <liwang@redhat.com> wrote:
>
> Hi Yuan,
>
> Thanks for contributing to the memory-hotplug test. I have no objection to these patches, but it seems quite a long time(since it imported to LTP from Linux foundation at the year 2008) nobody actually touches this memtoy except some code cleanup work.
>
> I'm wondering whether you guys play with the memtoy regularly? and how do you use it?

We did use memtoy to run memory experiments on Android (required some
minor tweaks to be able to build on Android). After Yuan's fixes we
were able to use it quite successfully.

>
> I take a rough look at the README file but got nothing useful to get a start.

You can see one of the scripts Yuan developed to ramp up memory
allocations of a given type (anon/file-backed/ion) using memtoy here:
https://android-review.googlesource.com/c/platform/external/ltp/+/1344879/44/testcases/kernel/hotplug/memory_hotplug/Scripts/ramp.sh
The usage is currently for experimentation only but we find it pretty
handy and we would like to keep using it in the future.
Thanks,
Suren.

>
> --
> Regards,
> Li Wang
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
